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
-- 

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

-- engine_size
-- horse_power -
/* measures power geenrated from the engine or the power produced by the engine.
entry level city car has 75 horsepower, mid sized family car has 110 -200 and above 200 is when you 
 feel the speed of the car*/
-- wheel_base
-- width
-- length
-- curb_weight
-- fuel_capacity
-- fuel_efficiency
-- power performance

-- create the sales table

CREATE TABLE sales(

	Id					INT PRIMARY KEY,
	manufacturer_id		INT REFERENCES manufacturer(manufacturer_id),
	model_id			INT REFERENCES model(model_id),
	vehicle_type_id		INT REFERENCES vehicleType(vehicle_type_id),
	sales				INT

);

-- modify the model table

ALTER TABLE model
ALTER COLUMN wheel_base DECIMAL (5,2)

ALTER TABLE model
ALTER COLUMN width DECIMAL(5,2)

ALTER TABLE model
ALTER COLUMN length_of_car DECIMAL(5,2)

ALTER TABLE model
ALTER COLUMN curb_weight DECIMAL(5,2)

ALTER TABLE model
ALTER COLUMN fuel_capacity DECIMAL(5,2)

ALTER TABLE model
ALTER COLUMN power_performance DECIMAL(5,2)


-- Example using sp_rename
EXEC sp_rename 'model.length', 'length_of_car', 'COLUMN';

SELECT * FROM model

-- next, import data into their respective tables.

-- insert the values into model table and sales table

-- model table

--insert values into the table.

INSERT INTO  model (model_id,model_name,manufacturer_id,price,engine_size,horse_power,
					wheel_base,width,length_of_car,curb_weight,fuel_capacity,fuel_efficiency,
					power_performance,car_launch)

