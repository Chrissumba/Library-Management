
-- Use the database
USE LibraryManagement;

-- Create the Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    PublicationYear INT,
    Status VARCHAR(20)
);

-- Create the Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(200),
    ContactNumber VARCHAR(20)
);

-- Create the Loans table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Insert sample data into the Books table
INSERT INTO Books (BookID, Title, Author, PublicationYear, Status)
VALUES
    (1, 'Book 1', 'Author 1', 2020, 'Available'),
    (2, 'Book 2', 'Author 2', 2018, 'Available'),
    (3, 'Book 3', 'Author 3', 2021, 'Available'),
    (4, 'Book 4', 'Author 4', 2019, 'Available'),
    (5, 'Book 5', 'Author 5', 2022, 'Available');

-- Insert sample data into the Members table
INSERT INTO Members (MemberID, Name, Address, ContactNumber)
VALUES
    (1, 'Member 1', 'Address 1', '123-456-7890'),
    (2, 'Member 2', 'Address 2', '987-654-3210'),
    (3, 'Member 3', 'Address 3', '555-555-5555'),
    (4, 'Member 4', 'Address 4', '111-222-3333');

-- Insert sample data into the Loans table
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate)
VALUES
    (1, 1, 1, '2023-06-01', '2023-06-15'),
    (2, 2, 1, '2023-06-02', '2023-06-16'),
    (3, 3, 2, '2023-06-03', '2023-06-17'),
    (4, 4, 3, '2023-06-04', '2023-06-18'),
    (5, 5, 4, '2023-06-05', '2023-06-19');
