-- SQL_Query_Delete_tables.sql
-- Script um die Tabellen zu löschen
--
-- Autor		: Manuel von Arx
-- Projekt		: HBU
-- Version		: 1.0
-- Change log
-- 26/04/2017	: MVA Erstellt
------------------------------------

-- DB auswählen
use KKSYS; 

-- Constraints löschen
ALTER Table Kreditkarten
	drop constraint FK_BesitzerID,
					FK_KartentypID;

go	-- Skript wird unterteilt in zwei Batch-Files, welche nacheinander &
	-- unabhängig von einander ausgeführt auch wenn das erste Fehlerhaft ist.

-- Tabellen entfernen
drop table Kreditkarten;	-- Tabelle mit FK zuerst löschen
drop table TLOG;
drop table Besitzer;
drop table Kartentyp;