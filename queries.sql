SELECT * FROM dealerships;

SELECT v.* FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = 1;

SELECT * FROM vehicles WHERE VIN = 'XYZ1234567890';

SELECT d.* FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.VIN = 'XYZ1234567890';


SELECT d.* FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.VIN = v.VIN
WHERE v.make = 'Ford' AND v.model = 'Mustang' AND v.color = 'Red';


SELECT s.* FROM sales_contracts s
JOIN inventory i ON s.VIN = i.VIN
WHERE i.dealership_id = 1 AND s.sale_date BETWEEN '2023-01-01' AND '2023-12-31';
