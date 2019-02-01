#!/bin/bash

echo " Starting backup "

#Setting up connectino
DB_SERVER='127.0.0.1'
DB_NAME='quimiflex'
DB_USER='quimiflex'
DB_PASS='AZs4buJS6F'
DB_PARAM='--add-drop-table --extended-insert'
DB_PORT=3306

#Setting up variables
FILENAME=$(date '+%Y%m%d%H%M%S').sql;
MYSQLDUMP=/usr/bin/mysqldump
BACKUP_DIR=/home/roberto/backup/mysql

#Create backup directory if not exists
if [ ! -e "$BACKUP_DIR" ]; then
  #echo "Create backup directory";
  mkdir -p $BACKUP_DIR; 
fi

#Start backup to directory
$MYSQLDUMP -h $DB_SERVER -P $DB_PORT -p $DB_NAME $DB_PARAM -u $DB_USER -p$DB_PASS > $BACKUP_DIR/$FILENAME;

#Create zip file
zip $BACKUP_DIR/$FILENAME.zip $BACKUP_DIR/$FILENAME

#Remove file
rm $BACKUP_DIR/$FILENAME
