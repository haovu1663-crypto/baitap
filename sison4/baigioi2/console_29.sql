set SEARCH_PATH to baigioi2;
CREATE TABLE products (
                          id SERIAL PRIMARY KEY,
                          name TEXT,
                          category TEXT,
                          price BIGINT,
                          stock INTEGER,
                          manufacturer TEXT
);
INSERT INTO products (name, category, price, stock, manufacturer) VALUES
                                                                      ('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
                                                                      ('Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
                                                                      ('Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
                                                                      ('Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
                                                                      ('iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
                                                                      ('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
                                                                      ('Tai nghe AirPods 3', 'Phụ kiện', 4500000, NULL, 'Apple');
--c1
INSERT INTO products (name, category, price, stock, manufacturer) VALUES
('chột không dây  logitech M170','phụ kiện',300000,20,'logitech');
--c2
update products set price=price*11/10 where id >0;
--c3
delete FROM products where stock=0;
--c4
    select * FROM products where price between 100000 and 3000000;
--c5
select * from products where stock is null;
--c6
select distinct products.manufacturer from products;
--c7
select * FROM products order by price ASC ;
select *from products order by price DESC ;
--c8
select * FROM products where name ilike '%laptop%';
--c9
select * FROM products order by price limit 2;

