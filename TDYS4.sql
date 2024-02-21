create database ToiDongYS4

use ToiDongYS4


Create table nhan_vien(
	id int primary key not null identity(1,1),
	ma_nv nvarchar(10) not null,
	ho_ten nvarchar(50) not null,
	gioi_tinh bit null,
	email nvarchar(50) not null,
	sdt char(10) not null,
)
SET IDENTITY_INSERT nhan_vien ON

CREATE TABLE tai_khoan
(
	id int not null PRIMARY KEY identity(1,1),
	ma_user varchar(50) not null,
	pass_word varchar(50) not null,
	level int not null,
	id_nv int null
)
GO


CREATE TABLE thong_tin_chu_ky
(
	id int not null PRIMARY KEY identity(1,1),
	ho_ten nvarchar(255),
	sdt char(10) not null,
	email varchar(255)not null,
	y_kien nvarchar(255)
)
GO

CREATE TABLE trung_tam
(
	id int not null PRIMARY KEY identity(1,1),
	ten_trung_tam nvarchar(255) not null,
	bac_si nvarchar(255),
	dia_chi nvarchar(255)
)
GO

CREATE TABLE thong_tin_dki_prep
(
	id int not null PRIMARY KEY identity(1,1),
	email varchar(255)not null,
	ho_ten nvarchar(255)not null,
	sdt char(10) not null,	
	thong_tin nvarchar(255),
	id_trung_tam int,
	id_nv int
)
GO


CREATE TABLE su_kien
(
	id int not null PRIMARY KEY identity(1,1),
	loai_skien nvarchar(255),
	hinh_anh nvarchar(255),
	ten_skien nvarchar(255),
	tomtat nvarchar(255),
	noi_dung nvarchar(max),
	link varchar(255),
	tgian datetime,
	chi_phi int
)
GO



ALTER TABLE tai_khoan ADD CONSTRAINT FK_nhanvien_taikhoan FOREIGN KEY (id_nv) REFERENCES nhan_vien(id)
ALTER TABLE thong_tin_dki_prep ADD CONSTRAINT FK_dkiprep_nhanvien FOREIGN KEY (id_nv) REFERENCES dbo.nhan_vien(id)
ALTER TABLE thong_tin_dki_prep ADD CONSTRAINT FK_dkiprep_trungtam FOREIGN KEY (id_trung_tam) REFERENCES trung_tam(id)
