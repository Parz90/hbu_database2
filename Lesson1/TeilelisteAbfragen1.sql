-- Welche Bestandteile hat der Artikel mit der Teile Nr. (TNr) = 60
USE Teileliste

SELECT t.TNr, s.UTeil
FROM Teile t inner join Struktur s
ON t.TNr = s.OTeil
WHERE t.TNr = 60

GO 

-- Die in der Baugruppe enthaltenen Teile werden aufgelöst (2 stufig)
SELECT t.TNr, t.Bezeichnung, s.Uteil, t2.Bezeichnung, s.Menge
FROM Teile t inner join Struktur s
ON t.TNr = s.OTeil
inner join Teile t2
on s.Uteil = t2.TNr
WHERE t.TNr = 60

GO 

SELECT t.TNr, s1.UTeil, s2.UTeil, t2.Bezeichnung
FROM Teile t inner join Struktur s1
ON t.TNr = s1.OTeil
inner join Struktur s2
ON s1.UTeil = s2.OTeil
inner join Teile t2
ON s2.Uteil = t2.TNr
WHERE t.TNr = 60

GO

SELECT t.TNr, t.Bezeichnung, 
		t2.TNr, t2.Bezeichnung, s1.Menge, 
		t3.TNr, t3.Bezeichnung, s2.Menge
FROM Teile t inner join Struktur s1 -- Mach ein Join um den oberen Teil auf Teil Nr 60 zu verbinden.
ON t.TNr = s1.OTeil
inner join Teile t2 -- Mach ein Join um die ersten Stufe in die Teileliste hinzuzufügen. Hier wird das zweite Teil in Untere Teilstruktur verbunden.
ON s1.UTeil = t2.TNr
inner join Struktur s2 -- Mach ein Join um den oberen Teil der 
ON t2.TNr = s2.OTeil
inner join Teile t3
ON s2.Uteil = t3.TNr
WHERE t.TNr = 60

GO 
