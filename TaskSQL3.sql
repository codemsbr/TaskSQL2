--CREATE DATABASE Company
--USE Company

--CREATE TABLE Position
--(
--	ID int primary key IDENTITY,
--	Name nvarchar(50) not null unique
--)

--CREATE TABLE Employee
--(
--	ID int primary key IDENTITY,
--	FirstName nvarchar(50) not null,
--	LastName nvarchar(50) not null default('XXX'),
--	FatherName nvarchar(50) not null default('XXX'),
--	Salary money not null
--)

--alter table Employee
--add PositionId int references Position(ID) not null

--CREATE TABLE Branches
--(
--	ID int primary key identity,
--	Name nvarchar(100) not null
--)

--CREATE TABLE Products
--(
--	ID int primary key identity,
--	Name nvarchar(50) not null unique,
--	PurchasePrice money not null check(PurchasePrice > 0),
--	SalePrice money not null check(SalePrice > 0),
--)


--CREATE TABLE Sale
--(
--	ID int primary key identity,
--	ProductID int references Products(ID) not null,
--	EmployeeID int references Employee(ID) not null,
--	DateOfSale datetime not null DEFAULT(GetDate()),
--	BrancheID int references Branches(ID) not null
--)

--insert into Position
--values('Junior Developer')

--select * from Employee

--insert into Employee
--values('Hans','Zimer','Florian',100,1)

--insert into Branches
--values('Assas')

--insert into Products
--values('ASUS TUF Gaming A16 Advantage Edition (2023)',100,200)

--select * from Sale

--insert into Sale(ProductID,EmployeeID,BrancheID)
--values (1,1,1)

--select * from Sale as s 
--JOIN Products as p On s.ProductID = p.id
--JOIN Employee as e ON s.EmployeeID = e.ID
--JOIN Branches as b ON s.BrancheID = b.ID

--select SUM(p.SalePrice) as [Total Sales] from Sale as s
--JOIN Products AS p ON s.ProductID = p.id


--insert into Employee
--values('Hans','Zimmer','Florian',100,1)

--insert into Branches
--values('Assas')

--insert into Products
--values('ASUS TUF Gaming A16 Advantage Edition (2022)',1200,3200)

--select * from Sale

--insert into Sale(ProductID,EmployeeID,BrancheID)
--values (1,1,1)


--insert into Position
--values('aaaaaaaa')

--insert into Employee
--values('asas','asass','asas',100,2)

--insert into Branches
--values('Assa')

--insert into Products
--values('ASUS TUF Gaming A16 Advantage Edition (2020)',1200,3200)

--select * from Sale

--insert into Sale(ProductID,EmployeeID,BrancheID)
--values (3,6,3)

--select * from Branches
--select * from Employee
--select * from Position
--select * from Products
--select * from Sale

/* *** Task1 *** */ 
--select CONCAT(FirstName,' ',LastName) as FullName,COUNT(sl.EmployeeID) as [NumberOfProductsSold] from Sale as sl 
--JOIN Employee as e ON sl.EmployeeID = e.ID
--GROUP BY FirstName,LastName

/* *** Task2 *** */ 
--create function dbo.MaxCount()
--returns int
--as
--begin 
--declare @NumberOfProductsSold int;
--	select @NumberOfProductsSold = MAX(BranchOfProductSold.NumberOfProductsSold)
--	from (select BrancheID,COUNT(BrancheID) as NumberOfProductsSold  
--	from Sale group by BrancheID) as BranchOfProductSold;
--return @NumberOfProductsSold
--end

--create view vw_BranchSellsMaxProductsPerDay
--as 
--select * from Branches
--where ID in 
--(select BrancheID from Sale
--where DAY(DateOfSale) = DAY(GETDATE())
--group by BrancheID
--having COUNT(BrancheID) = dbo.MaxCount())

--select * from vw_BranchSellsMaxProductsPerDay


/* *** Task3 *** */
--CREATE FUNCTION dbo.BestSellingProduct()
--returns int
--as
--begin 
--declare @NumberOfProductsSold int;
--	select @NumberOfProductsSold = MAX(ProductSold.NumberOfProductsSold)
--	from (select ProductID,COUNT(ProductID) as NumberOfProductsSold  
--	from Sale group by ProductID) as ProductSold;
--return @NumberOfProductsSold
--end

--CREATE view vw_DailyMaximumSoldProduct
--as 
--select * from Products
--where ID in 
--(select ProductID from Sale
--where  MONTH(DateOfSale) = MONTH(GETDATE())
--group by ProductID
--having COUNT(ProductID) = dbo.BestSellingProduct())

--select * from vw_DailyMaximumSoldProduct