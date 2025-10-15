-- ===========================
-- Initial DB Schema + Sample Data
-- Filename: project_db_schema1.sql
-- ===========================

-- 1️⃣ Create Database
CREATE DATABASE IF NOT EXISTS project_db_schema1;
USE project_db_schema1;

-- 2️⃣ Users Table
CREATE TABLE IF NOT EXISTS Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3️⃣ Products Table
CREATE TABLE IF NOT EXISTS Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4️⃣ Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- 5️⃣ Order_Items Table
CREATE TABLE IF NOT EXISTS Order_Items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- ===========================
-- 6️⃣ Sample Data
-- ===========================
INSERT INTO Users (name, email, password) VALUES
('Bhawani Singh', 'bhawani@example.com', 'pass123'),
('Aman Kumar', 'aman@example.com', 'pass123'),
('Sourabh Verma', 'sourabh@example.com', 'pass123');

INSERT INTO Products (name, price, stock) VALUES
('Laptop', 45000.00, 10),
('Mobile Phone', 15000.00, 25),
('Headphones', 2000.00, 50);

INSERT INTO Orders (user_id, total_amount) VALUES
(1, 47000.00),
(2, 15000.00);

INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 45000.00),
(1, 3, 1, 2000.00),
(2, 2, 1, 15000.00);

-- ===========================
-- 7️⃣ Optional: Check Data
-- ===========================
SHOW DATABASES;
SHOW TABLES;
DESCRIBE Users;
DESCRIBE Products;
DESCRIBE Orders;
DESCRIBE Order_Items;

SELECT * FROM Users;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
