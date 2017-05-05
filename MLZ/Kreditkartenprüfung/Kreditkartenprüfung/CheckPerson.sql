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

-- Creates a Stored Procedures to check Person Id
CREATE PROCEDURE checkPerson
@Name VARCHAR(50), 
@Vorname VARCHAR(50), 
@Geburtsdatum DATE,
@Id INT OUTPUT
AS
BEGIN
SET @Id = (SELECT Id FROM Person
WHERE Name = @Name and Vorname = @Vorname and Geburtsdatum = @Geburtsdatum)
END
GO


