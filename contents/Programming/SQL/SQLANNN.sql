 -- 1111111111111111111. tạo data base
 create database SQLAn
 go
 -- 2222222222222222222222. tạo bảng, xóa bảng bằng code
 --- tạo bảng
 create table GiaoVien
 (
	MaGV nvarchar(10),
	Name nvarchar(100)
 )

 go
  CREATE TABLE HocSinhGioi
  (
  MaHS NVARCHAR(10),
  Name NVARCHAR(100)
  )
  go
  --- xóa bảng
  DROP TABLE HocSinhGioi
  go
  --- sửa bảng 
  ALTER TABLE GiaoVien ADD NgaySinh DATE
  
  
  
  
  
  
  -- 44444444444444444444444. tạo khóa chính của bảng
  --- cách 1: tạo ngay trong bảng.
  --- cách 2: tạo bằng code.
  ---- ý nghĩa : 
  ----- UNIQUE : duy nhất, trong toàn bộ bảng từ nào có từ khóa UNIQUE thì không thể có 2 giá trị trùng nhau.
  ----- NOT NULL : Trường đó không được phép null.
  ----- DEFAULT : Giá trị mặc định của trường đó nếu k gán giá trị insert.
  ------ cách 1: cách tạo khóa ngay trong bảng
  create table testprimarykey0
  (
  ID int primary key,
  name NVARCHAR(100) DEFAULT N'Lalaala'
  )
 go

 ------ cách 2: khi đã tạo 1 bảng rồi thì nếu muốn biến cột đón thành primary key thì phải làm như sau
 -- đã tạo bảng
  create table testprimarykey1
 (
 ID int unique not null,
 name NVARCHAR(100) DEFAULT N'HUHUU'
 )
 go
 insert dbo.testprimarykey1
 (ID)
 values (0)
 -- sau khi tạo thêm khóa chính vào 1 cái được chọn
 ALTER TABLE dbo.testprimarykey1 ADD PRIMARY KEY (ID)
 ------ cách 3: tạo primary key ngay trong bảng
 -- chỉ tạo primary trong bảng
 create table testprimarykey2
 (
 ID int not null,
 name NVARCHAR(100) DEFAULT N'hahaa',
 PRIMARY key (ID)
 )
 go
 -- chỉ tạo primary trong bảng nhwung đặt tên cho nó
 create table testprimarykey3
 (
 ID int not null,
 name NVARCHAR(100) DEFAULT N'hahuuu',
 CONSTRAINT PK_Test3, --- tên của khóa, khi nào muốn xóa thì xóa ở tên lên xóa  dễ hơn.
 PRIMARY key (ID)
 )
 go
 ------cách 4: tạo primary key ngoài bảng khi có bảng và đặt tên cho khóa
 create table testprimarykey4
 (
 ID int not null,
 name NVARCHAR(100) DEFAULT N'hihi'
 )
 go
 ALTER TABLE dbo.testprimarykey4 ADD CONSTRAINT PK_TEST4 PRIMARY KEY (ID)
 ------cách 5: tạo primary key có 2 trường
 create table testprimarykey4
 (
 ID1 int not null,
 ID2 int not null,
 name NVARCHAR(100) DEFAULT N'hohi',
 PRIMARY KEY (ID1, ID2)
 )
 go






 --555555555555555555555555555555555. Tạo khóa ngoại
 --------điều kiện khóa ngoại :
 -------Tham chiếu tới khóa chính, cùng kiểu dữ liệu, unique với not null, cùng số lượng trường có sắp xếp.
CREATE DATABASE  Primary_B --- đây là database khác nhá để ý
GO

USE Primary_B
GO

CREATE TABLE BoMon
(
	MaBM CHAR(10) PRIMARY KEY,
	Name NVARCHAR(100) DEFAULT N'Tên bộ môn'
)
GO

CREATE TABLE Lop
(
	MaLop CHAR(10) NOT NULL,
	Name NVARCHAR(100) DEFAULT N'Tên lớp',
	
	PRIMARY KEY(MaLop)
)

CREATE TABLE GiaoVien
(
            MaGV CHAR(10) NOT NULL,
            Name NVARCHAR(100) DEFAULT N'Tên giáo viên',
            DiaChi NVARCHAR(100) DEFAULT N'Địa chỉ giáo viên',
            NgaySinh DATE,
            Sex BIT,
            MaBM CHAR(10),
           

 -- Tạo khóa ngoại ngay khi tạo bảng
            FOREIGN KEY (MaBM) REFERENCES dbo.BoMon(MaBM)
)
GO

ALTER TABLE dbo.GiaoVien ADD PRIMARY KEY(MaGV)

create table HocSinh
(
	MaHS char(10) PRIMARY KEY,
	name NVARCHAR(100),
	MaLop char(10)
)
GO
---------Tạo khóa ngoại ngay khi tạo bảng
ALTER TABLE dbo.HocSinh ADD CONSTRAINT FK_HS FOREIGN KEY (MaLop) REFERENCES dbo.Lop(MaLop)
------- hủy khóa ngoại
---ALTER TABLE dbo.HocSinh DROP CONSTRAINT FK_HS
insert  dbo.BoMon (MaBM, Name)
values ('BM07',
        N'bộ môn 1'
		)
insert   dbo.BoMon (MaBM, Name)
values ('BM08',
        N'bộ môn 1 '
		)
insert  dbo.BoMon (MaBM, Name)
values ('BM09',
        N'bộ môn 1'
		)
insert dbo.GiaoVien (MaGV, Name, DiaChi, NgaySinh, Sex, MaBM)
values ('GV1', N'GV 1', N'Dia chi 1', GETDATE(), 1, 'BM03')
insert dbo.GiaoVien (MaGV, Name, DiaChi, NgaySinh, Sex, MaBM)
values ('GV2', N'GV 1', N'Dia chi 1', GETDATE(), 1, 'BM02')






--666666666666666666666. Truy vấn dữ liệu 
---6666666666666.11111111111111111 .Truy vấn dữ liệu cơ bản
 --1/ Tạo DB + Sử dụng DB
	Create Database truyvandulieu 
	Go
	Use truyvandulieu
	Go
	
-- 2/ Tạo các table + Khoá chính
	Create Table THAMGIADT
	(
		MAGV nchar(3),
		MADT nchar(4),
		STT int,
		PHUCAP float,
		KETQUA nvarchar(10),
		Primary Key (MAGV,MADT,STT)
	)
	go
	
	Create Table KHOA
	(
		MAKHOA nchar (4),
		TENKHOA nvarchar (50),
		NAMTL int,
		PHONG char(3),
		DIENTHOAI char(10),
		TRUONGKHOA nchar(3),
		NGAYNHANCHUC datetime,
		primary key (MAKHOA)
	)
	go
	
	create table BOMON
	(
		MABM nchar(4),
		TENBM nchar (50),
		PHONG char(3),
		DIENTHOAI char(11),
		TRUONGBM nchar(3),
		MAKHOA nchar (4),
		NGAYNHANCHUC date,
		primary key (MABM)
	)
	go
	
	create table CONGVIEC 
	(
		MADT nchar(4),
		SOTT int,
		TENCV nvarchar(50),
		NGAYBD datetime,
		NGAYKT datetime,
		primary key (MADT,SOTT)
	)
	go
	
	create table DETAI
	(
		MADT nchar(4),
		TENDT nvarchar(50),
		CAPQL nchar(20),
		KINHPHI float,
		NGAYBD date,
		NGAYKT date,
		MACD nchar(4),
		GVCNDT nchar(3),
		primary key (MADT)
	)
	go
	create table CHUDE
	(
		MACD nchar(4),
		TENCD nvarchar(30),
		primary key (MACD)
	)
	go
	
	create table GIAOVIEN
	(
		MAGV nchar(3),
		HOTEN nvarchar(50),
		LUONG float,
		PHAI nchar(3),
		NGSINH date,
		DIACHI nchar(50),
		GVQLCM nchar(3),
		MABM nchar(4),
		primary key (MAGV)
	)
	go
	
	create table NGUOITHAN
	(
		MAGV nchar(3),
		TEN nchar(12),
		NGSINH datetime,
		PHAI nchar(3),
		primary key (MAGV,TEN)
	)
	go
	
	create table GV_DT
	(
		MAGV nchar(3),
		DIENTHOAI char (10),
		primary key (MAGV,DIENTHOAI)
	)
	go
	
