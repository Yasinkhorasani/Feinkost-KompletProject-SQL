USE [PA_Feinkost]
GO

-- Nötig für store procedure
DECLARE	@Erfolg bit;            -- geklappt oder nicht
DECLARE	@Feedback VARCHAR(MAX); -- Fehlermeldungen etc.

SELECT * 
FROM [dbo].[002_02_View_Filiale_Produkt_Bestand]
WHERE FilID = 1      -- München - Marienplatz
  AND ProdID = 20;   -- Forelle

EXEC [dbo].[sp_004_05_Verkauf_erstellen]
     'Forelle', 
	 'München - Marienplatz', 
	 4, 
	 ------------------------
	 @Erfolg OUTPUT,
	 @Feedback OUTPUT;

SELECT @Erfolg AS 'Erfolg', @Feedback AS 'Rückgabemeldung';

SELECT * 
FROM [dbo].[002_02_View_Filiale_Produkt_Bestand]
WHERE FilID = 1      -- München - Marienplatz
  AND ProdID = 20;   -- Forelle