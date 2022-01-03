use PriorityERP

SELECT * FROM INVOICES
SELECT * FROM INVOICEITEMS

select inv.iv as 'INVOICES_IV', invt.iv as 'INVOICEITEMES_IV', inv.AGENT, inv.CUST, inv.DISCOUNT, inv.IVDATE, 
       invt.QUANT, invt.PRICE, invt.PART
from INVOICES as inv full outer join INVOICEITEMS as invt
on inv.IV = invt.IV
/*
invoice - not null
invoiceitems - null
operation_invoice == 1 -> insert

invoice - not null
invoiceitems - null
operation_invoice == 3 -> delete
*/

SELECT  inv.iv as 'INVOICES_IV', invt.iv as 'INVOICEITEMES_IV', inv.AGENT, inv.CUST, inv.DISCOUNT, inv.IVDATE, 
        invt.QUANT, invt.PRICE, invt.PART, invt.KLINE, inv.__$operation, invt.__$operation
FROM [cdc].[dbo_INVOICES_CT] AS inv full outer join [cdc].[dbo_INVOICEITEMS_CT] AS invt
ON inv.iv = invt.iv
where invt.iv = 1002

delete from INVOICEITEMS 
where iv = 1002 and kline = 1002
---------------------------------------------------------
/*               Testing Increamental Load             */
---------------------------------------------------------
USE PriorityERP

-- 1. UPDATE(INVOICES) : 

UPDATE INVOICES SET DISCOUNT = 4
WHERE IV = 1

-- Check with cdc table to see the change:
SELECT * FROM [cdc].[dbo_INVOICES_CT]
WHERE IV = 1

-- After runing the ssis project, check with the next tables:
USE DWH_Only_Clothing_Store

SELECT * 
FROM MRR_INVOICES
WHERE IV = 1

SELECT *
FROM STG_FactSales
WHERE InvoiceID = 1

SELECT TOP 1 *
FROM FactSales
WHERE InvoiceID = 1
ORDER BY FactSalesKey DESC
---------------------------------------------------------------
-- 2. UPDATE(INVOICEITEMS):
USE PriorityERP

UPDATE INVOICEITEMS set QUANT = 11 
WHERE IV = 3 AND KLINE = 133

SELECT *
FROM INVOICEITEMS
WHERE IV = 3 AND KLINE = 133

-- Check with cdc table to see the change:
SELECT * FROM [cdc].[dbo_InvoiceItems_CT]
WHERE IV = 3 AND KLINE = 133


-- After runing the ssis project, check with the next tables:
USE DWH_Only_Clothing_Store

SELECT * 
FROM MRR_INVOICEITEMS
WHERE IV = 3

SELECT *
FROM STG_FactSales
WHERE InvoiceID = 3 AND Kline = 133

SELECT TOP 1 *
FROM FactSales
WHERE InvoiceID = 3 AND Kline = 133
ORDER BY FactSalesKey DESC
--------------------------------------------------------------------------
-- 3. UPDATE(Both) -> On INVOICES & INVOICEITEMS
USE PriorityERP

-- UPDATE On INVOICEITEMS TBL:
UPDATE INVOICEITEMS set QUANT = 11 
WHERE IV = 3 AND KLINE = 133

SELECT *
FROM INVOICEITEMS
WHERE IV = 3 AND KLINE = 133

-- Check with cdc table to see the change:
SELECT * FROM [cdc].[dbo_InvoiceItems_CT]
WHERE IV = 3 AND KLINE = 133

-- UPDATE ON INVOICES TBL:
UPDATE INVOICES SET DISCOUNT = 4
WHERE IV = 3

-- Check with cdc table to see the change:
SELECT * FROM [cdc].[dbo_INVOICES_CT]
WHERE IV = 3

-- After runing the ssis project, check with the next tables:
USE DWH_Only_Clothing_Store

SELECT * 
FROM MRR_INVOICEITEMS
WHERE IV = 3

SELECT * 
FROM MRR_INVOICES
WHERE IV = 3

SELECT *
FROM STG_FactSales
WHERE InvoiceID = 3 AND Kline = 133

SELECT TOP 1 *
FROM FactSales
WHERE InvoiceID = 3 AND Kline = 133
ORDER BY FactSalesKey DESC
--------------------------------------------------------------------------
-- 4. INSERT(Both) -> INVOICES & INVOICEITEMS:
USE PriorityERP

-- INSERT INTO INVOICES TBL:
INSERT INTO INVOICES (IVDATE, CUST, AGENT, DISCOUNT) values ('20210812', 15, 15, 15);

