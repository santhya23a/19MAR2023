USE [CRUDDB]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 18-Aug-2017 10:22:36 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 18-Aug-2017 10:22:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
	[Age] [int] NULL,
	[Salary] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO




CREATE OR ALTER PROCEDURE SP_SelectEmployee
AS
SELECT * FROM Employee
GO

CREATE OR ALTER PROCEDURE SP_InsertEmployee
(
	@Name varchar(50),
	@Position varchar(50),
	@Age int,
	@Salary int
)
AS
insert into Employee values(@Name, @Position, @Age, @Salary)
Go



CREATE OR ALTER PROCEDURE SP_UpdateEmployee
(
	@EmployeeID int,	
	@Name varchar(50),
	@Position varchar(50),
	@Age int,
	@Salary int
)
AS

Update  
Employee  
set  
Name = @Name,  
Position = @Position,
Age = @Age,  
Salary = @Salary
where EmployeeID = @EmployeeID
Go



CREATE OR ALTER PROCEDURE SP_DeleteEmployee
(
	@EmployeeID int
)
AS

DELETE  
Employee  
where EmployeeID = @EmployeeID