VALUES (1,'Integra',1,21500,1.8,225,101.2,67.3,172.4,2.6,13.2,28,91.4,'2012-02-02'),
		(2,'TL',1,28400,3.2,225,108.1,70.3,192.9,3.5,17.2,25,0,'2011-06-03'),
		(3,'CL',1,0,3.2,210,106.9,70.6,192.0,3.5,17.2,26,91.4,'2012-01-04'),
		(4,'RL',1,42000,3.5,150,114.6,71.4,196.6,3.9,18.0,22,62.8,'2011-03-10'),
		(5,'A4',2,23990,1.8,200,102.6,68.2,178.0,3.0,16.4,27,84.6,'2011-10-08'),
		(6,'A6',2,33950,2.8,310,108.7,76.1,192.0,3.6,18.5,22,134.7,'2011-08-09'),
		(7,'A8',2,62000,4.2,170,113.0,74.0,198.2,3.9,23.7,21,71.2,'2012-02-27'),
		(8,'323i',3,26990,2.5,193,107.3,68.4,176.0,3.2,16.6,26,81.9,'2011-06-28'),
		(9,'328i',3,33400,2.8,193,107.3,68.5,176.0,3.2,16.6,24,84,'2012-01-29'),
		(10,'528i',3,38900,2.8,175,111.4,70.9,188.0,3.5,18.5,25,71.2,'2011-04-04'),
		(11,'Century',4,21975,3.1,240,109.0,72.7,194.6,3.4,17.5,25,95.6,'2011-11-02'),
		(12,'Regal',4,25300,3.8,205,109.0,72.7,196.2,3.5,17.5,23,85.8,'2011-09-03'),
		(13,'Park Avenue',4,31965,3.8,205,113.8,74.7,206.8,3.8,18.5,24,84.3,'2012-03-23'),
		(14,'LeSabre',4,27885,3.8,275,112.2,73.5,200.0,3.6,17.5,25,113.9,'2011-07-23'),
		(15,'DeVille',5,39895,4.6,275,115.3,74.5,207.2,4.0,18.5,22,115.6,'2012-02-23'),
		(16,'Seville',5,44475,4.6,275,112.2,75.0,201.0,NULL,18.5,22,113.8,'2011-04-29'),
		(17,'Eldorado',5,39665,4.6,200,108.0,75.5,200.6,3.8,19.0,22,83.5,'2011-11-27'),
		(18,'Catera',5,31010,3,255,107.4,70.3,194.8,3.8,18.0,22,109.5,'2011-09-28'),
		(19,'Escalade',5,46225,5.7,115,117.5,77.0,201.2,5.6,30.0,15,46.4,'2012-04-17'),
		(20,'Cavalier',6,13260,2.2,170,104.1,67.9,180.9,2.7,14.3,27,67.3,'2011-08-17'),
		(21,'Malibu',6,16535,3.1,175,107.0,69.4,190.4,3.1,15.0,25,70,'2012-03-19'),
		(22,'Lumina',6,18890,3.1,180,107.5,72.5,200.9,3.3,16.6,25,72,'2011-05-24'),
		(23,'Monte Carlo',6,19390,3.4,200,110.5,72.7,197.9,3.3,17.0,27,81.1,'2011-12-22'),
		(24,'Camaro',6,24340,3.8,345,101.1,74.1,193.2,3.5,16.8,25,141.1,'2011-10-23'),
		(25,'Corvette',6,45705,5.7,120,104.5,73.6,179.7,3.2,19.1,22,48.3,'2012-05-12'),
		(26,'Prizm',6,13960,1.8,55,97.1,66.7,174.3,2.4,13.2,33,23.3,'2011-09-11'),
		(27,'Metro',6,9235,1,180,93.1,62.6,149.4,1.9,10.3,45,71.8,'2012-04-13'),
		(28,'Impala',6,18890,3.4,163,110.5,73.0,200.0,3.4,17.0,27,66,'2011-06-18'),
		(29,'Sebring Coupe',7,19840,2.5,168,103.7,69.7,190.9,3.0,15.9,24,69.5,'2012-01-16'),
		(30,'Sebring Conv',7,24495,2.5,200,106.0,69.2,193.0,3.3,16.0,24,80,'2011-11-17'),
		(31,'Concorde',7,22245,2.7,132,113.0,74.4,209.1,3.5,17.0,26,53.6,'2012-06-06'),
		(32,'Cirrus',7,16480,2,253,108.0,71.0,186.0,2.9,16.0,27,101.3,'2011-10-06'),
		(33,'LHS',7,28340,3.5,NULL,113.0,74.4,207.7,3.6,17.0,23,0,'2012-05-08'),
		(34,'Town & Country',7,9745,NULL,253,NULL,NULL,NULL,NULL,NULL,NULL,101.7,'2011-07-13'),
		(35,'300M',7,29185,3.5,132,113.0,74.4,197.8,3.6,17.0,23,52.1,'2012-02-10'),
		(36,'Neon',8,12640,2,163,105.0,74.4,174.4,2.6,12.5,29,65.7,'2011-12-12'),
		(37,'Avenger',8,19045,2.5,168,103.7,69.1,190.2,2.9,15.9,24,67.9,'2012-07-01'),
		(38,'Stratus',8,20230,2.5,202,108.0,71.0,186.0,3.1,16.0,24,80.8,'2011-10-31'),
		(39,'Intrepid',8,22505,2.7,450,113.0,74.7,203.7,3.5,17.0,NULL,188.1,'2012-06-02'),
		(40,'Viper',8,69725,8,230,96.2,75.7,176.7,3.4,19.0,16,90.2,'2011-08-07'),
		(41,'Ram Pickup',8,19460,5.2,175,138.7,79.3,224.2,4.5,26.0,17,71.1,'2012-03-06'),
		(42,'Ram Wagon',8,21315,3.9,175,109.6,78.8,192.6,4.2,32.0,15,70.1,'2012-01-06'),
		(43,'Ram Van',8,18575,3.9,120,127.2,78.8,208.5,4.3,32.0,16,49.7,'2012-07-26'),
		(44,'Dakota',8,16980,2.5,230,131.0,71.5,215.0,3.6,22.0,19,92.9,'2011-11-25'),
		(45,'Durango',8,26310,5.2,150,115.7,71.7,193.5,4.4,25.0,17,61.2,'2012-06-27'),
		(46,'Caravan',8,19565,2.4,110,113.3,76.8,186.3,3.5,20.0,24,44.1,'2011-09-01'),
		(47,'Escort',9,12070,2,190,98.4,67.0,174.7,2.5,12.7,30,76.5,'2012-03-31'),
		(48,'Mustang',9,21560,3.8,170,101.3,73.1,183.2,3.2,15.7,24,67.4,'2012-01-31'),
		(49,'Contour',9,17035,2.5,155,106.5,69.1,184.6,2.8,15.0,25,62.5,'2012-08-20'),
		(50,'Taurus',9,17885,3,107,108.5,73.0,197.6,3.4,16.0,24,43.1,'2011-12-20'),
		(51,'Focus',9,12315,2,200,103.0,66.9,174.8,2.6,13.2,30,80.5,'2012-07-22'),
		(52,'Crown Victoria',9,22195,4.6,210,114.7,78.2,212.0,3.9,19.0,21,87.6,'2011-09-26'),
		(53,'Explorer',9,31930,4,150,111.6,70.2,190.7,3.9,21.0,19,62.1,'2012-04-25'),
		(54,'Windstar',9,21410,3,240,120.7,76.6,200.9,3.8,26.0,21,100,'2012-02-25'),
		(55,'Expedition',9,36135,4.6,119,119.0,78.7,204.6,4.8,26.0,16,47.4,'2012-09-14'),
		(56,'Ranger',9,12050,2.5,220,117.5,69.4,200.7,3.1,20.0,23,89.4,'2012-01-14'),
		(57,'F-Series',9,26935,4.6,106,138.5,79.1,224.5,4.2,25.1,18,42.9,'2012-08-16'),
		(58,'Civic',10,12885,1.6,135,103.2,67.1,175.1,2.3,11.9,32,54.3,'2011-10-21'),
		(59,'Accord',10,15350,2.3,146,106.9,70.3,188.8,2.9,17.1,27,60.1,'2012-05-20'),
		(60,'CR-V',10,20550,2,205,103.2,68.9,177.6,3.2,15.3,24,83.6,'2012-03-21'),
		(61,'Passport',10,26600,3.2,210,106.4,70.4,178.2,3.9,21.1,19,85.2,'2012-10-09'),
		(62,'Odyssey',10,26000,3.5,92,118.1,75.6,201.2,4.3,20.0,23,36.7,'2012-02-08'),
		(63,'Accent',11,9699,1.5,140,96.1,65.7,166.7,2.2,11.9,31,54.6,'2012-09-10'),
		(64,'Elantra',11,11799,2,148,100.4,66.9,174.0,2.6,14.5,27,58.8,'2011-11-15'),
		(65,'Sonata',11,14999,2.4,227,106.3,71.6,185.4,3.1,17.2,25,92.4,'2012-06-14'),
		(66,'I30',12,29465,3,240,108.3,70.2,193.7,3.3,18.5,25,102.2,'2012-04-15'),
		(67,'S-Type',13,42800,3,120,114.5,71.6,191.3,3.7,18.4,21,48.7,'2012-11-03'),
		(68,'Wrangler',14,14460,2.5,190,93.4,66.7,152.0,3.0,19.0,17,76.6,'2012-03-04'),
		(69,'Cherokee',14,21620,4,195,101.4,69.4,167.5,3.2,20.0,20,80.4,'2012-10-05'),
		(70,'Grand Cherokee',14,26895,4,210,105.9,72.3,181.5,3.9,20.5,19,87.2,'2011-12-10'),
		(71,'ES300',15,31505,3,225,105.1,70.5,190.2,3.4,18.5,23,95,'2012-07-09'),
		(72,'GS300',15,37805,3,300,110.2,70.9,189.2,3.6,19.8,23,125,'2012-05-10'),
		(73,'GS400',15,46305,4,290,110.2,70.9,189.2,3.7,19.8,21,124.5,'2012-11-28'),
		(74,'LS400',15,54005,4,230,112.2,72.0,196.7,3.9,22.5,22,105.8,'2012-03-29'),
		(75,'LX470',15,60105,4.7,220,112.2,76.4,192.5,5.4,25.4,15,91.9,'2012-10-30'),
		(76,'RX300',15,34605,3,275,103.0,71.5,180.1,3.9,17.2,21,113.5,'2012-01-04'),
		(77,'Continental',16,39080,4.6,215,109.0,73.6,208.5,3.9,20.0,22,94,'2012-08-03'),
		(78,'Town car',16,43330,4.6,300,117.7,78.2,215.3,4.1,19.0,21,124,'2012-06-04'),
		(79,'Navigator',16,42660,5.4,113,119.0,79.9,204.8,5.4,30.0,15,45.8,'2012-12-23'),
		(80,'Mirage',17,13987,1.8,154,98.4,66.5,173.6,2.3,13.2,30,62.4,'2012-04-23'),
		(81,'Eclipse',17,19047,2.4,145,100.8,68.9,175.4,2.9,15.9,24,58.6,'2012-11-24'),
		(82,'Galant',17,17357,2.4,210,103.7,68.5,187.8,2.9,16.3,25,84.8,'2012-01-29'),
		(83,'Diamante',17,24997,3.5,161,107.1,70.3,194.1,3.4,19.0,22,67.5,'2012-08-28'),
		(84,'3000GT',17,25450,3,200,97.2,72.4,180.3,3.1,19.8,21,83.9,'2012-06-29'),
		(85,'Montero',17,31807,3.5,173,107.3,69.9,186.6,4.5,24.3,18,70.7,'2012-01-17'),
		(86,'Montero Sport',17,22527,3,125,107.3,66.7,178.3,3.5,19.5,20,51,'2012-05-18'),
		(87,'Mystique',18,16240,2,125,106.5,69.1,184.8,2.8,15.0,28,51.1,'2012-12-19'),
		(88,'Cougar',18,16540,2,153,106.4,69.6,185.0,2.9,16.0,30,62.2,'2012-02-23'),
		(89,'Sable',18,19035,3,200,108.5,73.0,199.7,3.4,16.0,24,80.7,'2012-09-22'),
		(90,'Grand Marquis',18,22605,4.6,210,114.7,78.2,212.0,4.0,19.0,21,86,'2012-07-24'),
		(91,'Mountaineer',18,27560,4,170,111.6,70.2,190.1,3.9,21.0,18,69.7,'2008-02-13'),
		(92,'Villager',18,22510,3.3,185,112.2,74.9,194.7,3.9,20.0,21,78.3,'2009-10-20'),
		(93,'C-Class',19,31750,2.3,221,105.9,67.7,177.4,3.3,16.4,26,98.3,'2011-04-24'),
		(94,'E-Class',19,49900,3.2,275,111.5,70.8,189.4,3.8,21.1,25,125.3,'2011-07-12'),
		(95,'S-Class',19,69700,4.3,302,121.5,73.1,203.1,4.1,23.2,21,140,'2011-06-13'),
		(96,'SL-Class',19,82600,5,190,99.0,71.3,177.1,4.1,21.1,20,82.8,'2011-03-17'),
		(97,'SLK',19,38900,2.3,185,94.5,67.5,157.9,3.1,15.9,26,81.9,'2011-01-16'),
		(98,'SLK230',19,41000,2.3,215,94.5,67.5,157.3,3.0,14.0,27,92.9,'2011-08-06'),
		(99,'CLK Coupe',19,41600,3.2,302,105.9,67.8,180.3,3.2,16.4,26,141.1,'2011-07-08'),
		(100,'CL500',19,85500,5,215,113.6,73.1,196.6,4.1,23.2,20,90.5,'2011-04-11'),
		(101,'M-Class',19,35300,3.2,126,111.0,72.2,180.6,4.4,19.0,20,50.2,'2011-02-10'),
		(102,'Sentra',20,13499,1.8,155,99.8,67.3,177.5,2.6,13.2,30,63.3,'2011-08-31'),
		(103,'Altima',20,20390,2.4,222,103.1,69.1,183.5,3.0,15.9,25,89.4,'2011-08-02'),
		(104,'Maxima',20,26249,3,170,108.3,70.3,190.5,3.3,18.5,25,71.2,'2011-05-06'),
		(105,'Quest',20,26399,3.3,170,112.2,74.9,194.8,4.0,20.0,21,72.3,'2011-03-07'),
		(106,'Pathfinder',20,29299,3.3,170,106.3,71.7,182.6,3.9,21.0,19,69.8,'2011-09-25'),
		(107,'Xterra',20,22799,3.3,170,104.3,70.4,178.0,3.8,19.4,18,67.9,'2011-01-24'),
		(108,'Frontier',20,17890,3.3,150,116.1,66.5,196.1,3.2,19.4,18,60.9,'2011-08-27'),
		(109,'Cutlass',21,18145,3.1,215,107.0,69.4,192.0,3.1,15.2,25,86.3,'2011-05-31'),
		(110,'Intrigue',21,24150,3.5,150,109.0,73.6,195.9,3.5,18.0,NULL,60.7,'2011-04-01'),
		(111,'Alero',21,18270,2.4,250,107.0,70.1,186.7,3.0,15.0,27,103.4,'2009-10-20'),
		(112,'Aurora',21,36229,4,190,113.8,74.4,205.4,4.0,18.5,22,80.5,'2011-02-18'),
		(113,'Bravada',21,31598,4.3,185,107.0,67.8,181.2,4.1,17.5,19,76.1,'2011-09-21'),
		(114,'Silhouette',21,25345,3.4,132,120.0,72.2,201.4,3.9,25.0,22,53.4,'2011-06-25'),
		(115,'Breeze',22,16080,2,150,108.0,71.0,186.3,2.9,16.0,27,61,'2011-04-26'),
		(116,'Voyager',22,18850,2.4,253,113.3,76.8,186.3,3.5,20.0,24,107,'2011-11-14'),
		(117,'Prowler',22,43000,3.5,150,113.3,76.3,165.4,2.9,12.0,21,62,'2011-04-24'),
		(118,'Sunfire',23,21610,2.4,175,104.1,68.4,181.9,2.9,15.0,27,70.4,'2012-06-27'),
		(119,'Grand Am',23,19720,3.4,200,107.0,70.4,186.3,3.1,15.2,25,81.5,'2012-01-25'),
		(120,'Firebird',23,25310,3.8,195,101.1,74.5,193.4,3.5,16.8,25,78.3,'2012-11-26'),
		(121,'Grand Prix',23,21665,3.8,205,110.5,72.7,196.5,3.4,18.0,25,82.7,'2012-06-16'),
		(122,'Bonneville',23,23755,3.8,185,112.2,72.6,202.5,3.6,17.5,24,76.2,'2012-10-15'),
		(123,'Montana',23,25635,3.4,217,120.0,72.7,201.3,3.9,25.0,23,93.4,'2011-05-18'),
		(124,'Boxter',24,41430,2.7,300,95.2,70.1,171.0,2.8,17.0,22,134.4,'2012-07-22'),
		(125,'Carrera Coupe',24,71020,3.4,300,92.6,69.5,174.5,3.0,17.0,21,135.9,'2012-02-19'),
		(126,'Carrera Cabrio',24,74970,3.4,170,92.6,69.5,174.5,3.1,17.0,23,73.5,'2012-12-21'),
		(127,'Gen 9-5',25,33120,2.3,185,106.4,70.6,189.2,3.3,18.5,23,76,'2011-07-11'),
		(128,'2003 Saab 9-3',25,26100,2,100,102.6,67.4,182.2,3.0,16.9,23,40,'2012-11-09'),
		(129,'SL',26,10685,1.9,100,102.4,66.4,176.9,2.3,12.1,33,40.7,'2011-06-12'),
		(130,'SC',26,12535,1.9,124,102.4,66.4,180.0,2.4,12.1,33,49.9,'2012-08-16'),
		(131,'SW',26,14290,1.9,137,102.4,66.4,176.9,2.5,12.1,31,56.3,'2011-03-16'),
		(132,'LW',26,18835,2.2,137,106.5,69.0,190.4,3.1,13.1,27,54.8,'2011-01-15'),
		(133,'LS',26,15010,2.2,165,106.5,69.0,190.4,2.9,13.1,28,67.8,'2011-08-05'),
		(134,'Outback',27,22695,2.5,165,103.5,67.5,185.8,3.4,16.9,25,66.8,'2012-12-04'),
		(135,'Forester',27,20095,2.5,120,99.4,68.3,175.2,3.1,15.9,24,48,'2011-07-07'),
		(136,'Corolla',28,13108,1.8,133,97.0,66.7,174.0,2.4,13.2,33,54.4,'2012-09-10'),
		(137,'Camry',28,17518,2.2,210,105.2,70.1,188.5,3.0,18.5,27,84.9,'2011-04-11'),
		(138,'Avalon',28,25545,3,140,107.1,71.7,191.9,3.4,18.5,26,56.5,'2011-02-10'),
		(139,'Celica',28,16875,1.8,142,102.4,68.3,170.5,2.4,14.5,31,55.3,'2011-08-31'),
		(140,'Tacoma',28,11528,2.4,194,103.3,66.5,178.7,2.6,15.1,23,78,'2012-12-29'),
		(141,'Sienna',28,22368,3,127,114.2,73.4,193.5,3.8,20.9,22,52,'2011-08-01'),
		(142,'RAV4',28,16888,2,150,94.9,66.7,163.8,2.7,15.3,27,62.4,'2012-10-05'),
		(143,'4Runner',28,22288,2.7,230,105.3,66.5,183.3,3.4,18.5,23,102.5,'2011-05-06'),
		(144,'Land Cruiser',28,51728,4.7,115,112.2,76.4,192.5,5.1,25.4,15,46.9,'2011-03-07'),
		(145,'Golf',29,14900,2,115,98.9,68.3,163.3,2.8,14.5,26,47.6,'2011-09-25'),
		(146,'Jetta',29,16700,2,150,98.9,68.3,172.3,2.9,14.5,26,61.7,'2011-01-24'),
		(147,'Passat',29,21200,1.8,115,106.4,68.5,184.1,3.0,16.4,27,48.9,'2011-08-27'),
		(148,'Cabrio',29,19990,2,115,97.4,66.7,160.4,3.1,13.7,26,48,'2012-10-30'),
		(149,'GTI',29,17500,2,115,98.9,68.3,163.3,2.8,14.6,26,47.3,'2011-05-31'),
		(150,'Beetle',29,15900,2,160,98.9,67.9,161.1,2.8,14.5,26,66.1,'2011-04-01'),
		(151,'S40',30,23400,1.9,160,100.5,67.6,176.6,3.0,15.8,25,66.5,'2011-10-20'),
		(152,'V40',30,24400,1.9,168,100.5,67.6,176.6,3.0,15.8,25,70.7,'2011-02-18'),
		(153,'S70',30,27500,2.4,168,104.9,69.3,185.9,3.2,17.9,25,71.2,'2011-09-21'),
		(154,'V70',30,28800,2.4,236,104.9,69.3,186.2,3.3,17.9,25,101.6,'2012-11-24'),
		(155,'C70',30,45500,2.3,201,104.9,71.5,185.7,3.6,18.5,23,85.7,'2011-06-25'),
		(156,'S80',30,36000,2.9,0,109.9,72.1,189.8,3.6,21.1,24,0,'2011-04-26')

