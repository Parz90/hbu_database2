USE [ISA-Person]
GO

CREATE TABLE Person (
    PersNr INTEGER CONSTRAINT NN_PERSON_PE_NR NOT NULL,
    Name VARCHAR(40),
    Adresse VARCHAR(40),
    Geburtsdatum DATE DEFAULT getdate(),
    CONSTRAINT PK_Person PRIMARY KEY (PersNr)
);
GO

CREATE TABLE Dozent (
    PersNr INTEGER CONSTRAINT NN_DOZENT_PE_NR NOT NULL,
    Biographie VARCHAR(40),
    Honorartag FLOAT DEFAULT 0.0,
    CONSTRAINT PK_Dozent PRIMARY KEY (PersNr)
);
GO

ALTER TABLE Dozent ADD CONSTRAINT Person_Dozent 
    FOREIGN KEY (PersNr) REFERENCES Person (PersNr) ON DELETE CASCADE;
GO

CREATE TABLE Kunde (
    PersNr INTEGER DEFAULT 0.0 CONSTRAINT NN_KUNDE_PE_NR NOT NULL,
    Funktion VARCHAR(40),
    Umsatz FLOAT,
    CONSTRAINT PK_Kunde PRIMARY KEY (PersNr)
);
GO

ALTER TABLE Kunde ADD CONSTRAINT Person_Kunde 
    FOREIGN KEY (PersNr) REFERENCES Person (PersNr);
GO

-- Person
INSERT INTO Person (PersNr, Name, Adresse, Geburtsdatum)
		VALUES (1, 'Balmelli', 'Dorfstrasse 10', CONVERT(DATE, '01.01.1990', 104)),
			   (2, 'Bürgin', 'Bahnhofstrasse 55', CONVERT(DATE, '10.10.1996', 104)),
			   (3, 'Müller', 'Zürichstrasse 99', CONVERT(DATE, '01.07.1988', 104)),
			   (4, 'Bürgin', 'Bernstrasse 33', CONVERT(DATE, '10.10.1981', 104))
GO

INSERT INTO Kunde(PersNr, Funktion, Umsatz)
		VALUES (1, 'Informatiker', '33000.00'),
			   (2, 'Automatiker', '50000.00')
GO

INSERT INTO Dozent(PersNr, Biographie, Honorartag)
		VALUES (3, 'Test1', '1000'),
			   (4, 'Test2', '5000')
GO

