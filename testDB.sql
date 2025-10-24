create database testDB;
show databases;
use testDB;

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

desc table persons;

insert into Persons(PersonID,LastName,FirstName,Address,City) values (01,'Gujre','Ankit','Arjun Nagar','Bhopal');
select * from persons;

alter table Persons add age int;
show tables;
select * from persons;

alter table persons modify age int not null;

INSERT INTO Persons(PersonID, LastName, FirstName, Address, City, Age) VALUES
(1, 'Gujre', 'Ankit', 'Arjun Nagar', 'Bhopal', 25),
(2, 'Sharma', 'Ravi', 'MG Road', 'Indore', 30),
(3, 'Verma', 'Neha', 'Civil Lines', 'Bhopal', 28),
(4, 'Patel', 'Amit', 'DB City', 'Indore', 35),
(5, 'Singh', 'Priya', 'Zone 1', 'Bhopal', 27);

select * from persons;

