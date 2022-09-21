-- Creating a Databse Name EmployeeDB
create database EmployeeDB
go
-- Accessing Database EmployeeDB
use EmployeeDB
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
create table Employee(
 ID int primary key identity(1000,5),
 Name varchar(20),
 CountryId int foreign key references Country(CountryId),
 GenderId int foreign key references Gender(GenderId)
 );
 go
 --1.  Insert the above records into Employee table
 insert into Employee values('John',1,1)
 insert into Employee values('Jessie',4,2)
 insert into Employee values('Tina',2,2)
 insert into Employee values('Thomas',3,1)
 insert into Employee values('Johnson',2,1)
 insert into Employee values('Riya',3,2)
 insert into Employee values('Tommy',4,1)
 insert into Employee values('Preeti',1,2)
 go
 select * from Employee
 
--2. select all employee record it should be display Id,Name,GenderType,CountryName
select E.ID,E.Name,C.CountryName,G.GenderType from ((Employee E join Country C
on C.CountryId=E.CountryId) join Gender G 
on g.GenderId=E.GenderId)

--3.select all Male employee record it should be display Id,Name,GenderType,CountryName
select E.ID,E.Name,G.GenderType,C.CountryName from ((Employee E join Country C
on C.CountryId=E.CountryId) join Gender G 
on g.GenderId=E.GenderId)
where g.GenderType='Male'

--4.select all Female employee record it should be display Id,Name,GenderType,CountryName
select E.ID,E.Name,G.GenderType,C.CountryName from ((Employee E join Country C
on C.CountryId=E.CountryId) join Gender G 
on g.GenderId=E.GenderId)
where g.GenderType='Female'

--5.Query to find total employee by GenderType
select G.GenderType,count(E.ID) as TotalEmployees from ((Employee E join Country C
on C.CountryId=E.CountryId) join Gender G 
on g.GenderId=E.GenderId)
group by g.GenderType

--6.Query to find total employee by CountryName
select C.CountryName,count(E.ID) as TotalEmployees from ((Employee E join Country C
on C.CountryId=E.CountryId) join Gender G 
on g.GenderId=E.GenderId)
group by C.CountryName
