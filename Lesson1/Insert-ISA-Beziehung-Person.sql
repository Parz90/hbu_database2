USE [ISA-Person]

INSERT INTO Person ([Pers-Nr], Name, Adresse, Geburtsdatum)
		VALUES (1, 'Balmelli', 'Dorfstrasse 10', CONVERT(DATE, '01.01.1990', 104)),
			   (2, 'Bürgin', 'Bahnhofstrasse 55', CONVERT(DATE, '10.10.1996', 104))

INSERT INTO Kunde([Pers-Nr], Funktion, Umsatz)
		VALUES (3, 'Informatiker', '33%'),
			   (4, 'Automatiker', '50%')

INSERT INTO Dozent([Pers-Nr], Biographie, Honorartag)
		VALUES (5, 'Test1', '1000'),
			   (6, 'Test2', '5000')
