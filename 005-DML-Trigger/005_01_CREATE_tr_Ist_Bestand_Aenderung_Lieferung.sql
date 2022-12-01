USE [PA_Feinkost]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gruppe B
-- Create date: 23.11.2022
-- Description:	Bestandsänderung bei Lieferungseingang
-- =============================================

CREATE OR ALTER TRIGGER [dbo].[005_01_tr_Ist_Bestand_Aenderung_Lieferung] 
   ON [dbo].[tb_Lieferung]  
   FOR UPDATE 
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @NummerAlt nvarchar(10);
	DECLARE @NummerNeu nvarchar(10);
	DECLARE @Datum date;
	DECLARE @Menge decimal(9,3);
	DECLARE @ProdId int;
	DECLARE @FilId int;
	------------------------------

	DECLARE @msg AS varchar(MAX);			
	------------------------------

	-- Lieferung prüfen, ob LiefNum von Null auf Wert geht. 
	SELECT @NummerAlt = LiefNum FROM deleted;
	SELECT @NummerNeu = LiefNum FROM inserted;

	SELECT @Menge  = LiefMenge FROM inserted;
	SELECT @ProdId = ProdId FROM inserted;
	SELECT @FilId  = FilId FROM inserted;

	IF ((@NummerAlt IS NULL) AND (@NummerNeu IS NOT NULL))
	BEGIN
		UPDATE [dbo].[tb_Bestand] SET BestIst = BestIst + @Menge
		WHERE FilID = @FilId
		  AND ProdID = @ProdId;	
	END
END
GO