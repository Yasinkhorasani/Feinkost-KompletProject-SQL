USE [PA_Feinkost];
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gruppe B
-- Create date: 22.11.2022
-- Description:	Zeitstempel: 20221122-105151150
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[sf_003_01_Zeitstempel] 
(
)
RETURNS char(18)
AS
BEGIN
	RETURN FORMAT(GETDATE(), 'yyyyMMdd-HHmmssfff');
END
GO