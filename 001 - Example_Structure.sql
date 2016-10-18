CREATE DATABASE AutonomousTransaction
GO

USE AutonomousTransaction
GO

--Creating table to log transactions
CREATE TABLE LogTransaction(
	 Id INT IDENTITY(1,1)
	,TextLog VARCHAR(MAX)
)
GO

CREATE TABLE DummyInsert(
	 Id INT IDENTITY(1,1)
	,SomeText VARCHAR(MAX)
)
GO

--Creating SP to insert log value
CREATE PROCEDURE [dbo].[InsertLogTransaction](@TextLog VARCHAR(MAX))
AS
BEGIN
	INSERT INTO dbo.LogTransaction VALUES (@TextLog);
END
GO

--Creating SP with inner commit
CREATE PROCEDURE [dbo].[InsertLogTransactionAC](@TextLog VARCHAR(MAX))
AS
BEGIN
	BEGIN TRAN
		INSERT INTO dbo.LogTransaction VALUES (@TextLog);
	COMMIT
END