/*
*******************************************************************************
*                                                                             *
*                SQL Server 2008 / 2008 R2 - Der schnelle Einstieg            *
*                                                                             *
*       Kapitel 5 - Transact-SQL - Die Sprache zur Serverprogrammierung       *
*                                                                             *
* © 2009/2010, Klemens Konopasek                                              *
*******************************************************************************
*/


-- Variablen und Datentypen
-- 5.1.1


DECLARE @nachname varchar(50), @vorname varchar(50)
DECLARE @gebdatum date

SET @nachname = (SELECT PersNachname
                 FROM tblPersonal
                 WHERE PersNr = 452)
SET @vorname = (SELECT PersVorname
                FROM tblPersonal
                WHERE PersNr = 452)
SET @gebdatum = (SELECT PersGebDatum
                FROM tblPersonal
                WHERE PersNr = 452)
SELECT @nachname NN, @vorname VN, @gebdatum Geburtsdatum



GO
-- *************************************************************************


DECLARE @nachname varchar(50), @vorname varchar(50)
DECLARE @gebdatum date

SELECT @nachname = PersNachname,
       @vorname = PersVorname,
       @gebdatum = PersGebDatum
FROM tblPersonal
WHERE PersNr = 452

SELECT @nachname NN, @vorname VN, @gebdatum Geburtsdatum




-- *************************************************************************



DECLARE @ust tinyint
DECLARE @netto smallmoney, @brutto smallmoney

SET @ust = 19
SET @netto = 450
SET @brutto = @netto * (@ust + 100) / 100

SELECT @netto Netto, @brutto Brutto




-- *************************************************************************


DECLARE @nr int

SET @nr = @nr + 3
SET @nr = @nr * 5

SELECT @nr Nr


GO
-- *************************************************************************



DECLARE @plz varchar(5)

SET @plz = '8010'

SELECT PersNachname, PersVorname
FROM tblPersonal
WHERE PersPlz = @plz


GO
-- *************************************************************************


DECLARE @nr int = 3
SET @nr = @nr + 3
SET @nr = @nr * 5
SELECT @nr Nr


GO
-- *************************************************************************








-- Benutzerdefinierte Tabellentypen
-- 5.1.2

CREATE TYPE KundenTab AS TABLE
(	kdnr int PRIMARY KEY,
	nachname varchar(50),
	vorname varchar(50)
)

GO
-- *************************************************************************


DECLARE @kunden KundenTab

INSERT INTO @kunden (kdnr, nachname, vorname)
SELECT KdNr, KdNachname, KdVorname
FROM dbo.tblKunden
WHERE KdLand = 'D'


GO
-- *************************************************************************



CREATE PROCEDURE dbo.spTabellenTest
	
	@kdnamen KundenTab READONLY

AS
BEGIN

	SELECT UPPER(nachname) + ' ' + vorname AS Kunde
	FROM @kdnamen
	ORDER BY 1

END


GO


DECLARE @kunden KundenTab

INSERT INTO @kunden (kdnr, nachname, vorname)
SELECT KdNr, KdNachname, KdVorname
FROM dbo.tblKunden
WHERE KdLand = 'D'

EXEC dbo.spTabellenTest @kunden


GO
-- *************************************************************************








-- Funktionen

-- 5.1.3


SELECT @@language

SELECT @@servername

SELECT @@VERSION

SELECT SERVERPROPERTY('ProductVersion')

-- Datumsfunktionen

SELECT DATEADD(week, 3, '01.01.2010')

SELECT DATEDIFF(month, '08.01.2010', '15.11.2010')

SET LANGUAGE german
SELECT DATENAME(weekday, '23.05.2010')
SELECT DATEPART(weekday, '23.05.2010')

SET LANGUAGE english
SELECT DATENAME(weekday, '05.23.2010')
SELECT DATEPART(weekday, '05.23.2010')

SET LANGUAGE german
SELECT DAY('20.04.2009') Tag, MONTH('20.04.2009') Monat, YEAR('20.04.2009') Jahr

SELECT GETDATE()


SELECT ISDATE('24.12.2008'), ISDATE('240.12.2008')

SELECT CURRENT_TIMESTAMP
SELECT Sysdatetime(), GETDATE()
SELECT Sysutcdatetime()
SELECT Sysdatetimeoffset()

SELECT	Sysdatetimeoffset() AS Graz,
		Switchoffset(Sysdatetimeoffset(), '-08:00') AS Vancouver

