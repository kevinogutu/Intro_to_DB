-- task_2.sql
-- Create all required tables in alx_book_store as per Task 0 attributes

USE alx_book_store;

-- ===============================
-- 1. AUTHORS TABLE
-- ===============================
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- ===============================
-- 2. BOOKS TABLE
-- ===============================
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- ===============================
-- 3. CUSTOMERS TABLE
-- ===============================
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

-- ===============================
-- 4. ORDERS TABLE
-- ===============================
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ===============================
-- 5. ORDER_DETAILS TABLE
-- ===============================
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
