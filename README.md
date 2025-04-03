# DataI_SFPYSQPBI01042025
# 📊 Power BI Dashboard Project with SQL  

## **🚀 Project Overview**  
This project focuses on creating an **interactive Power BI dashboard** by extracting, transforming, and visualizing data using **SQL** and **Power BI**.  

## **🔹 Technology Stack**
- **SQL Server**: Data extraction, transformation, and storage.
- **Power BI**: Data visualization and dashboard creation.
- **DAX (Data Analysis Expressions)**: Creating custom KPIs and measures.

---

## **📌 Data Pipeline Architecture**  

### **1️⃣ Initial Layer - Data Loading**
🔹 Import raw data from SQL Server into Power BI.  
🔹 Data sources include:
   - `DimCustomerData` (Customer details)
   - `DimDate` (Date dimension)
   - `DimLoyaltyInfo` (Loyalty program information)
   - `DimProductData` (Product details)
   - `DimStoreData` (Store details)
   - `factOrders` (Fact table containing sales transactions)

---

### **2️⃣ Initial2 Layer - Data Cleaning & Transformation**
🔹 **Data Cleansing Tasks:**
   - Remove duplicates and handle missing values.
   - Convert data types (e.g., converting price columns from string to numeric).
   - Normalize data where necessary (e.g., standardizing date formats).  

🔹 **Data Transformation Steps:**
   - Join tables (Fact and Dimension) to create a **star schema**.
   - Create **calculated columns** (e.g., `Order Year`, `Customer Age`).
   - Generate **DAX measures** for revenue calculations.

---

## **📊 Power BI Dashboard Features**
🔹 **Key Visuals**
   - **Sales Overview**: Gross, net, and lost revenue comparison.
   - **Orders by Category**: Number of orders per product category.
   - **Revenue Trends**: Monthly revenue analysis.
   - **Customer Insights**: Customer demographics and loyalty program impact.
   - **Geographic Distribution**: Sales by region and store.

🔹 **Key Performance Indicators (KPIs)**
   - **Total Revenue:** `SUM(factOrders[TotalAmount])`
   - **Net Revenue:** `SUM(factOrders[TotalAmount]) - SUM(factOrders[DiscountAmount]) - SUM(factOrders[ShippingCost])`
   - **Total Orders:** `COUNT(factOrders[CustomerID])`
   - **Average Order Value:** `DIVIDE(SUM(factOrders[TotalAmount]), COUNT(factOrders[CustomerID]), 0)`
   - **Orders by Product Category:** `COUNTROWS(FILTER(factOrders, RELATED(DimProductData[Category]) = "Electronics"))`

---

## **⚙️ How to Run This Project**
1️⃣ Load data into **SQL Server** from provided CSV files or datasets.  
2️⃣ Connect **Power BI** to SQL Server and import tables.  
3️⃣ Perform **data cleaning & transformation** in **Power Query Editor**.  
4️⃣ Create **DAX measures** for KPIs.  
5️⃣ Build **interactive Power BI visualizations**.  
6️⃣ Publish and share the **Power BI report**.

---

## **📁 Repository Structure**

