USE [PA_Feinkost]
GO

/****** Object:  Table [dbo].[tb_Produkt]    Script Date: 22.11.2022 22:28:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Produkt](
	[ProdID] [int] IDENTITY(1,1) NOT NULL,
	[ProdName] [nvarchar](30) NOT NULL,
	[ProdEinkaufspreis] [smallmoney] NOT NULL,
	[ProdVerkaufspreis] [smallmoney] NOT NULL,
	[EinID] [int] NOT NULL,
	[KatID] [int] NOT NULL,
	[LieferantID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Produkt] PRIMARY KEY CLUSTERED 
(
	[ProdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Produkt]  WITH CHECK ADD  CONSTRAINT [FK_tb_Produkt_tb_Einheit] FOREIGN KEY([EinID])
REFERENCES [dbo].[tb_Einheit] ([EinID])
GO

ALTER TABLE [dbo].[tb_Produkt] CHECK CONSTRAINT [FK_tb_Produkt_tb_Einheit]
GO

ALTER TABLE [dbo].[tb_Produkt]  WITH CHECK ADD  CONSTRAINT [FK_tb_Produkt_tb_Kategorie] FOREIGN KEY([KatID])
REFERENCES [dbo].[tb_Kategorie] ([KatID])
GO

ALTER TABLE [dbo].[tb_Produkt] CHECK CONSTRAINT [FK_tb_Produkt_tb_Kategorie]
GO

ALTER TABLE [dbo].[tb_Produkt]  WITH CHECK ADD  CONSTRAINT [FK_tb_Produkt_tb_Lieferant] FOREIGN KEY([LieferantID])
REFERENCES [dbo].[tb_Lieferant] ([LieferantID])
GO

ALTER TABLE [dbo].[tb_Produkt] CHECK CONSTRAINT [FK_tb_Produkt_tb_Lieferant]
GO

ALTER TABLE [dbo].[tb_Produkt]  WITH CHECK ADD  CONSTRAINT [CK_tb_Produkt_ProdEinkaufspreis] CHECK  (([ProdEinkaufspreis]>(0) AND [ProdEinkaufspreis]<[ProdVerkaufspreis]))
GO

ALTER TABLE [dbo].[tb_Produkt] CHECK CONSTRAINT [CK_tb_Produkt_ProdEinkaufspreis]
GO


