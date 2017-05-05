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

-- Creates a Stored Procedures to insert Card informtions
CREATE PROCEDURE insertCard 
@PersonId VARCHAR(50), 
@KartentypId VARCHAR(50), 
@Kartennummer VARCHAR(19), 
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
INSERT INTO Karte (PersonID, KartentypID, Kartennummer, GueltigkeitMM, GueltigkeitYYYY, Sicherheitscode, Kartensperrung, Sperrzaehler)
	VALUES (@PersonId, @KartentypId, @Kartennummer, @GueltigkeitMM, @GueltigkeitYYYY, @Sicherheitscode, 0, 0); 
END
END
