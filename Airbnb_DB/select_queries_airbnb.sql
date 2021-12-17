use airbnb_database;

-- --------------------------------------------------------------------------------------------------------
-- BELOW ARE THE SELECT QUERIES ANSWERING A BUSINESS QUESTION
-- ALONG WITH THESE QUERIES, THERE WILL BE A 1 - 2 SENTENCE DESCRIBING THE QUERY
-- --------------------------------------------------------------------------------------------------------



-- --------------------------------------------------------------------------------------------------------
-- SELECT QUERIES (BEGIN: ANGEL)
-- --------------------------------------------------------------------------------------------------------
-- SELECT STATEMENT 1 -- Basic
-- Business Question: Invester would like to know all hosts names in Denver, CO that start with the letter A,
--                      please query the names.
SELECT 
    HostFirstName AS 'Host First Name', HostLastName AS 'Host Last Name' 
FROM
    hosts_table
WHERE 
    HostFirstName LIKE 'A%';


-- SELECT STATEMENT 2 -- Basic
-- Business Question: Invester would like to know all the last names of the hosts in Denver, CO that start with the letter E,
--                      please query the names.
SELECT 
    HostLastName AS 'Host Last Name',  HostFirstName AS 'Host First Name'  
FROM 
    hosts_table
WHERE 
    HostLastName LIKE 'E%';

-- SELECT STATEMENT 3 -- Join 2 or more tables
-- Business Question: Invester would like to know how many of each property type there are,
--                      please query the results.
SELECT 
    count(p1.PropertyTypeID) AS 'Number of Properties', p2.PropertyTypeName AS 'Property Type'
FROM 
    properties_table p1
INNER JOIN 
    property_type_table p2
ON 
    p1.PropertyTypeID = p2.PropertyTypeID
GROUP BY 
    p2.PropertyTypeName
ORDER BY 
    COUNT(p1.PropertyTypeID) DESC;

-- SELECT STATEMENT 4- Join 2 or more tables
-- Business Question: Invester would like to know how many properties are in each neighborhood,
--                      please query the results
SELECT 
    COUNT(p1.NeighborhoodID) AS 'Number of Properties', n1.NeighborhoodName AS 'Neighborhood Name', CONCAT('$', AVG(p1.Price)) as 'Price'
FROM 
    properties_table p1
INNER JOIN
    neighborhoods_table n1
ON 
    p1.NeighborhoodID = n1.NeighborhoodID
GROUP BY 
    n1.NeighborhoodName
ORDER BY 
    COUNT(p1.NeighborhoodID) DESC;


-- SELECT STATEMENT 5 -- Subquery, window function, CTE, self-join
-- Business Question: Invester would like to know the listing name between $100 and $300
--                      please query results
WITH best_prices AS
(
    SELECT * FROM properties_table
    WHERE Price BETWEEN 100 AND 300
) SELECT ListingName AS 'Listing Name', CONCAT('$', price)  AS 'Price' FROM best_prices ORDER BY price;
-- --------------------------------------------------------------------------------------------------------
-- SELECT QUERIES (END: ANGEL)
-- --------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------------------
-- SELECT QUERIES (Begin: Kynndal)
-- --------------------------------------------------------------------------------------------------------

-- SELECT STATEMENT 1 -- Basic
-- Business Question: Investor wants to know which properties have air condition and a pool
Select PropertyID
From amenities 
WHERE AirConditioning = 'True' and Pool = 'True';

-- SELECT STATEMENT 2 -- Basic
-- Business Question: an investor would like to know how many properties are pet friendly
Select count(PropertyID) AS '# of pet friendly properties'
FROM amenities
WHERE PetFriendly = 'True';

-- SELECT STATEMENT 3 -- Join 2 or more tables
-- Business Question: An investor would like to know which property types comes with free parking and AC
Select t.PropertyTypeName, count(*) as Freeparking_AC
From propertytypes as t
join properties as p on t.PropertyTypeID = p.PropertyTypeID
join amenities as a on p.PropertyID = a.PropertyID
where a.AirConditioning ='True' and a.FreeParking = 'True'
Group by t.PropertyTypeName;

-- SELECT STATEMENT 4 -- Join 2 or more tables
-- Business Question: An investor would like to know the average nightly price of each property type
Select t.propertyTypeName, round(avg(p.price),2) as 'nightly price'
from propertytypes as t
inner join properties as p
on t.PropertyTypeID = p.PropertyTypeID
Group by t.PropertyTypeID;

