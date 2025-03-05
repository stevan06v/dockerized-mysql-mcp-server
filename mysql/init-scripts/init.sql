CREATE USER IF NOT EXISTS 'stevan'@'%' IDENTIFIED BY 'password';

GRANT SELECT, INSERT, UPDATE, DELETE ON shopdb.* TO 'stevan'@'%';

ALTER USER 'stevan'@'%' 
WITH MAX_QUERIES_PER_HOUR 1000
MAX_UPDATES_PER_HOUR 100;

FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS shopdb;
USE shopdb;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

INSERT INTO customers (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901'),
('Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012'),
('Bob', 'Brown', 'bob.brown@example.com', '456-789-0123'),
('Charlie', 'Davis', 'charlie.davis@example.com', '567-890-1234'),
('David', 'Miller', 'david.miller@example.com', '678-901-2345'),
('Eve', 'Wilson', 'eve.wilson@example.com', '789-012-3456'),
('Frank', 'Moore', 'frank.moore@example.com', '890-123-4567'),
('Grace', 'Taylor', 'grace.taylor@example.com', '901-234-5678'),
('Hannah', 'Anderson', 'hannah.anderson@example.com', '012-345-6789');

CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2)
);

INSERT INTO products (name, description, price) VALUES
('Laptop', 'High performance laptop', 999.99),
('Smartphone', 'Latest model smartphone', 799.99),
('Headphones', 'Noise-canceling headphones', 199.99),
('Mouse', 'Wireless mouse', 29.99),
('Keyboard', 'Mechanical keyboard', 99.99),
('Monitor', '27-inch 4K monitor', 349.99),
('Tablet', '10-inch tablet', 499.99),
('Smartwatch', 'Fitness tracking smartwatch', 149.99),
('Camera', 'Digital camera with 20MP', 499.99),
('Speaker', 'Bluetooth speaker', 129.99);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Completed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2025-03-01 10:00:00', 'Completed'),
(2, '2025-03-02 11:30:00', 'Pending'),
(3, '2025-03-03 12:45:00', 'Completed'),
(4, '2025-03-04 13:00:00', 'Cancelled'),
(5, '2025-03-05 14:30:00', 'Pending'),
(6, '2025-03-06 15:00:00', 'Completed'),
(7, '2025-03-07 16:15:00', 'Cancelled'),
(8, '2025-03-08 17:30:00', 'Pending'),
(9, '2025-03-09 18:45:00', 'Completed'),
(10, '2025-03-10 19:00:00', 'Pending');

CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 999.99),
(1, 2, 2, 799.99),
(2, 3, 1, 199.99),
(3, 4, 1, 29.99),
(4, 5, 1, 99.99),
(5, 6, 1, 349.99),
(6, 7, 1, 499.99),
(7, 8, 2, 149.99),
(8, 9, 1, 499.99),
(9, 10, 1, 129.99);
