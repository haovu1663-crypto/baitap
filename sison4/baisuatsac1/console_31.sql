set SEARCH_PATH to baisuatsac1;
-- Tạo bảng với cột id tự động tăng
CREATE TABLE employees (
                           id         SERIAL PRIMARY KEY,
                           full_name  TEXT NOT NULL,
                           department TEXT NOT NULL,
                           position   TEXT NOT NULL,
                           salary     INTEGER NOT NULL,
                           bonus      INTEGER,
                           join_year  INTEGER NOT NULL
);

-- Chèn dữ liệu không nhập id
INSERT INTO employees (full_name, department, position, salary, bonus, join_year) VALUES
                                                                                      ('Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
                                                                                      ('Trần Thị Mai', 'HR', 'Recruiter', 12000000, NULL, 2020),
                                                                                      ('Lê Quốc Trung', 'IT', 'Tester', 15000000, 800000, 2023),
                                                                                      ('Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
                                                                                      ('Phạm Ngọc Hân', 'Finance', 'Accountant', 14000000, NULL, 2019),
                                                                                      ('Bùi Thị Lan', 'HR', 'HR Manager', 20000000, 3000000, 2018),
                                                                                      ('Đặng Hữu Tài', 'IT', 'Developer', 17000000, NULL, 2022);
--c1
 delete FROM employees where id =
 (  select id FROM employees where full_name =
 (select full_name from employees group by  full_name,department,position having count(id) >1 limit 1)limit 1) ;
--Tăng 10% lương cho những nhân viên làm trong phòng IT có mức lương dưới 18,000,000
UPDATE employees
SET salary = salary * 1.1
WHERE department = 'IT'
  AND salary < 18000000;
--Với nhân viên có bonus IS NULL, đặt giá trị bonus = 500000
UPDATE employees
SET bonus = 500000
WHERE bonus IS NULL;
--Hiển thị danh sách nhân viên thuộc phòng IT hoặc HR, gia nhập sau năm 2020, và có tổng thu nhập (salary + bonus) lớn hơn 15,000,000
--Chỉ lấy 3 nhân viên đầu tiên sau khi sắp xếp giảm dần theo tổng thu nhập
SELECT id, full_name, department, position,
       salary, bonus,
       (salary + COALESCE(bonus,0)) AS total_income
FROM employees
WHERE (department = 'IT' OR department = 'HR')
  AND join_year > 2020
  AND (salary + COALESCE(bonus,0)) > 15000000
ORDER BY total_income DESC
LIMIT 3;
--Tìm tất cả nhân viên có tên bắt đầu bằng “Nguyễn” hoặc kết thúc bằng “Hân”
SELECT *
FROM employees
WHERE full_name LIKE 'Nguyễn%'
   OR full_name LIKE '%Hân';
--Liệt kê các phòng ban duy nhất có ít nhất một nhân viên có bonus IS NOT NULL
SELECT DISTINCT department
FROM employees
WHERE bonus IS NOT NULL;
--Hiển thị nhân viên gia nhập trong khoảng từ 2019 đến 2022 (BETWEEN)
SELECT *
FROM employees
WHERE join_year BETWEEN 2019 AND 2022;