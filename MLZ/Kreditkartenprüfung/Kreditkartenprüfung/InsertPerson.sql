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

-- Creates a Stored Procedures to insert Person informtions
CREATE PROCEDURE insertPerson
@Name VARCHAR(50), 
@Vorname VARCHAR(50), 
@Geburtsdatum DATE
AS
BEGIN
IF EXISTS(SELECT * FROM Person WHERE Name = @Name and Vorname = @Vorname and Geburtsdatum = @Geburtsdatum)
BEGIN
PRINT ('Dataset already exists!!!')
END
ELSE
BEGIN
INSERT INTO Person(Name, Vorname, Geburtsdatum)
		VALUES (@Name, @Vorname, convert(date, @Geburtsdatum, 104));
END
END
GO
