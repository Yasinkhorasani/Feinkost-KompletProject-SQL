USE [PA_Feinkost];
GO

DECLARE @Rueckgabe nvarchar(MAX);		-- Erforderlich für OUTPUT und PRINT

-- Pfad existiert
EXEC [dbo].[sp_004_02_Backup_mit_Zeitstempel_ParmPfad_Feedback] 
	 'C:\SQL_Projektarbeit\Gruppe B\Projektarbeit Lecker Schmecker\Abgabe\008-BackUp\',
	 @Rueckgabe OUTPUT;

------ Store Procedure existiert nicht
--EXEC [dbo].[sp_004_02_Backup_mit_Zeitstempel_ParmPfad_Feedback_XYZ] 
--	'C:\SQL_Projektarbeit\Gruppe B\Projektarbeit Lecker Schmecker\Abgabe\008-BackUpXYZ\',
--	@Rueckgabe OUTPUT;

------ Pfad existiert nicht
--EXEC [dbo].[sp_004_02_Backup_mit_Zeitstempel_ParmPfad_Feedback] 
--	'C:\SQL_Projektarbeit\Gruppe B\Projektarbeit Lecker Schmecker\Abgabe\008-BackUpXYZ\',
--	@Rueckgabe OUTPUT;

PRINT @Rueckgabe;