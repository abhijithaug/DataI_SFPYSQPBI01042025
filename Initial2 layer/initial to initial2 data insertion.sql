/*
===============================================================================
Stored Procedure: Load Silver Layer (Initial -> Initial2)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	Actions Performed:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
		
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Initial2.load_Initial2;

<<<Stored Procedure: Load initialSFPYSQPBI2 Layer >>>

To the following tables

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
select * from [initialSFPYSQPBI2].[DimCustomerData];
select * from [initialSFPYSQPBI2].[DimDate];
select * from [initialSFPYSQPBI2].[DimLoyaltyInfo];
select * from [initialSFPYSQPBI2].[DimProductData];
select * from [initialSFPYSQPBI2].[DimStoreData];
select * from [initialSFPYSQPBI2].[factOrders];
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

No data cleanings performed here.
Done only the data trasfer from the bales on Initial layer to the corresponding tables in Initial2 layer
===============================================================================
*/

--CREATE OR ALTER PROCEDURE initialSFPYSQPBI2.load_initialSFPYSQPBI2 AS

        PRINT '================================================';
        PRINT 'Loading Initial2 Layer';
        PRINT '================================================';


-- Table 1: Inserting/Loading the table: initialSFPYSQPB2.DimCustomerData from initialSFPYSQPB.DimCustomerData
		PRINT '==================================================';
		PRINT '#1: Loading initialSFPYSQPB2.DimCustomerData Table';
		PRINT '==================================================';

		PRINT '>> Truncating Table: initialSFPYSQPBI2.DimCustomerData';
		TRUNCATE TABLE initialSFPYSQPBI2.DimCustomerData;
		PRINT '>> Inserting Data Into: initialSFPYSQPBI2.DimCustomerData';

	INSERT INTO initialSFPYSQPBI2.[DimCustomerData] 
			(
			FirstName,
			LastName,
			Gender,
			DateOfBirth,
			Email,
			PhoneNumber,
			Address,
			City,
			State,
			Postcode,
			Country,
			LoyaltyProgramID
			)
	SELECT
			FirstName,
			LastName,
			Gender,
			DateOfBirth,
			Email,
			PhoneNumber,
			Address,
			City,
			State,
			Postcode,
			Country,
			LoyaltyProgramID
	FROM [initialSFPYSQPBI].[DimCustomerData]

GO

-- Table 2: Inserting/Loading the table: initialSFPYSQPB2.DimCustomerData from initialSFPYSQPB.DimDate
		PRINT '================================================';
		PRINT '#1: Loading initialSFPYSQPB2.DimDate Table';
		PRINT '================================================';

		PRINT '>> Truncating Table: initialSFPYSQPBI2.DimDate';
		TRUNCATE TABLE initialSFPYSQPBI2.DimDate;
		PRINT '>> Inserting Data Into: initialSFPYSQPBI2.DimDate';

	INSERT INTO [initialSFPYSQPBI2].[DimDate]
			(
			DateID,
			Date,
			DayOfWeek,
			Month,
			Quarter,
			Year,
			IsWeekend
			)
	SELECT 
			DateID,
			Date,
			DayOfWeek,
			Month,
			Quarter,
			Year,
			IsWeekend
	FROM [initialSFPYSQPBI].[DimDate]

GO

-- Table 3: Inserting/Loading the table: initialSFPYSQPB2.DimLoyaltyInfo from initialSFPYSQPB.DimLoyaltyInfo
		PRINT '================================================';
		PRINT '#1: Loading initialSFPYSQPB2.DimLoyaltyInfo Table';
		PRINT '================================================';

		PRINT '>> Truncating Table: initialSFPYSQPBI2.DimLoyaltyInfo';
		TRUNCATE TABLE initialSFPYSQPBI2.DimLoyaltyInfo;
		PRINT '>> Inserting Data Into: initialSFPYSQPBI2.DimLoyaltyInfo';

	INSERT INTO [initialSFPYSQPBI2].[DimLoyaltyInfo]
			(
			LoyaltyProgramID,
			ProgramName,
			ProgramTier,
			PointsAccrued
			)
	SELECT 
			LoyaltyProgramID,
			ProgramName,
			ProgramTier,
			PointsAccrued
	FROM [initialSFPYSQPBI].[DimLoyaltyInfo]

