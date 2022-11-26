USE [PA_Feinkost]
GO

/****** Object:  Table [dbo].[tb_Arbeitszeit]    Script Date: 22.11.2022 22:06:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Arbeitszeit](
	[ArbID] [int] IDENTITY(1,1) NOT NULL,
	[ArbDatum] [date] NOT NULL,
	[ArbAnfang] [time](0) NOT NULL,
	[ArbEnde] [time](0) NOT NULL,
	[SchID] [int] NOT NULL,
	[MitID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Arbeitszeit] PRIMARY KEY CLUSTERED 
(
	[ArbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Arbeitszeit]  WITH CHECK ADD  CONSTRAINT [FK_tb_Arbeitszeit_tb_Mitarbeiter] FOREIGN KEY([MitID])
REFERENCES [dbo].[tb_Mitarbeiter] ([MitID])
GO

ALTER TABLE [dbo].[tb_Arbeitszeit] CHECK CONSTRAINT [FK_tb_Arbeitszeit_tb_Mitarbeiter]
GO

ALTER TABLE [dbo].[tb_Arbeitszeit]  WITH CHECK ADD  CONSTRAINT [FK_tb_Arbeitszeit_tb_Schicht] FOREIGN KEY([SchID])
REFERENCES [dbo].[tb_Schicht] ([SchID])
GO

ALTER TABLE [dbo].[tb_Arbeitszeit] CHECK CONSTRAINT [FK_tb_Arbeitszeit_tb_Schicht]
GO

ALTER TABLE [dbo].[tb_Arbeitszeit]  WITH CHECK ADD  CONSTRAINT [CK_tb_Arbeitszeit_ArbDatum] CHECK  (([ArbDatum]<=CONVERT([date],getdate())))
GO

ALTER TABLE [dbo].[tb_Arbeitszeit] CHECK CONSTRAINT [CK_tb_Arbeitszeit_ArbDatum]
GO