-- 3/ Tạo khoá ngoại
--Tạo khoá ngoại ở bảng THAMGIADT
	Alter table THAMGIADT
		add constraint FK_HG1_MADT
		foreign key (MADT, STT)
		references CONGVIEC(MADT,SOTT)
		go
		
--Tạo khóa ngoại ở bảng CONGVIEC
	Alter table CONGVIEC
		add constraint FK_HG2_MADT
		foreign key (MADT)
		references DETAI(MADT)
		go
		
--Tạo khóa ngoại ở bảng DETAI
	Alter table DETAI
		add constraint FK_HG3_MACD
		foreign key (MACD)
		references CHUDE(MACD)
		go
		
--Tạo khóa ngoại ở bảng DETAI
	Alter table DETAI
		add constraint FK_HG4_GVCNDT
		foreign key (GVCNDT)
		references GIAOVIEN(MAGV)
		go
		
--Tạo khóa ngoại ở bảng THAMGIADT
	Alter table THAMGIADT
		add constraint FK_HG5_MAGV
		foreign key (MAGV)
		references GIAOVIEN(MAGV)
		go
		
--Tạo khóa ngoại ở bảng GIAOVIEN
	Alter table GIAOVIEN
		add constraint FK_HG6_GVQLCM
		foreign key (GVQLCM)
		references GIAOVIEN(MAGV)
		go
			
--Tạo khóa ngoại ở bảng KHOA
	Alter table KHOA
		add constraint FK_HG7_TRUONGKHOA
		foreign key (TRUONGKHOA)
		references GIAOVIEN(MAGV)
		go
		
--Tạo khóa ngoại ở bảng NGUOITHAN
	Alter table NGUOITHAN
		add constraint FK_HG8_MAGV
		foreign key (MAGV)
		references GIAOVIEN(MAGV)
		go
		
--Tạo khóa ngoại ở bảng GIAOVIEN
	Alter table GIAOVIEN
		add constraint FK_HG9_MABM
		foreign key (MABM)
		references BOMON(MABM)
		go
		
--Tạo khóa ngoại ở bảng BOMON
	Alter table BOMON
		add constraint FK_HG10_MAKHOA
		foreign key (MAKHOA)
		references KHOA(MAKHOA)
		go
		
--Tạo khóa ngoại ở bảng BOMON
	Alter table BOMON
		add constraint FK_HG11_TRUONGBM
		foreign key (TRUONGBM)
		references GIAOVIEN(MAGV)
		go
		
--Tạo khóa ngoại ở bảng GV_DT
	Alter table GV_DT
		add constraint FK_HG12_MAGV
		foreign key (MAGV)
		references GIAOVIEN(MAGV)
		go
		
-- 4/ Nhập data
--Nhập data cho bảng CHUDE
	Insert Into CHUDE(MACD,TENCD)
	values ('NCPT', N'Nghiên cứu phát triển')
	Insert Into CHUDE(MACD,TENCD)
	values ('QLGD', N'Quản lý giáo dục')
	Insert Into CHUDE(MACD,TENCD)
	values ('UDCN', N'Ứng dụng công nghệ')
	go
	
--Nhập data cho bảng GIAOVIEN
	Insert Into GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI)
	values ('001',N'Nguyễn Hoài An',2000.0,N'Nam','1973-02-15',N'25/3 Lạc Long Quân, Q.10,TP HCM')
	Insert Into GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI)
	values ('002',N'Trần Trà Hương',2500.0,N'Nữ','1960-06-20',N'125 Trần Hưng Đạo, Q.1, TP HCM')
	Insert Into GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI,GVQLCM)
	values ('003',N'Nguyễn Ngọc Ánh',2200.0,N'Nữ','1975-05-11',N'12/21 Võ Văn Ngân Thủ Đức, TP HCM',N'002')
	Insert Into GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI)
	values ('004',N'Trương Nam Sơn',2300.0,N'Nam','1959-06-20',N'215 Lý Thường Kiệt,TP Biên Hòa')
	Insert Into GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI)
	values ('005',N'Lý Hoàng Hà',2500.0,N'Nam','1954-10-23',N'22/5 Nguyễn Xí, Q.Bình Thạnh, TP HCM')
	Insert Into GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI,GVQLCM)
	values ('006',N'Trần Bạch Tuyết',1500.0,N'Nữ','1980-05-20',N'127 Hùng Vương, TP Mỹ Tho',N'004')
	Insert Into GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI)
	values ('007',N'Nguyễn An Trung',2100.0,N'Nam','1976-06-05',N'234 3/2, TP Biên Hòa')
	Insert Into GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI,GVQLCM)
	values ('008',N'Trần Trung Hiếu',1800.0,N'Nam','1977-08-06',N'22/11 Lý Thường Kiệt,TP Mỹ Tho',N'007')
	Insert Into GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI,GVQLCM)
	values ('009',N'Trần Hoàng nam',2000.0,N'Nam','1975-11-22',N'234 Trấn Não,An Phú, TP HCM',N'001')
	Insert Into GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI,GVQLCM)
	values ('010',N'Phạm Nam Thanh',1500.0,N'Nam','1980-12-12',N'221 Hùng Vương,Q.5, TP HCM',N'007')
	go
	
