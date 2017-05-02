
USE Kreditkartenpruefung
GO

CREATE PROCEDURE checkAccess
@Name VARCHAR(50),
@Vorname VARCHAR(50), 
@Geburtsdatum DATE,
@Kartennummer BIGINT, 
@GueltigkeitMM TINYINT, 
@GueltigkeitYYYY SMALLINT,
@Sicherheitscode SMALLINT,
@Kartentyp VARCHAR(50),
@Kartensperrung BIT OUTPUT
AS
BEGIN

DECLARE @PersonId BIGINT
DECLARE @KartenTypId INT
DECLARE @NameNOK BIT
DECLARE @VornameNOK BIT
DECLARE @GebrNOK BIT
DECLARE @KartenNrNOK BIT
DECLARE @GueltigkeitNOK BIT
DECLARE @SicherheitscodeNOK BIT
DECLARE @KartentypNOK BIT
DECLARE @NameRemark VARCHAR(50)
DECLARE @VornameRemark VARCHAR(50)
DECLARE @GebrRemark VARCHAR(50)
DECLARE @KartenNrRemark VARCHAR(50)
DECLARE @GueltigkeitRemark VARCHAR(50)
DECLARE @SicherheitscodeRemark VARCHAR(50)
DECLARE @KartentypRemark VARCHAR(50)
DECLARE @BeschreibungFehler VARCHAR(200)


SET @NameNOK = 0
SET @VornameNOK = 0
SET @GebrNOK = 0
SET @KartenNrNOK = 0
SET @GueltigkeitNOK = 0
SET @SicherheitscodeNOK = 0
SET @KartentypNOK = 0
SET @NameRemark = ''
SET @VornameRemark = ''
SET @GebrRemark = ''
SET @KartenNrRemark = ''
SET @GueltigkeitRemark = ''
SET @SicherheitscodeRemark = ''
SET @KartentypRemark = ''

IF NOT EXISTS (SELECT * FROM Person WHERE (Name = @Name))
BEGIN
SET @NameRemark = ' Name |'
SET @NameNOK = 1
END

IF NOT EXISTS (SELECT * FROM Person WHERE (Vorname = @Vorname))
BEGIN
SET @VornameRemark = ' Vorname |'
SET @VornameNOK = 1
END

IF NOT EXISTS (SELECT * FROM Person WHERE (Geburtsdatum = @Geburtsdatum))
BEGIN
SET @GebrRemark = ' Geburtsdatum |'
SET @GebrNOK = 1
END

IF NOT EXISTS (SELECT * FROM Karte WHERE (Kartennummer = @Kartennummer))
BEGIN
SET @KartenNrRemark = ' Kartennummer |'
SET @KartenNrNOK = 1
END

IF NOT EXISTS (SELECT * FROM Karte WHERE (GueltigkeitMM = @GueltigkeitMM and GueltigkeitYYYY = @GueltigkeitYYYY))
BEGIN
SET @GueltigkeitRemark = ' Gueltigkeit |'
SET @GueltigkeitNOK = 1
END

IF NOT EXISTS (SELECT * FROM Karte WHERE (Sicherheitscode = @Sicherheitscode))
BEGIN
SET @SicherheitscodeRemark = ' Sicherheitscode |'
SET @SicherheitscodeNOK = 1
END

IF NOT EXISTS (SELECT * FROM Kartentyp WHERE (Bezeichnung = @Kartentyp))
BEGIN
SET @KartentypRemark = ' Kartentyp |'
SET @KartentypNOK = 1
END

IF 3 > (SELECT Sperrzaehler FROM Karte WHERE (Kartennummer = @Kartennummer))
BEGIN

IF (@NameNOK = 1 or @VornameNOK = 1 or @GebrNOK = 1 or @KartenNrNOK = 1 or @GueltigkeitNOK = 1 or @SicherheitscodeNOK = 1 or @KartentypNOK = 1)
BEGIN

SET @BeschreibungFehler = 'Folgende Werte wurden falsch eingegeben: |' + @NameRemark + @VornameRemark + @GebrRemark + @KartenNrRemark + @GueltigkeitRemark + @SicherheitscodeRemark + @KartentypRemark + '. Zugriff verweigert!!!'
INSERT INTO Log (Zeit, Benutzer, Beschreibung, Name, Vorname, Geburtsdatum, Kartennummer, GueltigkeitMM, GueltigkeitYYYY, Sicherheitscode, Kartentyp)
VALUES	(convert(datetime,GETDATE(),113), 'Test', @BeschreibungFehler, @Name, @Vorname, @Geburtsdatum, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode, @Kartentyp);
UPDATE Karte SET Sperrzaehler += 1 WHERE Kartennummer = @Kartennummer

END
ELSE
BEGIN

INSERT INTO Log (Zeit, Benutzer, Beschreibung, Name, Vorname, Geburtsdatum, Kartennummer, GueltigkeitMM, GueltigkeitYYYY, Sicherheitscode, Kartentyp)
VALUES	(convert(datetime,GETDATE(),113), 'Test', 'Alle Angaben richtig. Zugriff erfolgreich!!!', @Name, @Vorname, @Geburtsdatum, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode, @Kartentyp);
UPDATE Karte SET Kartensperrung = 0
UPDATE Karte SET Sperrzaehler = 0

END

END

ELSE
BEGIN

UPDATE Karte SET Sperrzaehler += 1 WHERE Kartennummer = @Kartennummer
print N'Karte gesperrt!'
UPDATE Karte SET Kartensperrung = 1

END
SET @Kartensperrung = (SELECT Kartensperrung FROM Karte WHERE Kartennummer = @Kartennummer)

END
