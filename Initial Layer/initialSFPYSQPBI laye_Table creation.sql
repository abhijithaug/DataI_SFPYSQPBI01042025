
/*
===============================================================================
Stored Procedure: Load initialSFPYSQPBI Layer 

To the following tables

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
select * from [initialSFPYSQPBI].[DimCustomerData];
select * from [initialSFPYSQPBI].[DimDate];
select * from [initialSFPYSQPBI].[DimLoyaltyInfo];
select * from [initialSFPYSQPBI].[DimProductData];
select * from [initialSFPYSQPBI].[DimStoreData];
select * from [initialSFPYSQPBI].[factOrders];
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC initialSFPYSQPBI.load_initialSFPYSQPBI;


	--CREATE OR ALTER PROCEDURE initialSFPYSQPBI.load_initialSFPYSQPBI AS

===============================================================================
*/
		
		--CREATE OR ALTER PROCEDURE initialSFPYSQPBI.load_initialSFPYSQPBI AS
			
		PRINT '------------------------------------------------';
		PRINT '#1: Loading DimCustomerData Table';
		PRINT '------------------------------------------------';
		
		PRINT '>> Truncating Table: initialSFPYSQPBI.DimCustomerData';
		TRUNCATE TABLE initialSFPYSQPBI.DimCustomerData;
		PRINT '>> Inserting Data Into: initialSFPYSQPBI.DimCustomerData';
		BULK INSERT initialSFPYSQPBI.DimCustomerData
		FROM 'C:\Users\abhijith\Downloads\EndtoEndSalesProject-master\EndtoEndSalesProject-master\One Time Load\DimCustomerData.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	GO

		PRINT '------------------------------------------------';
		PRINT '#2: Loading DimDate Table';
		PRINT '------------------------------------------------';
		PRINT '>> Truncating Table: initialSFPYSQPBI.DimDate';
		TRUNCATE TABLE initialSFPYSQPBI.DimDate;
		PRINT '>> Inserting Data Into: initialSFPYSQPBI.DimDate';
		BULK INSERT initialSFPYSQPBI.DimDate
		FROM 'C:\Users\abhijith\Downloads\EndtoEndSalesProject-master\EndtoEndSalesProject-master\One Time Load\DimDate.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	GO

		PRINT '------------------------------------------------';
		PRINT '#3: Loading DimLoyaltyInfo Table';
		PRINT '------------------------------------------------';
				--SET @start_time = GETDATE();
		PRINT '>> Truncating Table: initialSFPYSQPBI.DimLoyaltyInfo';
		TRUNCATE TABLE initialSFPYSQPBI.DimLoyaltyInfo;
		PRINT '>> Inserting Data Into: initialSFPYSQPBI.DimLoyaltyInfo';
		BULK INSERT initialSFPYSQPBI.DimLoyaltyInfo
		FROM 'C:\Users\abhijith\Downloads\EndtoEndSalesProject-master\EndtoEndSalesProject-master\One Time Load\DimLoyaltyInfo.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

	
		PRINT '------------------------------------------------';
		PRINT '#4: Loading DimProductData Table';
		PRINT '------------------------------------------------';
		PRINT '>> Truncating Table: initialSFPYSQPBI.DimProductData';
		TRUNCATE TABLE initialSFPYSQPBI.DimProductData;
		PRINT '>> Inserting Data Into: initialSFPYSQPBI.DimProductData';
		BULK INSERT initialSFPYSQPBI.DimProductData
		FROM 'C:\Users\abhijith\Downloads\EndtoEndSalesProject-master\EndtoEndSalesProject-master\One Time Load\DimProductData.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	GO


		PRINT '------------------------------------------------';
		PRINT '#5: Loading DimStoreData Table';
		PRINT '------------------------------------------------';
		PRINT '>> Truncating Table: initialSFPYSQPBI.DimStoreData';
		TRUNCATE TABLE initialSFPYSQPBI.DimStoreData;
		PRINT '>> Inserting Data Into: initialSFPYSQPBI.DimStoreData';
		BULK INSERT initialSFPYSQPBI.DimStoreData
		FROM 'C:\Users\abhijith\Downloads\EndtoEndSalesProject-master\EndtoEndSalesProject-master\One Time Load\DimStoreData.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
GO

		PRINT '------------------------------------------------';
		PRINT '#6: Loading factorders Table';
		PRINT '------------------------------------------------';
		PRINT '>> Truncating Table: initialSFPYSQPBI.factorders';
		TRUNCATE TABLE initialSFPYSQPBI.factorders;
		PRINT '>> Inserting Data Into: initialSFPYSQPBI.factorders';
		BULK INSERT initialSFPYSQPBI.factorders
		FROM 'C:\Users\abhijith\Downloads\EndtoEndSalesProject-master\EndtoEndSalesProject-master\One Time Load\factorders.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	GO
