USE [PA_Feinkost]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gruppe B
-- Create date: 24.11.2022
-- Description:	Bestandsänderung bei Verkauf
-- =============================================

CREATE OR ALTER TRIGGER [dbo].[tr_005_02_Ist_Bestand_Aenderung_Verkauf] 
   ON [dbo].[tb_Verkauf]  
   FOR INSERT 
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @Menge decimal(9,3);
	DECLARE @ProdId int;
	DECLARE @FilId int;
	------------------------------

	DECLARE @msg AS varchar(MAX);			
	------------------------------

	-- Lieferung prüfen, ob LiefNum von Null auf Wert geht. 
	SELECT @Menge  = VerkMenge FROM inserted;
	SELECT @ProdId = ProdId FROM inserted;
	SELECT @FilId  = FilId FROM inserted;

	BEGIN
		UPDATE [dbo].[tb_Bestand] SET BestIst = BestIst - @Menge
		WHERE FilID = @FilId
		  AND ProdID = @ProdId;	
	END
END
GO