#!/usr/bin/expect -f

set timeout 1800
set cmd [lindex "$env(ANDROID_HOME)/tools/android --licenses"]

spawn {*}$cmd
expect {
  "Review licenses that have not been accepted (*)*" {
        exp_send "y\r"
        exp_continue
  }
  "*Accept? (*)*" {
        exp_send "y\r"
        exp_continue
  }
  eof
}
