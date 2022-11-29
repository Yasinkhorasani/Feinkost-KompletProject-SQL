USE [PA_Feinkost]
GO

/****** Object:  View [dbo].[002_05_View_Abteilungen_mit_min_3_Mitarbeiter]    Script Date: 24.11.2022 16:37:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[002_05_View_Abteilungen_mit_min_3_Mitarbeiter]
AS
SELECT        dbo.tb_Filiale.FilName, dbo.tb_Abteilung.AbtName, COUNT(dbo.tb_Mitarbeiter.MitID) AS [Anzahl Mitarbeiter]
FROM            dbo.tb_Filiale INNER JOIN
                         dbo.tb_Abteilung ON dbo.tb_Filiale.FilID = dbo.tb_Abteilung.FilID INNER JOIN
                         dbo.tb_Mitarbeiter ON dbo.tb_Abteilung.AbtID = dbo.tb_Mitarbeiter.AbtID
GROUP BY dbo.tb_Filiale.FilName, dbo.tb_Abteilung.AbtName
HAVING        (COUNT(dbo.tb_Mitarbeiter.MitID) >= 3)
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_Filiale"
            Begin Extent = 
               Top = 9
               Left = 43
               Bottom = 183
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Abteilung"
            Begin Extent = 
               Top = 8
               Left = 342
               Bottom = 138
               Right = 525
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_Mitarbeiter"
            Begin Extent = 
               Top = 6
               Left = 609
               Bottom = 276
               Right = 819
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'002_05_View_Abteilungen_mit_min_3_Mitarbeiter'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'002_05_View_Abteilungen_mit_min_3_Mitarbeiter'
GO

