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

CREATE PROCEDURE validate
@Name VARCHAR(50),
@Vorname VARCHAR(50), 
@Geburtsdatum VARCHAR(50),
@Kartennummer VARCHAR(50), 
@GueltigkeitMM TINYINT, 
@GueltigkeitYYYY SMALLINT,
@Sicherheitscode SMALLINT,
@Kartentyp VARCHAR(50),
@Result VARCHAR(1000) OUTPUT

AS
BEGIN

SET @Result = ''

IF (@Name = '')
BEGIN
SET @Result = @Result + 'Name nicht angegeben. \r\n'
END

IF (@Vorname = '')
BEGIN
SET @Result = @Result + 'Vorname nicht angegeben. <br />'
END

IF (@Geburtsdatum = NULL)
BEGIN
SET @Result = @Result + 'Geburtsdatum nicht angegeben. '
END

SET DATEFORMAT dmy
IF (SELECT TRY_PARSE(@Geburtsdatum AS DATE)) = NULL
BEGIN
SET @Result = @Result + 'Geburtsdatumformat falsch eingetragen. Beispiel: 01.01.1990. '
END

IF (@Kartennummer = NULL)
BEGIN
SET @Result = @Result + 'Kartennummer nicht angegeben. '
END

IF (SELECT LEN(@Kartennummer)) >= 21
BEGIN
SET @Result = @Result + 'Kartennummerlänge falsch. '
END

IF (@GueltigkeitMM = NULL)
BEGIN
SET @Result = @Result + 'Gueltigkeit Monat nicht angegeben. '
END

IF (@GueltigkeitMM > 12) or (@GueltigkeitMM < MONTH(GETDATE()))
BEGIN
SET @Result = @Result + 'Gueltigkeitsmonat-Format falsch angegeben. '
END

IF (@GueltigkeitYYYY = NULL)
BEGIN
SET @Result = @Result + 'Gueltigkeit Jahr nicht angegeben. '
END

IF (SELECT LEN(@GueltigkeitYYYY)) != 4 or (@GueltigkeitYYYY < YEAR(GETDATE()))
BEGIN
SET @Result = @Result + 'Gueltigkeitsjahr-Format falsch angegeben. '
END

IF (@Sicherheitscode = NULL)
BEGIN
SET @Result = @Result + 'Sicherheitsnummer nicht angegeben. '
END

IF (SELECT LEN(@Sicherheitscode)) >= 4
BEGIN
SET @Result = @Result + 'Sicherheitsnummer nicht angegeben. '
END

IF (@Kartentyp = '')
BEGIN
SET @Result = @Result + 'Kartentyp nicht angegeben. '
END

END


