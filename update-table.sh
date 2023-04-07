#!/bin/bash

read -p "Enter Table Name: " tbName
read -p "Enter the primary key value of the row to update: " pkVal
read -p "Enter the column name and the new value separated by spaces(or without a value to delete the existing one): " colName newVal

## checks if table exists
if [ "$tbName" ] && [ -f "./Tables/$tbName" ] && [ -f "./Metadata/$tbName" ] 
then
	## Get the primary key column number
	pkColNo=`awk -F : '{ if( $3 == "p" ) print NR; }' "./Metadata/$tbName"`
	
	## Get the given column number
	colNo=`awk -F : -v colName=$colName '{ if( $1 == colName ) print NR; }' "./Metadata/$tbName"`
	
	## Check if the given value exists in table
	rowNumber=`awk -v col=$pkColNo -v pkVal=$pkVal -F : '
		BEGIN{rn=-1}
		{ if( $col == pkVal ) rn = NR }
		END{ print rn }' "./Tables/$tbName"
		`
	## If the row exists delete it otherwise return an error
	if [ $rowNumber != "-1" ]
	then
		## If the name of column is valid then update the field else return an error
		if [ $colNo ]
		then
			awk -F : -v row=$rowNumber -v newVal=$newVal -v colNo=$colNo -v tbName=$tbName '{
			if( NR == row ){
					for(i = 1; i < NF; ++i){
						if( i == colNo )
							printf "%s:", newVal > "./Tables/"tbName;
						else
							printf "%s:", $i > "./Tables/"tbName; 
					}
					print $NF > "./Tables/"tbName; 
				}
			else
				print $0 > "./Tables/"tbName;
			}' "./Tables/$tbName"
			echo "Row with primary key ($pkVal) has been updated"
		else
			echo "!Error: Column not found"
		fi
	else
		echo "!Error: Row not found." 
	fi
else
	echo "!Error: Table not found or corrupted."

fi
