--IMPORTANT CAPITAL LETTER IS OPTIONAL IN SQL BUT WE AS A DEVELOPER USE THE CAPITAL LETTER SO THAT 
--WE CAN DISTINGUISH BETWEEN WHAT IS COMING FROM THE SQL OR WHAT IS COMING FROM THE CUSTOM NAME
-- LETS BEGIN



--showing the database we already have
SHOW DATABASES; 
==================================================================
--Creating a database in mysql
SYNTAX->  CREATE DATABASE <name>;
ex-CREATE DATABASE MY_STORE;
CREATE DATABASE PROFILES;
====================================================================
--DELETING THE DATABASE/ OR IN DB LANGUAGE WE SAY DROP THE DATABASE

SYNTAX-> DROP DATABASE <DATABASE NAME>

ex DROP DATABASE MY_STORE;

====================================================================
--CHOOSING THE DATABSE WHICH WE WANT TO USE
SYNTAX-> USE <DATABASE NAME> 
ex- USE MY_STORE;

====================================================================
--checking what database we are currnetly working on 
SYNTAX-> SELECT DATABASE();


==================================================================================
--before creating a database i want to introduce you to some of the datatypes 
--used in mysql database(just to freak you out ....just joking :P )

Numeric types                    String types                     date types

int 								char							date
smallint							varchar							datetime
tinyint								binary							timestamp
mediumint							varbinary						time
bigint								blob							year
decimal								tinyblob						
Numeric								mediumblob
float								longblob
double								text
bigint  							tinytext	
									mediumtext
									longtext
									enum
--we use above datatypes according to requirement
--but mainly we use int for no.,varchar for string..which ranges between 1-255 characters
===================================================================================




-- how to create a table 
SYNTAX-> CREATE TABLE TABLE_NAME
		(
			COLUMN_NAME data_types,
			COLUMN_NAME data_types

		);


ex->  CREATE TABLE dogs(
			name varchar(100),
			age int
			);

==================================================================================

--now we had created the table but how do we know that our table is created ......?
SYNTAX-> SHOW TABLES;
--it shows all the table with their respective table names
==================================================================================
--how to look for columns of tables
SYNTAX-> SHOW COLUMNS FROM TABLE_NAME;
--it will show the columns/field with their respective types with other parameter like 
--null,key,default,extra values ....i will discuss this further
one short command for the above one is 
SYNTAX-> DESC TABLE_NAME;
-- results will be same i prefer this one coz its short
====================================================================================
--deleting tables/dropping table
DROP TABLE table_name;
====================================================================================

--Adding data into your table

SYNTAX-> INSERT INTO table_name (COLUMN_NAME,COLUMN_NAME)
		  VALUES (value,value);
--values are corresponding to the column datatypes
ex->
INSERT INTO dogs (name,age)
		  VALUES ('bruno',10);
		  --we can do it in one line too
		  --one more thing order matter in column name with respect to values....
		  --string should be in quotes
=====================================================================================

SELECT command 

 select as a name suggested SELECT is used to SELECT the specific column with given additional parameters(like searching and sorting)
 and what that additional parameter is i'll discuss further' 

 ex-> SELECT * FROM table_name;
 --it shows complete table'
 ===============================================================================

Multiple INSERT --how to do it ?

ex->
INSERT INTO dogs (name,age)
		  VALUES ('bruno',10),
		  		 ('ricky',7),
		  		 ('sunny',19);
=================================================================================

please take a break here and learn somethings about warnings....

you often see query ok , 1 row affected ,1 warnings.....whats that one warning?

--YOU CAN SEE THOSE WARNING USING SIMPLE COMMANDS
SYNTAX-> SHOW WARNINGS;
--OUTPUT OF THE ABOVE QUERY WILL BE THREE COLUMNS NAMELY- LEVEL CODE MESSAGE WITH THE RESPECTIVE INFORMATION
--ALTHOUGH IT CAN BE ANYTHING RELATED TO YOUR ERROR BUT MOST OFTEN WE DO MISTAKES RELATED TO DATATYPES
--IMPORTANT when you  encounter the warnings see it quickly (i.e) after inserting another query other than (SHOW WARNINGS ),warning log will be empty
=========================================================================================
now back to business
--now we will discuss about what is the other parameter we see while describing databases

we see columns like null, key, default ,extra

what is null ?
-> it means "the value is not known". it doesn't' means 0...
->if the null columns says "yes" that means they are permitted to be null.
 it means we can leave that column without specifying values

