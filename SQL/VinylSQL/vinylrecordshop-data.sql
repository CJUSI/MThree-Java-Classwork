--Vinyl Record Shop Data - Callum Smith - 08/06/2021

--Load Database
USE vinylrecordshop;

--Clear rows and reset so the script can be run multiple times
DELETE FROM album;
ALTER TABLE album
	AUTO_INCREMENT=1;


--Insert first record into albums table. - throws error if you do not define ID
--INSERT INTO album (albumTitle, releaseDate, price, label) VALUES
  --('Imagine', '1971-9-9', '9.99', 'Apple');
INSERT INTO album
VALUES (1,'Imagine','Apple','1971-9-9',9.99);


--Insert second record into albums table using naming fields convention
INSERT INTO album (albumTitle, releaseDate, price, label) VALUES
  ('2525 (Exordium & Terminus)', '1969-7-1', 25.99, 'RCA');

--Show all stored records inside album table
SELECT * FROM album;

--Insert the remaining records using multiple rows of data
INSERT INTO album (albumTitle, releaseDate, price, label) VALUES
	  ("No One's Gonna Change Our World", '1969-12-12', 39.95, 'Regal Starline'),
	  ('Moondance Studio Album', '1969-8-1', 14.99, 'Warner Bros'),
   	('Clouds', '1969-5-1', 9.99, 'Reprise'),
   	('Sounds of Silence Studio Album', '1967-1-17', 9.99, 'Colombia'),
  	('Abbey Road', '1969-1-10', 12.99, 'Apple'),
   	('Smiley Smile', '1969-9-18', 5.99, 'Capitol');

--Show all(*) stored records inside album table
SELECT * FROM album;

--Delete record where albumID == 5
DELETE FROM album
  where albumID = 5;

--Reinsert record using INSERT
INSERT INTO album (albumTitle, releaseDate, price, label) VALUES
  ('Clouds', '1969-5-1', 9.99, 'Reprise');

--Update table with correct albumID for Clouds and Smiley Smile
UPDATE album
  SET albumId = 5 WHERE albumTitle = 'Clouds';
UPDATE album
  SET albumId = 9 WHERE albumTitle = 'Smiley Smile';

--Show Final Table
SELECT * FROM album;
