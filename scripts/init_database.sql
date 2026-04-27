/*
============================================================================
Project: Data Warehouse Setup
Architecture: Medallion Architecture (Bronze, Silver, Gold)
Description: 
    This script initializes the Data Warehouse environment by creating 
    specialized schemas to manage the data lifecycle from raw ingestion 
    to business-ready analytics.
Author: Esraa Ashraf
Date: 2026
============================================================================
*/

USE master;
GO

-- Create the Data Warehouse if it doesn't already exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    CREATE DATABASE DataWarehouse;
    PRINT 'Database [DataWarehouse] created successfully.';
END
GO

USE DataWarehouse;
GO

----------------------------------------------------------------------------
-- 1. BRONZE SCHEMA (Raw Layer)
-- Purpose: Ingest raw data from various sources (APIs, Scraping, Flat files).
-- Contains: Unaltered data to ensure full auditability.
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
BEGIN
    EXEC('CREATE SCHEMA bronze');
    PRINT 'Schema [bronze] created.';
END
GO

----------------------------------------------------------------------------
-- 2. SILVER SCHEMA (Cleansed Layer)
-- Purpose: Store cleaned, filtered, and standardized data.
-- Contains: Validated data ready for integration and transformation.
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('CREATE SCHEMA silver');
    PRINT 'Schema [silver] created.';
END
GO

----------------------------------------------------------------------------
-- 3. GOLD SCHEMA (Curated/Business Layer)
-- Purpose: Final layer for business logic and aggregations.
-- Contains: High-level tables for Power BI reports and Data Science models.
----------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
    EXEC('CREATE SCHEMA gold');
    PRINT 'Schema [gold] created.';
END
GO

-- End of Environment Setup
