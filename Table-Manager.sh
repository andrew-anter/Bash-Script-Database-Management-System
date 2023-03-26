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

				read -p "Enter the names of columns separated by spaces: " -a cols
				read -p "Enter the data type for each column respectively separated by spaces: [s:string / i:integer] " -a datatype
				read -p "Specify which column is primary: [primary:p / normal:n]" -a primaryKey
				if [ $cols ]
				then
					if [[ ${#datatype[*]} = ${#cols[@]} ]]
					then
						if [[ ${#cols[*]} = ${#primaryKey[*]}  ]]
						then
							echo "vaild colstypes number & valid primarykey number"
							
							valid=1
							for i in ${datatype[*]}
							do
								if ! [[ ${i^^} =~ ^(S|I)$ ]]
								then
									echo "One or more data type is invalid"
									valid=0
									break
								fi
							done
							
							primary=0
							for i in ${primaryKey[*]}
							do
								if ! [[ ${i^^} =~ ^(P|N)$  ]]
								then
									echo "!Error: One or more column type (p/n) is invalid"
									valid=0
									break
								fi
								
								if [[ ${i^^} =~ ^(P)$ ]]
								then
									primary=1
								fi
							done	

							if [[ $primary > 1  ]]
							then
								echo "!Error: Can not set up more than one primary key column" 
								continue
							elif [[ $primary = 0  ]]
							then
								echo "!Error: There must be one primary key column"
								continue
							fi
							
							if [[ $valid = 1  ]]
							then
								touch "./Tables/$tbName" "./Metadata/$tbName"
								echo "Table $tbName created"
							fi
						else
							echo "!Error: All columns must be specifie as a primary key or not"
						fi

					else
						echo "!Error: All columns must have a datatype"
					fi
				else
					echo "!Error: No columns were specified"
				fi
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
				if [ ${confirm^^} = "Y"  ]
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

