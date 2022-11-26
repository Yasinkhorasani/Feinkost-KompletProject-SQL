USE [PA_Feinkost]
GO

/****** Object:  Table [dbo].[tb_Schicht]    Script Date: 22.11.2022 22:28:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Schicht](
	[SchID] [int] IDENTITY(1,1) NOT NULL,
	[SchName] [nchar](20) NOT NULL,
	[SchAnfang] [time](0) NOT NULL,
	[SchEnde] [time](0) NOT NULL,
 CONSTRAINT [PK_tb_Schicht] PRIMARY KEY CLUSTERED 
(
	[SchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