-- insert data into the sales table

INSERT INTO sales(Id,manufacturer_id,model_id,vehicle_type_id,sales)

VALUES	(1,1,1,1,16919),
		(2,1,2,1,39384),
		(3,1,3,1,14114),
		(4,1,4,1,8588),
		(5,2,5,1,20397),
		(6,2,6,1,18780),
		(7,2,7,1,1380),
		(8,3,8,1,19747),
		(9,3,9,1,9231),
		(10,3,10,1,17527),
		(11,4,11,1,91561),
		(12,4,12,1,39350),
		(13,4,13,1,27851),
		(14,4,14,1,83257),
		(15,5,15,1,63729),
		(16,5,16,1,15943),
		(17,5,17,1,6536),
		(18,5,18,1,11185),
		(19,5,19,2,14785),
		(20,6,20,1,145519),
		(21,6,21,1,135126),
		(22,6,22,1,24629),
		(23,6,23,1,42593),
		(24,6,24,1,26402),
		(25,6,25,1,17947),
		(26,6,26,1,32299),
		(27,6,27,1,21855),
		(28,6,28,1,107995),
		(29,7,29,1,7854),
		(30,7,30,1,32775),
		(31,7,31,1,31148),
		(32,7,32,1,32306),
		(33,7,33,1,13462),
		(34,7,34,2,53480),
		(35,7,35,1,30696),
		(36,8,36,1,76034),
		(37,8,37,1,4734),
		(38,8,38,1,71186),
		(39,8,39,1,88028),
		(40,8,40,1,916),
		(41,8,41,2,227061),
		(42,8,42,2,16767),
		(43,8,43,2,31038),
		(44,8,44,2,111313),
		(45,8,45,2,101323),
		(46,8,46,2,181749),
		(47,9,47,1,70227),
		(48,9,48,1,113369),
		(49,9,49,1,35068),
		(50,9,50,1,245815),
		(51,9,51,1,175670),
		(52,9,52,1,63403),
		(53,9,53,2,276747),
		(54,9,54,2,155787),
		(55,9,55,2,125338),
		(56,9,56,2,220650),
		(57,9,57,2,540561),
		(58,10,58,1,199685),
		(59,10,59,1,230902),
		(60,10,60,2,73203),
		(61,10,61,2,12855),
		(62,10,62,2,76029),
		(63,11,63,1,41184),
		(64,11,64,1,66692),
		(65,11,65,1,29450),
		(66,12,66,1,23713),
		(67,13,67,1,15467),
		(68,14,68,2,55557),
		(69,14,69,2,80556),
		(70,14,70,2,157040),
		(71,15,71,1,24072),
		(72,15,72,1,12698),
		(73,15,73,1,3334),
		(74,15,74,1,6375),
		(75,15,75,2,9126),
		(76,15,76,2,51238),
		(77,16,77,1,13798),
		(78,16,78,1,48911),
		(79,16,79,2,22925),
		(80,17,80,1,26232),
		(81,17,81,1,42541),
		(82,17,82,1,55616),
		(83,17,83,1,5711),
		(84,17,84,1,110),
		(85,17,85,2,11337),
		(86,17,86,2,39348),
		(87,18,87,1,14351),
		(88,18,88,1,26529),
		(89,18,89,1,67956),
		(90,18,90,1,81174),
		(91,18,91,2,27609),
		(92,18,92,2,20380),
		(93,19,93,1,18392),
		(94,19,94,1,27602),
		(95,19,95,1,16774),
		(96,19,96,1,3311),
		(97,19,97,1,7998),
		(98,19,98,1,1526),
		(99,19,99,1,11592),
		(100,19,100,1,954),
		(101,19,101,2,28976),
		(102,20,102,1,42643),
		(103,20,103,1,88094),
		(104,20,104,1,79853),
		(105,20,105,2,27308),
		(106,20,106,2,42574),
		(107,20,107,2,54158),
		(108,20,108,2,65005),
		(109,21,109,1,1112),
		(110,21,110,1,38554),
		(111,21,111,1,80255),
		(112,21,112,1,14690),
		(113,21,113,2,20017),
		(114,21,114,2,24361),
		(115,22,36,1,32734),
		(116,22,115,1,5240),
		(117,22,116,2,24155),
		(118,22,117,1,1872),
		(119,23,118,1,51645),
		(120,23,119,1,131097),
		(121,23,120,1,19911),
		(122,23,121,1,92364),
		(123,23,122,1,35945),
		(124,23,123,2,39572),
		(125,24,124,1,8982),
		(126,24,125,1,1280),
		(127,24,126,1,1866),
		(128,25,127,1,9191),
		(129,25,128,1,12115),
		(130,26,129,1,80620),
		(131,26,130,1,24546),
		(132,26,131,1,5223),
		(133,26,132,1,8472),
		(134,26,133,1,49989),
		(135,27,134,1,47107),
		(136,27,135,2,33028),
		(137,28,136,1,142535),
		(138,28,137,1,247994),
		(139,28,138,1,63849),
		(140,28,139,1,33269),
		(141,28,140,2,84087),
		(142,28,141,2,65119),
		(143,28,142,2,25106),
		(144,28,143,2,68411),
		(145,28,144,2,9835),
		(146,29,145,1,9761),
		(147,29,146,1,83721),
		(148,29,147,1,51102),
		(149,29,148,1,9569),
		(150,29,149,1,5596),
		(151,29,150,1,49463),
		(152,30,151,1,16957),
		(153,30,152,1,3545),
		(154,30,153,1,15245),
		(155,30,154,1,17531),
		(156,30,155,1,3493),
		(157,30,156,1,18969)

