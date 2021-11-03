DROP SCHEMA IF EXISTS `cuteCar_Dealership` ;
CREATE SCHEMA IF NOT EXISTS `cuteCar_Dealership` DEFAULT CHARACTER SET utf8mb4 ;


set global local_infile= 1; -- allows for connection to local files
SET GLOBAL FOREIGN_KEY_CHECKS=0;

-- USE DATABASE
use cuteCar_Dealership;

-- ------------------------------------------------
-- Create salespeople table
DROP TABLE IF EXISTS `salespeople` ;

CREATE TABLE IF NOT EXISTS `salespeople`(
    salesPersonId INT(10),
    firstName VARCHAR(45) NOT NULL,
    lastName VARCHAR(45) NOT NULL,
    birthdate DATE NOT NULL,

    PRIMARY KEY (salesPersonId)
);


-- Load data using this: put your path to the files
LOAD DATA Local INFILE "your path to the csv file"
INTO TABLE salespeople 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- CHECK IF DATA IS IN TABLE
select * from salespeople;