SELECT Todatetimeoffset(Sysdatetime(), '-08:00')


-- Mathematische Funktionen

SELECT ROUND(5.129, 2), ROUND(18452, -2), ROUND(1.99,1,1)

SELECT CEILING(5.129)


-- Metadatenfunktionen

SELECT DB_NAME(), DB_NAME(1), DB_ID(), DB_ID('master')

SELECT COL_LENGTH('tblArtikel','Artbezeichnung')			-- nur innerhalb der DB möglich!

SELECT COL_LENGTH('wawi.dbo.tblArtikel','Artbezeichnung')   -- von jeder DB aus möglich!

SELECT OBJECT_ID('tblArtikel')

SELECT OBJECT_NAME('1511676433')

SELECT COL_NAME(OBJECT_ID('tblArtikel'), 2)


-- Sicherheitsfunktionen

SELECT IS_MEMBER('db_owner')


-- Zeichenfolgefunktionen

SELECT ASCII('m'), CHAR(109)

SELECT CHARINDEX(' ','SQL Server')


DECLARE @name varchar(30), @vorname varchar(15)
DECLARE @position int
    SET @name = 'Petra Konopasek'
    SET @position = CHARINDEX(' ', @name)
    SET @vorname = LEFT(@name, @position - 1)
    SELECT @vorname Vorname


SELECT MAX(LEN(PersNachname)) [Längster Name]
FROM tblPersonal;

SELECT PersVorname + ' ' + UPPER(PersNachname) Name
FROM tblPersonal
ORDER BY PersNachname;

SELECT REPLICATE('.', 15 - LEN(PersNachname)) + PersNachname Name
FROM tblPersonal;

SELECT SOUNDEX('Maier') Maier,
       SOUNDEX('Meyer') Meyer,
       SOUNDEX('Mayer') Mayer,
       SOUNDEX('Peyer') Peyer,
       SOUNDEX('Ober') Ober,
       SOUNDEX('Obermann') Obermann,
       SOUNDEX('Hausmahn') Hausmahn


SELECT  ArtBezeichnung + ' kostet € ' 
        + ArtVKPreis AS Preise
FROM tblArtikel;


SELECT  ArtBezeichnung + ' kostet € ' 
        + STR(ArtVKPreis, 5, 2) AS Preise
FROM tblArtikel;



DECLARE @name varchar(30)
DECLARE @nachname varchar(15)
DECLARE @position int
    SET @name = 'Alina Konopasek'
    SET @position = CHARINDEX(' ', @name)
    SET @nachname = SUBSTRING(@name, @position + 1, 15)
    SELECT @nachname Nachname



SELECT SUBSTRING(@@VERSION, 35, 4) AS Version


-- Systemfunktionen

SELECT	SYSDATETIME() As Datum,
		CONVERT(varchar,SYSDATETIME(), 4) As [Jahr 2-stellig],
		CONVERT(varchar,SYSDATETIME(), 104) As [Jahr 4-stellig]



SELECT PersNachname FROM tblPersonal
WHERE PersEintritt = '01.04.2001';

SELECT PersNachname FROM tblPersonal
WHERE PersEintritt = '01.04.2001 8:00';


SELECT GETDATE() As Datum,
       CONVERT(datetime,CONVERT(varchar,GETDATE(),4),4)
       As NurDatum



SELECT PersNachname FROM tblPersonal
WHERE CAST(PersEintritt AS DATE)= '01.04.2001';



SELECT HOST_NAME() As Arbeitsplatz, HOST_ID() As ID



INSERT INTO tblArtikel (ArtBezeichnung, ArtGruppe,
                        ArtVKpreis, ArtEKPreis, ArtLief)
VALUES('Wassereimer 15L', 'GA', 3.99, 2.12, 1003);
SELECT @@IDENTITY "Neue Artikelnunmmer" 



SELECT KdTitel + ' ' + KdAkadGrad + ' '
       + KdNachname + ' ' + KdVorname As Kunden
FROM tblKunden
ORDER BY KdNachname;



SELECT ISNULL(KdTitel + ' ','')
       + ISNULL(KdAkadGrad + ' ', '')
       + KdNachname + ' ' + KdVorname AS Kunden
FROM tblKunden
ORDER BY KdNachname;



BEGIN TRAN

UPDATE tblArtikel
SET ArtVKPreis = ArtVKPreis * 0.95
WHERE ArtVKPreis > 200;

