-- Datenbank deklarieren
USE Abo
SELECT * FROM Mitglied

-- Alle Mitglieder z�hlen
SELECT COUNT(*) FROM Mitglied

-- Aggregationsbefehle wie Max, Min, Sum und Durchschnitt
SELECT MAX(Gebuehr) AS MaxGeb�hr,
	   MIN(Gebuehr) AS MinGeb�hr,
	   AVG(Gebuehr) AS DurchschnittsGeb�hr,
	   SUM(Gebuehr) AS SummeGeb�hr,
COUNT(Gebuehr) as Anzahl
FROM AboArt
WHERE Gebuehr > 150;

-- Ort ID z�hlen(abgesehen null)
SELECT COUNT(Ortid)
FROM Mitglied;

-- Ort ID z�hlen und dabei eindeutige filtern. 
SELECT COUNT(DISTINCT Ortid)
FROM Mitglied;

UPDATE Mitglied
SET Vorname = null
WHERE Vorname = 'Marco'

UPDATE Mitglied
SET Vorname = 'Marco'
WHERE ID = 33

SELECT AnredeID FROM Mitglied
GROUP BY AnredeID

-- Nicht m�glich, da nur die Attributen angezeigt werden k�nnen welche zu dieser Gruppe geh�ren.
SELECT AnredeID, Nachname FROM Mitglied
GROUP BY AnredeID

-- M�glich, aber nicht dass was man will, da nur die Attributen angezeigt werden k�nnen welche zu dieser Gruppe geh�ren.
SELECT AnredeID, Nachname FROM Mitglied
GROUP BY AnredeID, Nachname

SELECT AnredeID, MAX(Nachname) FROM Mitglied
GROUP BY AnredeID

SELECT AnredeID, MAX(Nachname), MIN(Nachname) FROM Mitglied
GROUP BY AnredeID

-- Join Beispiele
SELECT * FROM Mitglied
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID

-- Abgek�rzt
SELECT Mitglied.ID, Mitglied.Vorname, Mitglied.Eintritt, Anrede.Anrede FROM Mitglied
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID

-- Mehrere Joins (Wie Abo Normalisierungstabelle ausgeben)
SELECT Mitglied.ID, Anrede.Anrede, Mitglied.Nachname, Mitglied.Vorname, Ort.PLZ, Ort.Ort, convert(varchar, Mitglied.Eintritt, 104), AboArt.AboArt, AboArt.Gebuehr FROM Mitglied
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
INNER JOIN Ort
ON Mitglied.OrtID = Ort.ID
ORDER BY Mitglied.ID asc


-- Vorbereitung f�r Outer Join (ein Ort neu erstellen dass zu keinem Mitglied hinzugef�gt wurde)
INSERT INTO Ort (PLZ, Ort)
VALUES(8610, 'Uster');

SELECT Ort FROM Ort

SELECT * FROM Ort
left outer join Mitglied
on Ort.ID = Mitglied.OrtID
