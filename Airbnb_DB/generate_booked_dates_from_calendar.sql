DROP SCHEMA IF EXISTS `bookings` ;
CREATE SCHEMA IF NOT EXISTS `bookings` DEFAULT CHARACTER SET utf8mb4 ;

-- --------------------------------------------------------------------------------------------------------
-- THESE INITIALIZERS ARE USED TO BE ABLE TO LOAD IN LOCAL DATA 
-- ALSO HAVE TO CHECK YOUR ADVANCED SETTING IN CONNECTION TO MAKE SURE THIS LINE IS ADDED:
-- OPT_LOCAL_INFILE=1
set global local_infile= 1; -- allows for connection to local files
SET GLOBAL FOREIGN_KEY_CHECKS=0;

-- USE DATABASE
use bookings;

-- create bookings table
DROP TABLE IF EXISTS `Calendar_Table`;

CREATE TABLE IF NOT EXISTS `Calendar_Table`(
    ListingID INT(100) NOT NULL,
    Date Date NOT NULL,
	Available CHAR(2) NOT NULL,
    Price INT(100) NOT NULL,
    Adjusted_Price INT(10) NOT NULL,
    Minimum_Nights INT(100) NOT NULL,
    Maximum_Nights INT(100) NOT NULL
);

DROP TABLE IF EXISTS `Booked_Dates_Table`;
CREATE TABLE IF NOT EXISTS `Booked_Dates_Table`(
    ListingID INT(100) NOT NULL,
    Date Date NOT NULL,
    Price INT(100) NOT NULL,
    Minimum_Nights INT(100) NOT NULL,
    Maximum_Nights INT(100) NOT NULL,
    
    PRIMARY KEY(ListingID, Date)
);

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO Bookings TABLE
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/Airbnb_DB/calendar.csv"
INTO TABLE Calendar_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Limiting to booked dates in 2022 Q1 (Jan-March)
INSERT INTO Booked_Dates_Table (ListingID, Date, Price, Minimum_Nights, Maximum_Nights)
SELECT ListingID, Date, Price, Minimum_Nights, Maximum_Nights FROM Calendar_Table
WHERE (Available = "f") AND (Year(Date) = 2022) AND (Month(Date) in (1,2,3));