USE [PA_Feinkost]
GO

CREATE USER [PA_Feinkost_Leser] FOR LOGIN [PA_FeinkostReader]
GO

use [PA_Feinkost]
GO

GRANT SELECT ON [dbo].[tb_Bestand] ([BestMax]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[002_02_View_Filiale_Produkt_Bestand] ([BestMax]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[tb_Bestand] ([BestMin]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[tb_Bestand] ([ProdID]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[tb_Bestand] ([BestIst]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[002_02_View_Filiale_Produkt_Bestand] ([BestMin]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[002_02_View_Filiale_Produkt_Bestand] ([FilName]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[tb_Produkt] ([ProdID]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[tb_Produkt] ([LieferantID]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[002_02_View_Filiale_Produkt_Bestand] ([BestIst]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[tb_Bestand] ([BestID]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[tb_Produkt] ([EinID]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[tb_Lieferant] ([LieferantName]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[tb_Lieferant] ([LieferantID]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[tb_Produkt] ([ProdName]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[tb_Bestand] ([FilID]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[002_02_View_Filiale_Produkt_Bestand] ([ProdName]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[002_02_View_Filiale_Produkt_Bestand] ([FilID]) TO [PA_Feinkost_Leser]
GO
GRANT VIEW DEFINITION ON [dbo].[002_02_View_Filiale_Produkt_Bestand] TO [PA_Feinkost_Leser]
GO

GRANT INSERT ON [dbo].[002_02_View_Filiale_Produkt_Bestand] TO [PA_Feinkost_Leser]
GO

GRANT DELETE ON [dbo].[002_02_View_Filiale_Produkt_Bestand] TO [PA_Feinkost_Leser]
GO

GRANT CONTROL ON [dbo].[002_02_View_Filiale_Produkt_Bestand] TO [PA_Feinkost_Leser]
GO

GRANT REFERENCES ON [dbo].[002_02_View_Filiale_Produkt_Bestand] TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[002_02_View_Filiale_Produkt_Bestand] ([ProdID]) TO [PA_Feinkost_Leser]
GO

GRANT SELECT ON [dbo].[tb_Produkt] ([KatID]) TO [PA_Feinkost_Leser]
GO
