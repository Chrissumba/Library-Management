CREATE VIEW OverdueLoans AS
SELECT Books.Title, Members.Name, CalculateOverdueDays(Loans.LoanID) AS OverdueDays
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
JOIN Members ON Loans.MemberID = Members.MemberID
WHERE Loans.ReturnDate < GETDATE();