-- find the duplicates in each table

-- VehicleType Analysis

 SELECT * FROM vehicleType;

-- total passenger and cars sold

SELECT 
	SUM(CASE WHEN vt.vehicle_type = 'Passenger'THEN 1 ELSE 0 END) AS total_passenger_sold,
	SUM(CASE WHEN vt.vehicle_type = 'Car'THEN 1 ELSE 0 END ) AS total_car_sold

FROM sales s
LEFT JOIN vehicleType vt
ON s.vehicle_type_id = vt.vehicle_type_id

-- model table
SELECT model_id, COUNT(model_id) AS num_duplicates
FROM model
GROUP BY model_id
HAVING COUNT(model_id) > 1;

-- sales table 

SELECT Id, COUNT(Id) AS num_duplicates
FROM sales
GROUP BY Id
HAVING COUNT(Id) > 1;

-- find the null values

SELECT * FROM model

-- replace all the null value with 0

-- Add a new column to the model table and name it performance_category
ALTER TABLE model
ADD horse_power_category VARCHAR (50);

-- populate the columns.

UPDATE model
SET horse_power_category = (SELECT 
    CASE
        WHEN horse_power <= 150 THEN 'Low-Power Car'
        WHEN  horse_power <= 300 THEN 'Mid-Range Car'
        WHEN  horse_power <= 500 THEN 'High-Performance Car'
        WHEN horse_power > 500 THEN 'Super Cars / Hyper Car'
        ELSE 'Unknown'
    END AS Horsepower_Category)



