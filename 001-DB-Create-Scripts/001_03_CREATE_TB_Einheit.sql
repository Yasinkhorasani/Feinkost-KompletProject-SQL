USE [PA_Feinkost]
GO

/****** Object:  Table [dbo].[tb_Einheit]    Script Date: 22.11.2022 22:22:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Einheit](
	[EinID] [int] IDENTITY(1,1) NOT NULL,
	[EinName] [nchar](20) NOT NULL,
	[EinAbk] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tb_Einheit] PRIMARY KEY CLUSTERED 
(
	[EinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Einheit]  WITH CHECK ADD  CONSTRAINT [CK_tb_Einheit_EinAbk] CHECK  (([EinAbk]='kg' OR [EinAbk]='g' OR [EinAbk]='l' OR [EinAbk]='ml' OR [EinAbk]='Stk'))
GO

ALTER TABLE [dbo].[tb_Einheit] CHECK CONSTRAINT [CK_tb_Einheit_EinAbk]
GO

ALTER TABLE [dbo].[tb_Einheit]  WITH CHECK ADD  CONSTRAINT [CK_tb_Einheit_EinName] CHECK  (([EinName]='Kilogramm' OR [EinName]='Gramm' OR [EinName]='Liter' OR [EinName]='Milliliter' OR [EinName]='Stück'))
GO

ALTER TABLE [dbo].[tb_Einheit] CHECK CONSTRAINT [CK_tb_Einheit_EinName]
GO


