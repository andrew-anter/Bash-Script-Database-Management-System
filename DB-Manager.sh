#!/bin/bash

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
			read -p "Enter the name of the DB: " dbName
			
			if [ -d "./DBS/$dbName" ]
			then
				echo "!Error: DB is already exist!"
			else
				mkdir "./DBS/$dbName"
				echo "DB created."
			fi 
			;;
			
		"2")	ls "./DBS/"
			;;

		"3")	
			read -p "Enter the name of the DB to connect to: " dbName
			if [ -d "./DBS/$dbName"  ]
			then
				cd "./DBS/$dbName"
				# Go to Table Manager
			else
				echo "!Error: DB does not exist!"
			fi
			;;

		"4")	echo "DB Dropped";;
		"5")	exit;;
	esac
done