--Nhập data cho bảng DETAI
	Insert Into DETAI(MADT,TENDT,CAPQL,KINHPHI,NGAYBD,NGAYKT,MACD,GVCNDT)
	values ('001',N'HTTT quản lý các trường ĐH',N'ĐHQG',20.0,'2007-10-20','2008-10-20',N'QLGD','002')
	Insert Into DETAI(MADT,TENDT,CAPQL,KINHPHI,NGAYBD,NGAYKT,MACD,GVCNDT)
	values ('002',N'HTTT quản lý giáo vụ cho một Khoa',N'Trường',20.0,'2000-10-12','2001-10-12',N'QLGD','002')
	Insert Into DETAI(MADT,TENDT,CAPQL,KINHPHI,NGAYBD,NGAYKT,MACD,GVCNDT)
	values ('003',N'Nghiên cứu chế tạo sợi Nanô Platin',N'ĐHQG',300.0,'2008-05-15','2010-05-15',N'NCPT','005')
	Insert Into DETAI(MADT,TENDT,CAPQL,KINHPHI,NGAYBD,NGAYKT,MACD,GVCNDT)
	values ('004',N'Tạo vật liệu sinh học bằng màng ối người',N'Nhà nước',100.0,'2007-01-01','2009-12-31',N'NCPT','004')
	Insert Into DETAI(MADT,TENDT,CAPQL,KINHPHI,NGAYBD,NGAYKT,MACD,GVCNDT)
	values ('005',N'Ứng dụng hóa học xanh',N'Trường',200.0,'2003-10-10','2004-12-10',N'UDCN','007')
	Insert Into DETAI(MADT,TENDT,CAPQL,KINHPHI,NGAYBD,NGAYKT,MACD,GVCNDT)
	values ('006',N'Nghiên cứu tế bào gốc',N'Nhà nước',4000.0,'2006-10-12','2009-10-12',N'NCPT','004')
	Insert Into DETAI(MADT,TENDT,CAPQL,KINHPHI,NGAYBD,NGAYKT,MACD,GVCNDT)
	values ('007',N'HTTT quản lý thư viện ở các trường ĐH',N'Trường',20.0,'2009-05-10','2010-05-10',N'QLGD','001')
	go
	
--Nhập data cho bảng CONGVIEC
	Insert Into CONGVIEC(MADT,SOTT,TENCV,NGAYBD,NGAYKT)
	values ('001',1,N'Khởi tạo và Lập kế hoạch','2007-10-20','2008-12-20')
	Insert Into CONGVIEC(MADT,SOTT,TENCV,NGAYBD,NGAYKT)
	values ('001',2,N'Xác định yêu cầu','2008-12-21','2008-03-21')
	Insert Into CONGVIEC(MADT,SOTT,TENCV,NGAYBD,NGAYKT)
	values ('001',3,N'Phân tích hệ thống','2008-03-22','2008-05-22')
	Insert Into CONGVIEC(MADT,SOTT,TENCV,NGAYBD,NGAYKT)
	values ('001',4,N'Thiết kế hệ thống','2008-05-23','2008-06-23')
	Insert Into CONGVIEC(MADT,SOTT,TENCV,NGAYBD,NGAYKT)
	values ('001',5,N'Cài đặt thử nghiệm','2008-06-24','2008-10-20')
	Insert Into CONGVIEC(MADT,SOTT,TENCV,NGAYBD,NGAYKT)
	values ('002',1,N'Khởi tạo và lập kế hoạch','2009-05-10','2009-07-10')
	Insert Into CONGVIEC(MADT,SOTT,TENCV,NGAYBD,NGAYKT)
	values ('002',2,N'Xác định yêu cầu','2009-07-11','2009-10-11')
	Insert Into CONGVIEC(MADT,SOTT,TENCV,NGAYBD,NGAYKT)
	values ('002',3,N'Phân tích hệ thống','2009-10-12','2009-12-20')
	Insert Into CONGVIEC(MADT,SOTT,TENCV,NGAYBD,NGAYKT)
	values ('002',4,N'Thiết kế hệ thống','2009-12-21','2010-03-22')
	Insert Into CONGVIEC(MADT,SOTT,TENCV,NGAYBD,NGAYKT)
	values ('002',5,N'Cài đặt thử nghiệm','2010-03-23','2010-05-10')
	Insert Into CONGVIEC(MADT,SOTT,TENCV,NGAYBD,NGAYKT)
	values ('006',1,N'Lấy mẫu','2006-10-20','2007-02-20')
	Insert Into CONGVIEC(MADT,SOTT,TENCV,NGAYBD,NGAYKT)
	values ('006',2,N'Nuôi cấy','2007-02-21','2008-09-21')
	go
	
--Nhập data cho bảng THAMGIADT
	Insert Into THAMGIADT(MAGV,MADT,STT,PHUCAP)
	values ('001','002',1,0.0)
	Insert Into THAMGIADT(MAGV,MADT,STT,PHUCAP)
	values ('001','002',2,2.0)
	Insert Into THAMGIADT(MAGV,MADT,STT,PHUCAP,KETQUA)
	values ('002','001',4,2.0,N'Đạt')
	Insert Into THAMGIADT(MAGV,MADT,STT,PHUCAP,KETQUA)
	values ('003','001',1,1.0,N'Đạt')
	Insert Into THAMGIADT(MAGV,MADT,STT,PHUCAP,KETQUA)
	values ('003','001',2,0.0,N'Đạt')
	Insert Into THAMGIADT(MAGV,MADT,STT,PHUCAP,KETQUA)
	values ('003','001',4,1.0,N'Đạt')
	Insert Into THAMGIADT(MAGV,MADT,STT,PHUCAP)
	values ('003','002',2,0.0)
	Insert Into THAMGIADT(MAGV,MADT,STT,PHUCAP,KETQUA)
	values ('004','006',1,0.0,N'Đạt')
	Insert Into THAMGIADT(MAGV,MADT,STT,PHUCAP,KETQUA)
	values ('004','006',2,1.0,N'Đạt')
	Insert Into THAMGIADT(MAGV,MADT,STT,PHUCAP,KETQUA)
	values ('006','006',2,1.5,N'Đạt')
	Insert Into THAMGIADT(MAGV,MADT,STT,PHUCAP)
	values ('009','002',3,0.5)
	Insert Into THAMGIADT(MAGV,MADT,STT,PHUCAP)
	values ('009','002',4,1.5)
	go
	
--Nhập data cho bảng KHOA
	Insert Into KHOA(MAKHOA,TENKHOA,NAMTL,PHONG,DIENTHOAI,TRUONGKHOA,NGAYNHANCHUC)
	values (N'CNTT',N'Công nghệ thông tin',1995,'B11','0838123456','002','2005-02-20')
	Insert Into KHOA(MAKHOA,TENKHOA,NAMTL,PHONG,DIENTHOAI,TRUONGKHOA,NGAYNHANCHUC)
	values (N'HH',N'Hóa học',1980,'B41','0838456456','007','2001-10-15')
	Insert Into KHOA(MAKHOA,TENKHOA,NAMTL,PHONG,DIENTHOAI,TRUONGKHOA,NGAYNHANCHUC)
	values (N'SH',N'Sinh học',1980,'B31','0838454545','004','2000-10-11')
	Insert Into KHOA(MAKHOA,TENKHOA,NAMTL,PHONG,DIENTHOAI,TRUONGKHOA,NGAYNHANCHUC)
	values (N'VL',N'Vật lý',1976,'B21','0838223223','005','2003-09-18')
	go
	
