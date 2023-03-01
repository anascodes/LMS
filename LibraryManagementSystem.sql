-- create Book table
CREATE TABLE Book (
    ID INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication_year INT NOT NULL,
    isbn VARCHAR(50) NOT NULL
);

-- create BookCopy table
CREATE TABLE BookCopy (
    ID INT PRIMARY KEY,
    book_id INT NOT NULL,
    location VARCHAR(255) NOT NULL,
    status VARCHAR(100) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Book(ID)
);

-- create Borrower table
CREATE TABLE Borrower (
    ID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL 
);

-- create Checkout table
CREATE TABLE Checkout (
    ID INT PRIMARY KEY,
    copy_id INT NOT NULL,
    borrower_id INT NOT NULL,
    checkout_date DATE NOT NULL,
    return_date DATE NOT NULL,
    status VARCHAR(100) NOT NULL,
    FOREIGN KEY (copy_id) REFERENCES BookCopy(ID),
    FOREIGN KEY (borrower_id) REFERENCES Borrower(ID)
);

-- create Reservation table
CREATE TABLE Reservation (
    ID INT PRIMARY KEY,
    copy_id INT NOT NULL,
    borrower_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    status VARCHAR(100) NOT NULL,
    FOREIGN KEY (copy_id) REFERENCES BookCopy(ID),
    FOREIGN KEY (borrower_id) REFERENCES Borrower(ID)
);

-- create Fine table
CREATE TABLE Fine (
    ID INT PRIMARY KEY,
    checkout_id INT NOT NULL,
    borrower_id INT NOT NULL,
    fine_amount DECIMAL(5,2) NOT NULL,
    fine_date DATE NOT NULL,
    status VARCHAR(100) NOT NULL,
    FOREIGN KEY (checkout_id) REFERENCES Checkout(ID),
    FOREIGN KEY (borrower_id) REFERENCES Borrower(ID)
);

-- insert data into Book table
INSERT INTO Book (ID, title, author, publication_year, isbn)
VALUES 
    (1, 'To Kill a Mockingbird', 'Harper Lee', 1960, '978-0446310789'),
    (2, 'Pride and Prejudice', 'Jane Austen', 1813, '978-1613821484'),
    (3, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, '978-0743273565');

--- 01-03-2023 01:33:15
--- MS SQL
INSERT INTO Borrower (ID, name, address, phone_number, email) VALUES
(1, 'John Doe', '123 Main St., Anytown USA', '555-555-1212', 'johndoe@example.com'),
(2, 'Jane Smith', '456 Elm St., Anytown USA', '555-555-1212', 'janesmith@example.com'),
(3, 'Bob Johnson', '789 Oak St., Anytown USA', '555-555-1212', 'bobjohnson@example.com');


-- insert data into BookCopy table
INSERT INTO BookCopy (ID, book_id, location, status)
VALUES 
    (1, 1, 'Shelf A', 'Available'),
    (2, 1, 'Shelf B', 'Checked Out'),
    (3, 2, 'Shelf C', 'Available'),
    (4, 3, 'Shelf D', 'Available');

-- insert data into Reservation table
INSERT INTO Reservation (ID, copy_id, borrower_id, reservation_date, status) VALUES
    (1, 2, 2, '2023-02-19', 'Active'),
    (2, 3, 1, '2023-02-21', 'Active'),
    (3, 4, 3, '2023-02-22', 'Active'),
    (4, 7, 2, '2023-02-25', 'Active');

-- insert data into Checkout table
INSERT INTO Checkout (ID, copy_id, borrower_id, checkout_date, return_date, status)
VALUES
    (1, 1, 1, '2023-02-01', '2023-02-08', 'Returned'),
    (2, 2, 1, '2023-02-09', '2023-02-16', 'Checked Out'),
    (3, 4, 2, '2023-02-12', '2023-02-19', 'Returned'),
    (4, 5, 3, '2023-02-15', '2023-02-22', 'Checked Out');

INSERT INTO Fine (ID, checkout_id, borrower_id, fine_amount, fine_date, status)
VALUES
    (1, 2, 1, 1.50, '2023-02-17', 'Paid'),
    (2, 4, 3, 2.00, '2023-02-24', 'Outstanding');

--- 01-03-2023 01:31:28
--- MS SQL
INSERT INTO Book (ID, title, author, publication_year, isbn)
VALUES (4, '1984', 'George Orwell', 1949, '978-0451524935');

DELETE FROM Reservation
WHERE ID = 2;

UPDATE BookCopy
SET status = 'Checked Out'
WHERE ID = 1;

SELECT * FROM Reservation