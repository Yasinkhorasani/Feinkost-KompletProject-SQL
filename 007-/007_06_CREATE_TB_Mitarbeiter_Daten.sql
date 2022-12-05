USE PA_Feinkost
GO

INSERT INTO [dbo].[tb_Mitarbeiter] (MitAnrede, MitVorname, MitNachname, MitGebDatum, MitWochenstunden, MitStrasse, MitHausnummer, MitPLZ, MitOrt, MitTel, AbtID) VALUES
('Frau', 'Edit', 'Schulze', '10.12.1986', 40, 'Parkstrasse', '62', '88326', 'M�nchen', '081231232133', 3),
('Frau', 'Catrin', 'Budube', '03.07.2001', 20, 'R�merstrasse', '290', '80237', 'M�nchen', '081254237543', 3),
('Frau', 'Claudia', 'Geselaum�ller', '19.04.1988', 40, 'Eichenweg', '74', '80026', 'M�nchen', '081675486725', 3),
('Frau', 'Ann', 'Horufoweiner', '06.10.1999', 20, 'Kapellenweg', '107', '80347', 'M�nchen', '082457375436', 4),
('Frau', 'Isolde', 'R�lovade', '01.05.1990', 40, 'Brunnenstrasse', '102', '80401', 'M�nchen', '082575254745', 4),
('Frau', 'Marianna', 'Ravugrade', '31.03.1989', 15, 'Weststrasse', '93', '80032', 'M�nchen', '089058256254', 4),
('Herr', 'Claus', 'Tedalateson', '09.02.1992', 40, 'Kirchstrasse', '184', '80001', 'M�nchen', '0804654325435', 5),
('Herr', 'S�nke', 'Nudesadestein', '21.06.1997', 20, 'Gerhart-Hauptmann-Strasse', '181', '80010', 'M�nchen', '080157624522', 5),
('Frau', 'Editha', 'Toresadem�ller', '08.05.1994', 40, 'Heinrich-Heine-Strasse', '205', '80200', 'M�nchen', '080846758454', 5),
('Herr', 'Frederic', 'Gitesademeiner', '13.09.1999', 30, 'Lilienweg', '137', '80055', 'M�nchen', '', 5),
('Frau', 'Alena', 'Zivalatem�ller', '26.07.1996', 40, 'Mozartstrasse', '240', '90456', 'N�rnberg', '0905267546', 24),
('Herr', 'Ernest', 'K�hler', '05.06.1997', 20, 'Wiesengrund', '225', '90402', 'N�rnberg', '0912454238', 24),
('Frau', 'Katrin', 'Wavovodeweiner', '18.07.2003', 35, 'Schlossstrasse', '261', '90407', 'N�rnberg', '09243563423', 24),
('Herr', 'Heinz-G�nther', 'Rutifere', '27.05.1999', 20, 'Weiherstrasse', '9', '90417', 'N�rnberg', '093435626', 25),
('Herr', 'Sven', 'Nedoschattson', '10.12.1986', 40, 'Mozartstrasse', '34', '88326', 'M�nchen', '081254237543', 6),
('Frau', 'Hanna', 'Fuchs', '03.07.2001', 20, 'Eichenstrasse', '59', '80237', 'M�nchen', '081675485462', 6),
('Herr', 'Olaf', 'Nulafohein', '19.04.1988', 40, 'Tannenstrasse', '38', '80026', 'M�nchen', '08245455436', 7),
('Frau', 'Janin', 'G�vubede', '06.10.1999', 20, 'Zeppelinstrasse', '48', '80347', 'M�nchen', '0825752554645', 7),
('Herr', 'Branko', 'Putalate', '01.05.1990', 40, 'Marktstrasse', '119', '80401', 'M�nchen', '089058223254', 7),
('Frau', 'Beate', 'Jetuschatt', '31.03.1989', 15, 'Siemensstrasse', '4d', '80032', 'M�nchen', '08046543535', 8),
('Frau', 'Hilda', 'Schmidt', '09.02.1992', 40, 'Pestalozzistrasse', '216', '80001', 'M�nchen', '08015734522', 9),
('Herr', 'Engelbert', 'Letifostein', '21.06.1997', 20, 'Daimlerstrasse', '76', '80010', 'M�nchen', '08084674', 10),
('Frau', 'Alexandra', 'Nilivadehein', '08.05.1994', 40, 'Asternweg', '71', '80011', 'M�nchen', '081254237543', 10),
('Frau', 'Zita', 'Holosede', '13.09.1999', 30, 'H�lderlinstrasse', '285', '90456', 'N�rnberg', '0905275446', 25),
('Herr', 'Harold', 'Cavosedehein', '26.07.1996', 40, 'Kirchenweg', '166', '90402', 'N�rnberg', '091245548', 26),
('Frau', 'Elfi', 'Lorulode', '05.06.1997', 20, 'Schwalbenweg', '100', '90407', 'N�rnberg', '09243243423', 26),
('Frau', 'Sabine', 'Schwarz', '18.07.2003', 35, 'Veilchenweg', '120', '90417', 'N�rnberg', '0934357626', 26)
GO