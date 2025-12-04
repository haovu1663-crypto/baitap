create schema baigioi1;
set SEARCH_PATH  to baigioi1;
CREATE TABLE sinh_vien (
                           nhan_dang SERIAL PRIMARY KEY,
                           ho_va_ten VARCHAR(100),
                           gioi_tinh VARCHAR(10),
                           nam_sinh INT,
                           nganh VARCHAR(50),
                           diem_trung_binh NUMERIC(3,1)
);
INSERT INTO sinh_vien (ho_va_ten, gioi_tinh, nam_sinh, nganh, diem_trung_binh) VALUES
                                                                                   ('Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
                                                                                   ('Trần Thị Bích Ngọc', 'Nữ', 2001, 'Kinh tế', 3.2),
                                                                                   ('Lê Quốc Cường', 'Nam', 2003, 'CNTT', 2.7),
                                                                                   ('Phạm Minh Anh', 'Nữ', 2000, 'Luật', 3.9),
                                                                                   ('Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
                                                                                   ('Lưu Đức Tài', NULL, 2004, 'Cơ khí', NULL),
                                                                                   ('Võ Thị Thu Hằng', 'Nữ', 2001, 'CNTT', 3.0);

INSERT INTO sinh_vien (ho_va_ten, gioi_tinh, nam_sinh, nganh, diem_trung_binh) VALUES
 ('phan hoàng nam ','nam',2003,'CNTT',2.8);
update sinh_vien set diem_trung_binh =3.4 where ho_va_ten='Lê Quốc Cường';
delete from sinh_vien where diem_trung_binh is null;
select * from sinh_vien where diem_trung_binh >= 3.0 and nganh ='CNTT';
select distinct nganh from sinh_vien;
select * from sinh_vien where nganh ='CNTT'   order by diem_trung_binh;
select * from sinh_vien where ho_va_ten like '%Nguyễn%';
select *
from sinh_vien where nam_sinh between 2001 and 2003;

