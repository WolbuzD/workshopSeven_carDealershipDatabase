## 1️⃣ Get All Dealerships

```SELECT * FROM dealerships;```

📸 Screenshot: ![All Dealerships](screenshots/1_all_dealerships.png)

## 2️⃣ Get All Vehicles for a Specific Dealership (ID = 1)


``SELECT v.*
FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = 1;``

📸 Screenshot: ![Vehicles by Dealership](screenshots/2_vehicles_by_dealership_1.png)

## 3️⃣ Get Vehicle Details by VIN

``sql
SELECT *
FROM vehicles
WHERE VIN = '2QQA0O1WXH3KR3JDJ';``

## 📸 Screenshot: ![Vehicle Details by VIN](screenshots/3_vehicle_by_vin.png)

## 4️⃣ Find Which Dealership Has a Specific Vehicle

``SELECT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.VIN = '2QQA0O1WXH3KR3JDJ';``

## 📸 Screenshot: ![Dealership by VIN](screenshots/4_dealership_by_vin.png)

## 5️⃣ Find Dealerships with Specific Make/Model/Color

``SELECT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.VIN = v.VIN
WHERE v.make = 'Ford' AND v.model = '3 Series' AND v.color = 'Green';``

## 📸 Screenshot: ![Dealership by Vehicle Attributes](screenshots/5_dealership_by_make_model_color.png)

## 6️⃣ Get Sales Contracts for Dealership ID 1 in a Date Range

``SELECT s.*
FROM sales_contracts s
JOIN inventory i ON s.VIN = i.VIN
WHERE i.dealership_id = 1
  AND s.sale_date BETWEEN '2023-01-01' AND '2025-12-31';``
  
  ## 📸 Screenshot: ![Sales Contracts by Dealership and Date](screenshots/6_sales_contracts_by_dealership_date.png)
