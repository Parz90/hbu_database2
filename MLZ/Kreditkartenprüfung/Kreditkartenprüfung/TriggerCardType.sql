USE Kreditkartenpruefung
GO

CREATE TRIGGER trInsertCardType
ON Kartentyp
INSTEAD OF INSERT AS
BEGIN
DECLARE @Bezeichnung VARCHAR(50);
SELECT @Bezeichnung = Bezeichnung FROM inserted;
IF EXISTS(SELECT Bezeichnung FROM Kartentyp WHERE Bezeichnung = @Bezeichnung)
BEGIN
PRINT ('Dataset already exists!!!')
END
ELSE
BEGIN
INSERT INTO Kartentyp(Bezeichnung)
SELECT Bezeichnung FROM inserted;
END
END