#!/bin/bash

read -p "Enter table name: " tbName
			
if ! [ "$tbName"  ]
then
    echo "!Error: No table name was entered" 
    continue
fi
if [ -f "./Tables/$tbName"  ] 
then
    echo "Error this table already exist"
else

    read -p "Enter the names of columns separated by spaces: " -a cols
    read -p "Enter the data type for each column respectively separated by spaces: [s:string / i:integer] " -a datatype
    read -p "Specify which column is primary: [primary:p / normal:n]" -a primaryKey
    if [[ ${cols[@]} ]]
    then
    	
    	## check if column names is unique
    	for i in ${cols[*]}
    	do
    		if [ ${freq[$i]} ]
    		then
    			freq[$i]=$(( ${freq[$i]} + 1 ))
		else
			freq[$i]=$(( 1 ))
    		fi
    		echo "$i: ${freq[$i]}"
    	done
    
        if [[ ${#datatype[*]} = ${#cols[@]} ]]
        then
            if [[ ${#cols[*]} = ${#primaryKey[*]}  ]]
            then
                valid=1
                for i in "${datatype[@]}"
                do
                    if ! [[ ${i^^} =~ ^(S|I)$ ]]
                    then
                        echo "!!Error: One or more data type is invalid"
                        valid=0
                        break
                    fi
                done
                
                primary=0
                for i in "${primaryKey[@]}"
                do
                    if ! [[ ${i^^} =~ ^(P|N)$  ]]
                    then
                        echo "!!Error: One or more column type (p/n) is invalid"
                        valid=0
                        break
                    fi
                    
                    if [[ ${i^^} =~ ^(P)$ ]]
                    then
                        primary=1
                    fi
                done	

                if [ $primary -gt 1  ]
                then
                    echo "!!Error: Can not set up more than one primary key column" 
                    continue
                elif [[ $primary = 0  ]]
                then
                    echo "!!Error: There must be one primary key column"
                    continue
                fi
                
                if [[ $valid = 1  ]]
                then
                    touch "./Tables/$tbName" "./Metadata/$tbName"
                    echo "Table $tbName created"

                    for (( i=0; i<${#cols[*]}; i++  ))
                    do
                        echo "${cols[$i]}:${datatype[$i]}:${primaryKey[$i]}" >> "./Metadata/$tbName"
                    done
                fi
            else
                echo "!!Error: All columns must be specifie as a primary key or not"
            fi

        else
            echo "!!Error: All columns must have a datatype"
        fi
    else
        echo "!!Error: No columns were specified"
    fi
fi
