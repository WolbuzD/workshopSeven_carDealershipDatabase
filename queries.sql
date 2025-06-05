-- 1. Get all dealerships
SELECT * FROM dealerships;

-- 2. Get all vehicles for a specific dealership (ID 1)
SELECT v.* 
FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = 1;

-- 3. Get vehicle details by VIN (updated with a valid VIN from your database)
SELECT * 
FROM vehicles 
WHERE VIN = '2QQA0O1WXH3KR3JDJ';  -- Replaced placeholder with actual VIN

-- 4. Find which dealership has a specific vehicle (updated with a valid VIN)
SELECT d.* 
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.VIN = '2QQA0O1WXH3KR3JDJ';  -- Replaced placeholder with actual VIN

-- 5. Find dealerships that have a specific vehicle make/model/color
-- Updated to use actual makes/models/colors from your database
SELECT d.* 
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.VIN = v.VIN
WHERE v.make = 'Ford' AND v.model = '3 Series' AND v.color = 'Green';  -- Used existing combination

-- 6. Get sales contracts for a specific dealership (ID 1) within a date range
-- Updated to use a date range that matches your data (2023-2025)
SELECT s.* 
FROM sales_contracts s
JOIN inventory i ON s.VIN = i.VIN
WHERE i.dealership_id = 1 
  AND s.sale_date BETWEEN '2023-01-01' AND '2025-12-31';  -- Adjusted date range