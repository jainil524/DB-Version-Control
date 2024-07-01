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

DATABASE FOLDER
    |
    |-> Structure ====> (Folder)
    |
    |-> Tables ====> (Folder)
    |       |
    |       |-> Structure ====> (Folder)   [ this  folder will be containing the only structural changes ]
    |       |-> Records ====> (Folder)  [ this folder will be containing the only records or data changes ]
    |       |       |
    |       |       |-> Datatime ( ISO 8601 ) .sql
    |


TODOs
====================
1) Discuss about what tech will be used in backend ( for efficiency purpose )
2) 