-- Exemple For Trigger After Inserted 
--Create Order Table 
CREATE TABLE Orders (
    OrderID INT IDENTITY PRIMARY KEY,  -- Auto-incrementing primary key
    CustomerName NVARCHAR(100) NOT NULL,  -- Customer's name
    OrderDate DATETIME DEFAULT GETDATE(),  -- Defaults to the current date/time
    OrderAmount DECIMAL(10, 2) NOT NULL   -- Total amount for the order
);


-- Create the AuditLog table
CREATE TABLE AuditLog (
    LogID INT IDENTITY PRIMARY KEY,
    Action NVARCHAR(50),
    TableName NVARCHAR(50),
    InsertedDate DATETIME
);


-- Create the Trigger
Create TRIGGER trg_AfterInsert_Orders on Orders 
after insert 
as 

BEGIN
	insert into AuditLog values ('INSERT','Orders',GETDATE()) ;
END 









--Test Tov Run 
select * from Orders
insert into Orders VALUES 
    ('John Doe',GETDATE() ,500.00),
    ('Jane Smith',GETDATE() ,1500.00),
    ('Mark Spencer',GETDATE() ,7500.00);


-- Ckeck AuditLog 
select * from AuditLog