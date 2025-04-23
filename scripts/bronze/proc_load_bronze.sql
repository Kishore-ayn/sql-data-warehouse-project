/*
===============================================================================
DDL Script : Create Bronze tables
===============================================================================
Script Purpose :
    This script creates tables in the bronze schema, dropping existing tables
    if they already exists.
    Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/


IF OBJECT_ID('bronze.load_bronze') IS NOT NULL
	DROP PROCEDURE bronze.load_bronze
GO

CREATE PROCEDURE [bronze].[load_bronze]
AS
BEGIN
	DECLARE @starttime AS DATETIME, @endtime AS DATETIME, @batch_start_time AS DATETIME, @batch_end_time AS DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '===========================================================';
		PRINT 'LOADING BRONZE LAYER';
		PRINT '===========================================================';

		
		PRINT '-----------------------------------------------------------';
		PRINT 'LOADING CRM LAYERS';
		PRINT '-----------------------------------------------------------';

		SET @starttime = GETDATE();
		PRINT '>> Truncating Table : bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Inserting Data Into : bronze.crm_customer_info'
		BULK INSERT bronze.crm_cust_info 
		FROM 'D:\PERSONAL\DE\Projects\Dataware Housing Project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT '>> Load Duration : ' + CAST(DATEDIFF(SECOND, @starttime, @endtime) AS NVARCHAR) + ' seconds';
		PRINT '-----------------'


		SET @starttime = GETDATE();
		PRINT '>> Truncating Table : bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting Data Into : bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info 
		FROM 'D:\PERSONAL\DE\Projects\Dataware Housing Project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT '>> Load Duration : ' + CAST(DATEDIFF(SECOND, @starttime, @endtime) AS NVARCHAR) + ' seconds';
		PRINT '-----------------'

		SET @starttime = GETDATE();
		PRINT '>> Truncating Table : bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserting Data Into : bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details 
		FROM 'D:\PERSONAL\DE\Projects\Dataware Housing Project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT '>> Load Duration : ' + CAST(DATEDIFF(SECOND, @starttime, @endtime) AS NVARCHAR) + ' seconds';
		PRINT '-----------------'

		PRINT '-----------------------------------------------------------';
		PRINT 'LOADING CRM LAYERS';
		PRINT '-----------------------------------------------------------';


		SET @starttime = GETDATE();
		PRINT '>> Truncating Table : bronze.erp_custaz12'
		TRUNCATE TABLE bronze.erp_custaz12;

		PRINT '>> Inserting Data Into : bronze.erp_custaz12'
		BULK INSERT bronze.erp_custaz12 
		FROM 'D:\PERSONAL\DE\Projects\Dataware Housing Project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT '>> Load Duration : ' + CAST(DATEDIFF(SECOND, @starttime, @endtime) AS NVARCHAR) + ' seconds';
		PRINT '-----------------'


		SET @starttime = GETDATE();
		PRINT '>> Truncating Table : bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Inserting Data Into : bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101 
		FROM 'D:\PERSONAL\DE\Projects\Dataware Housing Project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT '>> Load Duration : ' + CAST(DATEDIFF(SECOND, @starttime, @endtime) AS NVARCHAR) + ' seconds';
		PRINT '-----------------'


		SET @starttime = GETDATE();
		PRINT '>> Truncating Table : bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> Inserting Data Into : bronze.erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2 
		FROM 'D:\PERSONAL\DE\Projects\Dataware Housing Project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @endtime = GETDATE();
		PRINT '>> Load Duration : ' + CAST(DATEDIFF(SECOND, @starttime, @endtime) AS NVARCHAR) + ' seconds';
		PRINT '-----------------'

		SET @batch_end_time = GETDATE();
		PRINT '==========================================================='
		PRINT 'Loading Bronze Layer is Completed'
		PRINT '>> Total Load Duration : ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds'
		PRINT '==========================================================='

		END TRY
	BEGIN CATCH
		PRINT '===========================================================';
		PRINT 'Error Occurred While Loading The Bronze Layer'
		PRINT 'Error Message ' + ERROR_MESSAGE();
		PRINT 'Error Message ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message ' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '===========================================================';
	END CATCH

END;

GO



