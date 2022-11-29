USE PA_Feinkost;
GO
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Gruppe B>
-- Create date: <23.11.2022>
-- Description:	<Zeigt, welcher Lieferant welche Produkte liefert.  

-- =============================================
CREATE OR ALTER FUNCTION tf_003_02_Lieferant_Produkte

(		
	@LieferantID int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT TOP (100) PERCENT 
	tb_Lieferant.LieferantID, tb_Lieferant.LieferantName, tb_Produkt.ProdName, tb_Produkt.ProdEinkaufspreis 
	FROM tb_Lieferant 
		INNER JOIN tb_Produkt 
			ON dbo.tb_Lieferant.LieferantID = dbo.tb_Produkt.LieferantID
	WHERE tb_Lieferant.LieferantID = @LieferantID
	ORDER BY tb_Lieferant.LieferantName
)
GO
