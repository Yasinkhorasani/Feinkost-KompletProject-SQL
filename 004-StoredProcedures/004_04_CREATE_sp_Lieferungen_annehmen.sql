USE [PA_Feinkost]
GO

/****** Object:  StoredProcedure [dbo].[sp_004_04_Lieferungen_annehmen]    Script Date: 23.11.2022 10:58:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gruppe B
-- Create date: 22.11.2022
-- Description:	Neue Lieferung
-- =============================================

CREATE OR ALTER PROCEDURE [dbo].[sp_004_04_Lieferungen_annehmen]
	-- Input parameters for the stored procedure here
	@LiefID int,
	@LiefNum nvarchar(10),
	-- Output parameters
	@Erfolg bit OUTPUT,           -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY 
		DECLARE @BestMax AS decimal(9,3);
		DECLARE @BestIst AS decimal(9,3);
		DECLARE @LiefMenge AS decimal(9,3);
		DECLARE @ProdID AS int;
		DECLARE @FilID AS int;

	    -- Prüfung Input-Werte
		IF (@LiefID <= 0) 	-- @LiefID wurde nicht angegeben, Fehler
		THROW 50001, 'LieferungsID fehlt, bitte eingeben!', 1;

		IF (@LiefNum = '') 	-- @LiefNum wurde nicht angegeben, Fehler
		THROW 50002, 'Lieferungsnummer fehlt, bitte eingeben!', 1;

		IF ((SELECT COUNT(*) FROM [dbo].[tb_Lieferung] WHERE LiefID = @LiefID) = 0)   -- Lieferung existiert nicht, Fehler
		THROW 50003, 'Lieferung mit der eingegebenen ID existiert nicht, bitte korrigieren!', 1;

	    -- Prüfung Prozedurvariablen
		SET @ProdID = (SELECT ProdID FROM [dbo].[tb_Lieferung] WHERE LiefID = @LiefID);
		SET @FilID = (SELECT FilID FROM [dbo].[tb_Lieferung] WHERE LiefID = @LiefID);
		SET @LiefMenge = (SELECT LiefMenge FROM [dbo].[tb_Lieferung] WHERE LiefID = @LiefID);

		SET @BestMax = (SELECT BestMax FROM [dbo].[tb_Bestand] WHERE ProdId = @ProdID AND FilId = @FilID);
		SET @BestIst = (SELECT BestIst FROM [dbo].[tb_Bestand] WHERE ProdId = @ProdID AND FilId = @FilID);

		IF (@BestMax < @BestIst + @LiefMenge) 	-- Prüfung Überschreitung Max-Bestand
		THROW 50004, 'Produkt kann nicht angenommen werden, weil der Max-Bestand überschritten wird, Lieferung entsprechen anpassen!', 1;

		UPDATE [dbo].[tb_Lieferung] SET LiefNum = @LiefNum, LiefLiefDatum = getDate()
		WHERE LiefID = @LiefID;

        SET @Erfolg = 1;   -- hat geklappt
		SET @Feedback = 'Lieferung wurde angenommen und der Bestand in der Filiale erhöht!';

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