SELECT @@ROWCOUNT "Anzahl um 5% verbilligt"

ROLLBACK TRAN


-- Rangfolgefunktionen


SELECT Artbezeichnung AS Bezeichnung,
       ArtVKPreis AS Preis,
       RANK() OVER( ORDER BY ArtVKPreis DESC) AS Rang
FROM tblArtikel;


SELECT Artbezeichnung Bezeichnung,
       ArtVKPreis Preis,
       ArtGruppe Gruppe,
       RANK() OVER( PARTITION BY ArtGruppe
       ORDER BY ArtVKPreis DESC) AS Rang
FROM dbo.tblArtikel;




SELECT Artbezeichnung Bezeichnung,
       ArtVKPreis Preis,
       DENSE_RANK() OVER(ORDER BY ArtVKPreis DESC) AS Rang
FROM dbo.tblArtikel;



SELECT PersNachname AS Nachname,
       PersVorname As Vorname,
       NTILE(5) OVER( ORDER BY PersGebDatum) AS Gruppe
FROM tblPersonal;


SELECT Artbezeichnung AS Bezeichnung,
       ArtVKPreis AS Preis,
       ROW_NUMBER() OVER( ORDER BY ArtVKPreis DESC) AS "lfd. Nr."
FROM tblArtikel;




-- Hierarchie-ID-Funktionen

DECLARE @root hierarchyid
SET @root = hierarchyid::GetRoot()
SELECT @root.ToString() AS Wurzeleintrag, @root AS WurzelID


DECLARE @nachfolger hierarchyid
SET @nachfolger = @root.GetDescendant(NULL, NULL)
SELECT @nachfolger.ToString() AS Nachfolger

SELECT @nachfolger.IsDescendantOf(@root) AS IstNachfolger1,
@root.IsDescendantOf(@nachfolger) AS IstNachfolger2

SELECT @root.GetLevel() AS LevelRoot,
@nachfolger.GetLevel() AS LevelNachfolger

DECLARE @vorgaenger hierarchyid
SET @vorgaenger = @nachfolger.GetAncestor(1)
SELECT @vorgaenger.ToString() As Vorgänger



-- *************************************************************************
-- Kontrollstrukturen


-- 5.1.4
GO


DECLARE @monat tinyint
    SET @monat = MONTH(GETDATE())
    IF @monat <= 6
        PRINT 'Wir sind in der ersten Jahreshälfte.'
    ELSE
        PRINT 'Wir befinden uns im zweiten Halbjahr.'


-- *************************************************************************
GO

DECLARE @kunde int
DECLARE @interesse char(3)

    SET @kunde = 136
    SET @interesse = 'HUG'

    INSERT INTO tblKundeninteressen
    VALUES (@kunde, @interesse)


SELECT * FROM tblKunden; 
SELECT * FROM tblKundenInteressen; 


GO
-- *************************************************************************

DECLARE @kunde int
DECLARE @interesse char(3)

    SET @kunde = 136
    SET @interesse = 'HUG'

    IF (SELECT COUNT(*) FROM tblKundenInteressen
        WHERE KdNr = @kunde AND IntCode = @interesse) = 1
        PRINT 'Zuordnung bereits vorhanden.'
    ELSE
        INSERT INTO tblKundenInteressen
        VALUES (@kunde, @interesse);


GO
-- *************************************************************************


BEGIN TRAN

DECLARE @kunde int
DECLARE @interesse char(3)

    SET @kunde = 136
    SET @interesse = 'SPO'

    IF (SELECT COUNT(*) FROM tblKundenInteressen
        WHERE KdNr = @kunde AND IntCode = @interesse) = 1
        PRINT 'Zuordnung bereits vorhanden.'
    ELSE
    BEGIN
        INSERT INTO tblKundenInteressen
        VALUES (@kunde, @interesse);
        PRINT 'Interesse wurde zugewiesen.'
    END


--ROLLBACK TRAN
GO
-- *************************************************************************



IF MONTH(SYSDATETIME()) IN(1,2,3,4,5)
    PRINT 'Vorsaison'
ELSE
    IF MONTH(SYSDATETIME()) IN(6,7,8,9)
        PRINT 'Hauptsaison'
    ELSE
        PRINT 'Nachsaison'




-- *************************************************************************


IF MONTH(SYSDATETIME()) IN(1,2,3,4,5)
    PRINT 'Vorsaison'
