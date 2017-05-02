USE Kreditkartenpruefung
GO

CREATE PROCEDURE insertCardType
@Bezeichnung VARCHAR(50)
AS
BEGIN
IF EXISTS(SELECT Bezeichnung FROM Kartentyp WHERE Bezeichnung = @Bezeichnung)
BEGIN
PRINT ('Dataset already exists!!!')
END
ELSE
BEGIN
INSERT INTO Kartentyp(Bezeichnung)
		VALUES (@Bezeichnung);
END
END
GO
