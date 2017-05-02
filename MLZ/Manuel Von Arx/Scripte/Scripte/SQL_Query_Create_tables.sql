-- SQL_Query_Create_tables.sql
-- Script um die Datenbank KKSYS 
-- inkl. den Tabellen zu erstellen
--
-- Autor		: Manuel von Arx
-- Projekt		: HBU
-- Version		: 1.0
-- Change log
-- 26/04/2017	: MVA Erstellt
------------------------------------

-- erstelle DB wenn diese noch nicht besteht.
if db_id('KKSYS') is null
   create database KKSYS;
GO

use KKSYS;

create table Kartentyp(
	-- Felder der Tabelle definieren
	-- identity(1,1) -> automatisch bei 1 starten und immer 1 erhöhen
	KartentypID		int	identity(1,1)	not null,
	Typ				varchar(30) null,
	-- constraint -> primary-key definieren
	constraint PK_KartentypID primary key (KartentypID)
);

GO

create table Besitzer(
	-- Felder der Tabelle definieren
	-- identity(1,1) -> automatisch bei 1 starten und immer 1 erhöhen
	BesitzerID		int	identity(1,1)	not null,
	Vorname			varchar(50) null,
	Nachname		varchar(50) null,
	-- constraint -> primary-key definieren
	constraint PK_BesitzerID primary key (BesitzerID)
);

GO

create table TLOG(
	-- Felder der Tabelle definieren
	-- identity(1,1) -> automatisch bei 1 starten und immer 1 erhöhen
	ID				int	identity(1,1)	not null,
	KartenNr		decimal(16,0) null,
	SicherheitsCode varchar(3) null,
	Typ				varchar(30),
	AblaufDatum		Date null,
	Vorname			varchar(50),
	Nachname		varchar(50),
	Zeitstempel		Datetime null,
	Zutritt			Bit null,
	-- constraint -> primary-key definieren
	constraint PK_ID primary key (ID)
);

GO

create table Kreditkarten(
	-- Felder der Tabelle definieren
	-- identity(1,1) -> automatisch bei 1 starten und immer 1 erhöhen
	KartenNr		decimal(16,0) not null,
	BesitzerID		int not null,
	KartentypID		int not null,
	AblaufDatum		Date not null,
	SicherheitsCode varchar(3) not null,
	KartenStatus	int not null,
	-- constraint -> primary-key definieren
	constraint PK_KartenNr primary key (KartenNr)
);

GO


-- Create Constraints mit "alter"
-- Aendere die Kreditkarten-Tabelle
ALTER Table Kreditkarten
	add 
	-- constraint Fremdschlüssel (FK) definieren
	constraint FK_BesitzerID foreign key (BesitzerID) references Besitzer(BesitzerID),
	constraint FK_KartentypID foreign key (KartentypID) references Kartentyp(KartentypID)

