USE traineedb;

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