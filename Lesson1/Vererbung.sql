USE [ISA-Person]
GO
-- Kunde
select p.persNr
      , p.Name
      , p.Adresse
      , p.Geburtsdatum
      , k.Funktion
      , k.Umsatz
      from Person p 
        inner join kunde k
        on p.PersNr = k.PersNr;

-- Alle Kunden und alle Dozenten
select p.PersNr
      , p.Name
      , p.Adresse
      , p.Geburtsdatum
      , d.Biographie
      , d.Honorartag
	  , 'Dozent'
      from person p 
        inner join dozent d
        on p.PersNr = d.PersNr
union
select p.PersNr
      , p.Name
      , p.Adresse
      , p.Geburtsdatum
      , k.Funktion
      , k.Umsatz
	  , 'Kunde'
      from person p 
        inner join kunde k
        on p.PersNr = k.PersNr;