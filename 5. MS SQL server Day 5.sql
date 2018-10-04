USE LEARNING

/*
Constraint	: is properties of column/attribute 
			-> it's describe the behaviour of column

There are following types of constraints:
i. Primary key		: is not null , no duplicate , physically sorted, and can be only one in a table
			
ii. foreign key		: is referencetial column from one table to another table
					: foriegn key can hold/allow only referetial value which is avaiable in primary table/first table
					: foriegn key also allow null value 
					: foriegn  key also allow duplicate value 			 
iii. unique			: not duplicae , single null is alowed 
					: unique key can be multiple one a tgabl
iv. not null		: is madatory field, can not allow null value 
v. null				: is optional field , we can insert null/blank value 
vi. check			: is allow from given list only
vii. default		: set given value automatically when data is not inserted by user
*/


create table employee_details
(
empid int primary key,
fname varchar(30) not null,
lname varchar(30) null,
emailid  varchar(40) unique,
gender   char(1)     check (gender in('m','f')),
time_stamp  datetime  default getdate()
)

create table salary_details
(
eid  int foreign key references employee_details(empid),
basic int ,
hra int
)

insert into employee_details(empid,fname,gender)
values(1,'raman','m')
				
select * from employee_details			

insert into employee_details(empid,fname,emailid, gender)
values(2,'raman','raman@gmail.com','m')


insert into employee_details(empid,fname,lname, emailid, gender)
values(3,'monika','sharma','monika@gmail.com','f')

select * from employee_details

insert into salary_details
values(1,56000,28000)

insert into salary_details
values(2,56000,28000)

insert into salary_details
values(10,56000,28000)

delete from employee_details

delete from salary_details