UPDATE model
SET curb_weight = 0
WHERE model_id = 16;

UPDATE model
SET horse_power = 0
WHERE model_id = 33;

UPDATE model
SET engine_size = 0, wheel_base = 0,width = 0, length_of_car = 0,
	curb_weight = 0, fuel_capacity = 0,fuel_efficiency = 0
WHERE model_id = 34;


UPDATE model
SET fuel_efficiency = 0
WHERE model_id = 39;

UPDATE model
SET fuel_efficiency = 0
WHERE model_id = 110;

-- what is the minimum horsepower

SELECT MIN(horse_power)
FROM model

-- what is the maximum horsepower

SELECT MAX(horse_power)
FROM model

-- what is the minmum price the details of the minimum price

SELECT * FROM model
WHERE price = ( SELECT MIN(price) FROM model);

-- what is the maximum price and the details of the maximum price

SELECT * FROM model
WHERE price = ( SELECT MAX(price) FROM model);

-- what is the average price 

SELECT AVG(price)
FROM model;

SELECT
  AVG(horse_power) AS avg_horsepower,
  MIN(engine_size) AS min_engine_performance,
  MAX(engine_size) AS max_engine_size,
  AVG(wheel_base) AS avg_wheelbase
FROM model;

-- rank the horsepower

SELECT
  model_name,
  horse_power,
  DENSE_RANK() OVER (ORDER BY horse_power DESC) AS horsepower_rank
