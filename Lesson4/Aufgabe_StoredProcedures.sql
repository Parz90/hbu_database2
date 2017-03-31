USE ArztDB

--A2.1
GO
create procedure scores (@Z1 smallint, @Z2 smallint, @Z3 smallint, @Z4 smallint, @Z5 smallint , @Result smallint output)
as
set @Result = @Z1 + @Z2 + @Z3 + @Z4 + @Z5;

GO
DECLARE @SumScore smallint
EXEC scores 10, 9, 8, 8, 10, @SumScore OUTPUT
SELECT 'The Sum Score is: ', @SumScore
GO

--A2.2
GO
create procedure scores (@Z1 smallint, @Z2 smallint, @Z3 smallint, @Z4 smallint, @Z5 smallint , @Result smallint output)
as
set @Result = @Z1 + @Z2 + @Z3 + @Z4 + @Z5;

GO
DECLARE @SumScore smallint
EXEC scores @Z1=10, @Z2=9, @Z3=8, @Z4=8, @Z5=10, @Result=@SumScore OUTPUT
SELECT 'The Sum Score is: ', @SumScore
GO

--A2.3
GO
create procedure scores (@Z1 smallint, @Z2 smallint, @Z3 smallint, @Z4 smallint, @Z5 smallint , @Result smallint output)
as
set @Result = @Z1 + @Z2 + @Z3 + @Z4 + @Z5;

GO
create procedure average (@Z1 smallint, @Z2 smallint, @Z3 smallint, @Z4 smallint, @Z5 smallint , @Result smallint output)
as
set @Result = (@Z1 + @Z2 + @Z3 + @Z4 + @Z5) / 5;

GO
create procedure calc (@Z1 smallint, @Z2 smallint, @Z3 smallint, @Z4 smallint, @Z5 smallint, @Sel bit, @ResultFinal smallint output)
as
if @Sel = 1
begin
	EXEC scores @Z1=10, @Z2=9, @Z3=8, @Z4=8, @Z5=10, @Result=@ResultFinal OUTPUT
end
else
begin
	EXEC average @Z1=10, @Z2=9, @Z3=8, @Z4=8, @Z5=10, @Result=@ResultFinal OUTPUT
end

GO
DECLARE @Out smallint
EXEC calc @Z1=10, @Z2=9, @Z3=8, @Z4=8, @Z5=10, @Sel=0, @ResultFinal=@Out OUTPUT
SELECT 'The Sum Score is: ', @Out
GO

--A2.4
GO
CREATE PROCEDURE AnzahlKonsultationen @DiagnoseName nvarchar(30)
AS
Select count(*) as Anzahl from KONSULTATION k inner join DIAGNOSE d
on k.DiagnoseNr = d.DiagnoseNr
where d.DiagnoseName = @DiagnoseName
exec AnzahlKonsultationen 'Angina'
GO

SELECT count(*) AS Anzahl FROM Konsultation k INNER JOIN Diagnose d
ON k.DiagnoseNr = d.DiagnoseNr
WHERE d.DiagnoseName = 'Angina'

--A2.5
GO
CREATE PROCEDURE ArztListe
AS
Select * from Arzt
go
exec ArztListe

--A2.6
GO
CREATE PROCEDURE InsertOrt @PLZ int, @Ort nvarchar(50)
AS
Insert into Ort (PLZ, ORT )
Values( @PLZ, @Ort )
go
exec InsertOrt 3000, 'Bern'