WITH MemberBorrowCount AS (
    SELECT MemberID, COUNT(*) AS BorrowCount
    FROM Loans
    GROUP BY MemberID
)
SELECT Members.Name
FROM Members
JOIN MemberBorrowCount ON Members.MemberID = MemberBorrowCount.MemberID
WHERE MemberBorrowCount.BorrowCount >= 3;
