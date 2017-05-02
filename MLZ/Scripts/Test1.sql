EXEC insertCard 'Nagulanandan', 'Parthipan', '10.02.1990', 800, '30.03.2019', 899, 'Visa' 
GO
SELECT * FROM Karte
GO

-- Insert Stored Procedure
Create procedure InsertEmployee
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Gender nvarchar(50),
@Salary int,
@DepartmentId int
as
Begin
     Insert into Employees(FirstName, LastName, Gender, Salary, DepartmentId)
     values (@FirstName, @LastName, @Gender, @Salary, @DepartmentId)
End
GO