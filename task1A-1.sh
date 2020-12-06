#!/bin/bash

# Simple validation
if [ $# -eq 0 ]
  then
    echo "Usage: http_alert.sh <log file name> <recipient>"
    exit 1
fi

logfile=$1
recipient=$2

echo "Log file is $logfile"

# Assume Apache logs are in standard format, we just use cut to split the logline with whitespace as separator and get the 9th column,
# which contains the Response codes
if [ -f $logfile ]; then
  error_count=`cat $logfile | cut -d ' ' -f 9 | egrep "^4.*|^5.*" | wc -l`
else
  echo "Log file doesn't exist"
  exit 1
fi

# If occurences larger than 100, send alert email to target recipient
if [ $error_count -gt 100 ];
   then  sendmail "$recipient" <<EOF
subject: Alert - HTTP Error codes
from:Apache Server

HTTP Code 4xx/5xx occurences is > 100
EOF
fi