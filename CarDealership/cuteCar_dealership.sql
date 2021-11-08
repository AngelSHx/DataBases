-- NON CONTRIBUTORS
-- Liam Kennedy


DROP SCHEMA IF EXISTS `cuteCar_Dealership` ;
CREATE SCHEMA IF NOT EXISTS `cuteCar_Dealership` DEFAULT CHARACTER SET utf8mb4 ;

-- --------------------------------------------------------------------------------------------------------
-- THESE INITIALIZERS ARE USED TO BE ABLE TO LOAD IN LOCAL DATA 
-- ALSO HAVE TO CHECK YOUR ADVANCED SETTING IN CONNECTION TO MAKE SURE THIS LINE IS ADDED:
-- OPT_LOCAL_INFILE=1
set global local_infile= 1; -- allows for connection to local files
SET GLOBAL FOREIGN_KEY_CHECKS=0;

-- USE DATABASE
use cuteCar_Dealership;

-- --------------------------------------------------------------------------------------------------------
-- CREATE SALESPEOPLE TABLE
DROP TABLE IF EXISTS `salespeople` ;

CREATE TABLE IF NOT EXISTS `salespeople`(
    salesPersonId INT(10),
    firstName VARCHAR(45) NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    birthdate DATE NOT NULL,

    PRIMARY KEY (salesPersonId)
);

-- CREATE CAR TABLE
DROP TABLE IF EXISTS `car` ;
CREATE TABLE IF NOT EXISTS `car` (
	vinNumber VARCHAR(17) NOT NULL,
    color VARCHAR(45) NOT NULL,
    buyDate DATE,
    buyPrice DECIMAL NOT NULL,
    sellDate DATE,
    sellPrice DECIMAL NOT NULL,
    salesPersonId INT NOT NULL,
    sellerID INT NOT NULL,
    buyerID INT NOT NULL,
    
    PRIMARY KEY (vinNumber)
);

-- CREATE BUYER TABLE
DROP TABLE IF EXISTS `buyer` ;
CREATE TABLE IF NOT EXISTS `buyer` (
	buyerId INT NOT NULL,
    firstName VARCHAR(45) NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    paymentMethod VARCHAR(45) NOT NULL,
    
    PRIMARY KEY (buyerId)
);

-- CREATE SELLER TABLE
CREATE TABLE IF NOT EXISTS `seller` (
	sellerId INT NOT NULL,
    firstName VARCHAR(45) NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    paymentMethod VARCHAR(45) NOT NULL,
    
    PRIMARY KEY (sellerId)
);

-- --------------------------------------------------------------------------------------------------------
-- lOAD DATA INTO TABLES
LOAD DATA Local INFILE "PATH TO FILE"
INTO TABLE salespeople 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA Local INFILE "PATH TO FILE"
INTO TABLE buyer 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA Local INFILE "PATH TO FILE"
INTO TABLE car 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA Local INFILE "PATH TO FILE"
INTO TABLE seller
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

UPDATE buyer 
SET paymentMethod = 'HELLO'
WHERE paymentMethod = 'check';

-- --------------------------------------------------------------------------------------------------------
-- UPDATE/ALTER/DELETE STATEMENTS

UPDATE buyer SET paymentMethod = REPLACE(paymentMethod , 'check', 'CHECK');
UPDATE seller SET paymentMethod = REPLACE(paymentMethod , 'check', 'CHECK');

UPDATE buyer SET paymentMethod = REPLACE(paymentMethod , 'cash', 'CASH');
UPDATE seller SET paymentMethod = REPLACE(paymentMethod , 'cash', 'CASH');

UPDATE buyer SET paymentMethod = REPLACE(paymentMethod , '"credit card"', 'CC');
UPDATE seller SET paymentMethod = REPLACE(paymentMethod , '"credit card"', 'CC');

UPDATE car SET color = REPLACE(color, 'pink','PINK');
UPDATE car SET color = REPLACE(color, 'purple', 'PURPLE');
UPDATE car SET color = REPLACE(color, 'orange','ORANGE');
UPDATE car SET color = REPLACE(color, 'red', 'RED');

ALTER TABLE car RENAME COLUMN color TO carColor;
ALTER TABLE car MODIFY COLUMN carColor varchar(25);

