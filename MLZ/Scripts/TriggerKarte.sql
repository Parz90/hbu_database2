USE Kreditkartenpruefung
GO

CREATE TRIGGER trInsertKarte
ON Karte
FOR INSERT AS
BEGIN
DECLARE @Kartennummer INT;
DECLARE @Sicherheitscode INT;

SELECT @Kartennummer = Kartennummer FROM inserted;
SELECT @Sicherheitscode = Sicherheitscode FROM inserted;

IF EXISTS(SELECT * FROM Karte WHERE Kartennummer = @Kartennummer and Sicherheitscode = @Sicherheitscode) 
PRINT ('Dataset already exists!!!')
ELSE
INSERT INTO Karte(PersonId, KartentypId, Kartennummer, Gueltigkeit, Sicherheitscode)
SELECT PersonId, KartentypId, Kartennummer,Gueltigkeit, Sicherheitscode FROM inserted;
END