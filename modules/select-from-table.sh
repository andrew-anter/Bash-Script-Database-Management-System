#!/bin/bash

echo "select from table"

read -p "Enter the name of the table: " tbName
if [ -f "./Tables/$tbName" ]
then
	echo "table found!!"
	
	awk -F : '{printf "%s(%s,%s) %-7s" ,$1,$2,$3, "" }END{printf "\n"}' "./Metadata/$tbName"
	awk -F : '{ 
		for(i = 1 ; i <= NF ; i++){
			printf "  %s %-10s", $i , "";
		}
		printf "\n"
	 } END{ printf "\n" }' "./Tables/$tbName"

else
	echo "!Error: no table named \"$tbName\" in the current database"
fi
