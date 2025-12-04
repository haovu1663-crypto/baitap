set SEARCH_PATH  to baikha2;
CREATE TABLE products (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(50),
                          category VARCHAR(50),
                          price DECIMAL(10,2),
                          stock INT
);

INSERT INTO products (name, category, price, stock) VALUES
                                                        ('Laptop Dell', 'Electronics', 1500.00, 5),
                                                        ('Chuột Logitech', 'Electronics', 25.50, 50),
                                                        ('Bàn phím Razer', 'Electronics', 120.00, 20),
                                                        ('Tủ lạnh LG', 'Home Appliances', 800.00, 3),
                                                        ('Máy giặt Samsung', 'Home Appliances', 600.00, 2);
--cau 1
INSERT INTO products (name, category, price, stock) VALUES
('điều hòa panasonic','thiết bị gia dụng',400,10);
-- cau 2
update products set stock=7 where name ='Laptop Dell';
--cau 3
delete from products where stock=0;
--cau 4
select * from products order by price;
--cau5
select distinct category from products;
--cau6
select * from products where price between 100 and 1000;
--cau7
select *from products where name ilike '%lg%' or name ilike '%samsung%';
--cau8
select * from products order by name limit 2 offset 1;