--Nhập data cho bảng NGUOITHAN
	Insert Into NGUOITHAN(MAGV,TEN,NGSINH,PHAI)
	values ('001',N'Hùng','1990-01-14',N'Nam')
	Insert Into NGUOITHAN(MAGV,TEN,NGSINH,PHAI)
	values ('001',N'Thủy','1994-12-08',N'Nữ')
	Insert Into NGUOITHAN(MAGV,TEN,NGSINH,PHAI)
	values ('003',N'Hà','1998-09-03',N'Nữ')
	Insert Into NGUOITHAN(MAGV,TEN,NGSINH,PHAI)
	values ('003',N'Thu','1998-09-03',N'Nữ')
	Insert Into NGUOITHAN(MAGV,TEN,NGSINH,PHAI)
	values ('007',N'Mai','2003-03-26',N'Nữ')
	Insert Into NGUOITHAN(MAGV,TEN,NGSINH,PHAI)
	values ('007',N'Vy','2000-02-14',N'Nữ')
	Insert Into NGUOITHAN(MAGV,TEN,NGSINH,PHAI)
	values ('008',N'Nam','1991-05-06',N'Nam')
	Insert Into NGUOITHAN(MAGV,TEN,NGSINH,PHAI)
	values ('009',N'An','1996-08-19',N'Nam')
	Insert Into NGUOITHAN(MAGV,TEN,NGSINH,PHAI)
	values ('010',N'Nguyệt','2006-01-14',N'Nữ')
	go
	
--Nhập data cho bảng GV_DT
	Insert Into GV_DT(MAGV,DIENTHOAI)
	values ('001','0838912112')
	Insert Into GV_DT(MAGV,DIENTHOAI)
	values ('001','0903123123')
	Insert Into GV_DT(MAGV,DIENTHOAI)
	values ('002','0913454545')
	Insert Into GV_DT(MAGV,DIENTHOAI)
	values ('003','0838121212')
	Insert Into GV_DT(MAGV,DIENTHOAI)
	values ('003','0903656565')
	Insert Into GV_DT(MAGV,DIENTHOAI)
	values ('003','0937125125')
	Insert Into GV_DT(MAGV,DIENTHOAI)
	values ('006','0937888888')
	Insert Into GV_DT(MAGV,DIENTHOAI)
	values ('008','0653717171')
	Insert Into GV_DT(MAGV,DIENTHOAI)
	values ('008','0913232323')
	go
	
--Nhập data cho bảng BOMON
	Insert Into BOMON(MABM,TENBM,PHONG,DIENTHOAI,MAKHOA)
	values (N'CNTT',N'Công nghệ tri thức','B15','0838126126',N'CNTT')
	Insert Into BOMON(MABM,TENBM,PHONG,DIENTHOAI,MAKHOA)
	values (N'HHC',N'Hóa hữu cơ','B44','0838222222',N'HH')
	Insert Into BOMON(MABM,TENBM,PHONG,DIENTHOAI,MAKHOA)
	values (N'HL',N'Hóa Lý','B42','0838878787',N'HH')
	Insert Into BOMON(MABM,TENBM,PHONG,DIENTHOAI,TRUONGBM,MAKHOA,NGAYNHANCHUC)
	values (N'HPT',N'Hóa phân tích','B43','0838777777','007',N'HH','2007-10-15')
	Insert Into BOMON(MABM,TENBM,PHONG,DIENTHOAI,TRUONGBM,MAKHOA,NGAYNHANCHUC)
	values (N'HTTT',N'Hệ thống thông tin','B13','0838125125','002',N'CNTT','2004-09-20')
	Insert Into BOMON(MABM,TENBM,PHONG,DIENTHOAI,TRUONGBM,MAKHOA,NGAYNHANCHUC)
	values (N'MMT',N'Mạng máy tính','B16','0838676767','001',N'CNTT','2005-05-15')
	Insert Into BOMON(MABM,TENBM,PHONG,DIENTHOAI,MAKHOA)
	values (N'SH',N'Sinh hóa','B33','0838898989',N'SH')
	Insert Into BOMON(MABM,TENBM,PHONG,DIENTHOAI,MAKHOA)
	values (N'VLĐT',N'Vật lý điện tử','B23','0838234234',N'VL')
	Insert Into BOMON(MABM,TENBM,PHONG,DIENTHOAI,TRUONGBM,MAKHOA,NGAYNHANCHUC)
	values (N'VLUD',N'Vật lý ứng dụng','B24','0838454545','005',N'VL','2006-02-18')
	Insert Into BOMON(MABM,TENBM,PHONG,DIENTHOAI,TRUONGBM,MAKHOA,NGAYNHANCHUC)
	values (N'VS',N'Vi Sinh','B32','0838909090','004',N'SH','2007-01-01')
	go
	
--Cập nhật thêm dữ liệu cho bảng GIAOVIEN
	update GIAOVIEN
	set MABM = 'MMT'
	where (MAGV = '001')
	update GIAOVIEN
	set MABM = 'HTTT'
	where (MAGV = '002')
	update GIAOVIEN
	set MABM = 'HTTT'
	where (MAGV = '003')
	update GIAOVIEN
	set MABM = 'VS'
	where (MAGV = '004')
	update GIAOVIEN
	set MABM = N'VLĐT'
	where (MAGV = '005')
	update GIAOVIEN
	set MABM = 'VS'
	where (MAGV = '006')
	update GIAOVIEN
	set MABM = 'HPT'
	where (MAGV = '007')
	update GIAOVIEN
	set MABM = 'HPT'
	where (MAGV = '008')
	update GIAOVIEN
	set MABM = 'MMT'
	where (MAGV = '009')
	update GIAOVIEN
	set MABM = 'HPT'
	where (MAGV = '010')
	GO	

-----AS là đặt tên để dễ nhận biết hoặc với nhiều mục đích khác
use HowKteam --- chạy đúng data đg dùng
go

------ Truy vấn dữ liệu ở 1 bảng ( lấy hết dữ liệu trong bảng bộ môn)
select * from dbo.BOMON 

------ Truy vấn 1 hay nhiều loại dữ liệu mà mình muốn  (lấy mã bộ môn và tên bộ môn trong bảng bộ môn)
select MABM, TENBM from dbo.BOMON 

------ Đổi tên cột hiển thị mà mình muốn lấy
select MABM AS 'này', TENBM AS '2' from dbo.BOMON 
  
------ Truy vấn dữ liệu của 2 bảng cùng lúc ( lấy mã giáo viên tên bộ môn , mã bộ môn ng đó dạy )
SELECT * FROM dbo.GIAOVIEN, dbo.BOMON --- gợp lại tất cả dữ liệu của cả 2
SELECT GV.MAGV, BM.TENBM, GV.HOTEN FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM --- AS là đặt tên cho nó vào lấy cái tên đặt để cho vào câu lệnh khiến nó heieur là lấy của cái nào để k bị nhầm lẫn khi bị trùng tên của 2 dữ liệu với nhau.












--- 66666666666666.2222222222222222. Truy vấn dữ liệu có điều kiện 
select GV.MAGV, HOTEN, NT.TEN from dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT --- điềuu kiện để k bị lặp lại nhiều mã GV
where gv.MAGV=nt.MAGV

select * from dbo.GIAOVIEN --- điều kiện tìm ng có tiền lớp hơn 2000
where LUONG > 2000
select * from dbo.GIAOVIEN --- điều kiện tìm ng có tiền lớp hơn 2000 và là nữ
where LUONG > 2000 and PHAI = N'Nữ'

select * from dbo.GIAOVIEN --- những người nhỏ hơn 40 tuổi
where YEAR(GETDATE()) - YEAR(NGSINH) > 40 ---getdate là năm hiện tại

select HOTEN, NGSINH, YEAR(GETDATE()) - YEAR(NGSINH)  from dbo.GIAOVIEN --- lấy ra họ tên giáo viên, năm sinh của giáo viên nhỏ hơn hoặc bằng 40 tuổi
where YEAR(GETDATE()) - YEAR(NGSINH) >= 40

  -- lấy ra mã giáo viên tên giáo viên và khoa người đó đang làm việc
