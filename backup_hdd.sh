#!/bin/bash
TS=$(date +"%Y_%m_%d-%H_%M")
rsync -av /media/$1 /media/hdd_$1 > /var/log/local_backup/$1_$TS.log 2>&1
RESULT=$?
ln -sf /var/log/local_backup/$1_$TS.log /var/log/local_backup/$1.log
if [[ $RESULT -gt 0 ]]
then
   mail -s "Backup FAILED $1" pawelpp@gmail.com <<< "Backup FAILED $1" 
fi
