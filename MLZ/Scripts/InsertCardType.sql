USE Kreditkartenpruefung
GO

CREATE PROCEDURE insertCardType
@Kartentyp VARCHAR(50)
AS
BEGIN
INSERT INTO Kartentyp(Bezeichnung)
		VALUES (@Kartentyp);
END
GO