select GV.MAGV, GV.HOTEN, K.TENKHOA from dbo.GIAOVIEN AS GV, dbo.BOMON AS BM, dbo.KHOA AS K
where GV.MABM= BM.MABM and bm.MAKHOA= k.MAKHOA

-- lấy giáo viên là trưởng bộ môn
select gv.* from dbo.GIAOVIEN AS GV, dbo.BOMON AS BM --- gv. là lấy chỉ dữ liệu của giáo viên
where gv.MAGV= bm.TRUONGBM
 
 ------------đếm số lượng giáo viên
 -- cout (*) -- đếm tất cả  record
 --cout (tên trường nào đó)  --> đếm số lượng của tên trường đó
 select COUNT(*) AS N'Số lượng giáo viên' from dbo.GIAOVIEN -- AS đặt tên


 --- đếm số lượng người thân của giáo viên có mã là 007
 select COUNT(*) AS N'Số lượng người thân' from dbo.GIAOVIEN, dbo.NGUOITHAN
 where GIAOVIEN.MAGV = '007' and GIAOVIEN.MAGV = NGUOITHAN.MAGV
 --- xem những người thân của giáo viên có mã là 007
 select * from dbo.GIAOVIEN, dbo.NGUOITHAN
 where GIAOVIEN.MAGV = '007' and GIAOVIEN.MAGV = NGUOITHAN.MAGV










 --777777777777777. tìm kiếm gần đúng
 -----data vẫn dùng của ý 6 lớn

  ----- xuất ra thông tin giáo viên có họ và tên bắt đầu bằng chứ l
 select * from dbo.GIAOVIEN AS GV 
 where HOTEN like 'l%'

 ----- xuất ra thông tin giáo viên có họ và tên kết thúc bằng chữ n
 select * from dbo.GIAOVIEN AS GV 
 where HOTEN like '%n' 

 ----- xuất ra thông tin giáo viên có tồn tại chữ n trong họ và tên
 select * from dbo.GIAOVIEN AS GV 
 where HOTEN like '%n%' 













 --88888888888888888888888888888.11111111111111111111111111111111. inner join
 use HowKteam
 go


 -- inner join kiểu cũ, sau này k được hỗ trợ nữa
 select * from dbo.GIAOVIEN, dbo.BOMON
 where  BOMON.MABM = GIAOVIEN.MABM
 -- inner join kiểu đúng, bắt buộc phải có điều kiện on
 select * from dbo.GIAOVIEN inner join dbo.BOMON
 on GIAOVIEN.MABM = BOMON.MABM

 --có thể viết tắt inner join thành join
 select * from dbo.KHOA join dbo.BOMON
 on BOMON.MAKHOA = KHOA.MAKHOA

 --8888888888888888888888888888.2222222222222222222222222. Full outer join
 --- kiểu là lấy hết tất cả các dữ liệu của 2 bảng nhưng cái nào k cõ dữ liệu thì là giá trị NULL
 select * from dbo.GIAOVIEN full outer join dbo.BOMON
 on GIAOVIEN.MABM = BOMON.MABM


 --88888888888888888888888888888888.333333333333333333333333333333333. cross join là tổ hợp mỗi record của bảng A với all record của bảng B
 select * from dbo.GIAOVIEN cross join dbo.BOMON


 --8888888888888888888888888888.44444444444444444444444. Left join
 ---là bảng bên phải nhập vào bảng bên trái
 Select * from dbo.GIAOVIEN left join dbo.BOMON
 on BOMON.MABM = GIAOVIEN.MABM
 --88888888888888888888888888888.44444444444444444444444444. right join 
 --- bảng bên trái nhập vào bảng bên phải
  Select * from dbo.GIAOVIEN right join dbo.BOMON
 on BOMON.MABM = GIAOVIEN.MABM











 --9999999999999999999999999. union
 use HowKteam
 go

 select MAGV from dbo.GIAOVIEN
 where LUONG >= 2500
 union
 select MAGV from dbo.NGUOITHAN
 where PHAI = N'Nữ'

 select GV.MAGV from dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
 where GV.LUONG >= 2500
 and NT.PHAI = N'Nữ'










 -- 10.1000000000000000000000000000000.1111111111111111111111 select into
 use HowKteam
 go

 ----- lất hết dữ liệu của bảng GV đưa vào bảng tableA
 ----- bảng này có các record tương ứng như bảng giáo viên
 select * into tableA
 from dbo.GIAOVIEN


 --- tạo ra 1 bảng tableB mới có 1 cột dữ liệu và họ tên tướng ứng như bảng Giáo viên
 --- dữ liệu của bảng B này lấy từ giáo viên
 select HoTen into tableB
 from dbo.GIAOVIEN

 select * from tableB


 --- tạo ra 1 bảng tableB mới có 1 cột dữ liệu và họ tên tướng ứng như bảng Giáo viên
 --- với điều kiên lương lớn hơn 2000
 --- dữ liệu của bảng C này lấy từ giáo viên
 select HoTen into tableC
 from dbo.GIAOVIEN
 where LUONG > 2000

 --- tạo 1 bảng mới từ nhiều bảng
  select MAGV, HOTEN, TENBM into GVBackup
  from dbo.GIAOVIEN, dbo.BOMON
  where BOMON.MABM = GIAOVIEN.MABM

  select * from GVBackup



  --- tạo ra 1 bảng GVBK y chang nhưng k có dữ liệu
  select * into GVBK
  from dbo.GIAOVIEN
  where 6 > 9


  --- 10.1000000000000000000000000000000.222222222222222222222222222. insert into select


  --- insert into select  là copy dữ liệu vào bảng đã tồn tại
  select * into CloneGV
  from dbo.GIAOVIEN
  where 1=0

insert into CloneGV
select * from GIAOVIEN

select * from CloneGV











---11.1111111111111111111111111111111111111. truy vấn lồng
use HowKteam
go

-- kiểm tra xem giáo viên 001 có phải giáo viên quản lý chuyên môn hay không
-- lấy ra danh sách các mã giáo viên QLCM
-- kiểm tra mã giáo viên tồn tại trong danh sách đó
select * from dbo.GIAOVIEN
where MAGV = '001'
and MAGV in
(
 select GVQLCM from dbo.GIAOVIEN
) /* đây là truy vấn lồng */


-- truy vấn lồng trong from
select * from dbo.GIAOVIEN,
(select * from dbo.DETAI) as DT


-- VD1. xuất ra dnah sach giáo viên tham gia nhiều hơn 1 đề tài
-- lấy ra tất cả thông tin giáo viên khi mà
-- số lượng đề tài giáo viên đó tham gia > 1
select * from dbo.GIAOVIEN AS GV
where 1 <
(
      select count(*) from dbo.THAMGIADT
      where MAGV = GV.MAGV
)

--- VD2. xuất ra thông tin của khoa mà có nhiều hơn 2 giáo viên
-- lấy được danh sách bộ môn nằm trong khoa hiện tại
select * from dbo.KHOA AS K
where 2 <
( 
	select COUNT(*) from dbo.BOMON AS BM, dbo.GIAOVIEN AS GV
	where BM.MAKHOA = K.MAKHOA
	and BM.MABM = GV.MABM
)
-- đây là check xem đúng số lượng lớn hơn 2 GV trng khoa k
select * from KHOA AS K, BOMON AS BM, GIAOVIEN AS GV
where BM.MAKHOA = K.MAKHOA
ANd BM.MABM = GV.MABM


