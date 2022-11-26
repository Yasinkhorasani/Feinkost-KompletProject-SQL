USE [PA_Feinkost]
GO

/****** Object:  Table [dbo].[tb_Lieferung]    Script Date: 23.11.2022 09:49:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Lieferung](
	[LiefID] [int] IDENTITY(1,1) NOT NULL,
	[LiefNum] [nvarchar](10) NULL,
	[LiefMenge] [decimal](9, 3) NOT NULL,
	[LiefEinzelpreis] [smallmoney] NOT NULL,
	[LiefBestDatum] [date] NOT NULL,
	[LiefLiefDatum] [date] NULL,
	[FilID] [int] NOT NULL,
	[ProdID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Lieferung] PRIMARY KEY CLUSTERED 
(
	[LiefID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Lieferung]  WITH CHECK ADD  CONSTRAINT [FK_tb_Lieferung_tb_Filiale] FOREIGN KEY([FilID])
REFERENCES [dbo].[tb_Filiale] ([FilID])
GO

ALTER TABLE [dbo].[tb_Lieferung] CHECK CONSTRAINT [FK_tb_Lieferung_tb_Filiale]
GO

ALTER TABLE [dbo].[tb_Lieferung]  WITH CHECK ADD  CONSTRAINT [FK_tb_Lieferung_tb_Produkt] FOREIGN KEY([ProdID])
REFERENCES [dbo].[tb_Produkt] ([ProdID])
GO

ALTER TABLE [dbo].[tb_Lieferung] CHECK CONSTRAINT [FK_tb_Lieferung_tb_Produkt]
GO

ALTER TABLE [dbo].[tb_Lieferung]  WITH CHECK ADD  CONSTRAINT [CK_tb_Lieferung_LiefBestDatum] CHECK  (([LiefBestDatum]>=CONVERT([date],getdate())))
GO

ALTER TABLE [dbo].[tb_Lieferung] CHECK CONSTRAINT [CK_tb_Lieferung_LiefBestDatum]
GO

ALTER TABLE [dbo].[tb_Lieferung]  WITH CHECK ADD  CONSTRAINT [CK_tb_Lieferung_LiefEinzelpreis] CHECK  (([LiefEinzelpreis]>(0)))
GO

ALTER TABLE [dbo].[tb_Lieferung] CHECK CONSTRAINT [CK_tb_Lieferung_LiefEinzelpreis]
GO

ALTER TABLE [dbo].[tb_Lieferung]  WITH CHECK ADD  CONSTRAINT [CK_tb_Lieferung_LiefLiefDatum] CHECK  (([LiefLiefDatum]>=[LiefBestDatum]))
GO

ALTER TABLE [dbo].[tb_Lieferung] CHECK CONSTRAINT [CK_tb_Lieferung_LiefLiefDatum]
GO

ALTER TABLE [dbo].[tb_Lieferung]  WITH CHECK ADD  CONSTRAINT [CK_tb_Lieferung_LiefMenge] CHECK  (([LiefMenge]<>(0)))
GO

ALTER TABLE [dbo].[tb_Lieferung] CHECK CONSTRAINT [CK_tb_Lieferung_LiefMenge]
GO


