-- create a new database and name it car sales 

CREATE DATABASE Car_Sales;

-- use this database and create your tables

USE Car_Sales;

-- create the 5 tables that will be used for the analysis

--calendar table

CREATE TABLE calendar(

	car_launch	DATE PRIMARY KEY

);

-- vehicle type table

CREATE TABLE vehicleType(

	vehicle_type_id		INT PRIMARY KEY,
	vehicle_type		VARCHAR(50)

);

-- create the manufacturer date

CREATE TABLE manufacturer(

	manufacturer_id		INT PRIMARY KEY,
	manufacturer_name	VARCHAR(50)

);

-- create the model table

CREATE TABLE model(

	model_id			INT PRIMARY KEY,
	model_name			VARCHAR(50),
	manufacturer_id		INT REFERENCES manufacturer(manufacturer_id),
	price				INT,
	engine_size			DECIMAL(3,2),
	horse_power			INT,
	wheel_base			DECIMAL(3,3),
	width				DECIMAL(3,3),
	length				DECIMAL(3,3),
	curb_weight			DECIMAL(3,3),
	fuel_capacity		DECIMAL(3,3),
	fuel_efficiency		INT,
	power_performance	DECIMAL(3,3),
	car_launch			DATE REFERENCES calendar(car_launch)

);

-- create the sales table

CREATE TABLE sales(

	Id					INT PRIMARY KEY,
	manufacturer_id		INT REFERENCES manufacturer(manufacturer_id),
	model_id			INT REFERENCES model(model_id),
	vehicle_type_id		INT REFERENCES vehicleType(vehicle_type_id),
	sales				INT

);

-- next, import data into their respective tables.