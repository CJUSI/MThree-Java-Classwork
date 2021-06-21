-- Book Database Schema - Callum Smith - 14/06/2021

-- Create Database
DROP DATABASE IF EXISTS bookdb;
CREATE DATABASE bookdb;
USE bookdb;

-- Create Primary Tables
-- Book Table
CREATE TABLE book (
	BookId				INT				AUTO_INCREMENT	 		PRIMARY KEY 		NOT NULL,
    Title 				varchar(100)	NOT NULL
);

-- Subject Table
CREATE TABLE Subject (
	SubjectId			INT				AUTO_INCREMENT			PRIMARY KEY			NOT NULL,
    Subject_name 		varchar(100)	NOT NULL
);

-- Format Table
CREATE TABLE format (
	formatId			INT 			AUTO_INCREMENT			PRIMARY KEY			NOT NULL, 
    format_name			varchar(100) 	NOT NULL,
	thickness			varchar(50),
    price				double			NOT NULL,
    pages				INT
);

-- Genre Table
CREATE TABLE Genre (
	GenreId				INT				AUTO_INCREMENT			PRIMARY KEY			NOT NULL,
    genre_name			varchar(100)	NOT NULL
);

-- Publisher Table
CREATE TABLE Publisher (
	PublisherId			INT 			AUTO_INCREMENT			PRIMARY KEY			NOT NULL,
    publisherName		varchar(100)	NOT NULL,
    publisherCountry	varchar(50),
    publicationType		varchar(50)		NOT NULL
);
-- Author Table
CREATE TABLE Author (
	AuthorId			INT 			AUTO_INCREMENT			PRIMARY KEY			NOT NULL, 
    Author_name			varchar(100)	NOT NULL,
    Author_nationality	varchar(100)	NOT NULL		
);

-- Create Secondary Link Tables
-- Format Book Table
CREATE TABLE format_book (
	formatId	INT,
    BookId		INT,
    CONSTRAINT pk_formatBook
		PRIMARY KEY (formatId, BookId),
	CONSTRAINT fk_formatBook_format 
		FOREIGN KEY (formatId)
        REFERENCES	format(formatId),
	CONSTRAINT fk_FormatBook_Book
		FOREIGN KEY (BookId)
        REFERENCES book(BookId)
);

-- Book Subject Table
CREATE TABLE book_Subject (
	SubjectId	INT,
    BookId		INT,
    CONSTRAINT pk_bookSubject
		PRIMARY KEY (SubjectId, BookId),
	CONSTRAINT fk_bookSubject_Subject 
		FOREIGN KEY (SubjectId)
        REFERENCES	Subject(SubjectId),
	CONSTRAINT fk_bookSubject_Book
		FOREIGN KEY (BookId)
        REFERENCES book(BookId)
);

-- Book Genre Table
CREATE TABLE genre_book (
	GenreId		INT,
    BookId		INT,
    CONSTRAINT pk_bookGenre
		PRIMARY KEY (GenreId, BookId),
	CONSTRAINT fk_bookGenre_Genre 
		FOREIGN KEY (GenreId)
        REFERENCES	Genre(GenreId),
	CONSTRAINT fk_bookGenre_Book
		FOREIGN KEY (BookId)
        REFERENCES book(BookId)
);

-- Author Book table
CREATE TABLE Author_book (
	AuthorId	INT,
    BookId		INT,
    CONSTRAINT pk_AuthorBook
		PRIMARY KEY (AuthorId, BookId),
	CONSTRAINT fk_AuthorBook_Author 
		FOREIGN KEY (AuthorId)
        REFERENCES	Author(AuthorId),
	CONSTRAINT fk_AuthorBook_Book
		FOREIGN KEY (BookId)
        REFERENCES book(BookId)
);

-- Publisher Book Table
CREATE TABLE publisher_book (
	publisherId	INT,
    BookId		INT,
    CONSTRAINT pk_publisherBook
		PRIMARY KEY (publisherId, BookId),
	CONSTRAINT fk_publisherBook_publisher 
		FOREIGN KEY (publisherId)
        REFERENCES	Publisher(publisherId),
	CONSTRAINT fk_publisherBook_Book
		FOREIGN KEY (BookId)
        REFERENCES book(BookId)
);

