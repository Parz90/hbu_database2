USE [KKSYS]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[LoginProcedure]
		@KartenNr = 1234123412341234,
		@Typ = 'Master',
		@Vorname = 'Manuel',
		@Nachname = 'von Arx',
		@Datum = '2020-11-01',
		@SicherheitsCode = '025'

SELECT	'Return Value' = @return_value

GO

select * from TLOG
select * from Kreditkarten