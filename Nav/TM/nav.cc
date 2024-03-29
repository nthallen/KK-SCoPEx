#include <errno.h>
#include "dasio/cmd_writer.h"
#include "nav.h"

nav_pid_t nav_pid;
// courseErrorIntegralLimit should be less than absMaxThrustPerEngine
const double nav_pid_t::courseErrorIntegralLimit = 40.;
const double nav_pid_t::absMaxThrustPerEngine = 40.;
const double nav_pid_t::PI = 3.14159265358979323846;

nav_pid_t::nav_pid_t()
    : prevCourseError(0),
      courseErrorIntegral(0),
      PGain(0), IGain(0), DGain(0),
      course(0), course_rad(0), thrust_pct(0)
      {}

void nav_pid_t::set_rpm_pid(double heading) {
  double courseError = course_rad-heading;
  double courseErrorChange = courseError - prevCourseError;
  prevCourseError = courseError;
  double PdThrust = PGain * courseError;
  clamp(PdThrust, absMaxThrustPerEngine);
  courseErrorIntegral += courseError * IGain;
  clamp(courseErrorIntegral, courseErrorIntegralLimit);
  double DdThrust = DGain * courseErrorChange;
  clamp(DdThrust, absMaxThrustPerEngine);
  double dThrust = // In Newtons per engine
    PdThrust + courseErrorIntegral + DdThrust;
  clamp(dThrust, absMaxThrustPerEngine);
  set_rpm_dth(dThrust);
}

void nav_pid_t::set_rpm_dth(double dThrust) {
  // Given differential thrust, calculate left and right thrust
  double avgThrust = (thrust_pct/100.) * absMaxThrustPerEngine;
  double lThrust, rThrust;
  if (dThrust > absMaxThrustPerEngine)
    dThrust = absMaxThrustPerEngine;
  if (dThrust/2 >= avgThrust) {
    lThrust = dThrust;
    rThrust = 0;
  } else if (dThrust/2 <= -avgThrust) {
    lThrust = 0;
    rThrust = -dThrust;
  } else if (avgThrust+dThrust/2 > absMaxThrustPerEngine) {
    lThrust = absMaxThrustPerEngine;
    rThrust = lThrust - dThrust;
  } else if (avgThrust-dThrust/2 > absMaxThrustPerEngine) {
    rThrust = absMaxThrustPerEngine;
    lThrust = rThrust + dThrust;
  } else {
    lThrust = avgThrust + dThrust/2;
    rThrust = avgThrust - dThrust/2;
  }
  
  clamp(lThrust, absMaxThrustPerEngine);
  clamp(rThrust, absMaxThrustPerEngine);
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