-- SELECT STATEMENT 5 -- Subquery, window function, CTE, self-join
-- Business Question: An investor would like to know which listings are expensive, afforadable, or cheap
Select ListingName,
CASE when price > 500 Then 'expensive'
When price > 200 Then 'affordable'
Else 'cheap' END
AS Nightly_Price
From properties;

-- --------------------------------------------------------------------------------------------------------
-- SELECT QUERIES (END: Kynndal)
-- --------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------------------
-- SELECT QUERIES (BEGIN: LIAM)
-- --------------------------------------------------------------------------------------------------------
-- SELECT STATEMENT 1 -- Basic
-- Business Question: Invester would like to know the number of properties in the Denver area
SELECT count(distinct PropertyID)
FROM Properties_Table;

-- SELECT STATEMENT 2 -- Basic
-- Business Question: Invester would like to know the number of hosts in the Denver area
SELECT count(distinct HostID)
FROM Hosts_Table;

-- SELECT STATEMENT 3 -- Join 2 or more tables
-- Business Question: Invester would like to know how many hosts have more than one listing
SELECT b.HostID, count(*) as count
FROM Properties_Table a 
	JOIN Hosts_Table b ON a.HostID = b.HostID
GROUP BY b.HostID
HAVING count > 1
ORDER BY count DESC;

-- SELECT STATEMENT 4- Join 2 or more tables
-- Business Question: Invester would like to know which neighborhoods have the most pools
SELECT a.NeighborhoodName, count(*) as pools
FROM Neighborhoods_Table a
	JOIN Properties_Table b ON a.NeighborhoodID = b.NeighborhoodID
    JOIN Amenities_Table c ON b.PropertyID = c.PropertyID
WHERE c.Pool = 'True'
GROUP BY a.NeighborhoodName
ORDER BY pools DESC;

-- SELECT STATEMENT 5 -- Subquery, window function, CTE, self-join
-- Business Question: Invester would like to know average number of reviews per property
SELECT avg(count) FROM
	( SELECT PropertyID, count(*)  as count 
	  FROM PropertyReviews_Table
	  GROUP BY PropertyID );
-- --------------------------------------------------------------------------------------------------------
-- SELECT QUERIES (END: LIAM)
-- --------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------------------
-- SELECT QUERIES (BEGIN: SHIVANI )
-- --------------------------------------------------------------------------------------------------------
-- SELECT STATEMENT 1 -- Basic
-- Business Question: An investor is interested in which month (in the first quarter) has the most bookings so far.
SELECT Month(Date) as `Month`, Count(*) as `Bookings` FROM booked_dates_table
GROUP BY Month
ORDER BY Bookings desc;

-- SELECT STATEMENT 2 -- Basic
-- Business Question: Investor is interested in property type distribution by neighborhoods.
SELECT N.NeighborhoodName, PT.PropertyTypeName, COUNT(*) as `PropertyCount` FROM property_type_table as PT 
JOIN properties_table as P ON PT.PropertyTypeID = P.PropertyTypeID
JOIN neighborhoods_table as N ON N.neighborhoodID = P.neighborhoodID
GROUP BY NeighborhoodName, PropertyTypeName
ORDER BY NeighborhoodName, PropertyTypeName;

-- SELECT STATEMENT 3 -- Join 2 or more tables
-- Business Question: An investor wants to know the 100 top most reviewed properties and which neighborhoods are they located in.
SELECT PR.PropertyID, COUNT(PR.PropertyReviewsID) as `ReviewCount`, N.NeighborhoodName FROM propertyreviews_table as PR
JOIN properties_table as PT on PR.PropertyID = PT.PropertyID
JOIN neighborhoods_table as N on N.neighborhoodID = PT.neighborhoodID
GROUP BY PropertyID
ORDER BY ReviewCount desc
LIMIT 100;

-- SELECT STATEMENT 4 -- Join 2 or more tables
-- Business Question: An investor wants to know which niegborhoods have the most bookings in March 2022.
SELECT Count(*) as `Bookings`, N.NeighborhoodName FROM booked_dates_table as B
JOIN properties_table as P on B.listingID = P.propertyID
JOIN neighborhoods_table as N on N.neighborhoodID = P.neighborhoodID
WHERE Month(Date) = 3
GROUP BY N.NeighborhoodName
ORDER BY Bookings desc;

