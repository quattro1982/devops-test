#!/bin/bash
## Assuming no changes to file timestamps, We can use the GNU find commands to crontab to be run every night to clean up the logs
## e.g 30 01 * * * find /var/log/<log file name> -type f -mtime +3 -exec ls -lah{} \;"

for logfile in "backend.log*" "application.log*" "monitoring-*"
do
   { crontab -l; echo "30 01 * * * find /var/log/$logfile -type f -mtime +3 -exec ls -lah{} \;"; } | crontab -
done
