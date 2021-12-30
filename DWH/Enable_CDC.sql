--CREATE DATABASE DWH_Only_Clothing_Store
go
USE DWH_Only_Clothing_Store

SELECT * FROM DimCustomers
SELECT * FROM DimAgents
SELECT * FROM DimCountries
SELECT * FROM DimCategories
SELECT * FROM DimSubCategories
SELECT * FROM DimStores
SELECT * FROM DimProducts
SELECT * FROM FactSales

USE PriorityERP

--Enable CDC on DB
EXECUTE sys.sp_cdc_enable_db;  
GO
--Enable CDC on Part Table  
EXECUTE sys.sp_cdc_enable_table  
    @source_schema = N'dbo'  --schema name
  , @source_name = N'PART'  --Table name 
  , @role_name = null; -- Role Name 
GO 

--Enable CDC on FAMILYTYPES Table  
EXECUTE sys.sp_cdc_enable_table  
    @source_schema = N'dbo'  --schema name
  , @source_name = N'FAMILYTYPES '  --Table name 
  , @role_name = null; -- Role Name 
GO 

--Enable CDC on FAMILY Table  
EXECUTE sys.sp_cdc_enable_table  
    @source_schema = N'dbo'  --schema name
  , @source_name = N'FAMILY'  --Table name 
  , @role_name = null; -- Role Name 
GO

--Enable CDC on Customers Table  
EXECUTE sys.sp_cdc_enable_table  
    @source_schema = N'dbo'  --schema name
  , @source_name = N'CUSTOMERS'  --Table name 
  , @role_name = null; -- Role Name 
GO

--Enable CDC on Invoices Table  
EXECUTE sys.sp_cdc_enable_table  
    @source_schema = N'dbo'  --schema name
  , @source_name = N'INVOICES'  --Table name 
  , @role_name = null; -- Role Name 
GO

--Enable CDC on InvoiceItems Table  
EXECUTE sys.sp_cdc_enable_table  
    @source_schema = N'dbo'  --schema name
  , @source_name = N'INVOICEITEMS'  --Table name 
  , @role_name = null; -- Role Name 
GO


--Enable CDC on BRANCHES Table  
EXECUTE sys.sp_cdc_enable_table  
    @source_schema = N'dbo'  --schema name
  , @source_name = N'BRANCHES'  --Table name 
  , @role_name = null; -- Role Name 
GO

USE PriorityERP;
GO  
EXECUTE sys.sp_cdc_disable_table   
    @source_schema = N'dbo',   
    @source_name = N'InvoiceItems',  
    @capture_instance = N'all';


/*
TRUNCATE TABLE [MRR_BRANCHES]
TRUNCATE TABLE [MRR_CUSTOMERS]
TRUNCATE TABLE [MRR_FAMILY]
TRUNCATE TABLE [MRR_FAMILYTYPES]
TRUNCATE TABLE [MRR_INVOICEITEMS]
TRUNCATE TABLE [MRR_INVOICES]
TRUNCATE TABLE [MRR_PART]
*/