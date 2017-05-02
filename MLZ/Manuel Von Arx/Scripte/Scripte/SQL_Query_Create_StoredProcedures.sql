-- SQL_Query_create_StoredProcedures.sql
-- Mit diesem Script werden die Stored 
-- Procedures erstellt.
--
-- Autor		: Manuel von Arx
-- Projekt		: HBU
-- Version		: 1.0
-- Change log
-- 26/04/2017	: MVA Erstellt
------------------------------------

-- =============================================
-- Author:		Manuel von Arx
-- Create date: 27.04.2017
-- Description:	SaveCreditCard-Procedure
-- =============================================
CREATE PROCEDURE SaveCreditCardProcedure 
	-- Add the parameters for the stored procedure here
	@KartenNr decimal(16,0),		-- KartenNr
	@Typ varchar(30),				-- Kartentyp
	@Vorname varchar(50),			-- Vorname
	@Nachname varchar(50),			-- Nachname
	@Datum Date,					-- Ablaufdatum
	@SicherheitsCode varchar(3)		-- SicherheitsCode

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @BesitzerID int = 0;
	declare @KartentypID int = 0;

	IF NOT EXISTS (SELECT * FROM Kreditkarten WHERE (KartenNr = @KartenNr))
    BEGIN
	
		-- get KartentypID
		select @KartentypID = KartentypID from Kartentyp
		where Typ = @Typ
		print N'Kartentyp = ' + Convert(varchar(20), @KartentypID);
	
		-- get BesitzerID
		select @BesitzerID = BesitzerID from Besitzer
		where Vorname = @Vorname AND Nachname = @Nachname
		print N'BesitzerID = ' + Convert(varchar(20), @BesitzerID);

		IF @BesitzerID = 0   
		BEGIN
		 	insert into Besitzer
			values	(@Vorname, @Nachname);
			print N'Neuer Besitzer angelegt';
			select @BesitzerID = BesitzerID from Besitzer
			where Vorname = @Vorname AND Nachname = @Nachname
			print N'BesitzerID = ' + Convert(varchar(20), @BesitzerID);
		END

        insert into Kreditkarten
        values(@KartenNr, @BesitzerID, @KartentypID, convert(date, @Datum, 104), @SicherheitsCode, 0)
		print N'Neue Karte gespeichert.';
    END
    ELSE
    BEGIN
        print N'Karte existiert bereits!';
    END
	 
	 
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Manuel von Arx
-- Create date: 26.04.2017
-- Description:	Login-Procedure
-- =============================================
CREATE PROCEDURE LoginProcedure 
	-- Add the parameters for the stored procedure here
	@KartenNr decimal(16,0),		-- KartenNr
	@Typ varchar(30),				-- Kartentyp
	@Vorname varchar(50),			-- Vorname
	@Nachname varchar(50),			-- Nachname
	@Datum Date,					-- Ablaufdatum
	@SicherheitsCode varchar(3)		-- SicherheitsCode
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   -- Insert statements for procedure here
	declare @Zutritt int = 0;
	declare @Kartenstatus int = 0;

	IF NOT EXISTS (SELECT * FROM Kreditkarten WHERE (KartenNr = @KartenNr))
    BEGIN
		print N'Karte existiert nicht!';
		insert into TLOG
			values	(@KartenNr, @SicherheitsCode, @Typ, @Datum, @Vorname, @Nachname, convert(datetime,GETDATE(),113),0);
		
    END
    ELSE
    BEGIN
		-- get Creditcard from DB
		IF NOT EXISTS (select * from ((Kreditkarten
		inner join Kartentyp on Kreditkarten.KartentypID = Kartentyp.KartentypID)
		inner join Besitzer on Kreditkarten.BesitzerID = Besitzer.BesitzerID)
		where 
		Kreditkarten.KartenNr = @KartenNr AND
		Kartentyp.Typ = @Typ AND
		Besitzer.Vorname = @Vorname AND
		Besitzer.Nachname = @Nachname AND
		Kreditkarten.AblaufDatum = @Datum AND
		Kreditkarten.SicherheitsCode = @SicherheitsCode)
		
		BEGIN

			insert into TLOG
			values	(@KartenNr, @SicherheitsCode, @Typ, @Datum, @Vorname, @Nachname, convert(datetime,GETDATE(),113),0);
		 	print N'Fehlerhafte Eingabe';
			
			SELECT @Kartenstatus = KartenStatus FROM Kreditkarten WHERE (KartenNr = @KartenNr)

			if @Kartenstatus >= 3
			BEGIN
				print N'Karte gesperrt';
			END
			ELSE
			BEGIN
				update Kreditkarten
				SET KartenStatus = (@Kartenstatus + 1)
				where (KartenNr = @KartenNr);
			END	

		END
		ELSE
			BEGIN
				SELECT @Kartenstatus = KartenStatus FROM Kreditkarten WHERE (KartenNr = @KartenNr)

				if @Kartenstatus >= 3
				BEGIN
					print N'Karte gesperrt';
				END
				ELSE
				BEGIN
					insert into TLOG
						values	(@KartenNr, @SicherheitsCode, @Typ, @Datum, @Vorname, @Nachname, convert(datetime,GETDATE(),113),1);
					
					update Kreditkarten
					SET KartenStatus = 0
					where (KartenNr = @KartenNr);

		 			print N'Eingaben waren korrekt - Zugriff aktiv';
				END
			END
    END
	 
END
GO