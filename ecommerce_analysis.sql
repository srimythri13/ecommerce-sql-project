CREATE DATABASE IF NOT EXISTS ecommerce_transaction;
USE ecommerce;

CREATE TABLE ecommerce_transactions12 (
  Transaction_ID VARCHAR(50) PRIMARY KEY,
  User_Name VARCHAR(255),
  Age INT,
  Country VARCHAR(100),
  Product_Category VARCHAR(150),
  Purchase_Amount DECIMAL(10,2),
  Payment_Method VARCHAR(50),
  Transaction_Date DATE
);
SELECT COUNT(*) FROM  ecommerce_transactions;
SHOW TABLES;
SELECT * FROM ecommerce_transactions;
SELECT * FROM ecommerce_transactions LIMIT 10;
SELECT * FROM ecommerce_transactions
WHERE Country = 'India' AND Purchase_Amount > 100;
SELECT Transaction_ID, User_Name, Purchase_Amount
FROM ecommerce_transactions
ORDER BY Purchase_Amount DESC
LIMIT 10;
SELECT Country,
       COUNT(*) AS total_transactions,
       SUM(Purchase_Amount) AS total_sales,
       AVG(Purchase_Amount) AS avg_purchase
FROM ecommerce_transactions
GROUP BY Country
ORDER BY total_sales DESC;
SELECT Product_Category, SUM(Purchase_Amount) AS sales
FROM ecommerce_transactions
GROUP BY Product_Category
HAVING SUM(Purchase_Amount) > 10000;
SELECT *
FROM ecommerce_transactions
WHERE Purchase_Amount > (SELECT AVG(Purchase_Amount) FROM ecommerce_transactions);
SELECT a.User_Name, a.Product_Category AS First_Purchase, b.Product_Category AS Second_Purchase
FROM ecommerce_transactions a
JOIN ecommerce_transactions b
  ON a.User_Name = b.User_Name
  AND a.Transaction_ID <> b.Transaction_ID;
CREATE VIEW country_sales AS
SELECT Country, COUNT(*) AS tx_count, SUM(Purchase_Amount) AS total_sales
FROM ecommerce_transactions
GROUP BY Country;
-- Use it:
SELECT * FROM country_sales ORDER BY total_sales DESC;
SHOW TABLES; 
CREATE INDEX idx_country 
ON ecommerce_transactions (Country(50));
CREATE VIEW country_sales AS
SELECT Country, COUNT(*) AS tx_count, SUM(Purchase_Amount) AS total_sales
FROM ecommerce_transactions
GROUP BY Country;


