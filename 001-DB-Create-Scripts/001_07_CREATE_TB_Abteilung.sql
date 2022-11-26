USE [PA_Feinkost]
GO

/****** Object:  Table [dbo].[tb_Abteilung]    Script Date: 22.11.2022 22:05:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Abteilung](
	[AbtID] [int] IDENTITY(1,1) NOT NULL,
	[AbtName] [nvarchar](50) NOT NULL,
	[KatID] [int] NOT NULL,
	[FilID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Abteilung] PRIMARY KEY CLUSTERED 
(
	[AbtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Abteilung]  WITH CHECK ADD  CONSTRAINT [FK_tb_Abteilung_tb_Filiale] FOREIGN KEY([FilID])
REFERENCES [dbo].[tb_Filiale] ([FilID])
GO

ALTER TABLE [dbo].[tb_Abteilung] CHECK CONSTRAINT [FK_tb_Abteilung_tb_Filiale]
GO

ALTER TABLE [dbo].[tb_Abteilung]  WITH CHECK ADD  CONSTRAINT [FK_tb_Abteilung_tb_Kategorie] FOREIGN KEY([KatID])
REFERENCES [dbo].[tb_Kategorie] ([KatID])
GO

ALTER TABLE [dbo].[tb_Abteilung] CHECK CONSTRAINT [FK_tb_Abteilung_tb_Kategorie]
GO


