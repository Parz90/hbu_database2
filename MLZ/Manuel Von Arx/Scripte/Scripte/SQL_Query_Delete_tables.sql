-- SQL_Query_Delete_tables.sql
-- Script um die Tabellen zu l�schen
--
-- Autor		: Manuel von Arx
-- Projekt		: HBU
-- Version		: 1.0
-- Change log
-- 26/04/2017	: MVA Erstellt
------------------------------------

-- DB ausw�hlen
use KKSYS; 

-- Constraints l�schen
ALTER Table Kreditkarten
	drop constraint FK_BesitzerID,
					FK_KartentypID;

go	-- Skript wird unterteilt in zwei Batch-Files, welche nacheinander &
	-- unabh�ngig von einander ausgef�hrt auch wenn das erste Fehlerhaft ist.

-- Tabellen entfernen
drop table Kreditkarten;	-- Tabelle mit FK zuerst l�schen
drop table TLOG;
drop table Besitzer;
drop table Kartentyp;