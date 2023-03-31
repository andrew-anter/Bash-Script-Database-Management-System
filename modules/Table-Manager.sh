#!/bin/bash

## get the modules folder path from the DB-Manager.sh
modules=$1

## check and crete tables and metadata folders
if ! [ -d "Tables" ]
then
	mkdir "Tables"
	echo "Tables Directory Created"
fi

if ! [ -d "Metadata" ]
then
	mkdir "Metadata"
	echo "Metadata Directory Created"
fi

echo "Greetings from Table Manager: $PWD"

while read -p "
Select an option:
	1- Create Table
	2- List Tables
	3- Drop Table
	4- Insert Into Table
	5- Select From Table
	6- Delete From Table
	7- Update Table
	8- Disconect Database
	" option
do
	case $option in 
		"1") 
			$modules/create-table.sh ;;
		
		"2")
			ls "./Tables/" ;;
		
		"3")
			$modules/drop-table.sh ;;

		"4")
			$modules/insert-into-table.sh ;;
		
		"5")
			$modules/select-from-table.sh ;;

		"6")
			$modules/delete-from-table.sh ;;

		"7")
			$modules/update-table.sh ;;

		"8")
			exit;;
	esac
done

