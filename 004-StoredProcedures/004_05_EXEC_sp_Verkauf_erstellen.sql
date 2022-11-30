USE [PA_Feinkost]
GO

DECLARE	@Erfolg bit;            -- geklappt oder nicht
DECLARE	@Feedback VARCHAR(MAX); -- Fehlermeldungen etc.

EXEC [dbo].[sp_004_05_Verkauf_erstellen]
     'Forelle', 
	 'München - Marienplatz', 
	 15,

--EXEC [dbo].[sp_004_05_Verkauf_erstellen]
--   'Forelle', 
--	 'München - Marienplatz', 
--	 30,            -- Fehler, Ist-Bestand war nur 20

--EXEC [dbo].[sp_004_05_Verkauf_erstellen]
--   'Forelle', 
--	 'München - Marienplatz', 
--	 30,

--EXEC [dbo].[sp_004_05_Verkauf_erstellen]
--   'Forelle', 
--	 'München - Marienplat',   -- Fehler, 'z' fehlt bei Platz! => Filiale nicht gefunden.
--	 30,

--EXEC [dbo].[sp_004_05_Verkauf_erstellen]
--     'Forell',				-- Fehler, 'e' fehlt! => Produkt nicht gefunden.
--	 'München - Marienplatz', 
--	 30,
	 ------------------------
	 @Erfolg OUTPUT,
	 @Feedback OUTPUT;

SELECT @Erfolg AS 'Erfolg', @Feedback AS 'Rückgabemeldung';