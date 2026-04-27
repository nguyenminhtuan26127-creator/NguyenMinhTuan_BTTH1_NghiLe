CREATE DATABASE book_worm_db;
USE book_worm_db;

-- Bảng authors
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_year INT,
    nationality VARCHAR(50)
);

-- Bảng books
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(150) NOT NULL,
    category VARCHAR(50),
    author_id INT,
    price DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (price >= 0),
    publish_year YEAR,
    
    CONSTRAINT fk_books_authors
        FOREIGN KEY (author_id)
        REFERENCES authors(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Bảng customers
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    registration_date TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

-- thêm dữ liệu vào bangr authors ( 3 tác giả )
INSERT INTO authors (full_name, birth_year, nationality) 
VALUES
	('Nguyen Nhat Anh', 1955, 'Vietnam'),
	('Agatha Christie', 1890, 'United Kingdom'),
	('Dale Carnegie', 1888, 'USA');

-- thêm dữ liệu vào bảng books ( 8 sách )
INSERT INTO books (book_name, category, author_id, price, publish_year) 
VALUES
	('Mat Biec', 'Van hoc', 1, 85000, 1990),
	('Cho Toi Xin Mot Ve Di Tuoi Tho', 'Van hoc', 1, 92000, 2008),
	('Toi Thay Hoa Vang Tren Co Xanh', 'Van hoc', 1, 99000, 2010),
	('Murder on the Orient Express', 'Trinh tham', 2, 120000, 1934),
	('And Then There Were None', 'Trinh tham', 2, 115000, 1939),
	('The ABC Murders', 'Trinh tham', 2, 110000, 1936),
	('How to Win Friends and Influence People', 'Ky nang', 3, 150000, 1936),
	('The Quick and Easy Way to Effective Speaking', 'Ky nang', 3, 135000, 1962);

-- thêm dữ liệu vào bảng customer ( 5 khách hàng )
INSERT INTO customers (full_name, email, phone) 
VALUES
	('Nguyen Van A', 'vana@gmail.com', '0901111111'),
	('Tran Thi B', 'thib@gmail.com', '0902222222'),
	('Le Van C', 'vanc@gmail.com', '0903333333'),
	('Pham Thi D', 'thid@gmail.com', '0904444444'),
	('Hoang Van E', 'vane@gmail.com', '0905555555');

-- THỬ NHẬP EMAIL TRÙNG
INSERT INTO customers (full_name, email, phone) VALUES
('Khach Hang Loi', 'vana@gmail.com', '0906666666');
/* 
MySQL sẽ báo lỗi:
	Error Code: 1062 Duplicate entry 'vana@gmail.com' for key 'customers.email'
	Vì cột email đã được thiết lập UNIQUE, nên hệ thống sẽ chặn không cho thêm email trùng lặp. 
*/

-- Danh sách sách thể loại "Trinh thám" có giá dưới 100.000đ
SELECT *
FROM books
WHERE category = 'Trinh tham'
	AND price < 100000;

-- Khách hàng dùng email Google
SELECT *
FROM customers
WHERE email LIKE '%@gmail.com';

-- Top 3 cuốn sách đắt nhất ( sắp xếp theo chiều giảm dần và lấy 3 cuốn đầu tiên )
SELECT *
FROM books
ORDER BY price DESC
LIMIT 3;

-- Giảm giá 10% cho sách xuất bản trước 2020
UPDATE books
SET price = price * 0.9
WHERE publish_year < 2020;
