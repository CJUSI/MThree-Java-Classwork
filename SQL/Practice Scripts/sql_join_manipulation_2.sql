-- Select correct Database to manipulate --
USE bookdb;

-- Display a table with all the information for a book
SELECT b.Title, a.Author_name, a.Author_nationality, f.format_name, f.price, s.Subject_name,f.pages, f.thickness, p.publisherName, p.publisherCountry, p.publicationType, g.GenreId, g.genre_name  FROM book b 
	LEFT JOIN book_Subject bs ON b.BookId = bs.BookId
	LEFT JOIN subject s ON s.SubjectId = bs.SubjectId
	LEFT JOIN Author a ON b.BookId = a.AuthorId
	LEFT JOIN Author_book ab ON ab.BookId = a.AuthorId
	LEFT JOIN format f ON f.formatId = b.BookId 
	LEFT JOIN format_book fb ON fb.formatId = f.formatId
	LEFT JOIN Publisher p ON p.PublisherId = b.BookId
	LEFT JOIN publisher_book pb ON pb.PublisherId = p.PublisherId
	LEFT JOIN Genre g ON g.GenreId = b.BookId
	LEFT JOIN genre_book gb ON gb.GenreId = g.GenreId;

-- Display relevant information for an author based upon their nationality
SELECT b.Title, a.Author_name, a.Author_nationality, f.format_name, f.price, f.pages, s.Subject_name, p.publisherName, p.publisherCountry, p.publicationType, g.genre_name FROM book b 
	INNER JOIN Author a ON b.BookId = a.AuthorId
    INNER JOIN format f ON f.formatId = b.BookId 
    INNER JOIN Subject s ON s.SubjectId	= b.BookId
    INNER JOIN Publisher p ON p.PublisherId = b.BookId
    INNER JOIN Genre g ON g.GenreId = b.bookId
		WHERE Author_nationality = "UK";
        
-- Create View with all information
CREATE OR REPLACE VIEW full_info AS
	SELECT b.Title, a.Author_name, a.Author_nationality, f.format_name, f.price, s.Subject_name,f.pages, f.thickness, p.publisherName, p.publisherCountry, p.publicationType, g.genre_name  FROM book b
		LEFT JOIN book_Subject bs ON b.BookId = bs.BookId
		LEFT JOIN subject s ON s.SubjectId = bs.SubjectId
		LEFT JOIN Author a ON b.BookId = a.AuthorId
		LEFT JOIN Author_book ab ON ab.BookId = a.AuthorId
		LEFT JOIN format f ON f.formatId = b.BookId 
		LEFT JOIN format_book fb ON fb.formatId = f.formatId
		LEFT JOIN Publisher p ON p.PublisherId = b.BookId
		LEFT JOIN publisher_book pb ON pb.PublisherId = p.PublisherId
		LEFT JOIN Genre g ON g.GenreId = b.BookId
		LEFT JOIN genre_book gb ON gb.GenreId = g.GenreId;
		
-- Select excerpt from previously created view
SELECT * FROM full_info
	WHERE Author_nationality = 'UK';

	


