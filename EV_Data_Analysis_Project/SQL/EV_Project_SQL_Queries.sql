CREATE DATABASE ev_project;
USE ev_project;
CREATE TABLE ev_data (
    vin VARCHAR(20),
    county VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    model_year INT,
    make VARCHAR(100),
    model VARCHAR(100),
    electric_vehicle_type VARCHAR(100),
    cafv_eligibility VARCHAR(150),
    electric_range INT,
    base_msrp INT,
    legislative_district INT,
    dol_vehicle_id BIGINT,
    vehicle_location VARCHAR(255),
    electric_utility VARCHAR(255),
    census_tract BIGINT
);
SELECT * FROM ev_data LIMIT 10;

-- 1. Total EV count
SELECT COUNT(*) AS total_ev
FROM ev_data;

-- 2. Top 10 EV brands
SELECT make, COUNT(*) AS total_vehicles
FROM ev_data
GROUP BY make
ORDER BY total_vehicles DESC
LIMIT 10;

-- 3. EV count by model year
SELECT model_year, COUNT(*) AS total_vehicles
FROM ev_data
GROUP BY model_year
ORDER BY model_year;

-- 4. Top 10 cities with most EVs
SELECT city, COUNT(*) AS total_vehicles
FROM ev_data
GROUP BY city
ORDER BY total_vehicles DESC
LIMIT 10;

-- 5. EV type distribution
SELECT electric_vehicle_type, COUNT(*) AS total_vehicles
FROM ev_data
GROUP BY electric_vehicle_type
ORDER BY total_vehicles DESC;

-- 6. CAFV eligibility count
SELECT cafv_eligibility, COUNT(*) AS total_vehicles
FROM ev_data
GROUP BY cafv_eligibility
ORDER BY total_vehicles DESC;

-- 7. Average electric range by brand
SELECT make, ROUND(AVG(electric_range), 2) AS avg_range
FROM ev_data
WHERE electric_range > 0
GROUP BY make
ORDER BY avg_range DESC
LIMIT 10;

-- 8. Top EV models
SELECT make, model, COUNT(*) AS total_vehicles
FROM ev_data
GROUP BY make, model
ORDER BY total_vehicles DESC
LIMIT 10;