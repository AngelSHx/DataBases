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
-- SELECT QUERIES (BEGIN: )
-- --------------------------------------------------------------------------------------------------------