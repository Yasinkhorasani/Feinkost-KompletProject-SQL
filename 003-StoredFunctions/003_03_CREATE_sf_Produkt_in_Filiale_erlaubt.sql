USE [PA_Feinkost]
GO
/****** Object:  UserDefinedFunction [dbo].[sf_003_03_Produkt_in_Filiale_erlaubt]    Script Date: 23.11.2022 13:09:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 23.11.2022
-- Description:	Bestand in Filiale erlaubt
-- =============================================

CREATE OR ALTER FUNCTION [dbo].[sf_003_03_Produkt_in_Filiale_erlaubt] 
(
	@ProdID int,
	@FilID int
)
RETURNS bit
AS
BEGIN
	-- Rückgabevariable dekaltieren
	DECLARE @BestandErlaubt bit;

	-- Add the T-SQL statements to compute the return value here
	SELECT @BestandErlaubt = COUNT(*)
			FROM dbo.tb_Bestand
			WHERE ((ProdID = @ProdID)
			AND    (FilID = @FilID));

	-- Return the result of the function
	RETURN @BestandErlaubt;
END
GO