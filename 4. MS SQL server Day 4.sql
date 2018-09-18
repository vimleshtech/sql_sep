/*
Today's Topics
=====================
-Keywords:
	top		
	distinct
	insert into 
-Case when 
-order by 
-aggregiate function 
-group by 
-having 
-union 
-join and it;s type 
*/

use learning   
select * from product 

-- top		: return selected given no. of rows
select top 2 * from product --return top two rows

select top 2 p_id,p_name from product --return top two rows and selected columns


-- distinct: return unique rows 
select distinct * from product
select distinct P_NAME from product


--	insert into  : createa new table from existing table 
select * into product_bak from product 

select * from product_bak

--create new table with select columns and rows from existing table
select p_id,p_name into product_bak1 from product 
where p_id > 4

select * from product_bak1


---Case when  : is condition 
select * from product

select 
	p_id,
	p_name,
	P_PRICE,
	S_PRICE,
	case when status =1 then 
			'Active'
		else 
			'Inactive'
		end 		
from product

select 
	p_id,
	p_name,
	P_PRICE,
	S_PRICE,
	case when status =1 
		then 
			'Active'
	    else case  when status is null  
			 then 
					'na'
		     else 
				'inactive'
		    end 		
	end as status_name
from product

--- order by : to arrange data in ascending or descending order 
select * From product order by p_id desc 

select * From product order by p_id  --default is ascending 

select * From product order by p_name 
select * From product order by p_name desc 

--ORDER BY MULTIPLE COLUMNS 
select * From product order by p_name ASC, S_PRICE DESC 


--ORFER BY WITH TOP :
--RETURN PRODUCT -1ST HIGHEST
SELECT TOP 1 * FROM PRODUCT ORDER BY S_PRICE DESC 

SELECT TOP 2 * FROM PRODUCT ORDER BY S_PRICE DESC 

--LOWEST ONE 
SELECT TOP 1 * FROM PRODUCT ORDER BY S_PRICE ASC

--RETURN 2ND HIGHEST PRICE  : WITH SUBQUERY (NESTETD QUERY - RESULT OF ONE QUERY WILL USE AS SOURCE FOR OTHER QUERY)
SELECT TOP 1 * FROM 
				(
				SELECT TOP 2 *  FROM PRODUCT ORDER BY S_PRICE DESC 
				) A
ORDER BY S_PRICE ASC 


--RETURN 3RD SALES 
SELECT TOP 1 * FROM 
				(
				SELECT TOP 3 *  FROM PRODUCT ORDER BY S_PRICE ASC  
				) A
ORDER BY S_PRICE DESC




-- 2+3*4		=  14
-- (2+3) *4     =  20


-- aggregiate function : function which work on columns and will return one value 
-- there are following aggregiate function : 1. sum() 2. max() 3. min() 4. avg() 5. count()

select count(*) from product   -- * : all rows 
select max(S_PRICE) from product
select min(S_PRICE) from product
select avg(S_PRICE) from product
select sum(S_PRICE) from product

--count(*) vs count(col)
select count(*) from product    -- 12,  (count of all rows)
select count(status) from product    -- 7 , count of values without null


--group by : summarize the data based on given column
SELECT P_NAME,COUNT(*), COUNT(P_NAME)   
FROM PRODUCT GROUP BY P_NAME 


SELECT P_NAME,max(s_price), min(s_price),avg(s_price),sum(s_price)
FROM PRODUCT GROUP BY P_NAME 


--get status wise count
select status, count(status)
FROM PRODUCT GROUP BY status


--having : can use used only with group by 
select status, count(status)
FROM PRODUCT GROUP BY status
having count(status)>1

select status, count(status)
FROM PRODUCT GROUP BY status
having sum(s_price)>4333


-- union : to merge two or more than two tables vertially
-- no. of columns and column's data should be same and should be in same order
-- there are following types of union : i. union ii. union all 
-- i.union : return unique/distict rows
-- ii. union all : return all rows 

select * from product
union  
select * from product_bak  


select * from product
union   all
select * from product_bak  
union   all
select * from product_bak  
union   all
select * from product_bak  



select p_id from product
union   all
select P_id from product_bak  





---  join and it;s type 
-- join : to merge two or more than two tables horizentally 
-- at least one column must be same(logically) in all sources
-- there are following types of join 
-- i. inner join : return common or matching rows 
-- ii. outer join / full outher join : return all rows from all sources
--    a. left join / left outer join : return all rows from left table and matching from right table
--    b. right join / right outer join : return all rows from right table and matching from left table 

-- other types of join : i. cross join/cartisan product ii. self join 
-- note : cross is not recommended to use 


create table sales(oid int, pid int, cname varchar(30), quantity int, sale_date datetime)

insert into sales(oid,pid,cname,quantity)
values(1,2,'raman',5),
(2,3,'jatin',10),
(3,4,'ayush',2),
(4,5,'nidhi',1),
(5,20,'rahul',11)


select * from product 
select * from sales


-- inner join 
select  s.oid,s.cname,p.P_NAME,p.S_PRICE,s.quantity,s.sale_date
from product as p inner join sales as s 
	on p.P_ID = s.pid


select  s.oid,s.cname,p.P_NAME,p.S_PRICE,s.quantity,s.sale_date
from product as p  join sales as s   --default or inner join 
	on p.P_ID = s.pid

-- left join 
select  s.oid,s.cname,p.P_NAME,p.S_PRICE,s.quantity,s.sale_date
from product as p left join sales as s  --here product is left table, so all rows will be return from product table and matching from sales table
	on p.P_ID = s.pid

--right join 
select  s.oid,s.cname,p.P_NAME,p.S_PRICE,s.quantity,s.sale_date
from product as p right join sales as s  --here product is left table, so all rows will be return from sales table and matching from product table
	on p.P_ID = s.pid


-- full outer join 
select  s.oid,s.cname,p.P_NAME,p.S_PRICE,s.quantity,s.sale_date
from product as p full outer join sales as s  
	on p.P_ID = s.pid


--multiple table join
select  s.oid,s.cname,p.P_NAME,p.S_PRICE,s.quantity,s.sale_date
from product as p inner join sales as s 
		on p.P_ID = s.pid
	inner join product_bak as b
		on p.p_id = b.p_id 
		  and b.S_PRICE > 30
order by  p.P_PRICE
	
--cross join  : no recommned  (count of first table rows * count of 2nd table rows)
select * from product , sales 


/*
Questions:
	->Q1. wap to show list of manager whose direct reportee is more than 2
			table:  eid  ename  mgrname 
			        1     raman  nitin
					2     rahul   raman
					3     chahat  raman 


			output:
					mgrname 
					raman 




	-> Q2. wap to compute grae card 
			table :  sid  sname   hs  es cs ms 
					  1   raman   55 66 77  88

			output:
					sid sname   toatal_score   avgerage  grade (avg>80=A, avg>60 = B, else C)

	-> Q3. wap to return following result 
			output :
					pid   pname   total_purchase_product  total_Sale_product   available_in_stock
					1     dove     100                      40                  60

			input table:
					product : pid  pname   pur_price   sale_price
					           1    dove 
					transaction : tid   pid   tran_type    quantity  date
								   1    1     p            100
								  2    1      s           30
								  3    1      s           10
								  
								  
		-> Q4. wap to show following result :
					output:
								eid   ename  mgrname 
								1     raman    null
								2     nitin    raman
								3     rahul    nitin 
								
					input table:
							employee : eid  ename mgrid 
									   1    raman  null
									   2     nitin  1
									   3     rahul  2

*/


