USE [PA_Feinkost]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gruppe B
-- Create date: 24.11.2022
-- Description:	Bestandsänderungsinfo unter Min-Bestand
-- =============================================

CREATE OR ALTER TRIGGER [dbo].[tr_005_03_Ist_Bestand_Info_Min_unterschritten] 
   ON [dbo].[tb_Bestand]  
   FOR UPDATE 
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @msg AS varchar(MAX);	
	------------------------------

    -- Variablen für IST-Bestandsprüfung gegen Min-Bestand 
	DECLARE @IstMenge decimal(9,3);
	DECLARE @MinMenge decimal(9,3);
	DECLARE @DiffMenge decimal(9,3);

	DECLARE @ProdName nvarchar(30);
	DECLARE @ProdId int;
	DECLARE @FilName nvarchar(30);
	DECLARE @FilId int;
	------------------------------

	-- Variablen initalisieren
	SELECT @IstMenge = BestIst FROM inserted;
	SELECT @MinMenge = BestMin FROM inserted;
	SELECT @ProdId = ProdId FROM inserted;
	SELECT @FilId  = FilId FROM inserted;

	IF(@IstMenge < @MinMenge)
	BEGIN
			SET @DiffMenge = @MinMenge - @IstMenge;

			SET @ProdName = (SELECT [ProdName] FROM [dbo].[tb_Produkt] WHERE ProdID = @ProdId);
			SET @FilName = (SELECT [FilName] FROM [dbo].[tb_Filiale] WHERE FilID = @FilId);
			
			SET @msg = 
			FORMATMESSAGE('Produkt %s (ID: %i) in Filiale %s (ID: %i) hat den Mindestbestand von %s um %s unterschritten! Bitte nachbestellen!',
			@ProdName, @ProdId, @FilName, @FilId, FORMAT(@MinMenge, 'G', 'de-de'), FORMAT(@DiffMenge, 'G', 'de-de')); 

			SELECT @msg AS 'Nachbestellungsmitteilung';

	END  -- IF(@IstMenge < @MinMenge)
END
GO