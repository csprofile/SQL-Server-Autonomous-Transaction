USE [master]
GO

/****** Object:  LinkedServer [loopback]    Script Date: 18/10/2016 14:39:00 ******/
EXEC master.dbo.sp_addlinkedserver @server = N'loopback', @srvproduct=N' ', @provider=N'SQLNCLI', @datasrc=N'127.0.0.1'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'loopback',@useself=N'True',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL

GO

EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'collation compatible', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'loopback', @optname=N'remote proc transaction promotion', @optvalue=N'false'
GO