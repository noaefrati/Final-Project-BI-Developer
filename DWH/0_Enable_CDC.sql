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

/*
USE PriorityERP;
GO  
EXECUTE sys.sp_cdc_disable_table   
    @source_schema = N'dbo',   
    @source_name = N'InvoiceItems',  
    @capture_instance = N'all';
*/