select top 5* from dbo.GIAOVIEN


--12.12121212121212121212121212121212121212. Group by
use HowKteam
go
--------------Lưu ý là cái  nào ở trong group by thì trên select thì phải có nó, hiểu hơn thì xem VD bên dưới, nói chung là k đc select * from
-- xuất ra danh sách tên bộ môn và số lượng giáo viên của bộ môn đó
select TENBM, PHONG, COUNT(*) from dbo.BOMON, dbo.GIAOVIEN
where BOMON.MABM = GIAOVIEN.MABM
group by TENBM, PHONG


-- lấy ra danh sách giáo viên có lương > lương trung bình của giáo viên
select MAGV, HOTEN, LUONG from dbo.GIAOVIEN
where LUONG > (select sum(Luong) from dbo.GIAOVIEN)/(select COUNT(*) from dbo.GIAOVIEN)
group by MAGV, HOTEN, LUONG
-- xuất ra tên giáo viên và số lượng công việc giáo viên đó đã làm

select GV.HOTEN, COUNT(*) from GIAOVIEN AS GV, THAMGIADT AS TGDT
where GV.MAGV = TGDT.MAGV
group by  GV.HOTEN, GV.MAGV


--12.12121212121212121212121212121212121212121212. Group by-Having
USE HowKteam
go
-- xuất ra số lượng giáo viên trong từng bộ môn mà số giáo viên > 2
--having như where của select nhưng dành cho group by
select dbo.BOMON.MABM, COUNT(*) from dbo.GIAOVIEN, dbo.BOMON
where dbo.BOMON.MABM = GIAOVIEN.MABM
group by dbo.BOMON.MABM
having COUNT(*) > 1


-- xuất ra mức lương và tổng tuổi của giáo viên nhận mức lương đó
-- và có người thân và tuổi phải lớn hơn tuổi trung  bình
select LUONG, SUM(YEAR(GETDATE())-YEAR(GiaoVien.NGSINH)) from dbo.GIAOVIEN, dbo.NGUOITHAN
where GIAOVIEN.MAGV = NGUOITHAN.MAGV
and GIAOVIEN.MAGV in (select MAGV from dbo.NGUOITHAN)
group by LUONG
having SUM(YEAR(GETDATE())-YEAR(GiaoVien.NGSINH)) > 
(
	(select SUM(YEAR(GETDATE())-YEAR(GiaoVien.NGSINH)) from dbo.GIAOVIEN)
	/ (select COUNT(*) from dbo.GIAOVIEN) 
)



--13.13131313131313131313131313131313131313. Auto increament
use HowKteam
go

create table TestAuto
(
	ID int primary key,
	Name NVARCHAR(100)
)
go

insert dbo.TestAuto (ID, Name)
values (0, --ID int
		N'0' --Name - navarchar(100)
		)
insert dbo.TestAuto (ID, Name)
values (1, --ID int
		N'0' --Name - navarchar(100)
		)
insert dbo.TestAuto (ID, Name)
values (2, --ID int
		N'0' --Name - navarchar(100)
		)
insert dbo.TestAuto (ID, Name)
values (3, --ID int
		N'0' --Name - navarchar(100)
		)
insert dbo.TestAuto (ID, Name)
values (4, --ID int
		N'0' --Name - navarchar(100)
		)
select * from dbo.TestAuto

drop table dbo.TestAuto --- bth thì gán giá trị kia ít thì viết chay đc nhưng nếu quá dài thì ta phải dùng như sau mặc định bắt đầu là 1 và tăng 1 đơn vị


create table TestAuto
(
	ID int primary key IDENTITY, --- IDENTITY : kiểu này là tự tăng trường này phải là số
	Name NVARCHAR(100)
)
go 
-------- khi có cái indentity thì k cần gán ID vì ID là kiểu số lên nó sẽ tự tăng lên và bắt đầu bằng 1
insert dbo.TestAuto ( Name)
values (
		N'0'
		)
insert dbo.TestAuto ( Name)
values (
		N'0'
		)
insert dbo.TestAuto ( Name)
values (
		N'0'
		)

insert dbo.TestAuto ( Name)
values (
		N'0'
		)

insert dbo.TestAuto ( Name)
values (
		N'0'
		)

select * from dbo.TestAuto
go



create table TestAuto2
(
	ID int primary key identity(5, 10), -- bắt đầu từ 5 và tăng 10 đơn vị 
	Name NVARCHAR(100)
)
go 
drop table dbo.TestAuto2
go

select * from dbo.TestAuto2
 
insert dbo.TestAuto ( Name)
values (
		N'0'
		)
insert dbo.TestAuto ( Name)
values (
		N'0'
		)
insert dbo.TestAuto ( Name)
values (
		N'0'
		)

insert dbo.TestAuto ( Name)
values (
		N'0'
		)

insert dbo.TestAuto ( Name)
values (
		N'0'
		)





-- 14.14141414141414141414141414141414141414141414141414141414 . View
-- view là 1 bảng ảo và nó cập nhật dữ liệu theo bảng mà ta truy vấn
-- tùy chỉnh linh hoạt
use HowKteam
go

select * from dbo.GIAOVIEN
-- tạo ra 1 bảng lưu thông tin giáo viên, tên bộ môn và lương của giáo viên đó

select HOTEN, TENBM, LUONG INTO LuongGiaoVien from dbo.GIAOVIEN, dbo.BOMON
where BOMON.MABM = GIAOVIEN.MABM
select * from LuongGiaoVien

update dbo.GIAOVIEN SET LUONG = 90000
where MAGV = '006'

select * from GIAOVIEN
-- VD trên cho thấy là khi ta update ở dữ liệu bảng GIAOVIEN đc nhưng mà ở bảng của LUong giaovien k được 
--lên ta phải dùng view để có thể có dữ liệu đồng thời ở 2 bảng luôn
-- View là bảng ảo, cập nhât dữ liệu theo bảng mà view truy vấn tới mỗi khi lấy view ra dùng

-- tạo ra view TestView từ câu truy vấn
create view TestView AS
select * from dbo.GIAOVIEN

select * from TestView

update dbo.GIAOVIEN SET LUONG = 90000
where MAGV = '006' -- và nhờ dùng view lên giờ ta đã update đc dữ liệu từ bảng GV lên bảng test view

-- muốn xóa view thì nhưu xóa table
drop view TestView
go

-- ngĩa câu này là tạo ra hoặc thay thế view này
create OR replace view TestView AS
select HOTEN from dbo.GIAOVIEN --- hình như là sai


--update view
alter view TestView as
select HOTEN from dbo.GIAOVIEN

select * from TestView


alter view TestView as
select * from dbo.GIAOVIEN

--tạo view có dấu
create view [Giaó dục miễn phí] AS
select * from dbo.KHOA

select * from [Giaó dục miễn phí]




--15.151515151515151515151515151515151515. Check

