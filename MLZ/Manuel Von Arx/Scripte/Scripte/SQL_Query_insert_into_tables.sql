-- SQL_Query_insert_into_tables.sql
-- Script um Daten in die Tabellen zu füllen
--
-- Autor		: Manuel von Arx
-- Projekt		: HBU
-- Version		: 1.0
-- Change log
-- 26/04/2017	: MVA Erstellt
------------------------------------


use KKSYS;

insert into Kartentyp (Typ)
	values	('Maestro'),
			('Master'),
			('Visa'),
			('Dinners Club');
go
print 'Kartentypen angelegt';
go

insert into Besitzer
	values	('Manuel', 'von Arx'),
			('Urs','Müller');
go
print 'Test-Besitzer angelegt';
go

insert into Kreditkarten
	values	(1234123412341234, 1, 2, convert(date, '01.11.2020',104), '025', 0),
			(4321432143214321, 2, 3, convert(date, '01.12.2019',104), '546', 0);
go
print 'Test-Kreditkarten eingefügt';
go