so now the question is how can we prevent that the column should not be null ?
answer-> by specifying not null while making table ,we can add not null property 
just after specifying the column name so now what happen if we doesn't' specify the values for the not null ?
answer-> it shows the warning field(column_name) doesn't' have a default value 
--if column will be of integer type it will place 0 there and if String(varchar) type then it will leave it blank;
=================================================================
how to set default values?

answer-> its simple just like not null ....use DEFAULT 'VALUE' after specifying column name and datatype  
now if you are reading this whole basic_sql thing carefully you have came accross your mind a few things 
1.isn't' it redundant to use not null and default at the same time ?
answer-> no..by using default we can explicitly provide the null value to the columns where as using not null we cant provide that 
  

==================================================================
now lets move onto key parameter 

what is key?

if you already know about primary key if you came from dbms background. 
its good for you but if not then read this

right now we can add identical name or any parameter as many times as possible 
to stop this problem primary key is there for you  
primary key is used to uniquely define/identify the dataset you have.
lets take an example 
Two people can have a same name but they cannot have same rollno/mobileno/address/aadharno etc 
so we assign primary key onto those columns so that we can uniquely identify them

lets see an example 
CREATE TABLE CATS ( CAT_ID INT NOT NULL ,
						NAME VARCHAR(50),
						AGE INT,
						PRIMARY KEY (CAT_ID));

--HERE WE SPECIFY CAT_ID AS THE PRIMARY KEY SO IT CANT BE REPETATIVE. (i.e) it should be unique

now again IMPORTANT STUFF - now you have specify that cat_id is primary key so you dont want to add it manually 
here's' a solution for that make CAT_ID Auto_increment;


CREATE TABLE CATS ( CAT_ID INT NOT NULL Auto_increment,
						NAME VARCHAR(50),
						AGE INT,
						PRIMARY KEY (CAT_ID));
--NOW IF YOU DONT SPECIFY THE CAT_ID IT AUTOMATICALLY ADDS ONE TO IT EVERYTIME

NOW I HAVE COVER ALL THE field NAMELY  null ,key ,default,extra
extra contains things like auto_increment etc..


=================================================================================
HERE WE ARE HALF WAY THROUGH THE BASICS OF MY_SQL 
=================================================================================

Now i will show you the "CRUD" --> CREATE READ UPDATE DELETE
IT MEANS HOW DO WE SEACH DATA , CREATE DATA ,UPDATE DATA ,DELETE/DESTRO DATA

EX-> SELECT * FROM dogs;
answer-> its a command saying give me all the columns from dogs table;..thats it

select is basically used for specifically define what column we need ...
ex-. SELECT NAME FROM dogs;
answer-> this selects the name column from the dog table
===================================================================================
WHERE clause (MORE SPECIFICITY IN SELECTION)

EX-> SELECT * FROM dogs WHERE AGE = 7;
ANSWER-> it only shows the result where age of dog =7;


ex-> SELECT * FROM dogs WHERE NAME = 'BRUNO';
ANSWER->IT ONLY SHOWS THE RESULTS WITH A DOG NAME BRUNO;
IMPORTANT-> whatever is in quotes ''..will be case insensitive..
i.e we can write bRuNo = BRUNO = bruno

select * from dogs where dog_id = age ;
it selects the columns where dog-id = age;

====================================================================================
IMPORTANT ALIASAS

ALIASAS MEANS CHANGING THE COLUMNS NAME OR TABLE NAME AS YOU WANT TO...
P.S IT DONT ACTUALLY CHANGE THE TABLE'S' COLUMNS ,,IT ONLY SHOWS YOU AS YOU WANT 
EX-> SELECT DOD_ID AS ID, NAME FROM DOGS;
ANSWER-> IT WILL SHOW YOU THE DOG_ID AS ID IN RESULTS.

=====================================================================================
UPDATE COMMAND

SYNTAX-> UPDATE table_name SET BREED ="LABRADOR" WHERE BREED="POMELIAN";
ANSWER-> after update we provide tablename then SET command then what changes we want to 
then on where we want that changes;
here we change the breed pomelian to LABRADOR;

note-.try selecting before updating 

=====================================================================================
DELETE COMMAND

SYNTAX-> DELETE FROM tablename WHERE name="bruno";
-> it deletes the entry bruno from the table..i.e from name column

que-> now think about what it will do?
DELETE FROM CATS;
->IT DELETES ALL THE DATA FROM CATS;
ITS DIFFERENT FROM DROPPING TABLE ....dropping means it destroy the entire table 
here we just deleting all the entries from the table;


=======================================================================================
CONGRATULATIONS ITS THE END OF BASICS OF SQL .
SOON I WILL SHOW YOU SOME INTERMEDIATE SQL ALSO
======================================================================================= 
