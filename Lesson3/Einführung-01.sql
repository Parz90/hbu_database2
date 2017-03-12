-- Beispiel 1

-- Variablen Deklaration
declare @Z1 int, @Firstname varchar(50);

-- Set
set @Z1 = 100;

-- Print
print 'Zahl Z1 = ' + cast(@Z1 as varchar)


-- Beispiel 2
declare @Z1 int;

set @Z1 = 1000;
if @Z1 > 100
begin
	print 'Z1 ist eine grosse Zahl';
end
else
begin
	print 'Z2 ist eine kleine Zahl';
end


-- Beispiel 3
declare @num int
set @num =(SELECT COUNT(*) FROM PA_MITARBEITER);
if @num > 0
	print 'Total Abteilungen = ' + convert(varchar, @num);
else
	print 'keine Abteilungen vorhanden';


-- Beispiel 4
declare @Nr varchar(20), @bez varchar(40);
select @Nr=ABT_ABTNR, @bez = ABT_BEZ 
	from PA_ABTEILUNG 
	where ABT_ABTNR = 'DV1';
	
print 'Nr = ' + @Nr + ', Bezeichnung = ' + @bez;


-- Beispiel 5
go
create procedure CalcSumProc (@Z1 int, @Z2 int, @Result int output)
as
set @Result = @Z1 + @Z2;
go

declare @Sum int, @RetCode int;
set @Sum = 0;
exec CalcSumProc 1, 2, @Sum output;
print 'Sum = ' + cast(@Sum as varchar);


-- Beispiel 6
go
create function CalcSumFunc (@Z1 int, @Z2 int)
returns int
as
begin
declare @result int;

set @result = @Z1 + @Z2;
return @Result
end
go



-- Beispiel 7
declare @abtnr varchar(20), @abtbez varchar(50);

DECLARE Abteilung_Cursor CURSOR FOR
	SELECT ABT_ABTNR, ABT_BEZ 
	FROM PA_ABTEILUNG
	ORDER BY ABT_BEZ;

OPEN Abteilung_Cursor;
FETCH NEXT FROM Abteilung_Cursor
	into @abtnr, @abtbez;
	
WHILE @@FETCH_STATUS = 0
BEGIN
	print 'Nr = ' + @abtnr + ', Name = ' + @abtbez
	FETCH NEXT FROM Abteilung_Cursor
				into @abtnr, @abtbez;
END;
CLOSE Abteilung_Cursor;
DEALLOCATE Abteilung_Cursor;

	