USE [PA_Feinkost]
GO

/****** Object:  Table [dbo].[tb_Lieferant]    Script Date: 22.11.2022 22:23:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Lieferant](
	[LieferantID] [int] IDENTITY(1,1) NOT NULL,
	[LieferantName] [nvarchar](30) NOT NULL,
	[LieferantStrasse] [nvarchar](30) NOT NULL,
	[LieferantHausnummer] [nvarchar](10) NOT NULL,
	[LieferantPLZ] [nchar](5) NOT NULL,
	[LieferantOrt] [nvarchar](20) NOT NULL,
	[LieferantTel] [nvarchar](20) NULL,
 CONSTRAINT [PK_tb_Lieferant] PRIMARY KEY CLUSTERED 
(
	[LieferantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


