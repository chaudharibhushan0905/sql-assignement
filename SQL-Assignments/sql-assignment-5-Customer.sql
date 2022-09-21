-- Creating a Databse Name EmployeeDB
create database CustomerDB
go
-- Accessing Database EmployeeDB
use CustomerDB
go
--  Creating a table inside Database
create table Country(
CountryId int primary key identity(1,1),
CountryName varchar(30)
);
go
insert into Country values
 ('India'),
 ('USA'),
 ('England'),
 ('France')
 go
 select * from Country
 go
 create table Gender(
  GenderId int primary key identity(1,1),
  GenderType varchar(10)
  );
 go
 insert into Gender values
  ('Male'),
  ('Female')
 go
select * from Gender
go
create table Customer(
 ID int primary key identity(1000,5),
 Name varchar(20),
 CountryId int foreign key references Country(CountryId),
 GenderId int foreign key references Gender(GenderId)
 );
 go
 --1.  Insert the above records into Customer table
 insert into Customer values('John',1,1)
 insert into Customer values('Jessie',4,2)
 insert into Customer values('Tina',2,2)
 insert into Customer values('Thomas',3,NULL)
 insert into Customer values('Johnson',2,1)
 insert into Customer values('Riya',3,2)
 insert into Customer values('Tommy',4,NULL)
 insert into Customer values('Preeti',1,2)
 go
 select * from Customer

 go
 --2.Create a Stored Procedure to get all Customer record it should be display Id,Name,GenderType,CountryName 

create procedure sp_AllCustomerDetailsIdNameGenderAndCountryName
as
begin
select Ct.ID,Ct.Name,C.CountryName,G.GenderType from ((Customer Ct join Country C
on C.CountryId=Ct.CountryId) join Gender G 
on g.GenderId=Ct.GenderId)
end
go
exec sp_AllCustomerDetailsIdNameGenderAndCountryName

--3.Create a Stored Procedure which takes genderType  input parameter as a input and display customer details.
--it should be display Id,Name,GenderType,CountryName 
go

create procedure sp_CustomerDetailsByGenderTypeIdNameGenderAndCName
@genderType varchar(10)
as
begin
select Ct.ID,Ct.Name,C.CountryName,G.GenderType from ((Customer Ct join Country C
on C.CountryId=Ct.CountryId) join Gender G 
on g.GenderId=Ct.GenderId)
where g.GenderType=@genderType
end
go
exec sp_CustomerDetailsByGenderTypeIdNameGenderAndCName 'Female'

--4.create a function which accepet country id and gender id as a parameter as input and display customer details.
--it should be display Id,Name,GenderType,CountryName 
go
create function AllCustomerDtailByCountryIdandGenderId
(
	@Countryid int,
	@Genderid int
)
returns table
as
return (select Ct.ID,Ct.Name,C.CountryName,G.GenderType from ((Customer Ct join Country C
on C.CountryId=Ct.CountryId) join Gender G 
on g.GenderId=Ct.GenderId)
where g.Genderid=@genderid and C.CountryId=@Countryid)
go
select * from dbo.AllCustomerDtailByCountryIdandGenderId(3,2)


--5.Create a stored Procedure to find Total customer by countryName
go 
create procedure sp_FindTotalCustomerByContryName
as
begin
select C.CountryName,count(e.ID) as TotalEmployees from ((Customer e join Country C
on C.CountryId=E.CountryId) join Gender G 
on g.GenderId=E.GenderId)
group by C.CountryName
end
--drop procedure sp_FindTotalCustomerByContryName
go
exec sp_FindTotalCustomerByContryName
