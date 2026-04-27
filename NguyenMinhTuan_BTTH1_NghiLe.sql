CREATE database ShopManager;

use ShopManager;

create table Categories (
	category_id int primary key auto_increment,
    category_name varchar(255) not null 
);

create table Products (
	product_id int primary key auto_increment,
    product_name varchar(255) not null,
    price decimal(10,2) not null,
    stock int,
    category_id int not null,
    foreign key(category_id) references Categories(category_id)
);

insert into Categories (category_name) 
values
	('điện tử'),
    ('thời trang');
    
insert into Products (product_name, price, stock, category_id)
values
	('iphone 15', 25000000, 10, 1),
    ('Samsung S23', 20000000, 5, 1),
    ('áo sơ mi nam', 500000, 50, 2),
    ('giày thể thao', 1200000, 20, 2);
    
update Products
set price = 26000000
where product_name = 'iphone 15'
	and product_id > 0;

update Products
set stock = stock + 10
where category_id = 1;

delete from Products
where product_id = 4;

delete from Products
where price < 1000000
	and product_id > 0;

select * from Products;

select * from Products
where stock > 15;

select * from Products
where price > 1000000
	and price < 25000000;

select * from Products
where not product_name = 'iphone 15'
		and stock > 0;
        
select * from Products
where not category_id = 1 
	and price > 500000;

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
