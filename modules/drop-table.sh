#!/bin/bash

read -p "Enter table name: " tbName
			
if [ -f "./Tables/$tbName"  ]
then
    read -p "Do you really want to drop this table with its data? [y/n]: " confirm
    if [ "${confirm^^}" = "Y"  ]
    then
        rm "./Tables/$tbName"
        rm "./Metadata/$tbName"
        echo "Table Dropped"
    fi

else
    echo "This table does not exist"
fi