#!/bin/bash
## Create crontab entry with the following information
## Crontab that runs the http 4xx/5xx error checking  at 0130 System time every day
## 30 01 * * * bash http_error.sh <log filename> <recipient email address>
{ crontab -l; echo "30 01 * * * bash http_error.sh default.80.log alert@company.com"; } | crontab -