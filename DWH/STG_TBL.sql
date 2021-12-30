USE [DWH_Only_Clothing_Store]
GO

CREATE TABLE [dbo].[STG_DimProducts](
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](15) NULL,
	[UnitsInStock] [int] NULL,
	[Price] [float] NULL,
	[Cost] [float] NULL,
	[Status] [bit] NULL,
	[SubCategoryID] [int] NULL,
	[Operation] [int] NULL
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[STG_DimSubCategories](
	[SubCategoryID] [int] NULL,
	[SubCategoryName] [nvarchar](8) NULL,
	[CategoryID] [int] NULL,
	[Operation] [int] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[STG_DimStores](
	[StoreID] [int] NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](80) NULL,
	[State] [nvarchar](40) NULL,
	[CountryID] [int] NULL,
	[City] [nvarchar](255) NULL,
	[Operation] [int] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[STG_DimCustomers](
	[CustomerID] [int] NULL,
	[CustomerName] [nvarchar](50) NULL,
	[Address] [nvarchar](80) NULL,
	[Phone] [nvarchar](20) NULL,
	[State] [nvarchar](40) NULL,
	[AgentID] [int] NULL,
	[CountryID] [int] NULL,
	[Operation] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[STG_DimCategories](
	[CategoryID] [int] NULL,
	[CategoryName] [nvarchar](20) NULL,
	[Operation] [int] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[STG_DimAgents](
	[AgentID] [int] NULL,
	[AgentName] [nvarchar](32) NULL,
	[Comission] [float] NULL,
	[Address] [nvarchar](80) NULL,
	[Phone] [nvarchar](20) NULL,
	[State] [nvarchar](40) NULL,
	[CountryID] [int] NULL,
	[StoreID] [int] NULL,
	[Email] [nvarchar](48) NULL
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[STG_FactSales](
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[CountryID] [int] NULL,
	[StoreID] [int] NULL,
	[InvoiceID] [int] NULL,
	[AgentID] [int] NULL,
	[Discount] [float] NULL,
	[Quantity] [int] NULL,
	[Cost] [float] NULL,
	[Price] [float] NULL,
	[InvoiceDate] [datetime] NULL,
	[Operation] [int] NULL,
	[Kline] [int] NULL
) ON [PRIMARY]
GO