FROM model;


SELECT mo.model_name,m.manufacturer_name,mo.price, mo.car_launch
FROM model mo
INNER JOIN manufacturer m
ON mo.manufacturer_id = m.manufacturer_id
WHERE mo.price = 0;

-- why? We are doing this to avoid underestimating or over estimating the price values when performing aggregation like averages.
-- investigate and  replace the 0s

-- how many cars where produced by each manufacturer

SELECT m.manufacturer_name,COUNT(m.manufacturer_id) AS number_of_cars
FROM sales s
LEFT JOIN manufacturer m
ON s.manufacturer_id = m.manufacturer_id
GROUP BY  m.manufacturer_name

-- what are the top 5 manufacturers with the highest cars production

SELECT TOP (5) m.manufacturer_name,COUNT(m.manufacturer_id) AS number_of_cars
FROM sales s
LEFT JOIN manufacturer m
ON s.manufacturer_id = m.manufacturer_id
GROUP BY  m.manufacturer_name
ORDER BY COUNT(m.manufacturer_id) DESC;

-- 
SELECT m.manufacturer_name,
	SUM (CASE WHEN v.vehicle_type_id = 1 THEN 1 ELSE 0 END) AS passenger_type,
	SUM (CASE WHEN v.vehicle_type_id = 2 THEN 1 ELSE 0 END) AS car_type
