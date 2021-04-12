#include <errno.h>
#include "dasio/cmd_writer.h"
#include "nav.h"

nav_pid_t nav_pid;
const double nav_pid_t::courseErrorIntegralLimit = 100.;
const double nav_pid_t::absMaxThrustPerEngine = 40.;
const double nav_pid_t::PI = 3.14159265358979323846;

nav_pid_t::nav_pid_t()
    : prevCourseError(0),
      courseErrorIntegral(0),
      PGain(0), IGain(0), DGain(0),
      course(0), course_rad(0), thrust(0)
      {}

void nav_pid_t::set_rpm_pid(double track) {
  double courseError = angleDiff(course_rad, track);
  double courseErrorChange = courseError - prevCourseError;
  prevCourseError = courseError;
  courseErrorIntegral += courseError * IGain;
  clamp(courseErrorIntegral, courseErrorIntegralLimit);
  double dThrust = // In Newtons per engine
    PGain * courseError +
    IGain * courseErrorIntegral +
    DGain * courseErrorChange;
  clamp(dThrust, absMaxThrustPerEngine);
  set_rpm_dth(dThrust);
}

void nav_pid_t::set_rpm_dth(double dThrust) {
  // Given differential thrust, calculate left and right thrust
  double avgThrust = thrust*absMaxThrustPerEngine/100.;
  double lThrust, rThrust;
  if (dThrust >= avgThrust) {
    lThrust = dThrust;
    rThrust = 0;
  } else if (dThrust <= -avgThrust) {
    lThrust = 0;
    rThrust = -dThrust;
  } else if (avgThrust+dThrust > absMaxThrustPerEngine) {
    lThrust = absMaxThrustPerEngine;
    rThrust = lThrust - dThrust;
  } else if (avgThrust-dThrust > absMaxThrustPerEngine) {
    rThrust = absMaxThrustPerEngine;
    lThrust = rThrust - dThrust;
  } else {
    lThrust = avgThrust + dThrust;
    rThrust = avgThrust - dThrust;
  }
  
  double left_rpm = thrust2RPM(lThrust);
  double right_rpm = thrust2RPM(rThrust);
  ci_sendfcmd(Cmd_Send_Quiet, "PMC Left Velocity Set %.1f RPM\n", left_rpm);
  ci_sendfcmd(Cmd_Send_Quiet, "PMC Right Velocity Set %.1f RPM\n", right_rpm);
}

void nav_pid_t::clamp(double &value, double abs_limit) {
  if (value > abs_limit) {
    value = abs_limit;
  } else if (value < -abs_limit) {
    value = -abs_limit;
  }
}

double nav_pid_t::angleDiff(double a1, double a2) {
  double diff = fmod(a1-a2+PI,2*PI);
  diff += (diff < 0) ? PI : -PI;
  return diff;
}

float nav_track(float vn, float ve, float heading) {
  errno = 0;
  float track = atan2f(ve, vn);
  if (errno) track = heading;
  return track;
}

float nav_speed(float vn, float ve) {
  return sqrt(vn*vn+ve*ve);
}