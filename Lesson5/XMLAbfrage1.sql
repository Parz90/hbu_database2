USE Abo

-- A1.1
SELECT [ID], [Nachname], [Vorname], [Eintritt] FROM [Mitglied]
FOR XML AUTO, ROOT('MitarbeiterList')

-- A1.2
SELECT * , convert(xml, (SELECT m.[ID], m.[Nachname], m.[Vorname], m.[Eintritt] FROM [Mitglied] m
WHERE m.AnredeID = a.ID
FOR XML AUTO,ROOT('MitgliederList')))
as MitarbeiterListXML
FROM Anrede a



SELECT * FROM Abo
FOR XML AUTO, ROOT('ArztList')

SELECT a.ArztNr, a.ArztName, FROM Konsultation