use HowKteam
go
-- các kiểu tạo check
-- kiểu 1
create table TestCheck
(
	id int primary key identity,
	Luong int check(Luong > 3000 and Luong < 9000)
)
go
-- kiểu 2
create table TestCheck2
(
	id int primary key identity,
	Luong int,
	check(Luong > 3000 and Luong < 9000)
)
go
-- kiểu 3
create table TestCheck3
(
	id int primary key identity,
	Luong int,
	constraint CK_Luong check(Luong > 3000 and Luong < 9000)
)
go
-- kiểu 4
create table TestCheck4
(
	id int primary key identity,
	Luong int
)
go
alter table dbo.TestCheck4 ADD CONSTRAINT CK_Luong
check (Luong > 3000 and Luong < 9000)





insert dbo.TestCheck (Luong)
values (3001)










--16.16161616161616161616161616161616161616. Indexes
USE HowKteam
go
-- ta tìm index ở table mà ta đã tạo index và đó chính là indexes
-- Ta dùng index là để tốc độ khi mà mình tìm dữ liệu nó sẽ nhanh hơn nhưng mà tốc độ thêm, xóa và sửa dữ liệu sẽ bị chậm đi
-- Tạo index trên bảng GV
-- đây là cho phép các trường trùng nhau
Create index Indexname ON dbo.NGUOITHAN(MaGV)


-- đây là k cho phép các trường trùng nhau
Create unique index IndexnameUnique ON dbo.NGUOITHAN(MaGV) -- k chạy đc vì bảng ng thân có mã GV bị trùng nhau ý câu lệnh này là vậy, nó là k đc lấy trùng

Create unique index IndexnameUnique ON dbo.GIAOVIEN(MaGV) --- đây là giáo viên, vì giáo viên toàn là khác nhau lên sẽ k bị trùng nhau

 
select * from dbo.NGUOITHAN
where MAGV = '001' AND TEN = 'Tes999999'

select * from dbo.NGUOITHAN where MAGV = '001' AND TEN = 'Test99999'









--17.1717171717171717171717171717171717171717. kiểu sữ liệu tự định nghĩa
use HowKteam
go
-- là tạo tên cho kiểu dữ liệu
-- ta tìm nó ở programmability + type + User-defined data types
-- VD ở dưới là NNAME là NVARCHAR(100)
--csach tạo kiểu sữ liệu tự định nghĩa
--EXEC sp_addtype ' Tên kiểu dữ liệu', 'Kiểu dữ liệu thực tế', 'Not null' (có hay không đều được)
EXEC sp_addtype 'NNAME', 'nvarchar(100)', 'NOT NULL'

create table testTYPE1
(
	Name NNAME,
	adress NVARCHAR(500)
)
go

EXEC sp_addtype 'NADRESS', 'nvarchar(500)'

-- xóa tên dữ liệu mà mình tạo
--nếu muốn xóa nó thì cứ delete như bth ( xóa bằng tay)
-- đây là xóa bằng code:
EXEC sp_droptype 'NNAME' -- k xóa được là vì mình đg sử dụng nó rồi, muốn xóa thì phải xóa bảng sử dụng NNAME

EXEC sp_droptype 'NADRESS' -- có xóa đc vì nó chưa đc sử dụng








--18.18181818181818181818181818181818181818. Declare và sử dụng biến
use HowKteam
go
-- lên nhớ sau declare thì nhớ dùng @
-- tìm ra mã giáo viên có lương cao nhất
select MAGV from GIAOVIEN where LUONG = (select Max(LUONG) from GIAOVIEN)
-- lấy ra tuổi của Giáo viên với Mã GV là 001
select YEAR(GETDATE()) - YEAR(NGSINH) from dbo.GIAOVIEN
where MAGV = (select MAGV from GIAOVIEN where LUONG = (select Max(LUONG) from GIAOVIEN))-- ta thấy câu lệnh điều kiện quá là dài lên ta cần tìm ra 1 cái để k để câu lệnh phải viết dài nữa


-- tạo ra 1 biến kiểu char lưu mã giáo viên lương cao nhất
DECLARE @MinsalaryMAGV char(10)
select @MinsalaryMAGV = MAGV from GIAOVIEN where LUONG = (select Max(LUONG) from GIAOVIEN) -- giờ ta đã cho cái tìm đc giáo viên lương cao nhất là @salary

-- VD
select YEAR(GETDATE()) - YEAR(NGSINH) from dbo.GIAOVIEN
where MAGV = @MinsalaryMAGV  -- lưu ý chạy là phải chạy tất cả chạy mỗi câu lệnh của VD là sai


-- Khởi tạo với kiểu dữ liệu
-- biến bắt đầu bằng kí hiệu 0
DECLARE @i INT
-- Khởi tại với giá trị mặc đinh
DECLARE @j int = 0

-- SET dữ liệu theo biến
set @i = @i + 1
set @i +=1
Set @j *= @i


-- set thông qua câu select
declare @MaxLuong int

select @MaxLuong = Max(Luong) from dbo.GIAOVIEN

-- 1.xuất ra số lượng người thân của giáo viên 001
-- đầu tiên là lưu mã giáo viên 001 lại
-- tìm ra số lượng người thân tương ứng mã giáo viên

DECLARE @MaGV char(10) = '001'
select count(*) from NGUOITHAN where MAGV = @MaGV

-- 2, xuất ra tên của giáo viên có lương thấp nhất
declare @MinLuong INT
declare @TenGV nvarchar(100)

select @MinLuong = MIN(Luong) from dbo.GIAOVIEN
select @TenGV = HoTen from dbo.GIAOVIEN where LUONG = @MinLuong


------------------------------------------------------------------------------------------------------------
print @TenGV --- câu lệnh xuất gì đó trên màn hình








--19.19191919191919191919191919191919. If - else trong SQL
use HowKteam
go
----VD1: kiểm tra xem lương của giáo viên nhập vào có lớn hơn lương trung bình hay không
declare @LuongTrungBinh INT
declare @SoLuongGiaoVien INT

select @SoLuongGiaoVien = count(*) from GIAOVIEN
select @LuongTrungBinh = SUM(Luong)/@SoLuongGiaoVien from GIAOVIEN
print @luongTrungBinh -- nhớ là chạy từ dòng declare nhaa

declare @MaGV char(10) = '001'
declare @LuongMaGV INT = 0
select @LuongMaGV = Luong from GIAOVIEN where MAGV = @MaGV
--Nếu lương của @MaGV > @LuongTrungBinh
-- xuất ra lớn hơn
-- ngược lại
--nhỏ hơn
print @LuongMaGV
print @LuongTrungBinh
if @LuongTrungBinh > @LuongMaGV
	print N'lớn Hơn'
else
	print N'Nhỏ hơn'
	--- nếu nhu trong if muốn chạy 1 lần nhiều dòng lệnh thì dùng begin
	-- phải có dùng declare ở trên thì mới chạy đc dòng này nhé
if @LuongTrungBinh > @LuongMaGV
	begin 
		print @LuongMaGV
		print @LuongTrungBinh
		print N'lớn Hơn'
	end
else
		print @LuongMaGV
		print @LuongTrungBinh
		print N'Nhỏ hơn'



--VD2: UPDATE luong của toàn bộ giáo viên nếu lương nhập vào cao hơn lương trung bình
-- ngược lại chỉ update luong giáo viên nữ
declare @LuongTrungBinh INT
declare @SoLuongGiaoVien INT

