USE TEST 

----------------- TEST CRAETE TABLE ------------------------
CREATE TABLE TEST_DATA
(
ID INT IDENTITY(1,1),
NAME VARCHAR(50),
CONTACT   BIGINT,
EMAIL  VARCHAR(40),
FLAG   CHAR(1),
REG_NO VARCHAR(100)
)

----------------- INSERT ROW ------------------------
INSERT into TEST_DATA(name,contact,email,flag)
values('arun',9873296140,'arun@gmail.com','y'),
('varun',9873296140,'varun@yahoo.com','y'),
('atul',9587329641,'atul@hotmail.com',NULL),
('avinash',8556353639,'avi@gmail.com',NULL),
('govind',7889563565,'gov@gmail.com',NULL)


CREATE FUNCTION dbo.GET_CURRENT_REG_NO() 
RETURNS INT
AS
BEGIN
		DECLARE @CUR_REG_ID AS INT
		SELECT  @CUR_REG_ID = MAX(REG_NO ) FROM TEST_DATA 
		RETURN @CUR_REG_ID
END


SELECT dbo.GET_CURRENT_REG_NO()


------------------- CREATE TRIGGER ------------------------
ALTER TRIGGER TRG_UP_TEST_DATA_REG_NO
   ON  TEST_DATA
   AFTER UPDATE 
AS 
BEGIN
	SET NOCOUNT ON;

	DECLARE @CUR_REG_ID AS INT
			,@INDEX    AS INT = 1
	DECLARE @TEMP AS TABLE
			(
			SNO	INT IDENTITY(1,1),
			ID INT						
			)
	SELECT  @CUR_REG_ID = MAX(REG_NO ) FROM TEST_DATA 
	
	IF @CUR_REG_ID IS NULL
	BEGIN
			SET @CUR_REG_ID =2000
	END

	
	INSERT INTO @TEMP(ID) 
	SELECT ID FROM INSERTED 
	 
	 WHILE @INDEX <= (SELECT COUNT(*) FROM @TEMP )
	 BEGIN
			UPDATE U 
			SET REG_NO = @CUR_REG_ID+1
			FROM TEST_DATA AS U INNER JOIN @TEMP AS T	
					ON U.ID = T.ID  AND T.SNO = @INDEX
					AND  U.FLAG ='Y' AND U.REG_NO IS NULL 	

			SET @INDEX =@INDEX+1 
			SET @CUR_REG_ID = @CUR_REG_ID+1
	 END
	


END
GO



ALTER TRIGGER TRG_IN_TEST_DATA_REG_NO
   ON  TEST_DATA
   AFTER INSERT 
AS 
BEGIN
	SET NOCOUNT ON;

		
	
	DECLARE @CUR_REG_ID AS INT
			,@INDEX    AS INT = 1
	
	DECLARE @TEMP AS TABLE -- TEMP TABLE VARIBALE 
			(
			SNO	INT IDENTITY(1,1),
			ID INT						
			)
	SELECT  @CUR_REG_ID = MAX(REG_NO ) FROM TEST_DATA 
	
	INSERT INTO @TEMP(ID) 
	SELECT ID FROM INSERTED 
	 
	 WHILE @INDEX <= (SELECT COUNT(*) FROM @TEMP )
	 BEGIN
			UPDATE U 
			SET REG_NO = @CUR_REG_ID+1
			FROM TEST_DATA AS U INNER JOIN @TEMP AS T	
					ON U.ID = T.ID  AND T.SNO = @INDEX
					AND  U.FLAG ='Y' AND U.REG_NO IS NULL 	

			SET @INDEX =@INDEX+1 
			SET @CUR_REG_ID = @CUR_REG_ID+1
	 END
	




END
GO


SELECT * FROM TEST_DATA
DELETE FROM TEST_DATA
WHERE ID > 6


----- TEST REG UDPATE - SCRIPT --
INSERT into TEST_DATA(name,contact,email,flag)
values('Vimlesh',987329613,'vimlesh@gmail.com','y')

INSERT into TEST_DATA(name,contact,email,flag)
values ('ROHIT',987329613,'vimlesh@gmail.com',NULL),
('KSHITIZ',987329613,'vimlesh@gmail.com','y'),
('GAURAV',987329613,'vimlesh@gmail.com',NULL),
('NITISHA',987329613,'vimlesh@gmail.com','y')


---
UPDATE TEST_DATA
SET FLAG ='Y'
WHERE ID  = 5

