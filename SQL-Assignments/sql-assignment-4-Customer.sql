--Create a database CustomerDB
create database CustomerDB
go
--Accessing the database
use CustomerDB

go
--creating a table Customer
create table Customer(
ID int primary key identity(1,1),
Name varchar(15),
Gender varchar(15),
Salary int,
City varchar(15)
);

--drop table Customer
go
--Inserting a table Customer
insert into Customer values ('Tom','Male',4000,'London')
insert into Customer values ('Pam','Female',3000,'New York')
insert into Customer values ('John','Male',3500,'London')
insert into Customer values ('Sam','Male',4500,'London')
insert into Customer values ('Todd','Male',2800,'Sydney')
insert into Customer values ('Ben','Male',7000,'New York')
insert into Customer values ('Sara','Female',4800,'Sydney')
insert into Customer values ('Valarie','Female',5500,'New York')
insert into Customer values ('James','Male',6500,'London')
insert into Customer values ('Russell','Male',8800,'London')
go
select * from Customer

go
--1.Create a Stored Procedure which output the total salary by Gender 
create procedure sp_TotalSalryByCity
as
Begin
select City, sum(Salary) as TotalSalary from Customer 
group by City
End
go
exec sp_TotalSalryByCity

go
--2.Create a Stored Procedure which output the total salary by City and Gender 

create procedure sp_TotalSalryByCityAndGender
as
begin
select City,Gender, sum(Salary) as TotalSalary from Customer 
group by City,Gender
end
go
exec sp_TotalSalryByCityAndGender

go
--3.Create a Stored Procedure which output the total salary and total number of employee by City and Gender 
create procedure sp_TotalSalryAndEmployeeByCityAndGender
as
begin
select City,Gender, sum(Salary) as TotalSalary, count(ID) as TotalEmployee from Customer 
Group by City,Gender
end
go

exec sp_TotalSalryAndEmployeeByCityAndGender

go
--4.Create a Stored Procedure which takes gender and city as a input parameter. The Stored procedure should display
--all records customer which matcs the input parameter.
create procedure sp_EmployeeRecordByCityAndGender
@gender varchar(15),@city varchar(15)
as
begin
select * from Customer where Gender=@gender and City=@city
end

go
exec sp_EmployeeRecordByCityAndGender 'Male','London'
go