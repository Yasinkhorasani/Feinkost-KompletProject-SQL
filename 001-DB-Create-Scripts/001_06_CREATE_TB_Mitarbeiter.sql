USE [PA_Feinkost]
GO

/****** Object:  Table [dbo].[tb_Mitarbeiter]    Script Date: 22.11.2022 22:27:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Mitarbeiter](
	[MitID] [int] IDENTITY(1,1) NOT NULL,
	[MitAnrede] [nchar](5) NOT NULL,
	[MitVorname] [nchar](20) NOT NULL,
	[MitNachname] [nchar](30) NOT NULL,
	[MitGebDatum] [date] NOT NULL,
	[MitWochenstunden] [smallint] NOT NULL,
	[MitStrasse] [nvarchar](30) NOT NULL,
	[MitHausnummer] [nvarchar](10) NOT NULL,
	[MitPLZ] [nchar](5) NOT NULL,
	[MitOrt] [nvarchar](20) NOT NULL,
	[MitTel] [nvarchar](20) NULL,
	[AbtID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[MitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [FK_tb_Mitarbeiter_tb_Abteilung] FOREIGN KEY([AbtID])
REFERENCES [dbo].[tb_Abteilung] ([AbtID])
GO

ALTER TABLE [dbo].[tb_Mitarbeiter] CHECK CONSTRAINT [FK_tb_Mitarbeiter_tb_Abteilung]
GO

ALTER TABLE [dbo].[tb_Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [CK_tb_Mitarbeiter_MitAnrede] CHECK  (([MitAnrede]='Herr' OR [MitAnrede]='Frau'))
GO

ALTER TABLE [dbo].[tb_Mitarbeiter] CHECK CONSTRAINT [CK_tb_Mitarbeiter_MitAnrede]
GO

ALTER TABLE [dbo].[tb_Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [CK_tb_Mitarbeiter_MitGebDatum] CHECK  (([MitGebDatum]<CONVERT([date],getdate())))
GO

ALTER TABLE [dbo].[tb_Mitarbeiter] CHECK CONSTRAINT [CK_tb_Mitarbeiter_MitGebDatum]
GO

ALTER TABLE [dbo].[tb_Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [CK_tb_Mitarbeiter_MitWochenstunden] CHECK  (([MitWochenstunden]>=(10) AND [MitWochenstunden]<=(40)))
GO

ALTER TABLE [dbo].[tb_Mitarbeiter] CHECK CONSTRAINT [CK_tb_Mitarbeiter_MitWochenstunden]
GO


