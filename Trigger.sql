CREATE TRIGGER UpdateBookStatus
ON Loans
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
        -- Book loaned or returned
        UPDATE Books
        SET Status = CASE 
                        WHEN Books.BookID IN (SELECT BookID FROM inserted) THEN 'Loaned'
                        ELSE 'Available'
                    END
        WHERE Books.BookID IN (SELECT BookID FROM inserted);
    END
END
