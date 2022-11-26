USE [PA_Feinkost]
GO

/****** Object:  Table [dbo].[tb_Verkauf]    Script Date: 22.11.2022 22:28:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Verkauf](
	[VerkID] [int] IDENTITY(1,1) NOT NULL,
	[VerkBelegNummer] [nvarchar](25) NOT NULL,
	[VerkMenge] [decimal](9, 3) NOT NULL,
	[VerkEinzelpreis] [smallmoney] NOT NULL,
	[VerkDatum] [date] NOT NULL,
	[FilID] [int] NOT NULL,
	[ProdID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Verkauf] PRIMARY KEY CLUSTERED 
(
	[VerkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Verkauf]  WITH CHECK ADD  CONSTRAINT [FK_tb_Verkauf_tb_Filiale] FOREIGN KEY([FilID])
REFERENCES [dbo].[tb_Filiale] ([FilID])
GO

ALTER TABLE [dbo].[tb_Verkauf] CHECK CONSTRAINT [FK_tb_Verkauf_tb_Filiale]
GO

ALTER TABLE [dbo].[tb_Verkauf]  WITH CHECK ADD  CONSTRAINT [FK_tb_Verkauf_tb_Produkt] FOREIGN KEY([ProdID])
REFERENCES [dbo].[tb_Produkt] ([ProdID])
GO

ALTER TABLE [dbo].[tb_Verkauf] CHECK CONSTRAINT [FK_tb_Verkauf_tb_Produkt]
GO

ALTER TABLE [dbo].[tb_Verkauf]  WITH CHECK ADD  CONSTRAINT [CK_tb_Verkauf_VerkDatum] CHECK  (([VerkDatum]>=CONVERT([date],getdate())))
GO

ALTER TABLE [dbo].[tb_Verkauf] CHECK CONSTRAINT [CK_tb_Verkauf_VerkDatum]
GO

ALTER TABLE [dbo].[tb_Verkauf]  WITH CHECK ADD  CONSTRAINT [CK_tb_Verkauf_VerkEinzelpreis] CHECK  (([VerkEinzelpreis]>(0)))
GO

ALTER TABLE [dbo].[tb_Verkauf] CHECK CONSTRAINT [CK_tb_Verkauf_VerkEinzelpreis]
GO

ALTER TABLE [dbo].[tb_Verkauf]  WITH CHECK ADD  CONSTRAINT [CK_tb_Verkauf_VerkMenge] CHECK  (([VerkMenge]<>(0)))
GO

ALTER TABLE [dbo].[tb_Verkauf] CHECK CONSTRAINT [CK_tb_Verkauf_VerkMenge]
GO


