/*
=============================================================
Create Database and Schemas(Initial Layer Creation)
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up schemas 
    within the database: 'initial'.
	
WARNING:
    Running this script will drop the entire '[DataI_SFPYSQPBI01042025]' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

use MASTER;
GO
CREATE DATABASE [DataI_SFPYSQPBI01042025];

USE [DataI_SFPYSQPBI01042025];

-- Create SCHEMA: initial.layer
CREATE SCHEMA initialSFPYSQPBI;

SELECT * FROM sys.schemas

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 6 FROM sys.databases WHERE name = 'DataI_STPYSQ_PBI01042025')
BEGIN
    ALTER DATABASE DataI_STPYSQ_PBI01042025 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataI_STPYSQ_PBI01042025;
END;
GO



-- Table 1: Create the table: initialSFPYSQPBI.DimCustomerData
		PRINT '================================================';
		PRINT 'Table 1: Create the table: initialSFPYSQPBI.DimCustomerData';
		PRINT '================================================';
IF OBJECT_ID('initialSFPYSQPBI.DimCustomerData', 'U') IS NOT NULL
    DROP TABLE initialSFPYSQPBI.DimCustomerData;
-- Drop the table if it already exists
DROP TABLE IF EXISTS initialSFPYSQPBI.DimCustomerData;
GO


CREATE TABLE initialSFPYSQPBI.DimCustomerData (
    --CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Gender VARCHAR(20),
    DateOfBirth DATE,
    Email VARCHAR(255),
    PhoneNumber VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Postcode VARCHAR(20),
    Country VARCHAR(100),
    LoyaltyProgramID VARCHAR(20) 
);
 GO


-- Table 2: Create the table: initialSFPYSQPBI.DimDate
		PRINT '================================================';
		PRINT 'Table 2: Create the table: initialSFPYSQPBI.DimDate';
		PRINT '================================================';
IF OBJECT_ID('initialSFPYSQPBI.DimDate', 'U') IS NOT NULL
    DROP TABLE initialSFPYSQPBI.DimDate;
DROP TABLE IF EXISTS initialSFPYSQPBI.DimDate;
GO
CREATE TABLE initialSFPYSQPBI.DimDate (
    DateID INT PRIMARY KEY,
    Date DATE,
    DayOfWeek VARCHAR(10),
    Month VARCHAR(10),
    Quarter INT,
    Year INT,
    IsWeekend BIT  -- Changed from BOOLEAN to BIT
);
 GO


-- Table 3: Create the table: initialSFPYSQPBI.DimLoyaltyInfo
		PRINT '================================================';
		PRINT 'Table 3: Create the table: initialSFPYSQPBI.DimLoyaltyInfo';
		PRINT '================================================';
IF OBJECT_ID('initialSFPYSQPBI.DimLoyaltyInfo', 'U') IS NOT NULL
    DROP TABLE initialSFPYSQPBI.DimLoyaltyInfo;
DROP TABLE IF EXISTS initialSFPYSQPBI.DimLoyaltyInfo;
GO
CREATE TABLE initialSFPYSQPBI.DimLoyaltyInfo (
    LoyaltyProgramID VARCHAR(20),
    ProgramName VARCHAR(100),
    ProgramTier VARCHAR(50),
    PointsAccrued INT
);
 GO



-- Table 4: Create the table: initialSFPYSQPBI.DimProductData
		PRINT '================================================';
		PRINT 'Table 4: Create the table: initialSFPYSQPBI.DimProductData';
		PRINT '================================================';
IF OBJECT_ID('initialSFPYSQPBI.DimProductData', 'U') IS NOT NULL
    DROP TABLE initialSFPYSQPBI.DimProductData;
-- Drop the table if it already exists
DROP TABLE IF EXISTS initialSFPYSQPBI.DimProductData;
GO
CREATE TABLE initialSFPYSQPBI.DimProductData (
    ProductID VARCHAR(20),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    UnitPrice VARCHAR(50)
);
 GO


-- Table 5: Create the table: initialSFPYSQPBI.DimStoreData
		PRINT '================================================';
		PRINT 'Table 5: Create the table: initialSFPYSQPBI.DimStoreData';
		PRINT '================================================';
 IF OBJECT_ID('initialSFPYSQPBI.DimStoreData', 'U') IS NOT NULL
DROP TABLE IF EXISTS initialSFPYSQPBI.DimStoreData;
GO
CREATE TABLE initialSFPYSQPBI.DimStoreData (
    --StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    StoreType VARCHAR(50),
	StoreOpeningDate DATE,
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    --ZipCode VARCHAR(10),
    Country VARCHAR(50),
	Region VARCHAR(50),
    ManagerName VARCHAR(100)
);
Go


-- Table 6: Create the table: initialSFPYSQPBI.factorders
		PRINT '================================================';
		PRINT 'Table 6: Create the table: initialSFPYSQPBI.factorders';
		PRINT '================================================';
 IF OBJECT_ID('initialSFPYSQPBI.DimStoreData', 'U') IS NOT NULL
    DROP TABLE initialSFPYSQPBI.DimStoreData;
DROP TABLE IF EXISTS initialSFPYSQPBI.factorders;
GO
CREATE TABLE initialSFPYSQPBI.factOrders (
   -- OrderID INT PRIMARY KEY,
    DateID INT,
    ProductID INT,
    StoreID INT,
	CustomerID INT,
    QuantityOrdered INT,
    OrderAmount VARCHAR(50),
    DiscountAmount VARCHAR(50),
    ShippingCost VARCHAR(50),
    TotalAmount VARCHAR(50)
    --FOREIGN KEY (DateID) REFERENCES DimDate(DateID),
    --FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
    --FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
    --FOREIGN KEY (StoreID) REFERENCES DimStore(StoreID)
);
GO

-- EXEC [DataI_STPYSQ_PBI01042025]

