use dummyclass;
select * from customers;
show tables;
select * from emp;

-- delimeter ko change karne ke liye // isse ya koin bhi symbol @@ se kar sakte hai

DELIMITER //
create procedure customerinfo()
begin
select * from customers where country = "USA";
end //
DELIMITER ;

DELIMITER //
create procedure empinfo()
begin
select * from emp where dept = "HR";
end //
DELIMITER ;

 call empinfo();
 
 DELIMITER //
create procedure GetOfficeByCountry(in countryName varchar(255))
begin
select * from offices where country = countryName;
end //
DELIMITER ;

-- call GetOfficeByCountry('Bhopal')
call GetOfficeByCountry('USA')