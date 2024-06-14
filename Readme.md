Location of Storage of the Oracle mysql database files : 
Windows : "C:\ProgramData\MySQL\MySQL Server 8.0\Data"

Location of Storage of the Xampp mysql database files : 
Windows : "C:\xampp\mysql\data"

Go to the files C:\ProgramData\MySQL\MySQL Server 8.0\mysql.ini

Add these lines in the last:
general_log = 1
general_log_file = "A:\Log.log"


This above will log all the queries into the general_log_file(Log.log)
