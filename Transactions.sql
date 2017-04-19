-- Adds item to product and stores in default location/amount
DECLARE @intErrorCode INT
BEGIN TRAN
--Inserts item into product table
 INSERT INTO PRODUCT VALUES(99999999, 'xLaptop', 500, 95)
 --if an error occurs, produce error message and rollback
 SELECT @intErrorCode = @@ERROR
 IF (@intErrorCode <> 0) GOTO PROBLEM
 --inserts default values into stores ex. all new products go to fac 1, 100 stock initial
INSERT INTO STORES VALUES(1, 99999999, 100)

 SELECT @intErrorCode = @@ERROR
 IF (@intErrorCode <> 0) GOTO PROBLEM
COMMIT TRAN
-- If problem occurs, go to this
PROBLEM:
IF (@intErrorCode <> 0) BEGIN
PRINT 'Unexpected error occurred!'
-- Returns to original state before modifications
 ROLLBACK TRAN
END

-- Nested Transaction
-- Shows us what happens when President Drake takes over
SELECT 'Before BEGIN TRAN', @@TRANCOUNT -- The value of @@TRANCOUNT is 0
BEGIN TRAN
SELECT 'After BEGIN TRAN', @@TRANCOUNT -- The value of @@TRANCOUNT is 1
INSERT INTO EMPLOYEE values ('765','Drake','President',NULL,'6','1')
BEGIN TRAN nested
SELECT 'After BEGIN TRAN nested', @@TRANCOUNT
-- The value of @@TRANCOUNT is 2
UPDATE EMPLOYEE
SET EmpManager_ID = '765'
WHERE EmpManager_ID is NOT NULL OR Emp_ID = '234'
COMMIT TRAN nested
-- Does nothing except decrement the value of @@TRANCOUNT
SELECT 'After COMMIT TRAN nested', @@TRANCOUNT
-- The value of @@TRANCOUNT is 1
SELECT * FROM EMPLOYEE
ROLLBACK TRAN
SELECT 'After ROLLBACK TRAN', @@TRANCOUNT -- The value of @@TRANCOUNT is 0
-- It would also be 0 if we used a ROLLBACK since
-- ROLLBACK TRAN always rolls back all transactions and sets
-- @@TRANCOUNT to 0.
SELECT * FROM EMPLOYEE

-- Transaction with save points
-- Insterts a new employee Louie and then rolls back the changes
SELECT 'Before BEGIN TRAN', @@TRANCOUNT
BEGIN TRAN main
	SELECT 'After BEGIN TRAN main', @@TRANCOUNT
	INSERT INTO EMPLOYEE values (555, 'Szekeley', 'Louie', null, 6, 3)
	SAVE TRAN ins
	SELECT 'After SAVE TRAN ins', @@TRANCOUNT
	SELECT * FROM EMPLOYEE
	BEGIN TRAN nested
	SELECT 'After BEGIN TRAN nested', @@TRANCOUNT
	UPDATE EMPLOYEE
	SET EmpManager_ID = 234
	WHERE Emp_ID = 555

	SAVE TRAN updaterec
	SELECT 'After SAVE TRAN updaterec', @@TRANCOUNT
SELECT * FROM EMPLOYEE
	ROLLBACK TRAN ins
	SELECT 'After ROLLBACK TRAN addrec', @@TRANCOUNT
	SELECT * FROM EMPLOYEE
IF (@@TRANCOUNT > 0) BEGIN
	ROLLBACK TRAN
	SELECT 'AFTER ROLLBACK TRAN', @@TRANCOUNT
END
SELECT * FROM EMPLOYEE