ELSE
    IF MONTH(SYSDATETIME()) IN(6,7,8,9)
    BEGIN
        PRINT 'Hauptsaison'
        PRINT 'Hier ist alles sehr teuer.'
    END
    ELSE
        PRINT 'Nachsaison'



-- *************************************************************************


DECLARE @kunde int
DECLARE @interesse char(3)

    SET @kunde = 132
    SET @interesse = 'SPO'

    IF (SELECT COUNT(*) FROM tblKundenInteressen
        WHERE KdNr = @kunde AND IntCode = @interesse) = 1
        OR (SELECT KdAktiv FROM tblKunden 
            WHERE KdNr = @kunde) = 0
        PRINT 'Zuordnung bereits vorhanden oder Kunde nicht mehr aktiv.'
    ELSE
    BEGIN
        INSERT INTO tblKundenInteressen
        VALUES (@kunde, @interesse);
        PRINT 'Interesse wurde zugewiesen.'
    END



-- *************************************************************************



DECLARE @wotag varchar(10)
SET @wotag = CASE DATEPART(weekday, SYSDATETIME())
             WHEN 1 THEN 'Montag'
             WHEN 2 THEN 'Dienstag'
             WHEN 3 THEN 'Mittwoch'
             WHEN 4 THEN 'Donnerstag'
             WHEN 5 THEN 'Freistag'
             WHEN 6 THEN 'Samstag'
             ELSE 'Sonntag'
             END
SELECT @wotag [Heute ist]



-- *************************************************************************


DECLARE @typ varchar(10)
SET @typ = CASE WHEN DATEPART(weekday, GETDATE()) < 6
           THEN 'Arbeitstag'
           ELSE 'Wochenende' END
SELECT @typ "Heute ist"




-- *************************************************************************


SELECT CASE PersGeschlecht WHEN 1 THEN 'Frau' ELSE 'Herr' END Anrede,
       PersVorname Vorname,
       PersNachname Nachname
FROM tblPersonal



-- *************************************************************************

-- Cursor für Datenzugriffe einsetzen


-- 5.1.5


DECLARE @kdnr int
DECLARE @nachname varchar(50)


DECLARE kunden_cursor CURSOR LOCAL STATIC
FOR
    SELECT KdNr, KdNachname
    FROM tblKunden
    WHERE KdAktiv = 1

OPEN kunden_cursor
FETCH NEXT FROM kunden_cursor INTO @kdnr, @nachname


WHILE @@fetch_status = 0
BEGIN
    --...
    FETCH NEXT FROM kunden_cursor INTO @kdnr, @nachname
END


CLOSE kunden_cursor
DEALLOCATE kunden_cursor



-- *************************************************************************

-- Transaktionssteuerung


-- 5.2.1

DELETE FROM tblKunden WHERE KdAktiv = 0;



-- 5.2.2

SELECT * FROM tblTestpersonal;


UPDATE tblTestpersonal
SET Nachname = 'Untermann'
WHERE Nr = 101;


SELECT * 
FROM tblTestpersonal 
WHERE Nr = 101;


ROLLBACK TRAN


BEGIN TRANSACTION


DELETE FROM tblTestpersonal
WHERE Abtlg IN('MA', 'EK');


INSERT INTO tblTestpersonal
VALUES(700, 'Deutschmann', 'MA', SYSDATETIME());


SELECT * FROM tblTestpersonal ORDER BY Nr;


ROLLBACK TRANSACTION


SELECT * FROM tblTestpersonal ORDER BY Nr;


BEGIN TRANSACTION


DELETE FROM tblTestpersonal
WHERE Abtlg = 'GL';


INSERT INTO tblTestpersonal
VALUES(700, 'Deutschmann', 'MA', SYSDATETIME());


COMMIT TRANSACTION



-- *************************************************************************

-- SET-Optionen verwenden

-- 5.3


SET ANSI_NULLS ON
DECLARE @agrad varchar(10)
SET @agrad = Null

SELECT PersNachname, PersAkadGrad
FROM tblPersonal
WHERE PersAkadGRad = @agrad;



GO


SET ANSI_NULLS OFF
DECLARE @agrad varchar(10)
SET @agrad = Null

SELECT PersNachname, PersAkadGrad
FROM tblPersonal
WHERE PersAkadGRad != @agrad;


GO
-- *************************************************************************

SELECT PersAkadGrad + ' ' + PersNachname AS Mitarbeiter
FROM tblPersonal;


