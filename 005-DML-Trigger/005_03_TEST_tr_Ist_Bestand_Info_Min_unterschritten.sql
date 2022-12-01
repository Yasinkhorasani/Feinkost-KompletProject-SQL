USE [PA_Feinkost]
GO

-- N�tig f�r store procedure
DECLARE	@Erfolg bit;            -- geklappt oder nicht
DECLARE	@Feedback VARCHAR(MAX); -- Fehlermeldungen etc.

SELECT * 
FROM [dbo].[002_02_View_Filiale_Produkt_Bestand]
WHERE FilID = 1      -- M�nchen - Marienplatz
  AND ProdID = 20;   -- Forelle

EXEC [dbo].[sp_004_05_Verkauf_erstellen]
     'Forelle', 
	 'M�nchen - Marienplatz', 
	 4, 
	 ------------------------
	 @Erfolg OUTPUT,
	 @Feedback OUTPUT;

SELECT @Erfolg AS 'Erfolg', @Feedback AS 'R�ckgabemeldung';

SELECT * 
FROM [dbo].[002_02_View_Filiale_Produkt_Bestand]
WHERE FilID = 1      -- M�nchen - Marienplatz
  AND ProdID = 20;   -- Forelle