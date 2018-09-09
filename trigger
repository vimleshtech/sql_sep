

INSERT INTO USERS
VALUES(2,'JATIN','XYZ')

UPDATE USERS
SET u_pwd ='ABCD'
WHERE U_ID =1;


SELECT * FROM USERS;
SELECT * FROM USERS_LOGS;
WHERE U_ID =1;

CREATE TABLE USERS
(
u_id int,
u_name varchar(40),
u_pwd varchar(20)
);


CREATE TABLE USERS_logs 
(
u_id int,
u_name varchar(40),
u_pwd varchar(20),
time_stamp datetime,
action_type char(1)
);


CREATE TRIGGER trg_in_users
on USERS
AFTER INSERT 
AS
BEGIN

		INSERT INTO USERS_logs (U_ID,U_NAME,u_pwd,time_stamp,action_type)
		SELECT *,GETDATE(),'I' FROM INSERTED 
END
	


CREATE TRIGGER trg_up_users
on USERS
AFTER UPDATE 
AS
BEGIN

		INSERT INTO USERS_logs (U_ID,U_NAME,u_pwd,time_stamp,action_type)
		SELECT *,GETDATE(),'U' FROM INSERTED 

		INSERT INTO USERS_logs (U_ID,U_NAME,u_pwd,time_stamp,action_type)
		SELECT *,GETDATE(),'D' FROM DELETED
END
	

