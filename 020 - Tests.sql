USE AutonomousTransaction
GO

 
--1 - Normal transaction
BEGIN TRAN
	INSERT INTO DummyInsert VALUES ('Hey, this record will be erased on rollback')
	EXEC [InsertLogTransaction] 'This is the log, you have to keep it even on rollback'
	INSERT INTO DummyInsert VALUES ('Hey, this record will be erased on rollback')
ROLLBACK
SELECT '******** NORMAL TRANSACTION ********'
SELECT * FROM LogTransaction
SELECT * FROM DummyInsert


--Normal transaction with multiples commits
BEGIN TRAN
	INSERT INTO DummyInsert VALUES ('Hey, this record will be erased on rollback')
	BEGIN TRAN
		EXEC [InsertLogTransaction] 'This is the log, you have to keep it even on rollback'
	COMMIT
	INSERT INTO DummyInsert VALUES ('Hey, this record will be erased on rollback')
ROLLBACK
SELECT '******** NORMAL TRANSACTION WITH MULTIPLES COMMITS ********'
SELECT * FROM LogTransaction
SELECT * FROM DummyInsert


--Normal transaction executing auto commited SP
BEGIN TRAN
	INSERT INTO DummyInsert VALUES ('Hey, this record will be erased on rollback')
	EXEC [InsertLogTransactionAC] 'This is the log, you have to keep it even on rollback'
	INSERT INTO DummyInsert VALUES ('Hey, this record will be erased on rollback')
ROLLBACK
SELECT '******** NORMAL TRANSACTION EXECUTING AUTO COMMIT ********'
SELECT * FROM LogTransaction
SELECT * FROM DummyInsert


--Normal transaction executing log in loopback linked server
BEGIN TRAN
	INSERT INTO DummyInsert VALUES ('Hey, this record will be erased on rollback')
	EXEC [loopback].[AutonomousTransaction].[dbo].[InsertLogTransaction] 'This is the log, you have to keep it even on rollback'
	INSERT INTO DummyInsert VALUES ('Hey, this record will be erased on rollback')
ROLLBACK
SELECT '******** NORMAL TRANSACTION EXECUTING LOG IN LOOPBACK LINKED SERVER ********'
SELECT * FROM LogTransaction
SELECT * FROM DummyInsert