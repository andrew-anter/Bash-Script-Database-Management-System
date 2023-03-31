#!/bin/bash

echo "select from table"

read -p "Enter the name of the table: " tbName
if [ -f "./Tables/$tbName" ]
then
	echo "table found!!"
	echo `awk -F : '{print $1"("$2","$3")"}' "./Metadata/$tbName"`
	##awk -F : 'BEGIN{print ""} {print ""}'

else
	echo "!Error: no table named \"$tbName\" in the current database"
fi