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

-- Creates a Stored Procedures to insert Card types
CREATE PROCEDURE insertCardType
@Bezeichnung VARCHAR(50)
AS
BEGIN
IF EXISTS(SELECT Bezeichnung FROM Kartentyp WHERE Bezeichnung = @Bezeichnung)
BEGIN
PRINT ('Dataset already exists!!!')
END
ELSE
BEGIN
INSERT INTO Kartentyp(Bezeichnung)
		VALUES (@Bezeichnung);
END
END
GO
