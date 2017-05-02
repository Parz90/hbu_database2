USE Kreditkartenpruefung
GO

CREATE PROCEDURE CheckCardType
@Bezeichnung VARCHAR(50),
@Id INT OUTPUT
AS
BEGIN
SET @Id = (SELECT Id FROM Kartentyp
WHERE Bezeichnung = @Bezeichnung)
END
GO
