--creating a database
create database SchoolDB 
go
--accessing database
use SchoolDB
go
--creating table
create table Students(
Id int UNIQUE IDENTITY (100,1),
FirstName varchar(20),
LastName varchar(20),
Marks int CHECK (Marks > 0 And Marks < 100)
);
go
--insert the data 
insert into Students(FirstName, LastName, Marks)
Values('Johny', 'Ryan',55)

insert into Students(FirstName, LastName, Marks)
Values('Tina', 'Mari',75)

insert into Students(FirstName, LastName, Marks)
Values('Tim', 'Keith',65)

insert into Students(FirstName, LastName, Marks)
Values('Vineetha', 'Mathew',88)

insert into Students(FirstName, LastName, Marks)
Values('Varun', 'John',92)

insert into Students(FirstName, LastName, Marks)
Values('Tarun', 'Varghese',94)
go
-- show all record
select * from Students
go
--1.find the student marks>50
select Id, FirstName,LastName from Students where Marks>60
--2.find the highest marks for student
select Max (Marks) as [Highest Marks] from Students
--3.find the lowest marks for student
select Min (Marks) as [Lowest Marks] from Students
--4.find the average marks for student
select AVG (Marks) as [Average Marks] from Students
