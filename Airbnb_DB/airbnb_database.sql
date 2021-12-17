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
    FOREIGN KEY(NeighborhoodID) REFERENCES Neighborhoods_Table (NeighborhoodID),
    FOREIGN KEY(HostID) REFERENCES Hosts_Table (HostID)
);
-- --------------------------------------------------------------------------------------------------------
-- CREATE PROPERTY REVIEWS TABLE
DROP TABLE IF EXISTS `PropertyReviews_Table`;

CREATE TABLE IF NOT EXISTS `PropertyReviews_Table`(
    PropertyReviewsID INT(100) NOT NULL,
    PropertyID INT(100) NOT NULL,
    TravelerID INT NOT NULL,
    Comments VARCHAR(25) NOT NULL,
    ReviewDate Date NOT NULL,
    
    PRIMARY KEY (PropertyReviewsID),
    
    FOREIGN KEY (`PropertyID`) REFERENCES `properties_table` (`PropertyID`),
    FOREIGN KEY (`TravelerID`) REFERENCES `travelers_table` (`TravelerID`)
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

    FOREIGN KEY (`PropertyID`) REFERENCES `properties_table` (`PropertyID`)
    );
    
-- --------------------------------------------------------------------------------------------------------
-- CREATE BOOKINGS TABLE

DROP TABLE IF EXISTS `Booked_Dates_Table`;

CREATE TABLE IF NOT EXISTS `Booked_Dates_Table`(
	ListingID INT(100) NOT NULL,
    Date Date NOT NULL,
    Price INT(100) NOT NULL,
    Minimum_Nights INT(100) NOT NULL,
    Maximum_Nights INT(100) NOT NULL,
    
    PRIMARY KEY(ListingID, Date),
    FOREIGN KEY (`ListingID`) REFERENCES `properties_table` (`PropertyID`)
);

-- --------------------------------------------------------------------------------------------------------
-- CREATE POINTS OF INTERST TABLE
DROP TABLE IF EXISTS `POI_Table`;

CREATE TABLE IF NOT EXISTS `POI_Table`(
    POI_PK INT(100) NOT NULL,
    POI_Phone VARCHAR(12) NULL,
    POI_Address VARCHAR(50) NOT NULL,
    POI_Neighborhood VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (POI_PK)
);

-- --------------------------------------------------------------------------------------------------------
-- CREATE POINTS OF INTERST TABLE
DROP TABLE IF EXISTS `POI_Neighborhoods_Table`;

CREATE TABLE IF NOT EXISTS `POI_Neighborhoods_Table`(
    POI_PK INT(100) NOT NULL,
    POI_Neighborhood_ID INT(100) NOT NULL,
    POI_Neighborhood VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (POI_PK, POI_Neighborhood_ID),
    FOREIGN KEY (`POI_Neighborhood_ID`) REFERENCES `neighborhoods_table` (`NeighborhoodID`),
    FOREIGN KEY (`POI_PK`) REFERENCES `POI_table` (`POI_PK`)
);

-- NEED REST OF TABLES TO RUN BOOKINGS TABLE


-- --------------------------------------------------------------------------------------------------------
-- PLEASE ADD TABLES ABOVE
-- --------------------------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO TABLES SCRIPTS BELOW
-- --------------------------------------------------------------------------------------------------------


-- NOTE: replace PATH with FILE PATH in format C:/Users/ path to file

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO HOSTS TABLE
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/Airbnb_DB/csv_files_SQL/hosts.csv"
INTO TABLE hosts_table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO TRAVELERS TABLE
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/Airbnb_DB/csv_files_SQL/travelers.csv"
INTO TABLE Travelers_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO PROPERTY TYPE TABLE
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/Airbnb_DB/csv_files_SQL/propertytypes.csv"
INTO TABLE Property_Type_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO NEIGHBORHOODS TABLE
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/Airbnb_DB/csv_files_SQL/neighborhoods.csv"
INTO TABLE Neighborhoods_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO PROPERTIES TABLE
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/Airbnb_DB/csv_files_SQL/properties.csv"
INTO TABLE Properties_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO PROPERTIES REVIEWS TABLE
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/Airbnb_DB/csv_files_SQL/property_reviews.csv"
INTO TABLE PropertyReviews_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO AMENITIES TABLE
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/Airbnb_DB/csv_files_SQL/amenities.csv"
INTO TABLE Amenities_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------

-- LOAD DATA INTO POI TABLE
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/Airbnb_DB/csv_files_SQL/points_of_interest.csv"
INTO TABLE POI_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO POI_Neighborhoods TABLE
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/Airbnb_DB/csv_files_SQL/points_of_interest_neighborhoods.csv"
INTO TABLE POI_Neighborhoods_Table
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
-- --------------------------------------------------------------------------------------------------------
-- LOAD DATA INTO Booked Dates TABLE
LOAD DATA Local INFILE "C:/Users/negis/Documents/DataBases/Airbnb_DB/csv_files_SQL/booked_dates.csv"
INTO TABLE Booked_Dates_Table
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
select * from POI_table;
select * from POI_neighborhoods_table;
select * from booked_dates_table;