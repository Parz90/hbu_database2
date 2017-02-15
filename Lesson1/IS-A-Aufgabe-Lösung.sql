use Rekursion
go

CREATE TABLE PERSON (
    PE_NR INTEGER CONSTRAINT NN_PERSON_PE_NR NOT NULL,
    PE_NAME VARCHAR(40),
    PE_ADRESSE VARCHAR(40),
    PE_GEBDATUM DATE DEFAULT getdate(),
    CONSTRAINT PK_PERSON PRIMARY KEY (PE_NR)
);
go

CREATE TABLE DOZENT (
    PE_NR INTEGER CONSTRAINT NN_DOZENT_PE_NR NOT NULL,
    DO_BIOGRAPHIE VARCHAR(40),
    DO_HONORARPTAG FLOAT DEFAULT 0.0,
    CONSTRAINT PK_DOZENT PRIMARY KEY (PE_NR)
);
go

ALTER TABLE DOZENT ADD CONSTRAINT PERSON_DOZENT 
    FOREIGN KEY (PE_NR) REFERENCES PERSON (PE_NR) ON DELETE CASCADE;
    
CREATE TABLE KUNDE (
    PE_NR INTEGER DEFAULT 0.0 CONSTRAINT NN_KUNDE_PE_NR NOT NULL,
    KU_FUNKTION VARCHAR(40),
    KU_UMSATZ FLOAT,
    CONSTRAINT PK_KUNDE PRIMARY KEY (PE_NR)
);

ALTER TABLE KUNDE ADD CONSTRAINT PERSON_KUNDE 
    FOREIGN KEY (PE_NR) REFERENCES PERSON (PE_NR);



-- Person
insert into PERSON (PE_NR, PE_NAME, PE_ADRESSE, PE_GEBDATUM)
  values( 1
          , 'Meier'
          , 'Stadtstrasse 12'
          , convert(date, '20.01.1970', 104));
go
          
insert into KUNDE(PE_NR, KU_FUNKTION, KU_UMSATZ)
  values( 1
          , 'Grosshandel'
          , 200000.00);
go

insert into PERSON (PE_NR, PE_NAME, PE_ADRESSE, PE_GEBDATUM)
  values( 2
          , 'Lehrer'
          , 'Turmstrasse 99'
          , convert(date, '20.02.1975'));
go
          
insert into DOZENT(PE_NR, do_biographie, do_honorarptag)
  values( 2, null, 1200.00);
go
 
-- Dozent abfragen
select p.pe_nr
      , p.pe_name
      , p.pe_adresse
      , p.pe_gebdatum
      , d.do_biographie
      , d.do_honorarptag
      from person p 
        inner join dozent d
        on p.pe_nr = d.pe_nr;
go

-- Kunde
select p.pe_nr
      , p.pe_name
      , p.pe_adresse
      , p.pe_gebdatum
      , k.KU_FUNKTION
      , k.KU_UMSATZ
      from person p 
        inner join kunde k
        on p.pe_nr = k.pe_nr;

-- Alle Kunden und alle Dozenten
select p.pe_nr
      , p.pe_name
      , p.pe_adresse
      , p.pe_gebdatum
      , d.do_biographie
      , d.do_honorarptag
	  , 'Dozent'
      from person p 
        inner join dozent d
        on p.pe_nr = d.pe_nr
union
select p.pe_nr
      , p.pe_name
      , p.pe_adresse
      , p.pe_gebdatum
      , k.KU_FUNKTION
      , k.KU_UMSATZ
	  , 'Kunde'
      from person p 
        inner join kunde k
        on p.pe_nr = k.pe_nr;