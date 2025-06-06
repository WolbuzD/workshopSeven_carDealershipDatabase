# 🚗 Dealership Database Queries

![MySQL](https://img.shields.io/badge/DB-MySQL-blue?logo=mysql) ![SQL](https://img.shields.io/badge/Language-SQL-lightgrey) ![Status](https://img.shields.io/badge/Status-Active-brightgreen)

A comprehensive set of SQL queries for the **DealershipDatabase**. This documentation provides example queries to retrieve, filter, and analyze data. Each section includes the SQL code and a placeholder for a screenshot of the results.

---

## 📖 Table of Contents
1. [Get All Dealerships](#1-get-all-dealerships)
![All Dealerships](screenshots/1_all_dealerships.png)
2. [Get Vehicles by Dealership](#2-get-vehicles-by-dealership)  
![Vehicles by Dealership](screenshots/2_vehicles_by_dealership_1.png)
3. [Get Vehicle Details by VIN](#3-get-vehicle-details-by-vin)  
![Vehicle Details by VIN](screenshots/3_vehicle_by_vin.png)
4. [Find Dealership by VIN](#4-find-dealership-by-vin) 
![Dealership by VIN](screenshots/4_dealership_by_vin.png)
5. [Find Dealerships by Make/Model/Color](#5-find-dealerships-by-makemodelcolor)  
![Dealership by Vehicle Attributes](screenshots/5_dealership_by_make_model_color.png)
6. [Get Sales Contracts by Dealership and Date](#6-get-sales-contracts-by-dealership-and-date)
![Sales Contracts by Dealership and Date](screenshots/6_sales_contracts_by_dealership_date.png)

---

## 1️⃣ Get All Dealerships

Retrieve all records from the `dealerships` table.

```sql
SELECT *
FROM dealerships;


``SELECT s.*
FROM sales_contracts s
JOIN inventory i ON s.VIN = i.VIN
WHERE i.dealership_id = 1
  AND s.sale_date BETWEEN '2023-01-01' AND '2025-12-31';``
  
  ## 📸 Screenshot: ![Sales Contracts by Dealership and Date](screenshots/6_sales_contracts_by_dealership_date.png)





