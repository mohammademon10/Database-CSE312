------------------------------------------------------------
--Topic:Altering a table to add, modify, or delete columns  
------------------------------------------------------------

CREATE DATABASE  alterdb;
USE alterdb;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
    color VARCHAR(50)
);


-- Adding a new column 'stock_quantity'
ALTER TABLE products
ADD  stock_quantity INT DEFAULT 0;

-- Modifying the 'price' column to increase its size
ALTER TABLE products
MODIFY  price DECIMAL(12,2);
--modyfying column data type and size
ALTER TABLE products
MODIFY COLUMN product_name VARCHAR(150);

--move the column position
ALTER TABLE products
MODIFY COLUMN color VARCHAR(50) AFTER product_id;


--move the column to first position
ALTER TABLE products
MODIFY COLUMN stock_quantity INT FIRST;

--

-- Deleting the 'stock_quantity' column
ALTER TABLE products 
DROP COLUMN stock_quantity;

----------------------------------------------------------------
--datatype conversion
-- Altering column data type from INT to VARCHAR
----------------------------------------------------------------
CREATE TABLE sample_table (
    sample_id INT,
    sample_name VARCHAR(100)
);
ALTER TABLE sample_table
MODIFY COLUMN sample_id VARCHAR(50);
----------------------------------------------------------------
