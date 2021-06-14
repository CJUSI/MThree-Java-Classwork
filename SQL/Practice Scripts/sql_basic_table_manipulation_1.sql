show databases; #Show all available databases

#Create empty database - check if it exists
DROP DATABASE IF EXISTS db_1;
create database db_1;

#Select the DB from variable
use db_1;

#Create table replace
create TABLE trainee (
    ID			    INT			AUTO_INCREMENT PRIMARY key,
    name 		    varchar (50) 	not null, #error exception if duplicate is inserted into table
    location 	  	varchar(50) 	not null,
    postcode 	  	char (8)		default 'Unknown', # set default value at Unknown
    DOB			    date,
    YEARS		    INT				check (YEARS >= 0),
    speciality		varchar(20)		check (speciality in ('C', 'TA', 'Dr of Psych', 'Linux', 'SEN')), # Check that the values inserted are present in the array
    isNew		    INT				check (isNew in (0,1))
);

#Show the table selected from 'use'
show tables;

#Insert rows into the table
insert into trainee (name, location, postcode, DOB, YEARS, speciality, isNew) values ('Callum Smith', 'Streatham', 'SW171DD', '1994-06-06', 5,  'C', 1);
insert into trainee (name, location, postcode, DOB, YEARS, speciality, isNew) values ('Rory Smith', 'Streatham', 'SE161DB', '1999-05-27', 0, 'TA', 1);
insert into trainee (name, location, postcode, DOB, YEARS, speciality, isNew) values ('Evelyn Smith', 'Oval','NW17', '1995-10-01', 3, 'Dr of Psych', 0);
insert into trainee (name, location, postcode, DOB, YEARS, speciality, isNew) values ('Steve Smith', 'Bognor Regis', default, '1955-01-28', 20, 'Linux', 0); #Can insert in any order
insert into trainee (name, location, postcode, DOB, YEARS, speciality, isNew) values ('Brigid Smith', 'Furzedown', 'SW166RT', '1964-02-05', 20, 'SEN', 0);

#Select *(all) rows from db
select * from trainee; #where speciality in ('Linux', 'C');

#shows information on columns and datatypes etc
desc trainee;

#Update cell in row based upon condition
update trainee set postcode = 'SW166RT' where ID = 4;

#Select within a range
select * from trainee where YEARS between 5 and 20;

#Select within a range and a limit
select * from trainee where YEARS between 5 and 20 limit 2;

#Order display by column
select * from trainee order by YEARS DESC;

#Using wildcards to check if a character is present in a cell (% is wildcard)
select * from trainee where postcode like '%N%';

#Using underscores to check if character is present (_ = any character present - no. of underscores indicates no. of chars)
select * from trainee where postcode like '_______';

#Using square brackets to build range of options with wildcards (starts with S or W followed by anything(%)) - doesn't work with MariaDB
select * from trainee where postcode like '[SW]%';
select * from trainee where postcode like '[^SW]%';

#Use string functions to only display the first name.
SELECT SUBSTRING_INDEX (name, " ", 1) as firstname, SUBSTRING_INDEX(name," ", -1)  as lastname
from trainee;

#Create a table