-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS db_LibraryManagement;
USE db_LibraryManagement;

/* ======================= TABLES ======================== */

-- Publisher Table
CREATE TABLE tbl_publisher (
	publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
	publisher_PublisherAddress VARCHAR(200) NOT NULL,
	publisher_PublisherPhone VARCHAR(50) NOT NULL
);

-- Book Table
CREATE TABLE tbl_book (
	book_BookID INT PRIMARY KEY AUTO_INCREMENT,
	book_Title VARCHAR(100) NOT NULL,
	book_PublisherName VARCHAR(100) NOT NULL,
	CONSTRAINT fk_publisher_name1 FOREIGN KEY (book_PublisherName) 
	REFERENCES tbl_publisher(publisher_PublisherName)
	ON UPDATE CASCADE ON DELETE CASCADE
);

-- Library Branch Table
CREATE TABLE tbl_library_branch (
	library_branch_BranchID INT PRIMARY KEY AUTO_INCREMENT,
	library_branch_BranchName VARCHAR(100) NOT NULL,
	library_branch_BranchAddress VARCHAR(200) NOT NULL
);

-- Borrower Table
CREATE TABLE tbl_borrower (
	borrower_CardNo INT PRIMARY KEY AUTO_INCREMENT,
	borrower_BorrowerName VARCHAR(100) NOT NULL,
	borrower_BorrowerAddress VARCHAR(200) NOT NULL,
	borrower_BorrowerPhone VARCHAR(50) NOT NULL
);

-- Book Loans Table (Date fields improved)
CREATE TABLE tbl_book_loans (
	book_loans_LoansID INT PRIMARY KEY AUTO_INCREMENT,
	book_loans_BookID INT NOT NULL,
	book_loans_BranchID INT NOT NULL,
	book_loans_CardNo INT NOT NULL,
	book_loans_DateOut DATE NOT NULL,
	book_loans_DueDate DATE NOT NULL,
	CONSTRAINT fk_book_id1 FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_branch_id1 FOREIGN KEY (book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_cardno FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Book Copies Table
CREATE TABLE tbl_book_copies (
	book_copies_CopiesID INT PRIMARY KEY AUTO_INCREMENT,
	book_copies_BookID INT NOT NULL,
	book_copies_BranchID INT NOT NULL,
	book_copies_No_Of_Copies INT NOT NULL,
	CONSTRAINT fk_book_id2 FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_branch_id2 FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Book Authors Table
CREATE TABLE tbl_book_authors (
	book_authors_AuthorID INT PRIMARY KEY AUTO_INCREMENT,
	book_authors_BookID INT NOT NULL,
	book_authors_AuthorName VARCHAR(50) NOT NULL,
	CONSTRAINT fk_book_id3 FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE
);

/*==================== POPULATING TABLES ======================*/

-- Publisher Data
INSERT INTO tbl_publisher (publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
VALUES
('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
('Chilton Books','Not Available','Not Available'),
('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
('Alfred A. Knopf','The Knopf Doubleday Group, 1745 Broadway, NY 10019','212-940-7390'),
('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, NY 10018','212-419-5300'),
('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Tokyo, Japan','+81-3-5577-6507'),
('Harper and Row','HarperCollins, 195 Broadway, New York, NY 10007','212-207-7000'),
('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
('W.W. Norton','500 Fifth Avenue, New York, NY 10110','212-354-5500'),
('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745');

-- Book Data
INSERT INTO tbl_book (book_Title, book_PublisherName)
VALUES 
('The Name of the Wind', 'DAW Books'),
('It', 'Viking'),
('The Green Mile', 'Signet Books'),
('Dune', 'Chilton Books'),
('The Hobbit', 'George Allen & Unwin'),
('Eragon', 'Alfred A. Knopf'),
('A Wise Mans Fear', 'DAW Books'),
('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
('The Giving Tree', 'Harper and Row'),
('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
('Brave New World', 'Chalto & Windus'),
('The Princess Bride', 'Harcourt Brace Jovanovich'),
('Fight Club', 'W.W. Norton'),
('Holes', 'Scholastic'),
('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
('The Fellowship of the Ring', 'George Allen & Unwin'),
('A Game of Thrones', 'Bantam'),
('The Lost Tribe', 'Picador USA');

-- Library Branch Data
INSERT INTO tbl_library_branch (library_branch_BranchName, library_branch_BranchAddress)
VALUES
('Sharpstown','32 Corner Road, New York, NY 10012'),
('Central','491 3rd Street, New York, NY 10014'),
('Saline','40 State Street, Saline, MI 48176'),
('Ann Arbor','101 South University, Ann Arbor, MI 48104');

-- Borrower Data
INSERT INTO tbl_borrower (borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)
VALUES
('Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
('Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
('Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
('Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
('Haley Jackson','231 52nd Avenue, New York, NY 10014','212-419-9935'),
('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');

-- Book Loans Data (Dates fixed & CardNo corrected to match borrowers IDs)
INSERT INTO tbl_book_loans (book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)
VALUES
(1,1,1,'2018-01-01','2018-02-02'),
(2,1,1,'2018-01-01','2018-02-02'),
(3,1,1,'2018-01-01','2018-02-02'),
(4,1,1,'2018-01-01','2018-02-02'),
(5,1,2,'2018-01-03','2018-02-03'),
(6,1,2,'2018-01-03','2018-02-03'),
(7,1,2,'2018-01-03','2018-02-03'),
(8,1,2,'2018-01-03','2018-02-03'),
(9,1,2,'2018-01-03','2018-02-03');

-- Book Copies Data
INSERT INTO tbl_book_copies (book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
SELECT b.book_BookID, lb.library_branch_BranchID, 5
FROM tbl_book b, tbl_library_branch lb;

-- Book Authors Data
INSERT INTO tbl_book_authors (book_authors_BookID, book_authors_AuthorName)
VALUES
(1,'Patrick Rothfuss'),
(2,'Stephen King'),
(3,'Stephen King'),
(4,'Frank Herbert'),
(5,'J.R.R. Tolkien'),
(6,'Christopher Paolini'),
(7,'Patrick Rothfuss'),
(8,'J.K. Rowling'),
(9,'Haruki Murakami'),
(10,'Shel Silverstein'),
(11,'Douglas Adams'),
(12,'Aldous Huxley'),
(13,'William Goldman'),
(14,'Chuck Palahniuk'),
(15,'Louis Sachar'),
(16,'J.K. Rowling'),
(17,'J.K. Rowling'),
(18,'J.R.R. Tolkien'),
(19,'George R.R. Martin'),
(20,'Mark Lee');

/*======================== END OF SCRIPT ======================*/
