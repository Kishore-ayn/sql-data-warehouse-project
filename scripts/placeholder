/*
## 📂 scripts/

### ✅ Purpose

This folder contains SQL Server scripts used to initialize and manage the `DataWareHouse` database. The structure follows a modern data lakehouse architecture with three distinct schemas:

- `bronze`: For raw, unprocessed data ingested from source systems.
- `silver`: For cleaned and transformed data, ready for analysis.
- `gold`: For highly curated, business-level aggregations and reporting data.

These scripts are primarily intended for **development, testing, or demonstration** environments.

---

### ⚠️ Warning

> ⚠️ **Caution Before Execution**
>
> - These scripts **drop and recreate the `DataWareHouse` database**, which means **all existing data will be permanently deleted**.
> - The database is set to `SINGLE_USER` mode before dropping, which can interrupt active connections.
> - Only run these scripts if you're **absolutely sure** the environment is safe for reset (e.g., not in production).
> - Always **review scripts line-by-line** before executing on any server.
*/


USE master;


--Drop and recreate the 'DataWareHouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWareHouse')
BEGIN 
	ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWareHouse;
END;
GO

--Create the 'DataWareHouse' database
CREATE DATABASE DataWareHouse;

USE DataWareHouse;
GO

--Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

