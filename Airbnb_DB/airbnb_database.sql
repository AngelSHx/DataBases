
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
-- --------------------------------------------------------------------------------------------------------
-- CREATE PROPERTY TYPE TABLE
DROP TABLE IF EXISTS `Property_Type_Table`;

CREATE TABLE IF NOT EXISTS `Property_Type_Table`(
    PropertyTypeID INT(100) NOT NULL,
    PropertyTypeName VARCHAR(25) NOT NULL,

    PRIMARY KEY(PropertyTypeID)
);

-- --------------------------------------------------------------------------------------------------------
-- CREATE NEIGHBORHOODS TABLE
DROP TABLE IF EXISTS `Neighborhoods_Table`;

CREATE TABLE IF NOT EXISTS `Neighborhoods_Table`(
    NeighborhoodID INT(10) NOT NULL,
    NeighborhoodName VARCHAR(25) NOT NULL,

    PRIMARY KEY(NeighborhoodID)
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

    -- PRIMARY/FOREIGN KEYS
    PRIMARY KEY(PropertyID),

    FOREIGN KEY(PropertyTypeID) REFERENCES Property_Type_Table (PropertyTypeID),
    FOREIGN KEY(NeighborhoodID) REFERENCES Neighborhoods_Table (NeighborhoodID)
);
-- --------------------------------------------------------------------------------------------------------
-- CREATE PROPERTY REVIEWS TABLE
DROP TABLE IF EXISTS `PropertyReviews_Table`;

CREATE TABLE IF NOT EXISTS `PropertyReviews_Table`(
    PropertyReviewsID INT(100) NOT NULL,
    PropertyID INT(100) NOT NULL,
    UserID INT NOT NULL,
    Comments VARCHAR(25) NOT NULL,
    ReviewDate Date NOT NULL,
    
    PRIMARY KEY (PropertyReviewsID),
    
	CONSTRAINT `fk_PropertyReviews_PropertyID`
    FOREIGN KEY (`PropertyID`)
    REFERENCES `properties_table` (`PropertyID`)
);

-- --------------------------------------------------------------------------------------------------------
-- CREATE AMENITIES TABLE

DROP TABLE IF EXISTS `Amenities_Table`;

CREATE TABLE IF NOT EXISTS `Amenities_Table`(
    PropertyID INT(100) NOT NULL,
    PetFriendly VARCHAR(25) NOT NULL,
    WiFi VARCHAR(25) NOT NULL,
    TV VARCHAR(25) NOT NULL,
    AirConditioning VARCHAR(25) NOT NULL,
    Pool VARCHAR(25) NOT NULL,
    FreeParking VARCHAR(25) NOT NULL,

    -- CHANGED FROM BOOL TO VARCHAR(25)
    -- THERE WAS AN ERROR WHEN DEALING WITH THE VALUES IN THE CSV FILE
    -- VALUES ARE TRUE,FALSE AND NOT 1, 0

    
    CONSTRAINT `fk_Amenities_PropertyID`
    FOREIGN KEY (`PropertyID`)
    REFERENCES `properties_table` (`PropertyID`)
    );
    
-- --------------------------------------------------------------------------------------------------------
-- CREATE BOOKINGS TABLE

DROP TABLE IF EXISTS `Bookings_Table`;

CREATE TABLE IF NOT EXISTS `Bookings_Table`(
    BookingID INT(100) NOT NULL,
    BookingStartDate Date NOT NULL,
    BookingEndDate Date NOT NULL,
    ListingID INT(100) NOT NULL,
    TravelerID Date NOT NULL,
    
    PRIMARY KEY (BookingID),
    
    Constraint `fk_Bookings_TravelerID`
    FOREIGN KEY (`TravelerID`)
    REFERENCES `Travelers_Table` (`TravelerID`)
);

-- NEED REST OF TABLES TO RUN BOOKINGS TABLE


-- --------------------------------------------------------------------------------------------------------
-- PLEASE ADD TABLES ABOVE
-- --------------------------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO TABLES SCRIPTS BELOW
-- --------------------------------------------------------------------------------------------------------


-- NOTE: replace PATH with FILE PATH


-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO HOSTS TABLE
LOAD DATA Local INFILE "PATH"
INTO TABLE hosts_table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO TRAVELERS TABLE
LOAD DATA Local INFILE "PATH"
INTO TABLE Travelers_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO PROPERTY TYPE TABLE
LOAD DATA Local INFILE "PATH"
INTO TABLE Property_Type_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO NEIGHBORHOODS TABLE
LOAD DATA Local INFILE "PATH"
INTO TABLE Neighborhoods_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO PROPERTIES TABLE
LOAD DATA Local INFILE "PATH"
INTO TABLE Properties_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO PROPERTIES TABLE
LOAD DATA Local INFILE "PATH"
INTO TABLE PropertyReviews_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO PROPERTIES TABLE
LOAD DATA Local INFILE "PATH"
INTO TABLE Amenities_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO PROPERTIES TABLE
-- NEED REST OF TABLES TO RUN BOOKINGS TABLES
LOAD DATA Local INFILE "PATH"
INTO TABLE Bookings_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- TEST TO MAKE SURE DATA IS LOADED INTO TABLES
select * from hosts_table;
select * from travelers_table;
select * from property_type_table;
select * from neighborhoods_table;
select * from properties_table;
select * from propertyreviews_table;
select * from amenities_table;
select * from bookings_table;