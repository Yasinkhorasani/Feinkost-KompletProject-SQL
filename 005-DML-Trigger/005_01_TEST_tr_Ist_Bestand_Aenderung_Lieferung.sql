USE [PA_Feinkost]
GO

INSERT INTO [dbo].[tb_Lieferung] (LiefMenge, LiefBestDatum, LiefEinzelpreis, ProdID, FilID) VALUES
(20, '2022-11-23', 6.45, 20, 1);

SELECT * 
FROM [dbo].[002_02_View_Filiale_Produkt_Bestand]
WHERE FilID = 1
  AND ProdID = 20;

UPDATE [dbo].[tb_Lieferung] SET LiefNum = 'ABC117', LiefLiefDatum = '2022-11-23'
WHERE FilID = 1
  AND ProdID = 20;

SELECT * 
FROM [dbo].[002_02_View_Filiale_Produkt_Bestand]
WHERE FilID = 1
  AND ProdID = 20;