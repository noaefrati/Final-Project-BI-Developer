USE [DWH_Only_Clothing_Store]
GO

CREATE TABLE [dbo].[MRR_BRANCHES](
	[__$start_lsn] [binary](10) NULL,
	[__$operation] [int] NULL,
	[__$update_mask] [binary](128) NULL,
	[BRANCH] [bigint] NULL,
	[PHONE] [nvarchar](20) NULL,
	[ADDRESS] [nvarchar](80) NULL,
	[STATE] [nvarchar](40) NULL,
	[COUNTRY] [bigint] NULL,
	[CITY] [nvarchar](255) NULL,
	[__$command_id] [int] NULL,
	[Operation] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MRR_CUSTOMERS](
	[__$start_lsn] [binary](10) NULL,
	[__$operation] [int] NULL,
	[__$update_mask] [binary](128) NULL,
	[CUSTNAME] [nvarchar](50) NULL,
	[CUST] [bigint] NULL,
	[ADDRESS] [nvarchar](80) NULL,
	[PHONE] [nvarchar](20) NULL,
	[STATE] [nvarchar](40) NULL,
	[AGENT] [bigint] NULL,
	[COUNTRY] [bigint] NULL,
	[__$command_id] [int] NULL,
	[Operation] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MRR_FAMILY](
	[__$start_lsn] [binary](10) NULL,
	[__$operation] [int] NULL,
	[__$update_mask] [binary](128) NULL,
	[FAMILY] [bigint] NULL,
	[FAMILYNAME] [nvarchar](8) NULL,
	[FAMILYTYPE] [bigint] NULL,
	[__$command_id] [int] NULL,
	[Operation] [int] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[MRR_FAMILYTYPES](
	[__$start_lsn] [binary](10) NULL,
	[__$operation] [int] NULL,
	[__$update_mask] [binary](128) NULL,
	[FAMILYTYPE] [bigint] NULL,
	[FTNAME] [nvarchar](20) NULL,
	[__$command_id] [int] NULL,
	[Operation] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MRR_INVOICEITEMS](
	[__$start_lsn] [binary](10) NULL,
	[__$operation] [int] NULL,
	[__$update_mask] [binary](128) NULL,
	[IV] [bigint] NULL,
	[PART] [bigint] NULL,
	[PRICE] [float] NULL,
	[QUANT] [bigint] NULL,
	[KLINE] [bigint] NULL,
	[__$command_id] [int] NULL,
	[Operation] [int] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MRR_INVOICES](
	[__$start_lsn] [binary](10) NULL,
	[__$operation] [int] NULL,
	[__$update_mask] [binary](128) NULL,
	[IVDATE] [bigint] NULL,
	[IV] [bigint] NULL,
	[CUST] [bigint] NULL,
	[DISCOUNT] [float] NULL,
	[AGENT] [bigint] NULL,
	[__$command_id] [int] NULL,
	[Operation] [int] NULL
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[MRR_PART](
	[__$start_lsn] [binary](10) NULL,
	[__$operation] [int] NULL,
	[__$update_mask] [binary](128) NULL,
	[PARTNAME] [nvarchar](15) NULL,
	[PART] [bigint] NULL,
	[UNIT] [bigint] NULL,
	[STATUS] [nvarchar](1) NULL,
	[PRICE] [float] NULL,
	[COST] [float] NULL,
	[FAMILY] [bigint] NULL,
	[__$command_id] [int] NULL,
	[Operation] [int] NULL
) ON [PRIMARY]
GO