ALTER TABLE car RENAME COLUMN vinNumber TO VIN;
ALTER TABLE car MODIFY COLUMN VIN varchar(18);

UPDATE seller SET email = 'cnutkin1d@outlook.com' WHERE (sellerID = 50);

UPDATE seller SET paymentMethod = 'CHECK' WHERE (sellerID = 4);

DELETE FROM buyer WHERE buyerID IN (SELECT buyerID FROM car WHERE sellerID = 41);
DELETE FROM buyer WHERE buyerID IN (SELECT buyerID FROM car WHERE sellerID = 42);

DELETE FROM car WHERE sellerID = 41;
DELETE FROM car WHERE sellerID = 42;

DELETE FROM seller WHERE sellerID = 41;
DELETE FROM seller WHERE sellerID = 42;


-- --------------------------------------------------------------------------------------------------------
-- SQL SELECT STATEMENTS

-- 1) When do we send out birthday cards to employees each year? 
-- Create a list with all the salespeople sorted by birthday. Order A-Z by the ‘month number’, then order A-Z by the ‘date number’, for 
-- example...the month number for January would be 01, the month number for December would be 12. Do not sort by the birthday year.
select 
    birthdate AS 'Birthdate', 
    CONCAT(firstName, " ", lastName) as 'Name' 
from 
    salespeople 
ORDER BY 
    MONTH(birthdate);

-- 2) Show the ‘total revenue’ (i.e., sellPrice) and commission for each salesperson and by color of car if a car has been sold 
--(i.e., has a sellDate). Remember, each salesperson makes $250 per car transaction. Include each salesperson’s 
--firstName and lastName. 
select  
    CONCAT(sp.firstName, " ", sp.lastName) as 'Name', 
    SUM(c.sellPrice) as 'Revenue',
    COUNT(c.sellPrice) * 250 as 'Commision'
from 
    salespeople sp 
INNER join 
    car c 
on 
    sp.salesPersonId = c.salesPersonId
INNER JOIN 
    buyer b
ON 
    c.buyerID = b.buyerId
INNER JOIN 
    seller s
on 
    c.sellerID = s.sellerId
where 
    c.sellDate != '0000-00-00'
GROUP BY 
    sp.salesPersonId;


-- 3) Which car color contributed to the most profit? Show the profit (i.e., sellPrice – buyPrice) by each color if a car has been sold.
select  
    carColor as 'Car Color', 
    CONCAT('$', SUM((sellPrice - buyPrice))) as 'Potential Profit'
from 
    car
where 
    sellDate != '0000-00-00'
GROUP BY 
    carColor;



-- 4) What day of the week are the most cars sold? Show the weekday (2, 3, 1, etc...) or dayname (Monday, Tuesday, Sunday, etc...) and 
-- number of cars sold on that weekday or dayname. Order by the most to least cars sold.
select 
    dayname(sellDate) as 'Day', 
    count(*) as 'Cars Sold' 
from car
where 
    sellDate != '0000-00-00' or buyerID != 0
GROUP BY 
    dayname(sellDate)
ORDER BY 
    count(*) DESC;



-- 5) What is the total value of cars in stock (i.e., the cars’ buyPrice with no sellDate, no buyer)? What is the count of cars in stock (i.e., cars 
-- with no sellDate, no buyer)? Group by salesperson ID.
select 
    salesPersonId as 'Sales Person ID', 
    count(*) as 'Cars in Stock', 
    CONCAT('$', SUM(buyPrice)) as 'Total Revenue'
from 
    car
where 
    sellDate = '0000-00-00' or buyerID = 0
GROUP BY 
    salesPersonId;



-- 6) What is the potential profit (i.e., sellPrice – buyPrice) of these cars that are still in stock (i.e., not sold)?  
select 
    CONCAT('$', SUM((sellPrice - buyPrice))) as 'Potential Profit' 
from 
    car 
WHERE 
    sellDate = '0000-00-00' or buyerID = 0;

-- --------------------------------------------------------------------------------------------------------
-- CHECK FOR DATA
-- 
select * from salespeople;
select * from buyer;
select * from car;
select * from seller;