SET CONCAT_NULL_YIELDS_NULL OFF

SELECT LTRIM(PersAkadGrad + ' ' + PersNachname) AS Mitarbeiter
FROM tblPersonal;

SET CONCAT_NULL_YIELDS_NULL ON

SELECT ISNULL(PersAkadGrad + ' ', '') + PersNachname AS Mitarbeiter
FROM tblPersonal;


GO
-- *************************************************************************

SET DATEFIRST 1
SELECT DATEPART(weekday, '01.01.2010') As Tag

SET DATEFIRST 7
SELECT DATEPART(weekday, '01.01.2010') As Tag

-- *************************************************************************

SET DATEFORMAT dmy
DECLARE @datum datetime
SET @datum = '15.08.2010'

-- *************************************************************************

SET IDENTITY_INSERT tblArtikel ON

INSERT INTO tblArtikel (ArtNr, ArtBezeichnung, ArtGruppe,
                        ArtVKpreis, ArtEKPreis, ArtLief)
VALUES (2222, 'Gartenschlauch 15m', 'GA', 23.99,
        17.11, 1003);



-- *************************************************************************

SELECT langid, name, alias, dateformat, datefirst
FROM master.sys.syslanguages;

SET LANGUAGE english
SET LANGUAGE français
SET LANGUAGE german
SET LANGUAGE latviešu


-- *************************************************************************

SET QUOTED_IDENTIFIER OFF
CREATE TABLE quot_id_test
( ID int,
  "Kunden Name" varchar(60) );


-- *************************************************************************

SET ROWCOUNT 5

SELECT PersNr, PersNachname, Persvorname
FROM tblPersonal
ORDER BY 1;

SET ROWCOUNT 0




-- *************************************************************************

-- Fehlerbehandlung

-- 5.4


SET NOCOUNT ON

DECLARE @gruppe char(2), @name varchar(30)

SET @gruppe = 'GE'
SET @name = 'Geschirr'

INSERT INTO dbo.tblArtikelGruppen (ArtGr, ArtGrText)
VALUES (@gruppe, @name);

IF @@ROWCOUNT = 0
    SELECT 'Fehler!' As Ergebnis
ELSE
    SELECT 'Erledigt ;-)' As Ergebnis


GO

-- Fehler "vermeiden"

SET NOCOUNT ON

DECLARE @gruppe char(2), @name varchar(30)

SET @gruppe = 'GE'
SET @name = 'Geschirr'

IF exists ( SELECT * 
            FROM dbo.tblArtikelGruppen
            WHERE ArtGr = @gruppe)
    SELECT 'Fehler!' As Ergebnis
ELSE
BEGIN
    INSERT INTO dbo.tblArtikelGruppen
    VALUES (@gruppe, @name);
    SELECT 'Erledigt ;-)' As Ergebnis
END


GO

-- Fehler "behandeln"


SET NOCOUNT ON

DECLARE @gruppe char(2), @name varchar(30)

SET @gruppe = 'GE'
SET @name = 'Geschirr'

BEGIN TRY
    INSERT INTO dbo.tblArtikelGruppen
    VALUES (@gruppe, @name);
    SELECT 'Erledigt ;-)' As Ergebnis
END TRY
BEGIN CATCH
    SELECT 'Fehler!' As Ergebnis
END CATCH



GO

-- inkl. Transaktion


SET NOCOUNT ON

DECLARE @gruppe char(2), @name varchar(30)

SET @gruppe = 'GE'
SET @name = 'Geschirr'

BEGIN TRY
    BEGIN TRANSACTION

    INSERT INTO dbo.tblArtikelGruppen
    VALUES (@gruppe, @name);

    COMMIT TRANSACTION

    SELECT 'Erledigt ;-)' As Ergebnis
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    SELECT 'Fehler!' As Ergebnis
END CATCH


GO



-- Ausgabe Fehlermeldung

SET NOCOUNT ON

DECLARE @gruppe char(2), @name varchar(30)

SET @gruppe = 'GE'
SET @name = 'Geschirr'

BEGIN TRY

    BEGIN TRANSACTION

    INSERT INTO dbo.tblArtikelGruppen
    VALUES (@gruppe, @name);

    COMMIT TRANSACTION

    SELECT 'Erledigt ;-)' As Ergebnis
END TRY
BEGIN CATCH
    ROLLBACK
    SELECT ERROR_MESSAGE() As Ergebnis
END CATCH


GO
