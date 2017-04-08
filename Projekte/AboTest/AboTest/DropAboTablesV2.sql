-- DropAvoTables.sql
-- 
-- Author		: Parthipan Nagulanandan
-- Projekt		: HBU
-- Version		: 1.0
-- 
-- Change log
-- 09/12/2016   L�schscript erstellt

USE Abo;
-- Schritt 1:
-- Constraints l�schen
ALTER TABLE Mitglied
	DROP 
	CONSTRAINT FK_Mitglied_Anrede,
	CONSTRAINT FK_Mitglied_Ort,
	CONSTRAINT FK_Mitglied_AboArt

-- Schritt 2: 
-- Tabelle l�schen
DROP TABLE Anrede;
-- Tabelle Ort l�schen
DROP TABLE Ort;
-- Tabelle AboArt l�schen
DROP TABLE AboArt;
-- Tabelle Mitglied l�schen
DROP TABLE Mitglied;