DECLARE @InvoiceID BIGINT

SELECT TOP 1 @InvoiceID = IV
FROM INVOICES
ORDER BY IV DESC

SELECT IVDATE, CUST, AGENT, DISCOUNT, IV
FROM INVOICES
WHERE IV = 11002

-- Check with cdc table to see the change:
SELECT * FROM [cdc].[dbo_INVOICES_CT]
WHERE IV = 11002

-- INSERT INTO INVOICEITEMS TBL:

SELECT TOP 1 KLINE + 1 FROM INVOICEITEMS ORDER BY KLINE DESC

INSERT INTO INVOICEITEMS (IV, PART, PRICE, QUANT, KLINE) values (11002, 51, 29, 6, 1006);

SELECT *
FROM INVOICEITEMS
WHERE IV = 11002 AND KLINE = 1006

-- Check with cdc table to see the change:
SELECT * FROM [cdc].[dbo_INVOICEITEMS_CT]
WHERE IV = 11002 AND KLINE = 1006

-- After runing the ssis project, check with the next tables:
USE DWH_Only_Clothing_Store

SELECT * 
FROM MRR_INVOICEITEMS
WHERE IV = 11002 AND KLINE = 1006

SELECT * 
FROM MRR_INVOICES
WHERE IV = 11002

SELECT *
FROM STG_FactSales
WHERE InvoiceID = 11002 AND Kline = 1006

SELECT TOP 1 *
FROM FactSales
WHERE InvoiceID = 11002 AND Kline = 1006
ORDER BY FactSalesKey DESC

--------------------------------------------------------------------------
-- 5. INSERT(INVOICES):
GO
USE PriorityERP

-- INSERT INTO INVOICES TBL:
INSERT INTO INVOICES (IVDATE, CUST, AGENT, DISCOUNT) values ('20210811', 10, 10, 10);

SELECT IV
FROM INVOICES
ORDER BY IV DESC

SELECT IVDATE, CUST, AGENT, DISCOUNT, IV
FROM INVOICES
WHERE IV = 11003

-- Check with cdc table to see the change:
SELECT * FROM [cdc].[dbo_INVOICES_CT]
WHERE IV = 11003
-- After runing the ssis project, check with the next tables:
USE DWH_Only_Clothing_Store

SELECT * 
FROM MRR_INVOICES
WHERE IV = 11003

SELECT *
FROM STG_FactSales
WHERE InvoiceID = 11003

SELECT TOP 1 *
FROM FactSales
WHERE InvoiceID = 11003
ORDER BY FactSalesKey DESC
---------------------------------------------------------------------
-- 6. DELETE(INVOICES)
USE PriorityERP

DELETE FROM INVOICES
WHERE IV = 1000

SELECT *
FROM INVOICES
WHERE IV = 1000

-- Check with cdc table to see the change:
SELECT * FROM [cdc].[dbo_INVOICES_CT]
WHERE IV = 1000

-- After runing the ssis project, check with the next tables:
USE DWH_Only_Clothing_Store

SELECT * 
FROM MRR_INVOICES
WHERE IV = 1000

SELECT *
FROM STG_FactSales
WHERE InvoiceID = 1000

SELECT *
FROM FactSales
WHERE InvoiceID = 1000

----------------------------------------------------------------------
-- ALL DIMS & FACT TBL:
USE DWH_Only_Clothing_Store

SELECT * FROM [dbo].[DimAgents]SELECT * FROM [dbo].[DimCustomers]SELECT * FROM [dbo].[DimCategories]SELECT * FROM [dbo].[DimSubCategories]SELECT * FROM [dbo].[DimProducts]SELECT * FROM [dbo].[DimCountries]SELECT * FROM [dbo].[DimStores]SELECT * FROM [dbo].[FactSales]

SELECT * FROM MRR_INVOICES
SELECT * FROM MRR_INVOICEITEMS
SELECT * FROM MRR_BRANCHES
SELECT * FROM MRR_CUSTOMERS
SELECT * FROM MRR_FAMILY
SELECT * FROM MRR_FAMILYTYPES
SELECT * FROM MRR_PART

SELECT * FROM STG_DimAgents
SELECT * FROM  STG_DimCategories
SELECT * FROM STG_DimCustomers
SELECT * FROM STG_DimProducts
SELECT * FROM STG_DimStores
SELECT * FROM STG_DimSubCategories
SELECT * FROM STG_FactSales
