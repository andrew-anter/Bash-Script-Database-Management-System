#!/bin/bash

while read -p "Select an option
	1- Create Database
	2- List Databases
	3- Connect to Database
	4- Drop Database
	5- Exit Application
	" option
do
	case $option in 
		"1")	echo "DB created";;
		"2")	echo "DB listed";;
		"3")	echo "DB Connected";;
		"4")	echo "DB Dropped";;
		"5")	exit;;
	esac
done
