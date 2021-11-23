
DROP SCHEMA IF EXISTS `airbnb_database` ;
CREATE SCHEMA IF NOT EXISTS `airbnb_database` DEFAULT CHARACTER SET utf8mb4 ;

-- --------------------------------------------------------------------------------------------------------
-- THESE INITIALIZERS ARE USED TO BE ABLE TO LOAD IN LOCAL DATA 
-- ALSO HAVE TO CHECK YOUR ADVANCED SETTING IN CONNECTION TO MAKE SURE THIS LINE IS ADDED:
-- OPT_LOCAL_INFILE=1
set global local_infile= 1; -- allows for connection to local files
SET GLOBAL FOREIGN_KEY_CHECKS=0;

-- USE DATABASE
use airbnb_database;

-- --------------------------------------------------------------------------------------------------------
-- CREATE HOST TABLE
DROP TABLE IF EXISTS `Hosts_Table`;

CREATE TABLE IF NOT EXISTS `Hosts_Table`(
    HostID INT AUTO_INCREMENT NOT NULL,
    HostFirstName VARCHAR(25) NOT NULL,
    HostLastName VARCHAR(25) NOT NULL,

    PRIMARY KEY(HostID)

);

-- --------------------------------------------------------------------------------------------------------
-- CREATE TRAVELERS TABLE
DROP TABLE IF EXISTS `Travelers_Table`;

CREATE TABLE IF NOT EXISTS `Travelers_Table`(
    TravelerID INT AUTO_INCREMENT NOT NULL,
    TravelerFirstName VARCHAR(25) NOT NULL,
    TravelerLastName VARCHAR(25) NOT NULL,

    PRIMARY KEY (TravelerID)

);

DROP TABLE IF EXISTS `Property_Type_Table`;

CREATE TABLE IF NOT EXISTS `Property_Type_Table`(
    PropertyTypeID INT(100) NOT NULL,
    PropertyTypeName VARCHAR(25) NOT NULL
);

DROP TABLE IF EXISTS `Neighborhoods_Table`;

CREATE TABLE IF NOT EXISTS `Neighborhoods_Table`(
    NeighborhoodID INT(10) NOT NULL,
    NeighborhoodName VARCHAR(25) NOT NULL
);

-- --------------------------------------------------------------------------------------------------------
-- CREATE PROPERTIES TABLE
DROP TABLE IF EXISTS `Properties_Table`;

CREATE TABLE IF NOT EXISTS `Properties_Table`(
    PropertyID INT(100) NOT NULL,
    PropertyTypeID INT(100) NOT NULL,
    HostID INT NOT NULL,
    NeighborhoodID INT(10) NOT NULL,
    ListingName VARCHAR(25) NOT NULL,
    Price DECIMAL NOT NULL,

    PRIMARY KEY(PropertyID)

    -- ERRORS WHEN RUNNING THESE FOREIGN KEYS
    -- FOREIGN KEY(PropertyTypeID) REFERENCES `Property_Type_Table` (PropertyTypeID),
    -- FOREIGN KEY(NeighborhoodID) REFERENCES Neighborhoods_Table (NeighborhoodID)
);