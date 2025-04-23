-- Show all tables in the database
SHOW TABLES;

-- Create Customers table
CREATE TABLE Customers (
    Customer_ID INT NOT NULL PRIMARY KEY,
    Full_Name VARCHAR(30),
    Email VARCHAR(30),
    Age INT CHECK (Age >= 18),
    Status ENUM('active','inactive') DEFAULT 'active',
    Payment ENUM('Done', 'Pending') DEFAULT 'Pending'
);

-- Describe Customers table
DESCRIBE Customers;

-- Create Orders table with foreign key constraint
CREATE TABLE Orders (
    Order_ID INT NOT NULL PRIMARY KEY,
    Customer_ID INT,
    Address VARCHAR(100),
    Amount DECIMAL(10,2) CHECK (Amount >= 1),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Describe Orders table
DESCRIBE Orders;

-- Insert multiple records into Customers
INSERT INTO Customers(Customer_ID, Full_Name, Email, Age, Status, Payment)
VALUES
(1, 'Alexa', 'aleaxaruthuu@gmail.com', 24, 'active', 'Done'),
(2, 'Bobi', 'nunna@gmail.com', 22, 'inactive', 'Done'),
(3, 'Cynthia', 'cprab34@gmail.com', 27, 'active', 'Pending'),
(4, 'Devika', 'devikab@gmail.com', 23, 'inactive', 'Pending');

-- Insert multiple records into Orders
INSERT INTO Orders(Order_ID, Customer_ID, Address, Amount)
VALUES
(101, 1, '123 main st, NY', 134.26),
(102, 2, '3256 Ridge Road, Califorina', 129.00),
(103, 4, '7655 Moore Road, Utah', 129.00),
(104, 3, '8123 Denmark Road, Wisconsin', 234.56),
(105, 1, '1345 Woodmar, Indiana', 638.45);

-- View all records from Customers
SELECT * FROM Customers;

-- View all records from Orders
SELECT * FROM Orders;

-- Delete a customer and cascade delete from Orders
DELETE FROM Customers WHERE Customer_ID = 2;

-- Update Customer_ID and see cascading effect
UPDATE Customers SET Customer_ID = 345 WHERE Customer_ID = 1;

-- Select Orders of updated Customer_ID
SELECT * FROM Orders WHERE Customer_ID = 345;

-- Insert customer with only required fields (using default values)
INSERT INTO Customers (Customer_ID, Full_Name, Email, Age)
VALUES (6, 'Mano', 'mano@gmail.com', 25);

-- Insert order with invalid foreign key (fails)
-- (This query failed due to FK constraint)
INSERT INTO Orders (Order_ID, Customer_ID, Address, Amount)
VALUES (201, 999, '999 Ghost Street', 500.00);

-- Attempt to insert invalid ENUM value (fails)
-- (This query failed due to invalid ENUM value)
INSERT INTO Customers (Customer_ID, Full_Name, Email, Age, Status, Payment)
VALUES (6, 'Keert', 'keert@gmail.com', 25, 'waiting', 'Pending');

-- Update based on Age
UPDATE Customers SET Customer_ID = 33 WHERE Age = 27;

-- View updated Customers table
SELECT * FROM Customers;

--Added a CHECK constraint to ensure Amount in Orders is non-negative:
ALTER TABLE Orders ADD CONSTRAINT ch_check CHECK (Amount >= 0);

--Tried to insert an order with a negative amount
INSERT INTO Orders(Order_ID, Customer_ID, Address, Amount) 
VALUES (107, 6, '675 makimaki st, IL', -189.00);

