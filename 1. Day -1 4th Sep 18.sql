/*
Today's Topics
======================
-MS SQL Server - Server Type:

	-Database Engine/Database server
	**MS BI **
	-Integration Services (SSIS)
	-Reporting Services(SSRS)
	-Analysis Services (SSAS)

-Client-Server Architecture
	Client/Connector:
			SSMS (SQL Server management studio)
	Server:
			-MS SQL Server Express(free)
			-MS SQL Server Standard Edition (Paid)
			-MS SQL Server Enterprise Edition (Paid)

	SQL Server Developer Tool (MS BI):
			-BIDS (business  Int. development studio)
			-Data Tools 

-MS SQL Server - Version 
	-MS SQL Server 2000		(outdated)
	-MS SQL Server 2005		(outdated)
	-MS SQL Server 2008		(outdated)
	-MS SQL Server 2008R2 (release 2)	(in use)
	-MS SQL Server 2012		(in use)
	-MS SQL Server 2014		(in use)
	-MS SQL Server 2016		(in use)
		

-MS SQL Server File System Type:
	-.mdf	: main data file
	-.ldf	: log data file
	-.ndf	: file group (second file group location)

-Authentication Type:
	-Windows Authentication : no password required / works using windows login id and pwd
	-SQL Server			: user and password are required 
-Server Name:
	LH7U05CG7300QJQ\DBS92		
	Server/IPAddress/ComputerName\InstanceName
	LH7U05CG7300QJQ: server/computer name
	DBS92: is instance name 

-Database :		is relational schema which store data in tabular format and different typesof objects
				-Table
				-Views
				-Trigger
				-Function
				-Procedure
				etc.
Schema: is structure 

-MS SQL Server : Command Type
There are following command types:
1. DDL : Data Defintion Language
	-create
	-alter
	-drop
	-truncate
2. DML : Data Manipulation Language
	-insert
	-update
	-delete
3. DCL : Data Control Language
	-create user
	-grant access
	-revoke access
4. TCL : Transaction Control Language
	-begin transaction 
	-commit
	-rollback
5. DQL  : Data Query Language 
	-select
*/
select @@SERVICENAME
select @@version 


--create database 
create database db_learning

--switch databse 
use db_learning

--create table 
create table users
(
u_id int identity(1,1),  -- here identity : is auto incrementer
uname varchar(100),		--text type
emailid varchar(100),
pwd		varchar(30),
create_date datetime,
status_id   bit
)


--show schema
sp_help users 


--Q. design database of SuperStore 
--tomorrow time will be at 9:30 PM 


