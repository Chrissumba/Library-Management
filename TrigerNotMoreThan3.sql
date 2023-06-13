CREATE TRIGGER PreventExcessiveBorrowing
ON Loans
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MemberID INT;
    SELECT @MemberID = MemberID FROM inserted;

    IF (SELECT COUNT(*) FROM Loans WHERE MemberID = @MemberID) >= 3
    BEGIN
        RAISERROR('Member already has three books on loan. Cannot borrow more.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate)
    SELECT BookID, MemberID, LoanDate, ReturnDate
    FROM inserted;
END
