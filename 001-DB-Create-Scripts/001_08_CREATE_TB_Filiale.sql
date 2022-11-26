USE [PA_Feinkost]
GO

/****** Object:  Table [dbo].[tb_Filiale]    Script Date: 22.11.2022 22:22:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Filiale](
	[FilID] [int] IDENTITY(1,1) NOT NULL,
	[FilName] [nvarchar](30) NOT NULL,
	[FilStrasse] [nvarchar](30) NOT NULL,
	[FilHausnummer] [nvarchar](10) NOT NULL,
	[FilPlz] [nchar](5) NOT NULL,
	[FilOrt] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tb_Filiale] PRIMARY KEY CLUSTERED 
(
	[FilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


