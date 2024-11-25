
use C21_DB1;
-- Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Subject NVARCHAR(50),
    Grade INT
);


Go

-- Insert sample data into the Students table
INSERT INTO Students (StudentID, Name, Subject, Grade)
VALUES
    (1, 'Alice', 'Math', 90),
    (2, 'Bob', 'Math', 85),
    (3, 'Charlie', 'Math', 78),
    (4, 'Dave', 'Science', 88),
    (5, 'Emma', 'Science', 92),
    (6, 'Fiona', 'Science', 84),
    (7, 'Grace', 'English', 75),
    (8, 'Henry', 'English', 80),
    (9, 'Isabella', 'English', 88);














use C21_DB1;

select * from students order by grade desc;

--Assigns a unique integer to each row within the result set.

SELECT 
    StudentID, 
    Name, 
    Subject, 
    Grade,
    ROW_NUMBER() over (order by Subject desc)  AS RowNum
FROM 
    Students order by grade desc;
