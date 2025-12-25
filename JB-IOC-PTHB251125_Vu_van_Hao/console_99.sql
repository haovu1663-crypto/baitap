set SEARCH_PATH to kiemtra;
create table customer (
    customer_id varchar(5) primary key not null ,
    customer_full_name varchar(100) not null ,
    customer_email varchar(100) not null unique,
    customer_phone varchar(15) not null,
    customer_address varchar(255) not null
);
create table Room (
    room_id varchar(5) primary key not null ,
    room_type varchar(50) not null,
    room_price decimal(10,2) not null ,
    room_status varchar(20) not null ,
    room_area int not null
);
create table Booking (
    booking_id serial primary key not null,
    customer_id varchar(5) references customer(customer_id) not null,
    room_id varchar(5) references Room(room_id) not null,
    check_in_date date not null,
    check_out_date date not null,
    total_amount decimal(10,2)
);
create table Payment (
    payment_id serial primary key not null ,
    booking_id int REFERENCES Booking(booking_id) not NULL ,
    payment_method varchar(50) not null ,
    payment_date date not null ,
    payment_amount decimal(10,2) not null
);

insert into customer(customer_id, customer_full_name, customer_email, customer_phone, customer_address)
values ('C001','Nguyen Anh Tu','tu.nguyen@example.com','0912345678','Hanoi, Vietnam'),
        ('C002','Tran thi Mai','mai.tran@example.com','0923456789','Ho Chi Minh, Vietnam'),
        ('C003','Le Minh Hoang','hoang.le@example.com','0934567890','Danang, Vietnam'),
        ('C004','Pham Hoang Nam ','nam.pham@example.com','0945678901','Hue, Vietnam'),
        ('C005','Vu Minh Thu','thu.vu@example.com','0956789012','Hai Phong, Vietnam');
insert into Room (room_id, room_type, room_price, room_status, room_area)
VALUES ('R001','Single',100,'Available',25),
       ('R002','Double',150,'Booked',40),
       ('R003','Suite',250,'Available',60),
       ('R004','Single',120.0,'Booked',30),
       ('R005','Double',160.0,'Available',35);
insert into booking(customer_id, room_id, check_in_date, check_out_date, total_amount)
VALUES ('C001' ,'R001','2025-03-01','2025-03-05',400.0),
       ('C002','R002','2025-03-02','2025-03-06',600.0),
       ('C003','R003','2025-03-03','2025-03-07',1000.0),
       ('C004','R004','2025-03-04','2025-03-08',480.0),
       ('C005','R005','2025-03-05','2025-03-09',800.0);
insert into payment (booking_id, payment_method, payment_date, payment_amount)
VALUES (
    1,'Cash','2025-03-05',400.0),
    (2,'Credit Card','2025-03-06',600.0),
    (3,'Bank Transfer','2025-03-07',1000.0),
    (4,'Cash','2025-03-08',480.0),
    (5,'Credit Card','2025-03-09',800.0);
--c3 3. Cập nhật dữ liệu (6 điểm) Viết câu lệnh UPDATE để cập nhật lại total_amount trong bảng Booking theo công thức:
-- total_amount = total_amount * 0.9 cho những bản ghi có ngày check_in trước ngày 3/3/2025.
update Booking set total_amount = total_amount*0.9 where check_in_date<'2025-03-03';
-- 4. Xóa dữ liệu (6 điểm) Viết câu lệnh DELETE để xóa các thanh toán trong bảng Payment nếu:
--                                           - Phương thức thanh toán (payment_method) là "Cash".
--                                           - Và tổng tiền thanh toán (payment_amount) nhỏ hơn 500.
delete FROM payment where payment_method='Cash' and payment_amount<500;
--c5) Lấy thông tin khách hàng gồm: mã khách hàng, họ tên, email, số điện thoại được sắp xếp theo họ tên khách hàng giảm dần.
select c.customer_id,c.customer_full_name,c.customer_email,c.customer_phone from customer c order by customer_full_name DESC ;
--c6Lấy thông tin các phòng khách sạn gồm: mã phòng, loại phòng, giá phòng và diện tích phòng, sắp xếp theo diện tích phòng tăng dần.
select r.room_id,r.room_type,r.room_price,r.room_area from Room r order by r.room_area ASC ;
--c7Lấy thông tin khách hàng và phòng khách sạn đã đặt gồm: họ tên khách hàng, mã phòng, ngày nhận phòng và ngày trả phòng.
select c.customer_full_name,bk.room_id,bk.check_in_date,bk from customer c join Booking bk on c.customer_id=bk.customer_id;
--c8 Lấy danh sách khách hàng và tổng tiền đã thanh toán khi đặt phòng, gồm mã khách hàng, họ tên khách hàng,
-- phương thức thanh toán và số tiền thanh toán, sắp xếp theo số tiền thanh toán tăng dần.
select c.customer_id,c.customer_full_name,p.payment_method,p.payment_amount from customer c join booking bk on c.customer_id = bk.customer_id
                       join Payment p on p.booking_id=bk.booking_id
 order by p.payment_amount;
--c9
-- Lấy tất cả thông tin khách hàng từ vị trí thứ 2 đến thứ 4 trong bảng Customer được sắp xếp theo tên khách hàng (Z-A).
select * from customer order by customer_full_name DESC  limit 3 offset 1;
--10 Lấy danh sách khách hàng đã đặt ít nhất 2 phòng gồm : mã khách hàng, họ tên khách hàng và số lượng phòng đã đặt.
select c.customer_id,c.customer_full_name,count(bk.room_id)  from customer c join Booking bk on c.customer_id = bk.customer_id
group by c.customer_id,c.customer_full_name
having count( bk.room_id)>=2;
--11  Lấy danh sách các phòng từng có ít nhất 3 khách hàng đặt, gồm mã phòng, loại phòng, giá phòng và số lần đã đặt.
select r.room_id,r.room_type,r.room_price,count(bk.booking_id)  from Room r join Booking bk on r.room_id =bk.room_id

