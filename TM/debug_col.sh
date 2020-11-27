#! /bin/bash
doit=debug_col
. /usr/local/libexec/load_exconfig.sh
if [ -z "$STY" ]; then
  # echo "cmd is '$cmd' srcmode is '$srcmode' dispmode is '$dispmode'"
  # hit_any_key
  screen -t $doit $0 $*
  clear # after exiting screen
  echo "$doit completed, screen closed"
  exit 0
fi
  Launch       tm_bfr bfr -s Both -o /dev/null
  Launch Debug tm_gen scopexcol -V
  Launch Debug cmd    scopexsrvr -s Unix -v -V
