USE PA_Feinkost
GO

SET IDENTITY_INSERT [dbo].[tb_Produkt] ON
GO

INSERT INTO [dbo].[tb_Produkt] (ProdID, ProdName, ProdEinkaufspreis, ProdVerkaufspreis, EinID, KatID, LieferantID) VALUES
(1,'Rindfleisch', 1.56, 2.95, 1, 1, 1),
(2,'Hühnerfleisch', 1.30, 2.50, 1, 1, 2),
(3,'Gelbwurst', 0.85, 1.30, 1, 1, 1),
(4,'Bananen', 1.23, 1.55, 1, 2, 3),
(5,'Äpfel', 1.35, 1.95, 1, 2, 4),
(6,'Tomaten', 1.55, 1.75, 1, 2, 3),
(7,'Camembert', 2.31, 2.75, 1, 3, 1),
(8,'Gouda', 2.15, 2.55, 1, 3, 2),
(9,'Emmentaler', 2.85, 3.15, 1, 3, 3),
(10,'Pinot Grigio', 8.35, 12.55, 3, 4, 1),
(11,'Whiskey', 25.15, 38.65, 3, 4, 3),
(12,'Vodka', 20.50, 28.50, 3, 4, 4),
(13,'Joghurt', 0.95, 1.45, 3, 5, 2),
(14,'Milch', 1.15, 1.65, 3, 5, 1),
(15,'Sahne', 1.00, 1.35, 3, 5, 4),
(16,'Croissant', 1.50, 1.95, 3, 6, 3),
(17,'Breze', 0.98, 1.35, 3, 6, 3),
(18,'Roggenbrot', 3.55, 4.05, 3, 6, 1),
(19,'Garnelen', 7.85, 8.25, 1, 7, 2),
(20,'Forelle', 6.45, 7.35, 1, 7, 3),
(21,'Hummer', 15.50, 29.50, 1, 7, 1),
(22,'Safran', 7.15, 8.35, 1, 8, 4),
(23,'Kurkuma', 2.65, 3.05, 1, 8, 1),
(24,'Pfeffer', 2.05, 2.55, 1, 8, 3)
GO

SET IDENTITY_INSERT [dbo].[tb_Produkt] OFF
GO