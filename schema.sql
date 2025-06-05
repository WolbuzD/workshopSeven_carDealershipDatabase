# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          workshopSeven_carDealershipDatabase             #
# ---------------------------------------------------------------------- #
DROP DATABASE IF EXISTS DealershipDatabase;

CREATE DATABASE IF NOT EXISTS DealershipDatabase;

USE DealershipDatabase;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "dealerships"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

# ---------------------------------------------------------------------- #
# Add table "vehicles"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(30),
    model VARCHAR(30),
    year INT,
    color VARCHAR(20),
    mileage INT,
    price DECIMAL(10,2),
    sold BOOLEAN
);

# ---------------------------------------------------------------------- #
# Add table "inventory"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

# ---------------------------------------------------------------------- #
# Add table "sales_contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE sales_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    customer_name VARCHAR(50),
    sale_date DATE,
    sale_price DECIMAL(10,2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

# ---------------------------------------------------------------------- #
# Add table "lease_contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE lease_contracts (
    lease_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    customer_name VARCHAR(50),
    lease_start DATE,
    lease_end DATE,
    monthly_payment DECIMAL(10,2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Disable foreign key checks temporarily
SET FOREIGN_KEY_CHECKS = 0;

-- Truncate child tables first
TRUNCATE TABLE lease_contracts;
TRUNCATE TABLE sales_contracts;
TRUNCATE TABLE inventory;

-- Then truncate parent tables
TRUNCATE TABLE vehicles;
TRUNCATE TABLE dealerships;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

# ---------------------------------------------------------------------- #
# Add info into "dealerships"                                            #
# ---------------------------------------------------------------------- #

INSERT INTO dealerships (dealership_id, name, address, phone) VALUES
(1, 'Urban Auto Group', '123 Main St', '2125551234'),
(2, 'Elite Motors', '456 Broadway', '2125555678'),
(3, 'Value Cars NY', '789 5th Ave', '2125559012'),
(4, 'Fast Lane Autos', '101 Market St', '2125551004'),
(5, 'CityDrive Motors', '202 Pine St', '2125551005'),
(6, 'Metro Wheels', '303 Elm St', '2125551006'),
(7, 'Skyline Cars', '404 Cedar Rd', '2125551007'),
(8, 'Prime Autos', '505 Maple Ave', '2125551008'),
(9, 'Capital Motors', '606 Oak Blvd', '2125551009'),
(10, 'Auto Galaxy', '707 Birch Dr', '2125551010'),
(11, 'Downtown Rides', '808 Ash Ct', '2125551011'),
(12, 'Summit Motors', '909 Cherry Ln', '2125551012'),
(13, 'NextGen Auto', '111 Spruce St', '2125551013'),
(14, 'Trusty Cars', '222 Poplar Rd', '2125551014'),
(15, 'Union Auto Mall', '333 Willow Way', '2125551015'),
(16, 'Driven NYC', '444 Hickory Blvd', '2125551016'),
(17, 'Auto Empire', '555 Sycamore St', '2125551017'),
(18, 'Motor City Dealers', '666 Magnolia Ave', '2125551018'),
(19, 'SureRide Motors', '777 Dogwood Pl', '2125551019'),
(20, 'Brooklyn Wheels', '888 Fir St', '2125551020'),
(21, 'Five Borough Autos', '999 Redwood Rd', '2125551021'),
(22, 'Liberty Auto Center', '121 Freedom Blvd', '2125551022'),
(23, 'Northside Motors', '131 North St', '2125551023'),
(24, 'SouthEnd Dealers', '141 South St', '2125551024'),
(25, 'EastLine Cars', '151 East Rd', '2125551025'),
(26, 'West End Autos', '161 West Rd', '2125551026'),
(27, 'TrustAuto NYC', '171 Center Dr', '2125551027'),
(28, 'Harlem Auto Hub', '181 Uptown Ave', '2125551028'),
(29, 'Queens Car Spot', '191 Queens Blvd', '2125551029'),
(30, 'Bronx Auto Market', '201 Bronx Rd', '2125551030');


# ---------------------------------------------------------------------- #
# Add info into "vehicles"                                               #
# ---------------------------------------------------------------------- #

INSERT INTO vehicles (VIN, make, model, year, color, mileage, price, sold) VALUES
('2QQA0O1WXH3KR3JDJ', 'Toyota', 'Impala', 2017, 'Silver', 9279, 20387.82, TRUE),
('EEMIK0DGRLY6IKJ7P', 'Nissan', 'CX-5', 2019, 'Yellow', 43980, 17985.77, TRUE),
('36V3TV62JGYSMJGPY', 'Honda', 'CX-5', 2020, 'Blue', 70271, 19544.25, FALSE),
('PV68WV2HUDK79YTZP', 'Honda', 'Corolla', 2015, 'Blue', 7815, 8253.47, FALSE),
('Y6TAHGUYJCTLG3FND', 'Kia', 'Elantra', 2018, 'Gray', 48897, 8129.46, TRUE),
('V48M9FI84AHRH220B', 'Toyota', 'Elantra', 2021, 'Silver', 45129, 23485.82, TRUE),
('0M1FPLBVQYH73WQ67', 'Kia', 'F-150', 2020, 'Red', 65767, 11248.10, TRUE),
('X1KNZZRNNS8FHCUVR', 'Mazda', 'Altima', 2021, 'Yellow', 41472, 18966.94, TRUE),
('1V7M0VHH535J1VW3H', 'BMW', 'Soul', 2018, 'White', 88039, 39945.37, TRUE),
('5CNEP80J713GVEGTP', 'Mazda', 'Corolla', 2020, 'Yellow', 86903, 36235.03, FALSE),
('06ZIDDQLKSBIFW91C', 'Toyota', 'CX-5', 2021, 'Blue', 37728, 18033.09, FALSE),
('495WOEQ2EY3YGK0V6', 'Ford', '3 Series', 2020, 'Green', 50576, 38569.37, TRUE),
('1LBZV9AF24FMSO5OT', 'BMW', 'E350', 2023, 'Green', 23841, 34321.44, TRUE),
('P7T1OCIEKKR68OZXV', 'Nissan', 'Impala', 2017, 'Green', 22097, 33706.01, TRUE),
('XQFEMTXB24V7B4G2L', 'Mercedes', 'Soul', 2020, 'Blue', 65540, 27368.86, FALSE),
('FWP7GBHB1ZKFX87J1', 'Kia', 'F-150', 2015, 'Silver', 86544, 12497.20, FALSE),
('7VF9J0GXLCQGE5IEX', 'BMW', 'Corolla', 2019, 'White', 15732, 11707.18, TRUE),
('6AHOKZOIH1GEDQJRI', 'Hyundai', 'Altima', 2016, 'Red', 78811, 37223.39, FALSE),
('3ZMJUXQVGJ4J05OZR', 'Mazda', 'CX-5', 2019, 'Red', 13486, 20613.08, FALSE),
('K38P2MJH60IEAUB5S', 'Ford', '3 Series', 2022, 'Green', 47660, 16231.70, TRUE),
('A4JB5Z8EIKONV9LCP', 'Mercedes', 'Civic', 2023, 'Gray', 50100, 39499.99, TRUE),
('Z1T3UR9ZLRIO4AHDY', 'Toyota', '3 Series', 2018, 'Blue', 60487, 14224.30, TRUE),
('KQW5PS0VGM79XEPZ8', 'Chevrolet', 'Impala', 2023, 'Silver', 25692, 17723.81, TRUE),
('SKV7E1U6B05YRPZHT', 'BMW', 'Altima', 2015, 'Red', 22233, 20440.77, FALSE),
('HYDIPRCSFGRRUYUPV', 'Toyota', 'F-150', 2018, 'Red', 43027, 11715.51, TRUE),
('P2SKIKFM14YY71AMM', 'Hyundai', 'F-150', 2021, 'White', 55102, 20812.64, TRUE),
('NVOI6A3KX9WLMT09T', 'Chevrolet', 'Elantra', 2019, 'Gray', 50242, 39771.65, TRUE),
('QFA3QK3C9K6O37LO9', 'Kia', 'E350', 2019, 'White', 49735, 23060.21, TRUE),
('9MFV94ZR3IGY1FVVA', 'Ford', 'Altima', 2017, 'Black', 33063, 24935.36, TRUE),
('58GV8C5IJIXO8R9RD', 'Mazda', 'Altima', 2017, 'Silver', 89920, 19126.41, FALSE);


# ---------------------------------------------------------------------- #
# Add info into "inventory"                                              #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE inventory;

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '2QQA0O1WXH3KR3JDJ'),
(15, 'EEMIK0DGRLY6IKJ7P'),
(2, '36V3TV62JGYSMJGPY'),
(14, 'PV68WV2HUDK79YTZP'),
(4, 'Y6TAHGUYJCTLG3FND'),
(3, 'V48M9FI84AHRH220B'),
(11, '0M1FPLBVQYH73WQ67'),
(5, 'X1KNZZRNNS8FHCUVR'),
(5, '1V7M0VHH535J1VW3H'),
(21, '5CNEP80J713GVEGTP'),
(15, '06ZIDDQLKSBIFW91C'),
(10, '495WOEQ2EY3YGK0V6'),
(6, '1LBZV9AF24FMSO5OT'),
(30, 'P7T1OCIEKKR68OZXV'),
(15, 'XQFEMTXB24V7B4G2L'),
(25, 'FWP7GBHB1ZKFX87J1'),
(28, '7VF9J0GXLCQGE5IEX'),
(3, '6AHOKZOIH1GEDQJRI'),
(21, '3ZMJUXQVGJ4J05OZR'),
(9, 'K38P2MJH60IEAUB5S'),
(29, 'A4JB5Z8EIKONV9LCP'),
(9, 'Z1T3UR9ZLRIO4AHDY'),
(18, 'KQW5PS0VGM79XEPZ8'),
(10, 'SKV7E1U6B05YRPZHT'),
(19, 'HYDIPRCSFGRRUYUPV'),
(26, 'P2SKIKFM14YY71AMM'),
(13, 'NVOI6A3KX9WLMT09T'),
(20, 'QFA3QK3C9K6O37LO9'),
(24, '9MFV94ZR3IGY1FVVA'),
(23, '58GV8C5IJIXO8R9RD');


# ---------------------------------------------------------------------- #
# Add info into "sales_contracts"                                        #
# ---------------------------------------------------------------------- #

INSERT INTO sales_contracts (contract_id, VIN, customer_name, sale_date, sale_price) VALUES
(1, '2QQA0O1WXH3KR3JDJ', 'Customer 1', '2024-08-24', 26661.59),
(2, 'EEMIK0DGRLY6IKJ7P', 'Customer 2', '2023-08-15', 35246.31),
(3, 'Y6TAHGUYJCTLG3FND', 'Customer 3', '2024-10-27', 30327.34),
(4, 'V48M9FI84AHRH220B', 'Customer 4', '2025-05-14', 9495.69),
(5, '0M1FPLBVQYH73WQ67', 'Customer 5', '2024-10-18', 34108.93),
(6, 'X1KNZZRNNS8FHCUVR', 'Customer 6', '2024-03-05', 9299.15),
(7, '1V7M0VHH535J1VW3H', 'Customer 7', '2024-06-06', 41483.62),
(8, '495WOEQ2EY3YGK0V6', 'Customer 8', '2024-08-10', 25603.01),
(9, '1LBZV9AF24FMSO5OT', 'Customer 9', '2024-03-13', 27775.85),
(10, 'P7T1OCIEKKR68OZXV', 'Customer 10', '2025-04-12', 12385.20),
(11, '7VF9J0GXLCQGE5IEX', 'Customer 11', '2024-06-27', 11254.88),
(12, 'K38P2MJH60IEAUB5S', 'Customer 12', '2025-02-22', 32363.96),
(13, 'A4JB5Z8EIKONV9LCP', 'Customer 13', '2024-04-19', 8679.90),
(14, 'Z1T3UR9ZLRIO4AHDY', 'Customer 14', '2024-03-21', 28320.78),
(15, 'KQW5PS0VGM79XEPZ8', 'Customer 15', '2024-09-04', 17462.66),
(16, 'HYDIPRCSFGRRUYUPV', 'Customer 16', '2024-04-03', 33466.09),
(17, 'P2SKIKFM14YY71AMM', 'Customer 17', '2023-11-21', 26330.88),
(18, 'NVOI6A3KX9WLMT09T', 'Customer 18', '2023-10-27', 36533.72),
(19, 'QFA3QK3C9K6O37LO9', 'Customer 19', '2023-08-14', 30018.42),
(20, '9MFV94ZR3IGY1FVVA', 'Customer 20', '2024-05-14', 39121.27),
(21, '2QQA0O1WXH3KR3JDJ', 'Customer 21', '2024-01-20', 33719.50),
(22, 'EEMIK0DGRLY6IKJ7P', 'Customer 22', '2024-03-11', 14910.34),
(23, '1V7M0VHH535J1VW3H', 'Customer 23', '2023-12-28', 31456.99),
(24, 'KQW5PS0VGM79XEPZ8', 'Customer 24', '2023-09-14', 26479.31),
(25, 'HYDIPRCSFGRRUYUPV', 'Customer 25', '2024-02-24', 19245.69),
(26, 'QFA3QK3C9K6O37LO9', 'Customer 26', '2024-04-27', 31779.03),
(27, '9MFV94ZR3IGY1FVVA', 'Customer 27', '2023-12-22', 40678.92),
(28, 'Z1T3UR9ZLRIO4AHDY', 'Customer 28', '2023-10-17', 16551.28),
(29, 'A4JB5Z8EIKONV9LCP', 'Customer 29', '2023-06-17', 33359.25),
(30, 'P2SKIKFM14YY71AMM', 'Customer 30', '2024-01-12', 36147.81);


# ---------------------------------------------------------------------- #
# Add info into "lease_contracts"                                        #
# ---------------------------------------------------------------------- #

INSERT INTO lease_contracts (lease_id, VIN, customer_name, lease_start, lease_end, monthly_payment) VALUES
(1, 'PV68WV2HUDK79YTZP', 'Customer 1', '2025-01-11', '2027-01-11', 365.19),
(2, '5CNEP80J713GVEGTP', 'Customer 2', '2025-03-06', '2027-03-06', 329.16),
(3, '06ZIDDQLKSBIFW91C', 'Customer 3', '2025-02-11', '2027-02-11', 429.23),
(4, 'XQFEMTXB24V7B4G2L', 'Customer 4', '2024-09-07', '2026-09-07', 254.50),
(5, 'FWP7GBHB1ZKFX87J1', 'Customer 5', '2024-12-01', '2026-12-01', 338.29),
(6, '7VF9J0GXLCQGE5IEX', 'Customer 6', '2024-10-20', '2026-10-20', 217.47),
(7, '6AHOKZOIH1GEDQJRI', 'Customer 7', '2024-07-01', '2026-07-01', 431.65),
(8, '3ZMJUXQVGJ4J05OZR', 'Customer 8', '2024-06-22', '2026-06-22', 389.23),
(9, 'K38P2MJH60IEAUB5S', 'Customer 9', '2024-12-17', '2026-12-17', 415.88),
(10, 'A4JB5Z8EIKONV9LCP', 'Customer 10', '2024-07-29', '2026-07-29', 299.17),
(11, 'Z1T3UR9ZLRIO4AHDY', 'Customer 11', '2024-11-09', '2026-11-09', 361.11),
(12, 'KQW5PS0VGM79XEPZ8', 'Customer 12', '2024-06-25', '2026-06-25', 274.78),
(13, 'SKV7E1U6B05YRPZHT', 'Customer 13', '2024-08-30', '2026-08-30', 340.35),
(14, 'HYDIPRCSFGRRUYUPV', 'Customer 14', '2025-02-15', '2027-02-15', 387.06),
(15, 'P2SKIKFM14YY71AMM', 'Customer 15', '2025-01-01', '2027-01-01', 426.44),
(16, 'NVOI6A3KX9WLMT09T', 'Customer 16', '2024-07-07', '2026-07-07', 398.29),
(17, 'QFA3QK3C9K6O37LO9', 'Customer 17', '2024-05-01', '2026-05-01', 352.71),
(18, '9MFV94ZR3IGY1FVVA', 'Customer 18', '2024-06-10', '2026-06-10', 314.60),
(19, '58GV8C5IJIXO8R9RD', 'Customer 19', '2024-08-14', '2026-08-14', 279.38),
(20, 'X1KNZZRNNS8FHCUVR', 'Customer 20', '2025-01-15', '2027-01-15', 268.20),
(21, '36V3TV62JGYSMJGPY', 'Customer 21', '2024-10-11', '2026-10-11', 410.12),
(22, 'EEMIK0DGRLY6IKJ7P', 'Customer 22', '2024-09-05', '2026-09-05', 390.55),
(23, 'Y6TAHGUYJCTLG3FND', 'Customer 23', '2024-11-21', '2026-11-21', 366.77),
(24, '0M1FPLBVQYH73WQ67', 'Customer 24', '2025-02-18', '2027-02-18', 247.61),
(25, '1V7M0VHH535J1VW3H', 'Customer 25', '2025-03-01', '2027-03-01', 309.30),
(26, '495WOEQ2EY3YGK0V6', 'Customer 26', '2025-04-10', '2027-04-10', 327.00),
(27, '1LBZV9AF24FMSO5OT', 'Customer 27', '2025-04-21', '2027-04-21', 315.42),
(28, 'P7T1OCIEKKR68OZXV', 'Customer 28', '2024-08-02', '2026-08-02', 286.80),
(29, 'V48M9FI84AHRH220B', 'Customer 29', '2024-09-09', '2026-09-09', 398.88),
(30, '1V7M0VHH535J1VW3H', 'Customer 30', '2024-07-19', '2026-07-19', 342.57);