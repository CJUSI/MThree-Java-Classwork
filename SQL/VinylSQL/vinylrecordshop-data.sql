-- Vinyl Record Shop Data - Callum Smith - 08/06/2021

-- Load Database
USE vinylrecordshop;

-- Insert first record into albums table. - throws error if you do not define ID
-- INSERT INTO album (albumTitle, releaseDate, price, label) VALUES
  -- ('Imagine', '1971-9-9', '9.99', 'Apple');
INSERT INTO album VALUES 
	(1,'Imagine','Apple','1971-9-9',9.99);


-- Insert second record into albums table using naming fields convention
INSERT INTO album (albumTitle, releaseDate, price, label) VALUES
	('2525 (Exordium & Terminus)', '1969-7-1', 25.99, 'RCA');

-- Show all stored records inside album table
SELECT * FROM album;

-- Insert the remaining records using multiple rows of data
INSERT INTO album (albumTitle, releaseDate, price, label) VALUES
	("No One's Gonna Change Our World", '1969-12-12', 39.95, 'Regal Starline'),
	('Moondance Studio Album', '1969-8-1', 14.99, 'Warner Bros'),
	('Clouds', '1969-5-1', 9.99, 'Reprise'),
   	('Sounds of Silence Studio Album', '1967-1-17', 9.99, 'Colombia'),
  	('Abbey Road', '1969-1-10', 12.99, 'Apple'),
   	('Smiley Smile', '1969-9-18', 5.99, 'Capitol');

-- Show all(*) stored records inside album table
SELECT * FROM album;

-- Delete record where albumID == 5
DELETE FROM album
  where albumID = 5;

-- Reinsert record using INSERT
INSERT INTO album (albumTitle, releaseDate, price, label) VALUES
	('Clouds', '1969-5-1', 9.99, 'Reprise');

-- Update table with correct albumID for Clouds and Smiley Smile
UPDATE album
  SET albumId = 5 WHERE albumTitle = 'Clouds';
UPDATE album
  SET albumId = 9 WHERE albumTitle = 'Smiley Smile';

-- Show Final Table
SELECT * FROM album;


-- Import csv files for artist, band song, bandartist and songAlbum tables using csv import method
-- Must remove and sort the column headers according to the schema before importing using this method
-- artist
-- LOAD DATA INFILE 'C:/Users/cjusm/Documents/MThree Java Course/MThree-Java-Classwork/SQL/VinylSQL/artist.csv'
    -- INTO TABLE vinylrecordshop.artist
        -- FIELDS TERMINATED BY ',';
-- band
-- LOAD DATA INFILE 'C:/Users/cjusm/Documents/MThree Java Course/MThree-Java-Classwork/SQL/VinylSQL/band.csv'
    -- INTO TABLE vinylrecordshop.band
       -- FIELDS TERMINATED BY ',';
-- song
-- LOAD DATA INFILE 'C:/Users/cjusm/Documents/MThree Java Course/MThree-Java-Classwork/SQL/VinylSQL/song.csv'
   -- INTO TABLE vinylrecordshop.song
       -- FIELDS TERMINATED BY ',';
-- bandartist
-- LOAD DATA INFILE 'C:/Users/cjusm/Documents/MThree Java Course/MThree-Java-Classwork/SQL/VinylSQL/artistBand.csv'
   -- INTO TABLE vinylrecordshop.bandArtist
       -- FIELDS TERMINATED BY ',';
-- songalbum
-- LOAD DATA INFILE 'C:/Users/cjusm/Documents/MThree Java Course/MThree-Java-Classwork/SQL/VinylSQL/songAlbum.csv'
   -- INTO TABLE vinylrecordshop.songAlbum
       -- FIELDS TERMINATED BY ',';

-- Dump via this command within mysql/bin:
-- mysqldump -p --user=root vinylrecordshop songAlbum
-- --result-file="C:/Users/cjusm/Documents/MThree Java Course/MThree-Java-Classwork/SQL/songalbums.sql"

-- Insert artists, band and song table from the mysqldump output
INSERT INTO `artist`
   VALUES  
		(1, 'John', 'Lennon', 1), (2, 'Paul', 'McCartney', 1),--
		(3, 'George', 'Harrison', 1), (4, 'Ringo', 'Starr', 1),
		(5, 'Denny', 'Zager', 0), (6, 'Rick', 'Evans', 0),
		(10, 'Van', 'Morrison', 1), (11, 'Judy', 'Collins', 0),
		(12, 'Paul', 'Simon', 1), (13, 'Art', 'Garfunkel', 0),
		(14, 'Brian', 'Wilson', 0), (15, 'Dennis', 'Wilson', 0),
		(16, 'Carl', 'Wilson', 0), (17, 'Ricky', 'Fataar', 0),
		(18, 'Blondie', 'Chaplin', 0), (19, 'Jimmy', 'Page', 0),
		(20, 'Robert', 'Plant', 0), (21, 'John Paul', 'Jones', 0),
		(22, 'John', 'Bonham', 0), (23, 'Mike ' , 'Love', 0),
		(24, 'Al ', 'Jardine', 0), (25, 'David', 'Marks', 0),
		(26, 'Bruce ', 'Johnston', 0);

-- Insert dump from band using csv import
INSERT INTO `band` VALUES 
		(1, 'The Beatles\r'),(2, 'Zager and Evans\r'),
		(3, 'Van Morrison\r'),(4, 'Judy Collins\r'),
		(5, 'Simon and Garfunkel\r'),(7, 'Beach Boys\r'),
		(8, 'Led Zeppelin\r');

-- insert dump from song using csv import
INSERT INTO `song`
  VALUES
		(1, 'Imagine', 'https://youtu.be/DVg2EJvvlF8', 1),
		(2, 'In the Year 2525', 'https://youtu.be/izQB2-Kmiic', 2),
		(3, 'Across the Universe', 'https://youtu.be/Tjq9LmSO1eI', 1),
		(4, 'Moondance', 'https://youtu.be/6lFxGBB4UG', 3),
		(5, 'Both Sides Now', 'https://youtu.be/rQOuxByR5VI', 4),
		(6, 'Sounds of Silence', 'https://youtu.be/qn0QBXMYXsM', 5),
		(7, 'Something', 'https://youtu.be/xLGe-QzCK4Q', 1),
		(9, 'Good Vibrations', 'https://youtu.be/d8rd53WuojE', 7),
		(10, 'Come Together', 'https://youtu.be/_HONxwhwmgU', 1),
		(11, 'Something', 'https://youtu.be/UKAp-jRUp2o', 1),
		(12, 'Maxwell\'s Silver Hammer', 'https://youtu.be/YQgsob_o1io', 1);

-- insert dump from artistBand using csv import
INSERT INTO `bandartist` VALUES 
		(1,1), (1,2), (1,3), (1,4), (2,5), (2,6), (3,10),
		(4,11), (5,12), (5,13), (7,14), (7,15), (7,16),
		(7,17), (7,18), (7,23), (7,24), (7,25), (7,26),
		(8,19), (8,20), (8,21), (8,22);

-- insert dump from songAlbum using csv import
INSERT INTO `songalbum` VALUES 
		(1,1), (2,2), (3,3), (4,4), (5,5), (6,6),
		(7,7), (9,9), (10,7), (11,7), (12,7);
