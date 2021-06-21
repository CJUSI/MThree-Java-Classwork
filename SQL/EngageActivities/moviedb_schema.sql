-- DDL Activity - Movies Database - Callum Smith --

-- Flush Database to recreate the schema and load
DROP DATABASE IF EXISTS moviesdb;
CREATE DATABASE moviesdb;
USE moviesdb;

-- Create tables shown in List --
CREATE TABLE Genre (
	GenreID				INT 			AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_Genre
		PRIMARY KEY(GenreID),
	GenreName			varchar(30)		NOT NULL
);

CREATE TABLE Director (
	DirectorID			INT				AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_Director
		PRIMARY KEY (DirectorID),
	FirstName			varchar(30)		NOT NULL,
    LastName			varchar(30)		NOT NULL,
    DoB					DATE
);

CREATE TABLE Rating (
	RatingID			INT				AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_Rating
		PRIMARY KEY(RatingID),
    RatingName			varchar(5)		NOT NULL
);

CREATE TABLE Movie (
	MovieID 			INT				AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_Movie
		PRIMARY KEY(MovieID),
	GenreID 			INT,
    CONSTRAINT fk_MovieGenre
		FOREIGN KEY(GenreID)
        REFERENCES Genre(GenreID),
	DirectorID			INT,
    CONSTRAINT fk_MovieDirectorID
		FOREIGN KEY (DirectorID)
		REFERENCES Director(DirectorID),
	RatingID			INT,
    CONSTRAINT fk_MovieRatingID
		FOREIGN KEY (RatingID)
		REFERENCES Rating(RatingID),
	Title				varchar(128)	NOT NULL,
    ReleaseDate			DATE
);

CREATE TABLE Actor (
	ActorID		INT						AUTO_INCREMENT 		NOT NULL,
    CONSTRAINT pk_Actor
		PRIMARY KEY (ActorID),
	FirstName			varchar(30)		NOT NULL,
    LastName			varchar(30)		NOT NULL,
    BirthDate			DATE
);

CREATE TABLE CastMembers (
	CastMemberID		INT				AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_CastMember
		PRIMARY KEY (CastMemberID),
	ActorID				INT,
    CONSTRAINT fk_CastActorID
		FOREIGN KEY (ActorID)
		REFERENCES Actor(ActorID),
	MovieID			INT,
    CONSTRAINT fk_CastMovieID
		FOREIGN KEY (MovieID)
		REFERENCES Movie(MovieID),
	Role 				varchar(50)		NOT NULL
);



-- Show tables and describe the table structures --
SHOW TABLES;
DESCRIBE Movie;
DESCRIBE Genre;
DESCRIBE Director;
DESCRIBE Rating;
DESCRIBE Actor;
DESCRIBE CastMembers;