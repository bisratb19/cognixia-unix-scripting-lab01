#!/bin/bash

REPORT_DATE=$(date +"%Y-%m-%d-%T")
REPORT_FILE='report_'$REPORT_DATE'.log'

# 1

printf 'HOSTNAME: '$HOSTNAME > $REPORT_FILE
printf 'IP address: '$(ifconfig | cut -d ' ' -f10 | head -n 2 | tail -n 1) >> $REPORT_FILE
printf 'Free memory: '$(free -mh | awk '/Mem:/ {print $4}') >> $REPORT_FILE
printf 'Number of CPU cores: '$(lscpu | awk '/CPU/ {print $2}' | head -n 2 | tail -n 1) >> $REPORT_FILE

# 2
printf 'Number of processes running: '$(ps -aux | wc -l) >> $REPORT_FILE

# 3
printf 'Enter username to check: '
read REPORT_USERNAME

USER_CHECK=$(sed -n '/^$REPORT_USERNAME/p' /etc/passwd | wc -l)

if [ $USER_CHECK > 0 ]; then
	USER_CHECK_OUTPUT='User $REPORT_USERNAME is found in /etc/passwd'
else
	USER_CHECK_OUTPUT='User $REPORT_USERNAME is not found in /etc/passwd'
fi

printf $USER_CHECK_OUTPUT >> $REPORT_FILE

# print report
printf 'Log file name: '$REPORT_FILE
cat $REPORT_FILE
