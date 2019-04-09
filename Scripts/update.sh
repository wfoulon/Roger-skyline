#!/bin/bash

sudo apt-get update -y > /var/log/update_script.log
sudo apt-get upgrade -y >> /var/log/update_script.log

exit 0

# To execute the cron one time a week at 4.00 and at every reboot
# sudo crontab -u root -e
# copy this line in the crontab file "0 4 * * 1 root /absolute/path/to/the/file >> /var/log/update_script.log"
# copy this line in the crontab file "@reboot root /absolute/path/to/the/file >> /var/log/update_script.log"
