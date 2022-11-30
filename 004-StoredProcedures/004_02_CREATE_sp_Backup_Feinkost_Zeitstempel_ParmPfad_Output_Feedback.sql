USE [PA_Feinkost]
GO

/****** Object:  StoredProcedure [dbo].[sp_008_01_Backup_mit_Zeitstempel_ParmPfad_Feedback]    Script Date: 22.11.2022 20:08:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Gruppe B
-- Create date: 22.11.2022
-- Description:	Datenbanksicherung (DB: PA_Feinkost) mit Try/Catch und Feedback
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[sp_004_02_Backup_mit_Zeitstempel_ParmPfad_Feedback]
	@Pfad nvarchar(MAX),	-- 1. Parameter für den Backup-Pfad z.B. @Pfad: 'C:\SQL_Projektarbeit\Gruppe B\Projektarbeit Lecker Schmecker\Abgabe\008-BackUp\' 
	@Feedback nvarchar(MAX) OUTPUT -- 2. Parameter für Feedback
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRY
	
		DECLARE @FileName NVARCHAR(MAX);            -- File name
		DECLARE @FileNamePreFix NVARCHAR(MAX);      -- File name prefix
		DECLARE @TimeStamp NVARCHAR(MAX);           -- Time stamp

		SET @FileNamePreFix = '008_PA_Feinkost_';

		SET @TimeStamp = [dbo].[sf_003_01_Zeitstempel]();

		SET @FileName = @Pfad + 
				        @FileNamePreFix + 
					    @TimeStamp + 
					    '.bak';
   
		BACKUP DATABASE [PA_Feinkost] TO  DISK = @FileName;

		SET @Feedback = CHAR(10) + 'Backup war erfolgreich!';

	END TRY

	BEGIN CATCH	  -- CHAR(10) = Zeilenumbruch
		SET @Feedback = ERROR_MESSAGE() + CHAR(10)
						+ 'Fehler Nr. ' + CONVERT(varchar, ERROR_NUMBER()) + CHAR(10)
						+ 'Prozedur: '  + ERROR_PROCEDURE() + CHAR(10)
						+ 'Zeile Nr.: ' + CONVERT(varchar,  ERROR_LINE());	
	END CATCH
END
GO


