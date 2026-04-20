-- Types of Keys in SQL
--1. Primary Key
--2. Foreign Key
--3. Unique Key
--4. Composite Key
--5. Candidate Key

--1.Primary Key:
--A primary key is a column or a set of columns that uniquely identifies each row in a table.
--It must contain unique values and cannot contain NULL values. A table can have only one primary key. 
--The primary key is used to enforce entity integrity and establish relationships between tables.

--Example of Primary Key:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

--In this example, EmployeeID is the primary key for the Employees table. It uniquely identifies each employee in the table and ensures that no two employees can have the same EmployeeID.

--2. Foreign Key:
--A foreign key is a column or a set of columns in one table that refers to the primary key in another table.
--It is used to establish and enforce a link between the data in the two tables. A foreign key can contain duplicate values and can contain NULL values.

--Example of Foreign Key:
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
--In this example, EmployeeID in the Orders table is a foreign key that references the EmployeeID in the Employees table. This establishes a relationship between the Orders and Employees tables, allowing us to associate each order with a specific employee.

--3. Unique Key:
--A unique key is a column or a set of columns that must contain unique values. It
--can contain NULL values, but only one NULL value is allowed. A table can have multiple unique keys.
--Example of Unique Key:
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) UNIQUE,
    Price DECIMAL(10, 2)
);
--In this example, ProductName is a unique key for the Products table. It ensures that each product has a unique name, and no two products can have the same name.

--4. Composite Key:
--A composite key is a primary key that consists of two or more columns. It is used when a single column is not sufficient to uniquely identify a row in a table.
--Example of Composite Key:
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);
--In this example, the combination of OrderID and ProductID forms a composite primary key for the OrderDetails table. This means that each combination of OrderID and ProductID must be unique, allowing us to uniquely identify each order detail.

--5. Candidate Key:
--A candidate key is a column or a set of columns that can uniquely identify each row in a table. It is a potential primary key. A table can have multiple candidate keys, but only one can be chosen as the primary key.
--Example of Candidate Key:
CREATE TABLE Students (
    StudentID INT,
    Email VARCHAR(100),
    PRIMARY KEY (StudentID),
    UNIQUE (Email)
);
--In this example, both StudentID and Email can serve as candidate keys for the Students table. However, StudentID is chosen as the primary key, while Email is defined as a unique key to ensure that each student has a unique email address.

--In summary, keys are essential components of a database that help to ensure data integrity and establish relationships between tables. The primary key uniquely identifies each row in a table, while foreign keys establish links between tables. Unique keys ensure that values in a column are unique, and composite keys allow for the combination of multiple columns to create a unique identifier. Candidate keys are potential primary keys that can be used to uniquely identify rows in a table.