create  schema baisuatsac2;

set search_path to baisuatsac2;
CREATE TABLE books (
                       id SERIAL PRIMARY KEY,
                       title VARCHAR(200),
                       author VARCHAR(100),
                       category VARCHAR(50),
                       publish_year INT,
                       price NUMERIC(12,0),
                       stock INT
);
INSERT INTO books (id, title, author, category, publish_year, price, stock) VALUES
                                                                                (1, 'Lập trình C cơ bản', 'Nguyễn Văn Nam', 'CNTT', 2018, 95000, 20),
                                                                                (2, 'Học SQL qua ví dụ', 'Trần Thị Hạnh', 'CSDL', 2020, 125000, 12),
                                                                                (3, 'Lập trình C cơ bản', 'Nguyễn Văn Nam', 'CNTT', 2018, 95000, 20),
                                                                                (4, 'Phân tích dữ liệu với Python', 'Lê Quốc Bảo', 'CNTT', 2022, 180000, NULL),
                                                                                (5, 'Quản trị cơ sở dữ liệu', 'Nguyễn Thị Minh', 'CSDL', 2021, 150000, 5),
                                                                                (6, 'Học máy cho người mới bắt đầu', 'Nguyễn Văn Nam', 'AI', 2023, 220000, 8),
                                                                                (7, 'Khoa học dữ liệu cơ bản', 'Nguyễn Văn Nam', 'AI', 2023, 220000, NULL);


delete
from books
where id =(select id
           from books
           where author =(select author
                          from books
                          GROUP BY title, author,publish_year
                          HAVING count (id)>=2)
           limit 1);
--Tăng giá 10% cho sách xuất bản từ năm 2021 trở đi và có price < 200000:

UPDATE books
SET price = price * 1.1
WHERE publish_year >= 2021
  AND price < 200000;
--Với sách có stock IS NULL, đặt stock = 0:
UPDATE books
SET stock = 0
WHERE stock IS NULL;
--Liệt kê sách thuộc chủ đề CNTT hoặc AI, giá trong khoảng 100000–250000, sắp xếp giảm dần theo price, rồi tăng dần theo title:
SELECT *
FROM books
WHERE category IN ('CNTT', 'AI')
  AND price BETWEEN 100000 AND 250000
ORDER BY price DESC, title ASC;
--Tìm sách có tiêu đề chứa từ “học” (không phân biệt hoa thường):
SELECT *
FROM books
WHERE title ILIKE '%học%';
--Liệt kê các thể loại duy nhất có ít nhất một cuốn sách xuất bản sau năm 2020:
SELECT DISTINCT category
FROM books
WHERE publish_year > 2020;
--Chỉ hiển thị 2 kết quả đầu tiên, bỏ qua 1 kết quả đầu tiên:
SELECT *
FROM books
LIMIT 2 OFFSET 1;
