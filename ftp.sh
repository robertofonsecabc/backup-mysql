#!/bin/sh

while getopts f: option
do
	case "${option}"
	in
	f) FILE=$OPTARG;;
	esac
done

if [ ! $FILE  ]; then
	echo "File not found, add -f parameter";
	exit 1;
fi	

echo "Start uploading - $FILE";