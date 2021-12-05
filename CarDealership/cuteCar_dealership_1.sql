-- NON CONTRIBUTORS
-- Liam Kennedy
-- Maile Moll


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
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/CarDealership/salespeople.csv"
INTO TABLE salespeople 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/CarDealership/buyer.csv"
INTO TABLE buyer 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/CarDealership/car.csv"
INTO TABLE car 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/CarDealership/seller.csv"
INTO TABLE seller
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

UPDATE buyer 
SET paymentMethod = 'HELLO'
WHERE paymentMethod = 'check';

-- --------------------------------------------------------------------------------------------------------
-- CHECK FOR DATA
-- 
select * from salespeople;
select * from buyer;
select * from car;
select * from seller;