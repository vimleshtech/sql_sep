
/*
How to design database structure
==================================
Example:
	HRMS		: Human Resorce Management System
	-Tables/Entity
		-Country
				(attribute/colum/field)
				cid cname status  time_stamp  
					
		-State
				sid  cid state status time_stamp

		-OfficeLocation
				olid sid office_address	 status time_stamp

		-Designation
				did name	status time_stamp

		-Department
				dptid name  status	time_stamp

		-Employee
				eid  dptid did  olid fname  mname lname     emailid gender phoneno 
		-EmployeeEducationDetails
				eduid  eid 10th_score 10th_year 10th_board 12th_score 12th_year 12th_board
				grad_score grad_year grad_board postgrad_score postgrad_year postgrad_board

		-EmployeeEmployementDetails
				did  eid   companyname profile form_date to_date						
			
		-Salary
				eid hra  basic  other 
					
		-AttendanceStatus
				aid  status_name  status   time_stamp
					
		-Attendance
				atid	eid	 date  aid	

			
-Data Type
-Constraints
-create, alter ,drop , truncate
-insert,delete,update
-select			: projection 
-where			: selection 
-operator
-order by
-group by 
-having
-case when 
-keywords : identity , top , distinct 

Data Type
======================
Numeric : non-decimal
-------------------------
-tinyint
-int
-bigint 

Numeric:  decimal 
-float				= 111.1234567 (7 decimal)
-double				=111233.11111111111111 (15 decimal)
-numeric(5,2)			= 123.45				, example : price numeric(8,2)  = 100000.12


AlphaNumeric : any char from keywboard
-------------------------
char		: fix size ASCII(english)	, example char(5) ='ab'	  / gender char(1)
										: there are 2 char in use, howevere 3 will not be free
		
nchar		: fix size Unicode (multiple language)
							
varchar		: dynamic size ASCII(english)  , example varchar(10) = 'abcd' / name, address 
											, 4 char will be used, rest 6 char will be free
nvarchar	: dynamic size , Unicode (multi langauge) 
text		: ASCII :  for formated data like xml, .txt file (tag based data)
ntext		: Unicode : for formated data like xml, .txt file (tag based data)
			 example :
						comments/descriptions 
								[{id:111,name:'raman'}]
								<emp>
								</emp>

DateTime
--------------
Date		: yyyy-mm-dd
Datetime	: yyyy-mm-dd hh:mm
smalldatetime	: yyyy-mm-dd hh:mm:ss:ms	
time			: hh:mm:ss

Boolean
----------
bit			: true (1) /false (0)


Other 
----------------
varbinary			: hexacode /encrypted data 
money				: amount with symbal
					: $33333.22
image/blob				:
					save binary code of image

etc.

Note : all data type data will be stored within single quote ' ' except numeric (decimal, non-decimal) and bit 

Constraints : is properties of column/attribute
===================
There are following constraints:
-primary key	
			-no duplicate
			-not null
			-physically sorted
			-can be single in a table 
-foreign key
			- referential column from primary table 
			- foreign key can hold duplicate value
			- foeign key can hold  null value
			- multiple foreign key can be in a table 						
-unique
			-no duplicate
			-allow  single null 
			-can be multiple in a table
-not null
			-mandatory field/column
-null	
			-optional field 
-default 
			-set/store  specified value automatically wheen data will given by user
-check 
			-allow value from given list 
				
*/
---create database
create database hrms_prac
use hrms_prac

