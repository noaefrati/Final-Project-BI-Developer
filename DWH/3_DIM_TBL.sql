USE [DWH_Only_Clothing_Store]
GO


-- DimAgents

CREATE TABLE [dbo].[DimAgents](
	[AgentID] [int] PRIMARY KEY,
	[AgentName] [nvarchar](32) NULL,
	[Address] [nvarchar](80) NULL,
	[State] [nvarchar](40) NULL,
	[CountryID] [int] NULL,
	[Email] [nvarchar](48) NULL,
	[StoreID] [int] NULL,
	[Phone] [nvarchar](20) NULL,
	[Commission] [float] NULL,
	[startDate] [datetime] NULL,
	[EndDate] [datetime] NULL

)
GO

ALTER TABLE [dbo].[DimAgents] ADD  DEFAULT (NULL) FOR [EndDate]
GO
-- DimCategories

CREATE TABLE [dbo].[DimCategories](
	[CategoryID] [int] PRIMARY KEY,
	[CategoryName] [nvarchar](20) NULL
)
GO

--[DimSubCategories]

CREATE TABLE [dbo].[DimSubCategories](
	[SubCategoryID] [int] PRIMARY KEY,
	[SubCategoryName] [nvarchar](8) NULL,
	[CategoryID] [int] NULL
)
GO

-- [DimCountries]

CREATE TABLE [dbo].[DimCountries](
	[CountryID] [int] PRIMARY KEY,
	[CountryName] [nvarchar](18) NULL,
	[CountryCode] [nvarchar](2) NULL,
) 
GO

-- DimCustomers

CREATE TABLE [dbo].[DimCustomers](
	[CustomerID] [int] PRIMARY KEY,
	[CustomerName] [nvarchar](50) NULL,
	[Address] [nvarchar](80) NULL,
	[Phone] [nvarchar](20) NULL,
	[State] [nvarchar](40) NULL,
	[AgentID] [int] NULL,
	[CountryID] [int] NULL
)
GO


-- DimProducts

CREATE TABLE [dbo].[DimProducts](
	[ProductID] [int] PRIMARY KEY,
	[ProductName] [nvarchar](15) NULL,
	[UnitsInStock] [int] NULL,
	[Price] [float] NULL,
	[Cost] [float] NULL,
	[Status] [bit] NULL,
	[SubCategoryID] [int] NULL
)
GO

--DimStores
CREATE TABLE [dbo].[DimStores](
	[StoreID] [int] PRIMARY KEY,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](80) NULL,
	[State] [nvarchar](40) NULL,
	[CountryID] [int] NULL,
	[City] [nvarchar](255) NULL
)
GO

-- FactSales

CREATE TABLE [dbo].[FactSales](
	[FactSalesKey] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NULL,
	[CustomerID] [int] NULL,
	[AgentID] [int] NULL,
	[CountryID] [int] NULL,
	[StoreID] [int] NULL,
	[ProductID] [int] NULL,
	[Kline] [int] NULL,
	[Discount] [float] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[Cost] [float] NULL,
	[InvoiceDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FactSalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
