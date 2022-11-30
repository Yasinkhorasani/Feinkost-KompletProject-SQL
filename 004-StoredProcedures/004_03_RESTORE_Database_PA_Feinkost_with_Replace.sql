USE [master]
GO

ALTER DATABASE [PA_Feinkost] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

RESTORE DATABASE [PA_Feinkost] 
-- Choose the correct backup file (.bak)
FROM  DISK = N'C:\SQL_Projektarbeit\Gruppe B\Projektarbeit Lecker Schmecker\Abgabe\008-BackUp\008_PA_Feinkost_20221124-172353470.bak'
WITH  FILE = 1,  MOVE N'PA_Feinkost' TO N'C:\SQL_Projektarbeit\Datenbank\PA_Feinkost.mdf',  
NOUNLOAD,  REPLACE,  STATS = 5
GO

ALTER DATABASE [PA_Feinkost] SET MULTI_USER
GO