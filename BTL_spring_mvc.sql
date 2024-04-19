create database btl_spring_mvc

go
use btl_spring_mvc
go
create table account
(
	id int primary key identity,
	username varchar(50),
	password varchar(100),
	fullname nvarchar(100),
	phone nvarchar(10),
	address nvarchar(100),
	role varchar(50),
	picture nvarchar(255),
	status bit
)
go
insert into account values('admin','e10adc3949ba59abbe56e057f20f883e',N'Admin','','','admin','images/admin.jpg',1)
insert into account values('duong','e10adc3949ba59abbe56e057f20f883e',N'duong','0985243225','Ha Noi','user','images/admin.jpg',1)
go
create table categories
(
	id int primary key IDENTITY,
	name nvarchar(100) UNIQUE,
	status tinyint,
	createdate DATE,
)
go
insert  into categories(name,status,createdate) values ('giay',1,GETDATE());
go
create table products
(
	id varchar(10) primary key,
	name nvarchar(255) ,
	slug nvarchar(255),
	price float not null,
	oldprice float not null,
	status tinyint,
	description NTEXT,
	image nvarchar(255),
	category_id int foreign key references  categories(id),
	createdate DATE,
)
insert  into products values ('g01','giay xin','giay-xin',400,500,1,'giay tot ','giay.jpg',1,GETDATE());
go
create table img_product(
	id int primary key IDENTITY,
	image Nvarchar(255),
	productId varchar(10) foreign key references  products(id),
)
go
create table orders(
	orderId nvarchar(100) primary key,
	accountId int  foreign key references  account(id),
	status int,
	note nvarchar(255),
	paymentMethod int
)

go

create table orderDetail (
	orderDetailId int primary key identity,
	orderId nvarchar(100) foreign key references orders(orderId),
	proId varchar(10) foreign key references products(id),
	quantity int,
	price float
)

