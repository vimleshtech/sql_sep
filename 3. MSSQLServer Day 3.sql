/*
System Defined Databases:
----------------------------------
There are following :
-master		: is default database , which contains meta info(details about user databases)
-msdb		: contains meta info(details about system, instance, and predefinded scripts)
-tempdb		: temp database which contains temp variable , and cache data 
-model		: contains Entity relationship (ER Diagram)


MS SQL Server Command Type:
1. DDL : data definition language
-create
-alter 
-drop 
-truncate
2. DML : data manipulation language
-insert 
-update
-delete 
3. DQL: data query langauge
-select

--WHERE CALAUSE/condition 
--Operator

*/

--create new database 
create database learning   

--switch databse 
use learning   

--create new table 


create table product 
(
P_ID INT IDENTITY(1,1) PRIMARY KEY,-- IDENTITY(1 -START FROM ,1 - INCREMENTER) : AUTO INCREMENT 
P_NAME VARCHAR(50) NOT NULL,
P_PRICE FLOAT NOT NULL,
S_PRICE FLOAT NOT NULL,
STATUS BIT
)

--TO VIEW THE STRUCTURE OF TABLE
sp_help PRODUCT 


--insert  
insert into product 
values('DOVE',40,50,1)


--insert using select
insert into product 
select 'lux',30,40,1


--INSERT
insert into product(P_NAME,P_PRICE,S_PRICE) 
values('IPhone x',78000,87000)


--bulk insert
insert into product(P_NAME,P_PRICE,S_PRICE) 
values('sony phone',7000,8000),
('sony tv',80000,90000),
('samsung tv',4000,50000),
('samsung phone',12000,15000)

--
insert into product 
select 'lux1',30,40,1
union						--to merge two or more than two table 
select 'lux2',34,44,1
union
select 'lux3',32,42,1
union
select 'lux4',31,46,1


--
select 1,'abcd'
union 
select 2,''


---view all columns and all rows data  : projection 
-- * : show all columns
select * from product

--view selected columns
select P_ID,P_NAME,S_PRICE from product

--CREATE ALIASE : CHANGE /ASSIGN THE NEW NAME OF COLUMN IN RESULT SET
select P_ID AS PRODUCT_ID,P_NAME   PRODUCT_NAME,S_PRICE from product

---update: DATA IN EXISTING ROW
SELECT * FROM PRODUCT

UPDATE product
SET STATUS =1  --UDPATE ONE COLUMN
WHERE P_ID = 3

UPDATE product
SET STATUS =1,  --UDPATE MULTIPLE COLUMN
    S_PRICE=100
WHERE P_ID = 4

--- delete  : REMOVE EXISTING ROWS 
SELECT * FROM PRODUCT

--DELETED SELECTED ROWS
DELETE FROM PRODUCT WHERE P_ID =1

--DELETE ALL ROWS
DELETE FROM PRODUCT 


--- alter : ALTER TABLE AND ADD NEW COLUMN
SELECT * FROM PRODUCT 

ALTER TABLE PRODUCT 
ADD MFD DATETIME

--ALTER TABLE AND MODIFY DATATYPE OR SIZE 
ALTER TABLE PRODUCT
ALTER COLUMN P_NAME VARCHAR(300)

-- ALTER TABLE AND DROP THE COLUMN
SELECT * FROM PRODUCT 

ALTER TABLE PRODUCT
DROP COLUMN MFD 


---drop  : remove table data with structure or remove object , there will no existing of object 
drop table product 


--truncate table : remove all rows
truncate table product 

/*
DELETE VS TRUNCATE 
->TRUNCATE DOESN'T ALLOW WHERE CALAUSE, SO ALL ROWS WILL BE REMOVED
  WHEASE DELETE DOES ALLOW WHERE CALAUSE, SO SELECTED ROWS WILL BE REMOVED	 
->DELETE CAN ALSO REMOVE ALL ROWS
->DELETE IS PART OF DML COMMAND, SO LOG BE MAINTAINDED
  HOWEVER TRUNCATE IS PART OF DDL COMMAND , SO LOG WILL NOT BE MAINTAINED

->DELETE DOESN'T RESET AUTO INCREMENT(IDENTITY) COLUMN,
	HOWERE TRUNCATE RESET AUTO INCREMENT COLUMN
*/
SELECT * FROM PRODUCT 
--11
DELETE  FROM PRODUCT 

INSERT INTO PRODUCT 
VALUES('DOVE',44,55,1)


--TRUNCATE 
TRUNCATE TABLE PRODUCT 


 


--WHERE CALAUSE/condition 
--Operator
select * from product where p_id =1

select * from product where p_id >3

select * from product where p_id >=3

select * from product where p_id <3
select * from product where p_id <=3

--in list
select * from product where p_id in (3,5,6,7,10)
select * from product where p_id not in (3,5,6,7,10)

select * from product where p_name in ('dove','lux')

--between - in range :inclusive
select * from product where p_id between 2 and 5

select * from product where p_id not between 2 and 5

-- and 
select * from product where P_id > 2 and P_id < 4

select * from product where P_id > 2 and status  =1

--or
select * from product where P_id > 2 or status  =1

--is null
select * from product where status is null 
select * from product where status is not null 

---wild card  / parttern matching 
/*
% : ANY CHAR ANY GIVEN NO. OF TIMES
_ : ANY CHAR WITH GIVEN NO. OF TIMES  : EXACT LENGHT MATCH
*/
select * from product where P_NAME LIKE 'D%'  -- START WITH D
select * from product where P_NAME LIKE '%E'  -- END WITH E 

select * from product where P_NAME LIKE '%A%'   --CONTAINS A
select * from product where P_NAME LIKE '%@GAMIL.COM' 

select * from product where P_NAME LIKE 'D___' 

select * from product where P_NAME LIKE 'D_B%C__' 
										--D1BSJHKSUHSJJFJHRCXY

select * from product where P_NAME NOT LIKE 'D%'  -- NOT START WITH D

--
