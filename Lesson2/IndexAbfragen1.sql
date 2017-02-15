USE Abo

-- A1.2 / A1.4
SELECT Nachname, Vorname
FROM Mitglied
ORDER BY Nachname

GO

-- A1.3
CREATE UNIQUE INDEX IX_MitgliedNachnameVorname
ON Mitglied (Nachname, Vorname)

GO

-- A1.5
SELECT Nachname, Vorname
FROM Mitglied
WHERE Nachname = 'Balmelli'
ORDER BY Nachname

GO

-- A1.5
SELECT Nachname, Vorname, Eintritt
FROM Mitglied
WHERE Nachname = 'Balmelli'
ORDER BY Nachname

GO

-- A1.6
CREATE INDEX IX_MitgliedOrtID
ON Mitglied (OrtID)

CREATE INDEX IX_MitgliedAboArtID
ON Mitglied (AboID)

CREATE UNIQUE INDEX IX_OrtOrt
ON Ort (Ort)

GO

-- A1.7
ALTER INDEX ALL ON Mitglied REBUILD

ALTER INDEX ALL ON Ort REBUILD

ALTER INDEX ALL ON AboArt REBUILD

-- A1.8
