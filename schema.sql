# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          workshopSeven_carDealershipDatabase                                       #
# ---------------------------------------------------------------------- #
DROP DATABASE IF EXISTS DealershipDatabase;

CREATE DATABASE IF NOT EXISTS DealershipDatabase;

USE DealershipDatabase;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "dealerships"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

# ---------------------------------------------------------------------- #
# Add table "vehicles"                                                 #
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

# ---------------------------------------------------------------------- #
# Add info into "dealerships"                                            #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE dealerships;

INSERT INTO dealerships (dealership_id, name, address, phone) VALUES
(1, 'Urban Auto Group', '123 Main St', '2125551234'),
(2, 'Elite Motors', '456 Broadway', '2125555678'),
(3, 'Value Cars NY', '789 5th Ave', '2125559012');

# ---------------------------------------------------------------------- #
# Add info into "dealerships"                                            #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE vehicles;

INSERT INTO vehicles (VIN, make, model, year, color, mileage, price, sold) VALUES
('1HGBH41JXMN109186', 'Honda', 'Civic', 2020, 'Red', 15000, 18000.00, FALSE),
('2C3KA53G46H123456', 'Chrysler', '300', 2018, 'Black', 42000, 14500.00, TRUE),
('1FTFW1ET1EFA12345', 'Ford', 'F-150', 2022, 'Blue', 8000, 35000.00, FALSE),
('WDBUF56X88B123456', 'Mercedes', 'E350', 2019, 'White', 25000, 28000.00, TRUE);

# ---------------------------------------------------------------------- #
# Add info into "inventory"                                              #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE inventory;

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGBH41JXMN109186'),
(1, '2C3KA53G46H123456'),
(2, '1FTFW1ET1EFA12345'),
(3, 'WDBUF56X88B123456');

# ---------------------------------------------------------------------- #
# Add info into "sales_contracts"                                        #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE sales_contracts;

INSERT INTO sales_contracts (contract_id, VIN, customer_name, sale_date, sale_price) VALUES
(1, '2C3KA53G46H123456', 'Alicia Gomez', '2024-04-15', 14000.00),
(2, 'WDBUF56X88B123456', 'Mark Johnson', '2024-05-02', 27500.00);

# ---------------------------------------------------------------------- #
# Add info into "lease_contracts"                                        #
# ---------------------------------------------------------------------- #

TRUNCATE TABLE lease_contracts;

INSERT INTO lease_contracts (lease_id, VIN, customer_name, lease_start, lease_end, monthly_payment) VALUES
(1, '1HGBH41JXMN109186', 'Sarah Lee', '2024-06-01', '2026-06-01', 325.00);


