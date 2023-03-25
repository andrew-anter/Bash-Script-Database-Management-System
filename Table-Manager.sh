#!/bin/bash

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
			echo "Create Table"
			;;
		"2")
			echo "List tables"
			;;
		"3")
			echo "Drop tables"
			;;
		"4") 
			echo "Insert into table"
			;;
		"5")
			echo "select from table"
			;;
		"6")
			echo "delete from table"
			;;
		"7")
			echo "update table"
			;;
		"8")
			exit;;
	esac
done