FROM sales s
LEFT JOIN manufacturer m
ON s.manufacturer_id = m.manufacturer_id
LEFT JOIN vehicleType v
ON s.vehicle_type_id = v.vehicle_type_id
GROUP BY m.manufacturer_name

-- what is the total sales

SELECT SUM(sales) AS total_revenue 
FROM  sales;

-- sales generated by each manufacturer

SELECT mo.model_name,m.manufacturer_name,
SUM(s.sales)  OVER (PARTITION BY  m.manufacturer_name )AS revenue_generated
FROM sales s
LEFT JOIN model mo
ON s.model_id = mo.model_id
LEFT JOIN manufacturer m
ON s.manufacturer_id = m.manufacturer_id


-- what are the top five manufacturer that acquired the highest.

SELECT TOP(5) m.manufacturer_name, SUM(S.sales) AS revenue_generated
FROM sales s
LEFT JOIN manufacturer m
ON s.manufacturer_id = m.manufacturer_id
GROUP BY m.manufacturer_name
ORDER BY SUM(s.sales) DESC;

-- sales by horse_power category

SELECT m.horse_power_category, SUM(s.sales)
FROM sales s
LEFT JOIN model m
ON s.model_id = m.model_id
GROUP BY m.horse_power_category
ORDER BY SUM(s.sales) DESC

-- from the table below mid-range cars recorded the highest sales 
-- followed by low- range cars. High performance cars recorded the least sales generating 161,576
--xm
