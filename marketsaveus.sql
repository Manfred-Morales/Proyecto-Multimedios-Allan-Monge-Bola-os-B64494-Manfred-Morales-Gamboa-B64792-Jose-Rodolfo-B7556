create database marketsaveus
go
use marketsaveus
go

create table TblUser
(email varchar(50) primary key,
 passw varchar(30) not null,
 fullName varchar(50) not null,
 tipo char(1) not null)
go

create table TblProduct
(code varchar(20) primary key,
 productName varchar(20) not null,
 productDescription varchar(50) not null,
 prize decimal not null,
 stock int,
 productImage varchar(100))
 go


 create table TblInvoice
 (idInvoice int identity(1,1) primary key,
  userEmail varchar(50),
  dateInvoice datetime not null)
  go

  alter table TblInvoice add foreign key (userEmail) references TblUser (email)
  go
  
 create table TblDescInvoice
 (idDescInvoice int identity(1,1) primary key,
  idInvoice int,
  productCode varchar(20), 
  quantity int not null,
  subtotal decimal not null)
  go

  alter table TblDescInvoice add foreign key (idInvoice) references TblInvoice (idInvoice)
  go
  alter table TblDescInvoice add foreign key (productCode) references TblProduct (code)
  go

 