select @SoLuongGiaoVien = count(*) from GIAOVIEN
select @LuongTrungBinh = SUM(Luong)/@SoLuongGiaoVien from GIAOVIEN

declare @Luong INT = 2000
if (@Luong > @LuongTrungBinh)
BEGIN
   UPDATE GIAOVIEN SET LUONG = @Luong
END
ELSE
BEGIN
	UPDATE GIAOVIEN SET LUONG = @Luong
	where PHAI = N'Nữ'
END

select * from GIAOVIEN












--20.2020202020202020202020202020 . Vòng lặp
use HowKteam
go

-- đây là dùng while (nó là điều kiện để vòng lặp hoạt động)
-- Thử
declare @i int  = 0
declare @n int = 10000

while (@i < @n)
Begin 
	print @i
	SET @i +=1
End





-- Insert 10000 record vào bảng  TestCheck mà không trùng ID và tên bộ môn tăng dần

declare @i int  = 0
declare @n int = 10000

while (@i < @n)
Begin 
	Insert dbo.TestCheck
			(Luong)
	Values  (@i --Luong -- int
			)
	SET @i+=1
End
select  * from TestCheck














--21.21212121212121212121212121212121212121. Cursor
use HowKteam
go

-------------------------------------------------------------------------------------------------------------------------------
--Khi có nhu cầu duyệt từng record của bảng. với mỗi record có kết quả xử lý riêng thì dùng cursor

-- cấu trúc:
-- DEClare <tên con trỏ> cursor for < câu select>
--Open <Tên con trỏ>
--FETCH next from <tên con trỏ> Into <danh sách các biến tương ứng kết quả truy vấn>
--while @@FETCH_STATUS = 0
--begin
--Câu lệnh thực hiện
--Fetch next lại lần nữa
--Fetch next from <tên con trỏ> into <Danh sách các biến tương ứng kết quả truy vấn>
--END

--close <tên con trỏ> : đóng con trỏ khi k sử dụng
--deallocate <tên con trỏ> : hủy vùng nhớ của nó (K hiểu lắm )
--------------------------------------------------------------------------------------------------------------------------



-- từ tuổi của giáo viên nếu lớn hơn 40 tuổi thì cho lương là 2500, nhỏ hơn 40 và lớn hơn 30 thì cho lương là 2000, ngược lại thì lương là 1500


-- đây là lấy ra dnah sách mã giáo viên kèm tuổi đưa vào con trỏ có tên là GiaoViencursor
DECLARE GiaoViencursor CURSOR FOR SELECT MaGV, year(GETDATE()) - year(NGSINH) from dbo.GIAOVIEN

open GiaoViencursor

declare @MaGV char(10)
declare @Tuoi INT
FETCH NEXT FROM GiaoViencursor INTO @MaGV, @Tuoi
while @@FETCH_STATUS = 0
begin
	if @Tuoi > 50 
	begin 
		update GIAOVIEN SET LUONG = 2500 where MAGV = @MaGV
	END
	ELSE
	IF @Tuoi >40
	begin
		UPDATE GIAOVIEN SET LUONG = 2000 where MAGV = @MaGV
	END
	Fetch next from GiaoViencursor INTO @MaGV, @Tuoi
	
end



close GiaoViencursor
deallocate  GiaoViencursor


-- kiểm tra bảng đaX ĐC update chưa
select * from GIAOVIEN









--22.22222222222222222222222222222222222222222222222222222. Store
use HowKteam
go

-- store procedure
-- là chuoneg trình hay thủ tục
-- ta có thể dùng Transact-SQL EXCUTE (EXEC) để thực thi các stored procedure
--stored procedure khác với các hàm xử lý là giá trị trả về của chúng
-- không chứa trong tên và chúng không được sử dụng trực tiếp trong biểu thức


-- tính chất
--Động : có thể chỉnh sửa khối lệnh, tái sử dụng nhiều lần
--Nhanh hơn: Tự phân tích cú pháp với các hàm xử lý là giá trị trả về của chúng
--Bảo mật: Giới hạn quyền cho user nào sử dụng user nào không
--Giảm bandwidth : Với các gói transaction lớn. Vài ngàn dòng lệnh cùng 1 lúc thì dùng store sẽ đảm bảo



/*
CẤU TRÚC:
create proc <Tên STORE>
[Parameter nếu có]
AS
BEGIN
	<CODE xử lý>
END

Nếu chỉ là câu truy vấn thì có thể k cần begin và end
*/
-- create đây là tạo store trước
create proc USP_TEST
@MaGV NVARCHAR (10), @Luong INT
AS
BEGIN
	 SELECT * FROM DBO.GIAOVIEN where MAGV = @MaGV AND LUONG = @Luong
END
go



EXEC dbo.USP_TEST @MaGV = N'', @Luong = 0
EXEC dbo.USP_TEST N'', 0
EXECUTE dbo.USP_TEST @MaGV = N'', @Luong = 0
EXECUTE dbo.USP_TEST N'', 0
go



create proc USP_SelectAllGiaoVien
AS SELECT * FROM GIAOVIEN
go

-- sử dụng hiện bảng
EXEC USP_SelectAllGiaoVien

















---23.232323232323232323232323232323232323. Function
use HowKteam
go
-- cái function mà mình tạo thì nó lằm ở programmability rồi vào stored procedures
-- (getdate là function đó)
Create function UF_SelectAllGiaoVien()
returns table
as return select * from GIAOVIEN
go


select * from UF_SelectAllGiaoVien()



create function UF_SelectLuongGiaoVien(@MaGV char(10))
returns int
as
begin
	declare @Luong int
	select @Luong = LUONG from GIAOVIEN where MAGV = @MaGV
	return @Luong
end
--- muốn select luôn bảng như bên dưới thì ta bắt buộc phải có dbo.'......'
-- còn select * from thì k cần dbo.
select dbo.UF_SelectLuongGiaoVien('001') AS DBDBD

select dbo.UF_SelectLuongGiaoVien(MaGV) from GIAOVIEN



-- muốn xóa function thì
drop function UF_SelectAllGiaoVien


-- sửa function thì
alter function UF_SelectLuongGiaoVien(@MaGV char(10))
returns int
as
begin
	declare @Luong int
	select @Luong = LUONG from GIAOVIEN where MAGV = @MaGV
	return @Luong
end
-----------------------------------------------------------------
--VD tạo function tính 1 số truyền vào phải là số chẵn hay không
create function UF_IsOdd(@Num int)
returns nvarchar(20)
as
begin
	if (@Num % 2 = 0)
		return N'số chẵn'
	else
		return N'Số lẻ'
	return N'Không xác định'
end

select dbo.UF_IsOdd()


select dbo.UF_IsOdd(year(getdate()) - year(NgSinh)) from GIAOVIEN



create function UF_AgeOfyear(@year int)
returns int
as
begin
	return year(getdate()) - year(@year)
end

--sửa lại function
alter function UF_AgeOfyear(@year int)
returns int
as
begin
	return year(getdate()) - year(@year)
end
select dbo.UF_AgeOfyear('19940419')
select dbo.UF_AgeOfyear(NgSinh), dbo.UF_IsOdd(dbo.UF_AgeOfyear(NgSinh)) from dbo.GIAOVIEN




