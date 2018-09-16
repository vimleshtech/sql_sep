

use test

create table sales_order
(
oid  int,
cid int,
pid  int,
o_date datetime,
quantity int,
status int,
action_by varchar(30)
)


insert into sales_order(oid,cid,pid,o_date,quantity,status,action_by)
values(1,100,901,GETDATE(),10,1,'nitin')

select * from sales_order
update sales_order
set status =4, action_by='nidhi'
where oid =1

select * from sales_order_log
select * from sales_order

create table sales_order_log
(
oid  int,
[status] int, 
date_time datetime,
action_by varchar(30)
)

create trigger sales_order_up_track on sales_order
after update
as
begin

			insert into sales_order_log(oid,[status],date_time,action_by)
			select oid,[status],getdate(),action_by from inserted

end


----
create table abc(id int , name varchar(10))

insert into abc 
values(1,'a')


insert into abc(name)
values('a')

insert into abc 
values(2,'a'),
(3,'a'),
(4,'a')

insert into abc 
select 3,'abcd'

insert into abc(id,name) 
select 3,'abcd'


	
declare @i as int =1		--init 
while @i<=100			--condition 
begin
		print @i 
		set @i = @i +5	--increment

end