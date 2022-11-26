USE [PA_Feinkost]
GO

/****** Object:  Table [dbo].[tb_Bestand]    Script Date: 23.11.2022 09:47:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Bestand](
	[BestID] [int] IDENTITY(1,1) NOT NULL,
	[BestIst] [decimal](9, 3) NOT NULL,
	[BestMin] [decimal](9, 3) NOT NULL,
	[BestMax] [decimal](9, 3) NOT NULL,
	[FilID] [int] NOT NULL,
	[ProdID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Bestand] PRIMARY KEY CLUSTERED 
(
	[BestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Bestand] ADD  CONSTRAINT [DF_tb_Bestand_BestIst]  DEFAULT ((0)) FOR [BestIst]
GO

ALTER TABLE [dbo].[tb_Bestand] ADD  CONSTRAINT [DF_tb_Bestand_BestMin]  DEFAULT ((0)) FOR [BestMin]
GO

ALTER TABLE [dbo].[tb_Bestand] ADD  CONSTRAINT [DF_tb_Bestand_BestMax]  DEFAULT ((0)) FOR [BestMax]
GO

ALTER TABLE [dbo].[tb_Bestand]  WITH CHECK ADD  CONSTRAINT [FK_tb_Bestand_tb_Filiale] FOREIGN KEY([FilID])
REFERENCES [dbo].[tb_Filiale] ([FilID])
GO

ALTER TABLE [dbo].[tb_Bestand] CHECK CONSTRAINT [FK_tb_Bestand_tb_Filiale]
GO

ALTER TABLE [dbo].[tb_Bestand]  WITH CHECK ADD  CONSTRAINT [FK_tb_Bestand_tb_Produkt] FOREIGN KEY([ProdID])
REFERENCES [dbo].[tb_Produkt] ([ProdID])
GO

ALTER TABLE [dbo].[tb_Bestand] CHECK CONSTRAINT [FK_tb_Bestand_tb_Produkt]
GO

ALTER TABLE [dbo].[tb_Bestand]  WITH CHECK ADD  CONSTRAINT [CK_tb_Bestand_BestIst] CHECK  (([BestIst]>=(0) AND [BestIst]<=[BestMax]))
GO

ALTER TABLE [dbo].[tb_Bestand] CHECK CONSTRAINT [CK_tb_Bestand_BestIst]
GO

ALTER TABLE [dbo].[tb_Bestand]  WITH CHECK ADD  CONSTRAINT [CK_tb_Bestand_Min_Max] CHECK  (([BestMin]>=(0) AND [BestMax]>=(0)))
GO

ALTER TABLE [dbo].[tb_Bestand] CHECK CONSTRAINT [CK_tb_Bestand_Min_Max]
GO


