-- DDL Activity - Books Database - Callum Smith --

-- Flush Database to recreate the schema and load
DROP DATABASE IF EXISTS booksdb;
CREATE DATABASE booksdb;
USE booksdb;

-- Create tables shown in ERD --
CREATE TABLE Author (
    AuthorID 		INT			AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_Author
		PRIMARY KEY(AuthorID),
    FirstName		varchar(25)		NOT NULL,
    MiddleName		varchar(25),
    LastName		varchar(25) 		NOT NULL,
    Gender		varchar(1),
    DoB			DATE			NOT NULL,
    DoD			DATE
);

CREATE TABLE Book (
    BookID		INT			AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_Book
		PRIMARY KEY (BookID),
    Title		varchar(100) 		NOT NULL,
    PublicationDate 	DATE
);

CREATE TABLE Format (
    FormatID		INT			AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_Format
		PRIMARY KEY(FormatID),
    FormatName		varchar(12)		NOT NULL
);

CREATE TABLE Genre (
    GenreID		INT 			AUTO_INCREMENT		NOT NULL,
    CONSTRAINT pk_Genre
		PRIMARY KEY(GenreID),
    GenreName			varchar(25)	NOT NULL
);

CREATE TABLE BookAuthor (
    AuthorID		INT			NOT NULL,
    CONSTRAINT fk_AuthorBookID
		FOREIGN KEY (AuthorID)
		REFERENCES Author(AuthorID),
    BookID		INT			NOT NULL,
    CONSTRAINT fk_BookAuthorID
		FOREIGN KEY (BookID)
		REFERENCES Book(BookID)
);

CREATE TABLE BookFormat (
    BookID		INT			NOT NULL,
    CONSTRAINT fk_BookFormatID
		FOREIGN KEY (BookID)
		REFERENCES Book(BookID),
    FormatID		INT			NOT NULL,
    CONSTRAINT fk_FormatBookID
		FOREIGN KEY (FormatID)
		REFERENCES Format(FormatID),
    Price		DECIMAL,
    QuantityOnHand	INT
);

CREATE TABLE BookGenre (
    BookID		INT			NOT NULL,
    CONSTRAINT fk_BookGenreID
		FOREIGN KEY (BookID)
		REFERENCES Book(BookID),
    GenreID		INT 			NOT NULL,
    CONSTRAINT fk_GenreBookID
		FOREIGN KEY (GenreID)
		REFERENCES Genre(GenreID)
);

-- Show tables and describe the table structures --
SHOW TABLES;
DESCRIBE Author;
DESCRIBE Book;
DESCRIBE BookAuthor;
DESCRIBE BookFormat;
DESCRIBE BookGenre;
DESCRIBE Format;
DESCRIBE GENRE;
