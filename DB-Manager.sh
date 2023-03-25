#!/bin/bash

## initialization of DBS file
if ! [ -d "./DBS/"  ]
then
	mkdir "DBS"
	echo "DBS created"
fi

while read -p "
Select an option:
	1- Create Database
	2- List Databases
	3- Connect to Database
	4- Drop Database
	5- Exit Application
	" option
do
	case $option in 
		"1")	
			read -p "Enter the name of the Database: " dbName
			
			if [ -d "./DBS/$dbName" ]
			then
				echo "!Error: Database is already exist!"
			else
				mkdir "./DBS/$dbName"
				echo "Database created."
			fi 
			;;
			
		"2")	ls "./DBS/"
			;;

		"3")	
			read -p "Enter the name of the Database to connect to: " dbName
			if [ -d "./DBS/$dbName"  ]
			then
				cd "./DBS/$dbName"
				# Go to Table Manager
			else
				echo "!Error: Database does not exist!"
			fi
			;;

		"4")	
			read -p "Enter the name of the Database to drop: " dbName
			if [ -d "./DBS/$dbName"  ]
			then
				read -p "Are you sure want to drop $dbName Database with all its tables? [y/n]: " check
				if [ $check = "y" ]
				then
					rm -r "./DBS/$dbName"
					echo "Database $dbName dropped."
				fi
			else
				echo "!Error: Database does not exist!"
			fi
			;;

		"5")	exit
			;;
	esac
done
