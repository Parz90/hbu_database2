USE Kreditkartenpruefung
GO

CREATE PROCEDURE CheckCardType
@Kartentyp VARCHAR(50)
AS
BEGIN
SELECT Id FROM Kartentyp
WHERE Bezeichnung = @Kartentyp
END
GO