-- SELECT STATEMENT 5 -- Subquery, window function, CTE, self-join
-- An investor is interested in finding the host with the most properties and then seeing how their properties are distributed by neighborhoods. 
SELECT N.NeighborhoodName, Count(P.PropertyID) as `NumProperties` FROM properties_table as P
JOIN neighborhoods_table as N on P.neighborhoodID = N.neighborhoodID
WHERE P.HostID in (SELECT * FROM (SELECT H.HostID FROM hosts_table as H
	JOIN properties_table as P ON H.HostId = P.HostID
	GROUP BY H.HostId
	ORDER BY Count(*) desc
    LIMIT 1) as q)
GROUP BY NeighborHoodName
ORDER BY NumProperties desc;
-- --------------------------------------------------------------------------------------------------------
-- SELECT QUERIES (END: SHIVANI )
-- --------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------------------
-- STORED PROGRAMS
-- --------------------------------------------------------------------------------------------------------
-- STORED FUNCTION (1) THAT WILL SET PROPERTY PRICES AS CHEAP, AVERAGE, EXPENSIVE
DROP function IF EXISTS `House_level`;
DELIMITER //
CREATE FUNCTION House_level (
    Price DECIMAL(10, 0)
) 
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE house_level VARCHAR(20);
    CASE
        when Price > 800 then set house_level = 'Expensive';
        when Price <= 800 and Price >= 400 THEN set house_level = 'Affordable';
        when Price < 400 THEN set house_level = 'Cheap';
    END CASE;
    RETURN (house_level);
END //
DELIMITER ;

DROP function IF EXISTS `POI_rank`;
-- STORED FUNCTION (2) THAT WILL SET PROPERTY POI Rank as "Many POIs", "Some POIs", "Very Few POIs"
DELIMITER //
CREATE FUNCTION POI_rank (
    NeighborhoodID Int
) 
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	DECLARE poi_rating VARCHAR(20);
    DECLARE poi_count INT;
    SET poi_count = (SELECT COUNT(*) as `POI_Count` FROM poi_neighborhoods_table as PN
	JOIN poi_table as PT ON PN.POI_PK = PT.POI_PK
    WHERE PN.POI_Neighborhood_ID = neighborhoodID
    GROUP BY POI_Neighborhood_ID);
	CASE
 		when poi_count > 10 then set poi_rating = 'Many POIs';
 		when poi_count < 10 and poi_count >= 5 THEN set poi_rating = 'Some POIs';
 		when (poi_count < 5) OR (poi_count is NULL) THEN set poi_rating = 'Very Few POIs';
 	END CASE;
	RETURN (poi_rating);
END //
DELIMITER ;




-- --------------------------------------------------------------------------------------------------------
-- STORED PROCEDURE
-- --------------------------------------------------------------------------------------------------------
DROP procedure IF EXISTS `GetNumberofPropertiesPerHost`;
DELIMITER //
CREATE PROCEDURE GetNumberofPropertiesPerHost()
BEGIN
	SELECT H.HostID, H.HostFirstName, H.HostLastName, Count(*) AS `Number_of_Properties` FROM hosts_table as H
	JOIN properties_table as P ON H.HostId = P.HostID
	GROUP BY H.HostId
	ORDER BY Number_of_Properties desc
	LIMIT 10;
END //
DELIMITER ;

DROP procedure IF EXISTS `GetAllNeighborhoodProperties`;

DELIMITER //
CREATE PROCEDURE GetAllNeighborhoodProperties(
	IN neighborhood varchar(30)
)
BEGIN
	SELECT P.PropertyID, H.HostID, N.NeighborhoodName FROM hosts_table as H
	JOIN properties_table as P ON H.HostId = P.HostID
	JOIN neighborhoods_table as N ON P.neighborhoodID = N.neighborhoodID
	WHERE N.NeighborhoodName like CONCAT('%',neighborhood,'%');
END //
DELIMITER ;

-- --------------------------------------------------------------------------------------------------------
-- TRIGGER
-- --------------------------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------------------------------
-- QUERIES CALLING STORED FUNCTIONS/PROGRAMS
-- --------------------------------------------------------------------------------------------------------
-- QUERY 1 FOR STORED PROGRAM (1)
SELECT PropertyID, House_Level(Price) from properties_table; 
-- QUERY 2 FOR STORED PROGRAM (2)
SELECT PropertyID, POI_rank(NeighborhoodID) as `POI_Rating` from properties_table
ORDER BY POI_Rating asc;
-- QUERY FOR STORED PROCEDURE
CALL GetNumberofPropertiesPerHost();
CALL GetAllNeighborhoodProperties('Highland');
CALL GetAllNeighborhoodProperties('Five Points');

