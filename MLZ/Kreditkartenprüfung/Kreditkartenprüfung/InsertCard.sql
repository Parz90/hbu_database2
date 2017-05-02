USE Kreditkartenpruefung
GO

CREATE PROCEDURE insertCard 
@PersonId VARCHAR(50), 
@KartentypId VARCHAR(50), 
@Kartennummer BIGINT, 
@GueltigkeitMM TINYINT, 
@GueltigkeitYYYY SMALLINT,
@Sicherheitscode INT
AS
BEGIN
IF EXISTS(SELECT * FROM Karte WHERE Kartennummer = @Kartennummer and GueltigkeitMM = @GueltigkeitMM and GueltigkeitYYYY = @GueltigkeitYYYY and Sicherheitscode = @Sicherheitscode) 
BEGIN
PRINT ('Dataset already exists!!!')
END
ELSE
BEGIN
IF (@GueltigkeitMM > (SELECT MONTH(GETDATE())))
INSERT INTO Karte (PersonID, KartentypID, Kartennummer, GueltigkeitMM, GueltigkeitYYYY, Sicherheitscode, Kartensperrung, Sperrzaehler)
		VALUES (@PersonId, @KartentypId, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode, 0, 0); 
ELSE
PRINT ('Kreditkarte ist abgelaufen. Ungueltig!!!')
END
END
GO
