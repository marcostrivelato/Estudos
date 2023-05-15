#!/bin/bash

#creating and going to backup directory
user=/home/user
backup_path=$user/backup
cd $user
if [ ! -d backup ]
then
	mkdir backup
fi
cd backup

# The backups are sorted by date, so we are setting different directories for each date
date=$(date +%F)
if [ ! -d $date ]
then
	mkdir $date
fi

#checking all the tables
time=$(date +%R)
tabelas=$(mysql -u root mutillidae -e "show tables" | grep -v Table)

#dumping all tables with their name and the time of the backup in the name
for table in $tabelas
do 	
	file_name="$table-$time"
	mysqldump -u root mydb $table > $backup_path/backup/$date/$file_name.sql
done

#Check for error, can toggle this for manual backup execution
#if [ $? -eq 0 ]
#then
#	echo "backup realizado com sucesso"
#else
#	echo "houve um problema ao realizar o backup"
#fi

#using amazon bucket, use this command to sync the backups into there
#to use this the bucket must have already been set, check README for those settings
aws s3 sync $backup_path s3://my_backup_bucket
