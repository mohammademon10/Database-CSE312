-- MySQL Data Types

--1. Numeric Data Types
--1.1 INT: A standard integer data type that can store whole numbers. It can be signed (allowing negative values) or unsigned (only positive values). The range of values depends on whether it is signed or unsigned.
--1.2 DECIMAL: A fixed-point data type that can store numbers with a specified number of digits before and after the decimal point. It is often used for financial calculations where precision is important.
--1.3 FLOAT: A floating-point data type that can store approximate numeric values with a
--Example of Numeric Data Types:
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,

    Price DECIMAL(10, 2),
    Quantity INT
);
--In this example, ProductID is an INT data type that serves as the primary key for the Products table. Price is a DECIMAL data type that can store values with up to 10 digits in total and 2 digits after the decimal point, allowing for precise financial calculations. Quantity is an INT data type that can store whole numbers representing the quantity of products in stock.
--Example of FLOAT:
CREATE TABLE Measurements (
    MeasurementID INT PRIMARY KEY,
    Value FLOAT
);
--In this example, Value is a FLOAT data type that can store approximate numeric values, which is useful for measurements that may not require high precision.


--2. String Data Types
--2.1 VARCHAR: A variable-length string data type that can store up to 255 characters. It is used for storing text data that can vary in length.
--2.2 TEXT: A string data type that can store large amounts of text data, up to 65,535 characters. It is used for storing long text such as articles or descriptions.
--2.3 CHAR: A fixed-length string data type that can store a specified number of characters. It is used for storing data that has a consistent length, such as postal codes or phone numbers.
--Example of String Data Types:
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Address TEXT,
    PostalCode CHAR(10)
);
--In this example, FirstName and LastName are VARCHAR data types that can store variable-length strings up to 50 characters. Email is a VARCHAR data type that can store variable-length strings up to 100 characters. Address is a TEXT data type that can store large amounts of text data, while PostalCode is a CHAR data type that can store fixed-length strings of 10 characters.


--3. Date and Time Data Types
--3.1 DATE: A data type that can store date values in the format 'YYYY
-MM-DD'. It is used for storing date information such as birthdates or event dates.
--3.2 DATETIME: A data type that can store date and time values in the format 'YYYY-MM-DD HH:MM:SS'. It is used for storing both date and time information, such as timestamps for when a record was created or updated.
--3.3 TIMESTAMP: A data type that can store date and time values in the
format 'YYYY-MM-DD HH:MM:SS'. It is similar to DATETIME but has a smaller range and is often used for tracking changes to records, as it automatically updates to the current date and time when a record is modified.
--Example of Date and Time Data Types:

CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATE,
    CreatedAt DATETIME,
    UpdatedAt TIMESTAMP
);
--In this example, EventDate is a DATE data type that can store date values, while CreatedAt is a DATETIME data type that can store both date and time values. UpdatedAt is a TIMESTAMP data type that automatically updates to the current date and time whenever a record is modified, allowing us to track changes to the event records.


--4. Boolean Data Type
--4.1 BOOLEAN: A data type that can store only two values: TRUE or FALSE
--It is used for storing binary data such as flags or status indicators.
--Example of BOOLEAN:

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    IsActive BOOLEAN
);
--In this example, IsActive is a BOOLEAN data type that indicates whether a user is active or not. It can store either TRUE or FALSE values, allowing us to easily check the status of each user.

--In summary, MySQL offers a variety of data types to accommodate different types of data, including numeric, string, date and time, and boolean data. Choosing the appropriate data type for each column in a table is important for ensuring data integrity and optimizing performance when querying the database.