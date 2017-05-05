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

-- Creates a Stored Procedures to check for card type Id
CREATE PROCEDURE checkCardType
@Bezeichnung VARCHAR(50),
@Id INT OUTPUT
AS
BEGIN
SET @Id = (SELECT Id FROM Kartentyp
WHERE Bezeichnung = @Bezeichnung)
END
GO
