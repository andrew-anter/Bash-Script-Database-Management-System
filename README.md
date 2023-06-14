# Bash Script Database Management System
This repo representes A Bash-based database management system (DBMS). 
The system represents databases as folders and tables as files. For each table, there are two files: one for the data and one for the metadata concerning the columns' specifics. When the script is run, it asks the user to connect to a database that was created before or create a new one and connect to it. After connecting to the database, the user is asked what to do next within the database tables themselves, such as performing CRUD operations on data or editing tables or columns.

The system includes a number of validations to ensure that the data entered by the user is correct. For example, the system will validate that the names of tables and columns are valid, and that the data entered into each column is of the correct type. If the user enters incorrect data, the system will display an error message and ask the user to enter the data again.

The application runs only on linux terminals. To run the application: 
```bash
chmod 777 DB-Manager.sh
./DB-Manager.sh
```

## Each feature is implemented in a separate module: 
<ul>
  <li>Table-Manager.sh: This module is responsible for managing tables, such as creating, deleting, and dropping tables.</li>
  <li>create-table.sh: This module is responsible for creating new tables.</li>
  <li>delete-from-table.sh: This module is responsible for deleting data from tables.</li>
  <li>drop-table.sh: This module is responsible for dropping tables.</li>
  <li>insert-into-table.sh: This module is responsible for inserting data into tables.</li>
  <li>select-from-table.sh: This module is responsible for selecting data from tables.</li>
  <li>update-table.sh: This module is responsible for updating data in tables.</li>
</ul>