group by r.room_id,r.room_type,r.room_price
having count( bk.customer_id)>=3;
--12) Lấy danh sách các khách hàng có tổng số tiền đã thanh toán lớn hơn 1000, gồm mã khách hàng, họ tên khách hàng,
-- mã phòng, tổng số tiền đã thanh toán.
select c.customer_id,c.customer_full_name,bk.room_id,payment_amount from customer c join Booking bk on c.customer_id = bk.customer_id
                       join Payment p on p.booking_id = bk.booking_id
where payment_amount>1000;
--13ểm) Lấy danh sách các khách hàng gồm : mã KH, Họ tên, email, sđt có họ tên chứa chữ "Minh" hoặc địa chỉ ở "Hanoi". Sắp xếp kết quả theo họ tên tăng dần.
select customer_id,customer_full_name,customer_email,customer_phone from customer where customer_full_name ilike '%Minh%' or customer_address ilike '%Hanoi%';
--14Lấy danh sách thông tin các phòng gồm : mã phòng, loại phòng, giá , sắp xếp theo giá phòng giảm dần.
-- Chỉ lấy 5 phòng và bỏ qua 5 phòng đầu tiên (tức là lấy kết quả của trang thứ 2, biết mỗi trang có 5 phòng).
select room_id,room_type,room_price from Room order by room_price DESC limit 5 offset 5;
--15Hãy tạo một view để lấy thông tin các phòng và khách hàng đã đặt, với điều kiện ngày nhận phòng nhỏ hơn ngày 2025-03-04.
-- Cần hiển thị các thông tin sau: Mã phòng, Loại phòng, Mã khách hàng, họ tên khách hàng
create view view_1 as
    select r.room_id, r.room_type,c.customer_id,c.customer_full_name from customer c join Booking bk on c.customer_id=bk.customer_id
                            join Room r on r.room_id = bk.room_id
                            where bk.check_in_date<'2025-03-04';
--16Hãy tạo một view để lấy thông tin khách hàng và phòng đã đặt, với điều kiện diện tích phòng lớn hơn 30 m².
-- Cần hiển thị các thông tin sau: Mã khách hàng, Họ tên khách hàng, Mã phòng, Diện tích phòng, Ngày nhận phòng
create view view_2 as
    select c.customer_id,c.customer_full_name,r.room_id,r.room_area,bk.check_in_date from customer c join Booking bk on c.customer_id=bk.customer_id
                           join Room r on r.room_id=bk.room_id
            where r.room_area>30;

--c17Hãy tạo một trigger check_insert_booking để kiểm tra dữ liệu mối khi chèn vào bảng Booking.
-- Kiểm tra nếu ngày đặt phòng mà sau ngày trả phòng thì thông báo lỗi với nội dung
-- “Ngày đặt phòng không thể sau ngày trả phòng được !” và hủy thao tác chèn dữ liệu vào bảng.
create function  f_check_insert ()
returns trigger
as $$
    begin
        if new.check_in_date > new.check_out_date then raise exception 'Ngày đặt phòng không thể sau ngày trả phòng được !';
        end IF ;
        return new;

    end;
    $$ language  plpgsql;
create trigger  check_insert_booking
    BEFORE INSERT ON  Booking
    FOR EACH ROW EXECUTE FUNCTION f_check_insert();

--18. (5 điểm) Hãy tạo một trigger có tên là update_room_status_on_booking để tự động cập nhật trạng thái phòng thành
-- "Booked" khi một phòng được đặt (khi có bản ghi được INSERT vào bảng Booking).
create function f_chek_update()
returns trigger
as $$
    begin
        If TG_OP ='INSERT' then update kiemtra.Room set room_status='Booked' where new.room_id = room_id;
        end if;
        return new;
    end;
    $$ language plpgsql;

create trigger   update_room_status_on_booking
    AFTER INSERT ON Booking
    FOR EACH ROW EXECUTE FUNCTION f_chek_update();
--19. (5 điểm) Viết store procedure có tên add_customer để thêm mới một khách hàng với đầy đủ các thông tin cần thiết.
create procedure  add_customer (id_in varchar(5),name_in varchar(100),email_in varchar(100),phone_in varchar(15),adder_in varchar(255))
as $$
    begin
        insert into customer(customer_id, customer_full_name, customer_email, customer_phone, customer_address)
        values (id_in,name_in,email_in,phone_in,adder_in);
    end;
    $$ language plpgsql;
call add_customer('C006','vu van hao','haovu1663@gmail.com','0348425849','khanh dương yêm mô');

--) Hãy tạo một Stored Procedure  có tên là add_payment để thực hiện việc thêm một thanh toán mới cho một lần đặt phòng
create procedure add_payment (booking_in int ,payment_method_in varchar(50),payment_date_in date ,payment_amount_in decimal(10,2) )
as $$
    begin
        insert into Payment(booking_id, payment_method, payment_date, payment_amount)
        values (booking_in,payment_method_in,payment_date_in,payment_amount_in);
    end;
    $$ language plpgsql;
call add_payment(7,'tiên mặt','2025-12-23',499);








