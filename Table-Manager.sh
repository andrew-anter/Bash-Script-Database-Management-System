#!/bin/bash

# check and create tables and metadata folders
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

###########################################

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
			read -p "Enter table name: " tbName
			if [ -f "./Tables/$tbName"  ]
			then
				echo "Error this table already exist"
			else
				touch "./Tables/$tbName"
				echo "Table $tbName created"
			fi
			;;
		"2")
			ls "./Tables/"
			;;
		"3")
			read -p "Enter table name: " tbName
			
			if [ -f "./Tables/$tbName"  ]
			then
				read -p "Do you really want to drop this table with its data? [y/n]: " confirm
				if [ $confirm = "y"  ]
				then
					rm "./Tables/$tbName"
					echo "Table Dropped"
				fi

			else
				echo "This table does not exist"
			fi
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

