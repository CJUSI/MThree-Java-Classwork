-- Flush Database to recreate the schema and load
DROP DATABASE IF EXISTS vinylrecordshop;
CREATE DATABASE vinylrecordshop;
USE vinylrecordshop;

-- CREATE PRIMARY TABLES--
-- Album
CREATE TABLE album (
	albumId				INT				AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_album
		PRIMARY KEY (albumId),
    albumTitle			varchar(100)	NOT NULL,
    label				varchar(50),
    releaseDate			DATE,
    price				DECIMAL(5,2)
);

-- Artist
CREATE TABLE artist (
	artistId 			INT				AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_artist
		PRIMARY KEY (artistId),
    artistFirstName		varchar(25),
    artistLastName		varchar(50)		NOT NULL
);

-- Band
CREATE TABLE band (
	bandId				INT				AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_band
		PRIMARY KEY (bandId),
    bandName			varchar(50)		NOT NULL
);

-- CREATE RELATED TABLES--
-- Song
CREATE TABLE song (
	songId				INT				AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_song
		PRIMARY KEY (songId),
    songTitle 			varchar(100)	NOT NULL,
    videoURL			varchar(100),
    bandId				INT				NOT NULL,
    CONSTRAINT fk_song_band
		FOREIGN KEY (bandID)
		REFERENCES band(bandId)
);

-- songAlbum
CREATE TABLE songAlbum (
	songId				INT,
    albumId				INT,
    CONSTRAINT pk_songAlbum
		PRIMARY KEY (songId, albumId),
	CONSTRAINT fk_songAlbum_song
		FOREIGN KEY (songId)
		REFERENCES song(songId),
	CONSTRAINT fk_songAlbum_album
		FOREIGN KEY (albumId)
		REFERENCES album(albumId)
);

-- bandArtist
CREATE TABLE bandArtist (
	bandId				INT,
    artistId			INT,
    CONSTRAINT pk_bandArtist
		PRIMARY KEY (bandId, artistId),
	CONSTRAINT fk_bandArtist_band
		FOREIGN KEY (bandId)
		REFERENCES band(bandId),
	CONSTRAINT fk_bandArtist_artist
		FOREIGN KEY (artistId)
		REFERENCES artist(artistId)
);

-- Display the description of the tables
SHOW TABLES;
DESCRIBE album; 
DESCRIBE artist;
DESCRIBE band;
DESCRIBE song;
DESCRIBE songAlbum;
DESCRIBE bandArtist;
