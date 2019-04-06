#!/bin/bash

if [ ! -f /home/xxx/crontab_backup ]; then
 cat /etc/crontab > /home/xxx/crontab_backup
fi

backup_md5=$( md5sum /home/wfoulon/crontab_backup | awk '{print $1}' )
cron_md5=$( md5sum /etc/crontab | awk '{print $1}' )

if [ "$backup_md5" != "$cron_md5" ]; then
	echo "crontab changed"
	echo "crontab changed" | sendmail -s "your crontab has changed" root
	cat /etc/crontab > /home/xxx/crontab_backup
	exit 1
else
	echo "nothing changed"
	 exit 2
 fi

# To execute the cron every day at midnight
# sudo crontab -u root -e
# Copy this line in the crontab file "0 0 * * root /absolute/path/to/the/file"
