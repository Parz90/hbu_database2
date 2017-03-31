USE ArztDB

ALTER TABLE Konsultation ADD CONSTRAINT ck_datum CHECK (KON_DATUM > GETDATE())

GO

ALTER TRIGGER trigger_date ON Konsultation INSTEAD OF INSERT
AS
BEGIN 
DECLARE @kon_date date
SELECT @kon_date = Datum FROM inserted

IF @kon_date > GETDATE()
Raiserror('Fehler: Datum ist falsch',16, 1)

else
    INSERT INTO Konsultation(ArztNr, PatientNr, DiagnoseNr, Datum)
	SELECT ArztNr, PatientNr, DiagnoseNr, Datum FROM inserted
	PRINT 'Datensatz eingefügt'
END

insert into Konsultation ([PatientNr], [ArztNr], [DiagnoseNr], [Datum])
	values (1234, 50001, 1, convert(datetime, '2018.03.15', 102))
