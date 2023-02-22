--- 20-02-2023 15:09:18
--- MS SQL
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication_year INT NOT NULL,
    isbn VARCHAR(50) NOT NULL
);

-- create BookCopy table
CREATE TABLE BookCopy (
    copy_id INT PRIMARY KEY,
    book_id INT NOT NULL,
    location VARCHAR(255) NOT NULL,
  	status VARCHAR(100) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- create Borrower table
CREATE TABLE Borrower (
    borrower_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);

-- create Checkout table
CREATE TABLE Checkout (
    checkout_id INT PRIMARY KEY,
    copy_id INT NOT NULL,
    borrower_id INT NOT NULL,
    checkout_date DATE NOT NULL,
    return_date DATE NOT NULL,
  	status VARCHAR(100) NOT NULL,
    FOREIGN KEY (copy_id) REFERENCES BookCopy(copy_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrower(borrower_id)
);

-- create Reservation table
CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY,
    book_id INT NOT NULL,
    borrower_id INT NOT NULL,
    reservation_date DATE NOT NULL,
  	status VARCHAR(100) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrower(borrower_id)
);

-- create Fine table
CREATE TABLE Fine (
    fine_id INT PRIMARY KEY,
    checkout_id INT NOT NULL,
    borrower_id INT NOT NULL,
    fine_amount DECIMAL(5,2) NOT NULL,
  	fine_date DATE NOT NULL,
  	status VARCHAR(100) NOT NULL,
    FOREIGN KEY (checkout_id) REFERENCES Checkout(checkout_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrower(borrower_id)
);

--- 20-02-2023 15:51:31
--- MS SQL
ALTER TABLE book
ALTER COLUMN isbn VARCHAR(50) NOT NULL;

--- 20-02-2023 15:53:03
--- MS SQL
INSERT INTO book (book_id, title, author, publication_year, isbn)
VALUES
(1,'The Great Gatsby', 'F. Scott Fitzgerald', 1925, '978-3-16-148410-0'),
(2,'Pride and Prejudice', 'Jane Austen', 1813, '978-3-16-148410-1'),
(3,'To Kill a Mockingbird', 'Harper Lee', 1960, '978-3-16-148410-2'),
(4,'1984', 'George Orwell', 1949 ,' 978-3-16-148410-3'),
(5,'Animal Farm', 'George Orwell', 1945, '978-3-16-148410-4'),
(6,'Brave New World', 'Aldous Huxley', 1932, '978-3-16-148410-5'),
(7,'The Catcher in the Rye', 'J.D. Salinger', 1951, '978-3-16-148410-6'),
(8,'Lord of the Flies', 'William Golding', 1954, '978-3-16-148410-7'),
(9,'The Hobbit', 'J.R.R. Tolkien', 1937, '978-3-16-148410-8'),
(10,'The Lord of the Rings', 'J.R.R. Tolkien', 1954, '978-3-16-148410-9');

--- 20-02-2023 15:53:18
--- MS SQL
SELECT * from Book;

--- 20-02-2023 15:55:02
--- MS SQL.1
INSERT INTO book (book_id, title, author, publication_year, isbn)
VALUES
('14', 'The Catcher in the Rye', 'J. D. Salinger', '1951', '031-6-76-948734-2'),
('20', 'Moby-Dick', 'Herman Melville', '1851', '978-0-14-243724-7');


--- 20-02-2023 15:58:01
--- MS SQL
INSERT INTO Borrower (borrower_id, name, address, phone_number)
VALUES
(1, 'John Doe', '123 Main St, Albany, NY', '518-555-1234'),
(2, 'Jane Smith', '456 Central Ave, Syracuse, NY', '315-555-2345'),
(3, 'Mike Johnson', '789 Broadway, New York, NY', '212-555-3456'),
(4, 'Emily Davis', '1111 Winton Rd S, Rochester, NY', '585-555-4567'),
(5, 'David Lee', '222 Elm St, Ithaca, NY', '607-555-5678'),
(6, 'Karen Brown', '333 State St, Binghamton, NY', '607-555-6789'),
(7, 'Sarah Chen', '444 Jefferson Rd, Rochester, NY', '585-555-7890'),
(8, 'Jason Kim', '555 Maple Ave, Syracuse, NY', '315-555-8901'),
(9, 'Megan Clark', '666 Washington Ave, Albany, NY', '518-555-9012'),
(10, 'Erica White', '777 University Ave, Rochester, NY', '585-555-0123');

--- 20-02-2023 15:58:10
--- MS SQL
INSERT INTO Reservation (reservation_id, book_id, borrower_id, reservation_date, status) VALUES
(1, 1, 1, '2023-02-15', 'reserved'),
(2, 2, 1, '2023-02-16', 'reserved'),
(3, 3, 2, '2023-02-17', 'reserved'),
(4, 4, 3, '2023-02-18', 'reserved'),
(5, 5, 4, '2023-02-19', 'reserved'),
(6, 6, 4, '2023-02-20', 'reserved'),
(7, 7, 5, '2023-02-21', 'reserved'),
(8, 8, 6, '2023-02-22', 'reserved'),
(9, 9, 6, '2023-02-23', 'reserved'),
(10, 10, 6, '2023-02-24', 'reserved');

--- 20-02-2023 16:11:32
--- MS SQL
INSERT INTO BookCopy (copy_id, book_id, location, status) 
VALUES 
    (11, 1, 'Shelf A', 'available'),
    (12, 2, 'Shelf A', 'available'),
    (13, 3, 'Shelf B', 'checked out'),
    (14, 3, 'Shelf C', 'available'),
    (15, 4, 'Shelf D', 'checked out'),
    (16, 4, 'Shelf E', 'available'),
    (17, 5, 'Shelf F', 'available'),
    (18, 6, 'Shelf F', 'available'),
    (19, 7, 'Shelf G', 'checked out'),
    (20, 10, 'Shelf H', 'available');

--- 20-02-2023 16:11:39
--- MS SQL.1
SELECT * from BookCopy;

--- 20-02-2023 16:17:24
--- MS SQL
INSERT INTO Checkout (checkout_id, copy_id, borrower_id, checkout_date, return_date, status)
VALUES 
    (1, 11, 1, '2023-02-10', '2023-02-17', 'checked out'),
    (2, 12, 2, '2023-02-10', '2023-02-17', 'checked out'),
    (3, 13, 3, '2023-02-10', '2023-02-17', 'checked out'),
    (4, 15, 4, '2023-02-10', '2023-02-17', 'checked out'),
    (5, 19, 5, '2023-02-10', '2023-02-17', 'checked out'),
    (6, 20, 6, '2023-02-10', '2023-02-17', 'checked out'),
    (7, 17, 7, '2023-02-10', '2023-02-17', 'checked out'),
    (8, 18, 8, '2023-02-10', '2023-02-17', 'checked out'),
    (9, 14, 9, '2023-02-10', '2023-02-17', 'checked out'),
    (10, 16, 10, '2023-02-10', '2023-02-17', 'checked out');


--- 20-02-2023 16:25:40
--- MS SQL
INSERT INTO Fine (fine_id, checkout_id, borrower_id, fine_amount, fine_date, status)
VALUES
(1, 1, 3, 2.40, '2023-02-10', 'paid'),
(2, 2, 2, 1.20, '2023-02-10', 'not paid'),
(3, 5, 3, 4.00, '2023-02-10', 'not paid'),
(4, 9, 6, 6.02, '2023-02-10', 'paid'),
(5, 10, 8, 3.99, '2023-02-10', 'paid');

--- 20-02-2023 16:26:41
--- MS SQL
SELECT fine_id, fine_amount, fine_date
FROM Fine
WHERE borrower_id = 3 AND status = 'paid';

--- 20-02-2023 16:26:46
--- MS SQL
SELECT fine_id, fine_amount, fine_date
FROM Fine
WHERE borrower_id = 3 AND status = 'not paid';

