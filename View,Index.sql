create database demo;
use demo;
create table Products(
id int primary key,
productCode int,
productName varchar(25),
productPrice int,
productAmount int,
productDescripton varchar(50),
productStatus varchar(25)
);
Create unique index productCode_index on Products (productCode);
create unique index nameprice_index on Products(productName,productPrice);
create view product_view as
select productCode,productName,productPrice,productStatus from Products;
drop view product_view;
delimiter //
create procedure findAllProducts()
begin
select * from Products;
end;//
delimiter; 

delimiter // 
create procedure addNewProduct (nid  int,nproductCode int,nproductName varchar(25),nproductPrice int,nproductAmount int,nproductDescripton varchar(50),nproductStatus varchar(25)) 
begin 
insert into Products(id,productCode,productName,productPrice,productAmount,productDescripton,productStatus) values
(nid,nproductCode,npruductName,nproductPrice,nproductAmount,nproductDescripton,nproductStatus);
end;
 // 
delimiter;
delimiter //
create procedure editProduct (nid  int,nproductCode int,nproductName varchar(25),nproductPrice int,nproductAmount int,nproductDescripton varchar(50),nproductStatus varchar(25))
begin
update Products set productCode = nProductCode,productName = nproductName,productPrice = nproductPrice,productAmount = nproductAmount,productDescripton = nproductDescripton,productStatus = nproductStatus
where id = nid;
end;//
delimiter 
delimiter //
create procedure deleteProduct(nid int)
begin
delete from Products where id = nid;
end; //
delimiter 

