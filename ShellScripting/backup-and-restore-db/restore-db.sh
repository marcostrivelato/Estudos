#!/bin/bash

#getting the files from aws bucket
restore_path=/home/user/restore
aws s3 syc s3://my_backup_bucket/$(date +%F) $restore_path

cd $restore_path
if [ -f $1.sql ]
then
	mysql -u root mydb restore < $1.sql
	
	#Checking ig there was an error on the restore
	if [ $? -eq 0 ]
	then
		echo "Restore executed sussecefully"
	else
		echo "Problem during the restore process"
	fi
else
	echo "file not found"
fi
