USE [PA_Feinkost]
GO

/****** Object:  StoredProcedure [dbo].[sp_004_05_Verkauf_erstellen]    Script Date: 24.11.2022 10:58:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gruppe B
-- Create date: 24.11.2022
-- Description:	Verkauf - Produkt verkaufen
-- =============================================

CREATE OR ALTER PROCEDURE [dbo].[sp_004_05_Verkauf_erstellen]
	-- Input parameters for the stored procedure here
	@ProdName nvarchar(30),
	@FilName nvarchar(30),
	@Menge decimal(9,3),
	-- Output parameters
	@Erfolg bit OUTPUT,           -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	DECLARE @ProdID AS int;
	DECLARE @FilID AS int;
	DECLARE @VerkEinzelpreis AS smallmoney;
	DECLARE @IstBestand AS decimal(9,3);
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY 
	    -- Prüfung Input-Werte
		IF (@ProdName = '') 	-- @ProdName wurde nicht angegeben, Fehler
		THROW 50001, 'Produktname fehlt, bitte eingeben!', 1;

		IF (@FilName = '') 	-- @FilName wurde nicht angegeben, Fehler
		THROW 50002, 'Filialname fehlt, bitte eingeben!', 1;

		IF (@Menge <= 0) 	-- @Menge <= 0, Fehler
		THROW 50003, 'Menge muss größer Null sein, bitte korrigieren!', 1;

	    -- Prüfung Prozedurvariablen
		SET @ProdID = (SELECT ProdID FROM [dbo].[tb_Produkt]
						   WHERE ProdName = @ProdName);

		IF ((@ProdID IS NULL) OR (@ProdID = '')) 	-- @ProdID wurde nicht gefunden, Fehler
		THROW 50004, 'Produkt für den eingegebenen Produktnamen nicht gefunden, bitte korrigieren!', 1;

		SET @FilID = (SELECT FilID FROM [dbo].[tb_Filiale]
						   WHERE FilName = @FilName);

		IF ((@FilID IS NULL) OR (@FilID = '')) 	-- @FilID wurde nicht gefunden, Fehler
		THROW 50005, 'Filiale für den eingegebenen Filialnamen nicht gefunden, bitte korrigieren!', 1;

		-- Prüfung Buisnesslogik, ist das Produkt im Bestand der Filiale erlaubt bzw. 
		-- kann das Produkt für die Filiale bestellt werden? 

		IF ([dbo].[sf_003_03_Produkt_in_Filiale_erlaubt](@ProdID, @FilID) = 0)  -- Produkt in Filiale nicht erlaubt, Fehler
		THROW 50006, 'Produkt in Filiale nicht vorhanden, bitte korrigieren!', 1;

		SET @VerkEinzelpreis = (SELECT ProdVerkaufspreis FROM [dbo].[tb_Produkt] WHERE ProdID = @ProdID);

		SET @IstBestand = (SELECT [BestIst] FROM [dbo].[tb_Bestand] WHERE (FILID = @FilID AND ProdID = @ProdID));

		IF (@Menge > @IstBestand)
		THROW 50007, 'Nicht genug Bestand verfügbar, bitte weniger verkaufen!', 1;

		INSERT INTO [dbo].[tb_Verkauf]
					([VerkBelegNummer], [VerkMenge], [VerkEinzelpreis], [VerkDatum], [FilID], [ProdID]) VALUES
			        (CONVERT(nvarchar(2), @FilID) + '-' + CONVERT(nvarchar(2), @ProdID) + '-' + FORMAT(GETDATE(), 'yyyyMMddHHmmssff'),
					@Menge,
					@VerkEinzelpreis, 
					getDate(), 
					@FilID,  
					@ProdID);
			
        SET @Erfolg = 1;   -- hat geklappt
		SET @Feedback = 'Produkt wurde verkauft!';

	END TRY 

	BEGIN CATCH
		SET @Erfolg = 0;			-- nicht geklappt--
		SET @Feedback =				-- @Feedback text OUTPUT
			ERROR_MESSAGE() + ' Fehler Nr. '+ CONVERT(varchar, ERROR_NUMBER())
							+ ' Prozedur: '  + ERROR_PROCEDURE()
							+ ' Zeile Nr.: ' + CONVERT(varchar,  ERROR_LINE());
	END CATCH;    
END
GO