-- Populate primary tables in database
-- Insert into Book table
INSERT INTO book (Title) VALUES 
	('Of Mice and Men');
INSERT INTO book (Title) VALUES 
	('Pride and Prejudice');
INSERT INTO book (Title) VALUES 
	('In Search of Lost Time');
INSERT INTO book (Title) VALUES 
	("Harry Potter and the Philosopher's stone");
INSERT INTO book (Title) VALUES 
	('The Alchemist');

-- Insert into Subject Table
INSERT INTO Subject (Subject_name) VALUES 
	('The Great Depression');
INSERT INTO Subject (Subject_name) VALUES 
	('Classical Social Commentary');
INSERT INTO Subject (Subject_name) VALUES 
	('In Search of Lost Time');
INSERT INTO Subject (Subject_name) VALUES 
	('Magic');
INSERT INTO Subject (Subject_name) VALUES 
	('Adventure');

-- Insert into format table
INSERT INTO format (format_name, thickness, price, pages) VALUES 
	('Paperback', 'Thin', 1.99, 107);
INSERT INTO format (format_name, thickness, price, pages) VALUES 
	('Hardback', 'Thin', 2.99, 345);
INSERT INTO format (format_name, thickness, price, pages) VALUES 
	('Paperback', 'Thick', 3.99, 4215);
INSERT INTO format (format_name, thickness, price, pages) VALUES 
	('Hardback', 'Thick', 11.47, 223);
INSERT INTO format (format_name, thickness, price, pages) VALUES 
	('Hardback', 'Thick', 15.99, 163);
        
-- Insert into Genre Table
INSERT INTO Genre (genre_name) VALUES 
	('Tragedy');
INSERT INTO Genre (genre_name) VALUES 
	('Romance');
INSERT INTO Genre (genre_name) VALUES 
	('Romance');
INSERT INTO Genre (genre_name) VALUES 
	('Fantasy');
INSERT INTO Genre (genre_name) VALUES 
	('Fantasy Quest');

-- Insert into Publisher table
INSERT INTO Publisher VALUES
	(1, 'Pascal Covici', 'USA', 'Physical');
INSERT INTO Publisher VALUES    
    (2, 'T. Edgerton', 'UK', 'Physical');
INSERT INTO Publisher VALUES
    (3, 'Grasset and Gallimard', 'France', 'Physical');
INSERT INTO Publisher VALUES 
	(4, 'Pottermore Publishers', 'UK', 'Physical');
INSERT INTO Publisher VALUES
	(5, 'HarperTorch', 'Brazil', 'Physical');

-- Insert into Author table
INSERT INTO Author (Author_name, Author_nationality) VALUES
	('John Steinbeck', 'USA');
INSERT INTO Author (Author_name, Author_nationality) VALUES
	('Jane Austen', 'UK');
INSERT INTO Author (Author_name, Author_nationality) VALUES
	('Marcel Proust', 'French');
INSERT INTO Author (Author_name, Author_nationality) VALUES
	('J.K. Rowling', 'UK');
INSERT INTO Author (Author_name, Author_nationality) VALUES
	('Paulo Coeleho', 'Brazil');
    
-- Insert values into secondary tables
-- Insert into format_book table
INSERT INTO format_book VALUES 
	(1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5);

-- Insert into book_subject table
INSERT INTO book_subject VALUES 
	(1,1), 
    (2,2), 
    (3,3), 
    (4,4), 
    (5,5);

-- Insert into Author_book table
INSERT INTO Author_book VALUES 
	(1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5);

-- Insert into Publisher_book table
INSERT INTO publisher_book VALUES 
	(1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5);
    
-- Insert into genre_book
INSERT INTO genre_book (BookId, GenreId) VALUES
	(1,2);
INSERT INTO genre_book (BookId, GenreId) VALUES
	(2,3);
INSERT INTO genre_book (BookId, GenreId) VALUES
	(4,1);
INSERT INTO genre_book (BookId, GenreId) VALUES
	(5,5);
INSERT INTO genre_book (BookId, GenreId) VALUES
	(2,4);
    
-- Show tables --
SHOW TABLES;
