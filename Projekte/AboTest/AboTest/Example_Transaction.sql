USE Abo

BEGIN TRANSACTION
UPDATE Mitglied
SET Vorname = 'Hugo'
WHERE Vorname = 'Marco'

-- Test wenn Transaktion l�uft und ein Select Befehl ausgef�hrt wird.
SELECT * FROM Mitglied