GO

-- Table 4: Inserting/Loading the table: initialSFPYSQPB2.DimProductData from initialSFPYSQPB.DimProductData
		PRINT '================================================';
		PRINT '#1: Loading initialSFPYSQPB2.DimProductData Table';
		PRINT '================================================';

		PRINT '>> Truncating Table: initialSFPYSQPBI2.DimProductData';
		TRUNCATE TABLE initialSFPYSQPBI2.DimProductData;
		PRINT '>> Inserting Data Into: initialSFPYSQPBI2.DimProductData';

	INSERT INTO [initialSFPYSQPBI2].[DimProductData]
				(
			    ProductID,
				ProductName,
				Category,
				Brand,
				UnitPrice
				)
	SELECT 
				ProductID,
				ProductName,
				Category,
				Brand,
				UnitPrice
	FROM [initialSFPYSQPBI].[DimProductData]

	GO

-- Table 5: Inserting/Loading the table: initialSFPYSQPB2.DimStoreData from initialSFPYSQPB.DimStoreData
		PRINT '================================================';
		PRINT '#1: Loading initialSFPYSQPB2.DimStoreData Table';
		PRINT '================================================';

		PRINT '>> Truncating Table: initialSFPYSQPBI2.DimStoreData';
		TRUNCATE TABLE initialSFPYSQPBI2.DimStoreData;
		PRINT '>> Inserting Data Into: initialSFPYSQPBI2.DimStoreData';

	INSERT INTO [initialSFPYSQPBI2].[DimStoreData]
				(
			    --StoreID INT PRIMARY KEY,
				StoreName,
				StoreType,
				StoreOpeningDate,
				Address,
				City,
				State,
				--ZipCode VARCHAR(10),
				Country,
				Region,
				ManagerName
				)
	SELECT 
				--StoreID INT PRIMARY KEY,
				StoreName,
				StoreType,
				StoreOpeningDate,
				Address,
				City,
				State,
				--ZipCode VARCHAR(10),
				Country,
				Region,
				ManagerName
	FROM [initialSFPYSQPBI].[DimStoreData]

GO

-- Table 6: Inserting/Loading the table: initialSFPYSQPB2.DimStoreData from initialSFPYSQPB.DimStoreData
		PRINT '================================================';
		PRINT '#1: Loading initialSFPYSQPB2.DimStoreData Table';
		PRINT '================================================';

		PRINT '>> Truncating Table: initialSFPYSQPBI2.DimStoreData';
		TRUNCATE TABLE initialSFPYSQPBI2.DimStoreData;
		PRINT '>> Inserting Data Into: initialSFPYSQPBI2.DimStoreData';

	INSERT INTO [initialSFPYSQPBI2].[factOrders]
				(
				-- OrderID INT PRIMARY KEY,
				DateID,
				ProductID,
				StoreID,
				CustomerID,
				QuantityOrdered,
				OrderAmount,
				DiscountAmount,
				ShippingCost,
				TotalAmount
				--FOREIGN KEY (DateID) REFERENCES DimDate(DateID),
				--FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
				--FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
				--FOREIGN KEY (StoreID) REFERENCES DimStore(StoreID)
			)
	SELECT 
		-- OrderID INT PRIMARY KEY,
				DateID,
				ProductID,
				StoreID,
				CustomerID,
				QuantityOrdered,
				OrderAmount,
				DiscountAmount,
				ShippingCost,
				TotalAmount
				--FOREIGN KEY (DateID) REFERENCES DimDate(DateID),
				--FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
				--FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
				--FOREIGN KEY (StoreID) REFERENCES DimStore(StoreID)
	FROM [initialSFPYSQPBI].[factOrders]

GO




select * from [initialSFPYSQPBI2].[DimCustomerData];
GO
select * from [initialSFPYSQPBI2].[DimDate];
GO
select * from [initialSFPYSQPBI2].[DimLoyaltyInfo];
GO
select * from [initialSFPYSQPBI2].[DimProductData];
GO
select * from [initialSFPYSQPBI2].[DimStoreData];
GO
select * from [initialSFPYSQPBI2].[factOrders];
GO

[DataI_SFPYSQPBI01042025]
