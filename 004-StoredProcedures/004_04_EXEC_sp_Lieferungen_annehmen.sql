USE [PA_Feinkost]
GO

DECLARE	@Erfolg bit;            -- geklappt oder nicht
DECLARE	@Feedback VARCHAR(MAX); -- Fehlermeldungen etc.

EXEC [dbo].[sp_004_04_Lieferungen_annehmen]
     -- Fehler
	 --14,    
	 --'UVW14',

	 -- Erfolg :-)
     13,    
	 'UVW14',
	 ------------------------
	 @Erfolg OUTPUT,
	 @Feedback OUTPUT;

SELECT @Erfolg AS 'Erfolg', @Feedback AS 'Rückgabemeldung';