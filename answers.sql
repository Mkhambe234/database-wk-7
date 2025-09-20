/Write an SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order/
-- Create normalized tables for 1NF
CREATE TABLE Orders_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    PRIMARY KEY (OrderID)
);

CREATE TABLE OrderProducts_1NF (
    OrderID INT,
    Product VARCHAR(255),
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders_1NF(OrderID)
);

-- Insert data into normalized tables
INSERT INTO Orders_1NF (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM ProductDetail;

INSERT INTO OrderProducts_1NF (OrderID, Product)
SELECT 
    OrderID,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.digit+1), ',', -1)) as Product
FROM ProductDetail
JOIN (SELECT 0 digit UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) n
WHERE LENGTH(Products) - LENGTH(REPLACE(Products, ',', '')) >= n.digit
ORDER BY OrderID, Product;

/Write an SQL query to transform this table into 2NF by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key./
-- Create normalized tables for 1NF
CREATE TABLE Orders_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    PRIMARY KEY (OrderID)
);

CREATE TABLE OrderProducts_1NF (
    OrderID INT,
    Product VARCHAR(255),
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders_1NF(OrderID)
);

-- Insert data into normalized tables
INSERT INTO Orders_1NF (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM ProductDetail;

INSERT INTO OrderProducts_1NF (OrderID, Product)
SELECT 
    OrderID,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.digit+1), ',', -1)) as Product
FROM ProductDetail
JOIN (SELECT 0 digit UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) n
WHERE LENGTH(Products) - LENGTH(REPLACE(Products, ',', '')) >= n.digit
ORDER BY OrderID, Product;


Week 7
