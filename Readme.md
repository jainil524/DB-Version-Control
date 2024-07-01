// This is current not going to be considered as an idea as of now
----------------------------------------------------------------------------------------------
Location of Storage of the Oracle mysql database files : 
Windows : "C:\ProgramData\MySQL\MySQL Server 8.0\Data"

Location of Storage of the Xampp mysql database files : 
Windows : "C:\xampp\mysql\data"

Go to the files C:\ProgramData\MySQL\MySQL Server 8.0\mysql.ini

Add these lines in the last:
general_log = 1
general_log_file = "A:\Log.log"


This above will log all the queries into the general_log_file(Log.log)
-----------------------------------------------------------------------------------------------


What queries we need
Create
Alter
Drop

Following is the command to get all the queries for a particular database
C:\Program Files\MySQL\MySQL Server 8.0\bin> .\mysqldump --complete-insert --create-options --events --quick -u root -p jainil > backup.sql


FOLDER STURCTURE
----------------------------------------------------------------------
DATABASE_NAME ====> (Folder)
    |
    |
    |-> Tables ====> (Folder)
    |       |
    |       |-> Structure ====> (Folder)   [ this  folder will be containing the only structural changes ]
    |       |-> Records ====> (Folder)  [ this folder will be containing the only records or data changes ]
    |       |       |
    |       |       |-> Datatime ( ISO 8601 ) .sql
    |
----------------------------------------------------------------------

=> How to scrapping is working
1) Create Folder Structure: Ensure necessary folders are created.
2) Read .sql File: Parse the .sql file content.
3) Extract Structures: Identify and extract table creation statements.
4) Extract Data: Identify and extract data insertion statements.
5) Generate Timestamps: Create valid filenames using timestamps.
6) Save Structures: Save table structures in the Structure folder.
7) Save Data: Save table data in timestamped files within the Tables/Records/[table_name] ( and the table name is  ) folder.
8) Run Script: Execute the main function to perform the entire process.
9) Once scrapping is done, the folder structure will be created as mentioned above.
10) The data will be stored in the respective folders.
11) The main .sql file will be moved into the database folder.


=> To run the script
1) Open the terminal
2) Just run the command `python scrapper.py`

TODOs
====================
1) Discuss about what tech will be used in backend ( for efficiency purpose )
2) 