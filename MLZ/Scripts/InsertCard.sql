USE Kreditkartenpruefung
GO

CREATE PROCEDURE insertCard 
@PersonId INT, 
@KartentypId INT, 
@Kartennummer INT, 
@Gueltigkeit VARCHAR(50), 
@Sicherheitscode INT
AS
BEGIN
INSERT INTO Karte (PersonID, KartentypID, Kartennummer, Gueltigkeit, Sicherheitscode)
		VALUES (@PersonId, @KartentypId, @Kartennummer, convert(date, @Gueltigkeit, 104), @Sicherheitscode); 
END
GO
