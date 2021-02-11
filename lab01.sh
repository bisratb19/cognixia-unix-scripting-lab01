#!/bin/bash

# 1

printf 'HOSTNAME: '$HOSTNAME > report_file.txt
printf 'IP address: 'ifconfig | cut -d ' ' -f10 | head -n 2 | tail -n 1 >> report_file.txt
printf 'Free memory: 'free -mh | awk '/Mem:/ {print $4}' >> report_file.txt
printf 'Number of CPU cores: 'lscpu | awk '/CPU/ {print $2}' | head -n 2 | tail -n 1 >> report_file.txt

# 2


# 3


# print report
cat report_file.txt
