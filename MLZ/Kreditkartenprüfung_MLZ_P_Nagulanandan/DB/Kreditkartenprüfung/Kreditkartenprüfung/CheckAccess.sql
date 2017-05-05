-- Author		: Parthipan Nagulanandan
-- Projekt		: HBU
-- Version		: 1.3
-- 
-- Change log
-- 29/04/2017   Planung und Beispiel Code
-- 02/05/2017   Grob Implementation
-- 05/05/2017   Fertigstellung Kreditkartenpruefung

USE Kreditkartenpruefung
GO

-- Creates a Stored Procedures to validate the entries and check the access
CREATE PROCEDURE checkAccess
@Name VARCHAR(50),
@Vorname VARCHAR(50), 
@Geburtsdatum VARCHAR(50),
@Kartennummer VARCHAR(50), 
@GueltigkeitMM TINYINT, 
@GueltigkeitYYYY SMALLINT,
@Sicherheitscode SMALLINT,
@Kartentyp VARCHAR(50),
@Kartensperrung BIT OUTPUT,
@Sperrzaehler INT OUTPUT,
@ValidationMessage VARCHAR(1000) OUTPUT,
@Message VARCHAR(1000) OUTPUT

AS
BEGIN

-- Variables
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

SET @ValidationMessage = ''
SET @Message = ''

-- Execution of Validate Stored Procedures
EXEC validate @Name, @Vorname, @Geburtsdatum, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode, @Kartentyp, @ValidationMessage OUTPUT

-- Run Access check only if Validation results no error.
IF @ValidationMessage = ''
BEGIN

    -- Check all Entries
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

	-- Check if Cardnummer is existing to execute locking logic
	IF EXISTS (SELECT * FROM Karte WHERE (Kartennummer = @Kartennummer))
	BEGIN

		-- Check if Card already locked
		IF 2 > (SELECT Sperrzaehler FROM Karte WHERE (Kartennummer = @Kartennummer))
		BEGIN
			
			-- Check if entries are correctly, if not write a message.
			IF (@NameNOK = 1 or @VornameNOK = 1 or @GebrNOK = 1 or @KartenNrNOK = 1 or @GueltigkeitNOK = 1 or @SicherheitscodeNOK = 1 or @KartentypNOK = 1)
			BEGIN
			SET @Message = 'Folgende Werte wurden falsch eingegeben: |' + @NameRemark + @VornameRemark + @GebrRemark + @KartenNrRemark + @GueltigkeitRemark + @SicherheitscodeRemark + @KartentypRemark + '. Zugriff verweigert!!!'
			INSERT INTO Log (Zeit, Benutzer, Beschreibung, Name, Vorname, Geburtsdatum, Kartennummer, GueltigkeitMM, GueltigkeitYYYY, Sicherheitscode, Kartentyp)
				VALUES	(convert(datetime,GETDATE(),113), 'Test', @Message, @Name, @Vorname, @Geburtsdatum, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode, @Kartentyp);
			UPDATE Karte SET Sperrzaehler += 1 WHERE Kartennummer = @Kartennummer
			UPDATE Karte SET Kartensperrung = 0
			SELECT @Kartensperrung = Kartensperrung FROM Karte WHERE Kartennummer = @Kartennummer
			SELECT @Sperrzaehler = Sperrzaehler FROM Karte WHERE Kartennummer = @Kartennummer
			END

			-- If entries are correctly, write success message.
			ELSE
			BEGIN
			SET @Message = 'Alle Angaben richtig. Zugriff erfolgreich!!!'
			INSERT INTO Log (Zeit, Benutzer, Beschreibung, Name, Vorname, Geburtsdatum, Kartennummer, GueltigkeitMM, GueltigkeitYYYY, Sicherheitscode, Kartentyp)
				VALUES	(convert(datetime,GETDATE(),113), 'Test', @Message, @Name, @Vorname, @Geburtsdatum, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode, @Kartentyp);
			UPDATE Karte SET Kartensperrung = 0
			UPDATE Karte SET Sperrzaehler = 0
			SELECT @Kartensperrung = Kartensperrung FROM Karte WHERE Kartennummer = @Kartennummer
			SELECT @Sperrzaehler = Sperrzaehler FROM Karte WHERE Kartennummer = @Kartennummer
			END
			
		END

		-- Set locked bit, count the try and write locked message.
		ELSE
		BEGIN
		UPDATE Karte SET Sperrzaehler += 1 WHERE Kartennummer = @Kartennummer
		UPDATE Karte SET Kartensperrung = 1
		SELECT @Kartensperrung = Kartensperrung FROM Karte WHERE Kartennummer = @Kartennummer
		SELECT @Sperrzaehler = Sperrzaehler FROM Karte WHERE Kartennummer = @Kartennummer
		SET @Message = 'Karte gesperrt!!!'
		END

	END

	-- Write card not existing message and set locked bit to 0 and do not count.
	ELSE
	BEGIN
	SET @Kartensperrung = 0
	SET @Sperrzaehler = 0
	UPDATE Karte SET Sperrzaehler += 1 WHERE Kartennummer = @Kartennummer
	UPDATE Karte SET Kartensperrung = 1
	SET @Message = 'Karte existiert nicht!!!' 
	END

END

ELSE
BEGIN
SET @Kartensperrung = 0
SET @Sperrzaehler = 0
END

END
