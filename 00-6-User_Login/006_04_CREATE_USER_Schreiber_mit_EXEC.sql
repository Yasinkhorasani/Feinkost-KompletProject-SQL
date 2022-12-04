USE [PA_Feinkost];
GO
CREATE USER [PA_Feinkost_Schreiber] FOR LOGIN [PA_FeinkostWriter];
GO

-- Tabelle Einheit --
GRANT SELECT ON [dbo].[tb_Einheit] TO [PA_Feinkost_Schreiber];
GO
GRANT UPDATE ON [dbo].[tb_Einheit] ([EinName]) TO [PA_Feinkost_Schreiber];
GO
GRANT UPDATE ON [dbo].[tb_Einheit] ([EinAbk]) TO [PA_Feinkost_Schreiber];
GO

-- Prozedur Backup --
GRANT EXECUTE ON [dbo].[sp_004_02_Backup_mit_Zeitstempel_ParmPfad_Feedback] TO [PA_Feinkost_Schreiber];
GO
