CREATE DATABASE netflix;
use netflix;

SELECT * FROM TITLES;

-- COUNT TOTAL NUMBER OF RECORDS
SELECT COUNT(*)AS TOTAL_RECORDS
FROM TITLES; 

-- UNIQUE VALUES IN EACH COLUMN
SELECT
COUNT(DISTINCT SHOW_ID)AS UNIQUE_show_ids,
COUNT(DISTINCT type)AS UNIQUE_types,
COUNT(DISTINCT title)AS UNIQUE_titles,
COUNT(DISTINCT director)AS UNIQUE_directors,
COUNT(DISTINCT cast)AS UNIQUE_casts,
COUNT(DISTINCT country)AS UNIQUE_countries,
COUNT(DISTINCT date_added)AS UNIQUE_dates_added,
COUNT(DISTINCT release_year)AS UNIQUE_release_years,
COUNT(DISTINCT rating)AS UNIQUE_ratings,
COUNT(DISTINCT duration)AS UNIQUE_durations,
COUNT(DISTINCT listed_in)AS UNIQUE_listed_in,
COUNT(DISTINCT description)AS UNIQUE_descriptions
FROM titles;

-- count missing values in each column
 SELECT
 SUM(CASE WHEN director IS NULL THEN 1 ELSE 0 END) AS missing_directors,
 SUM(CASE WHEN cast IS NULL THEN 1 ELSE 0 END) AS missing_cast,
 SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS missing_country,
 SUM(CASE WHEN date_added IS NULL THEN 1 ELSE 0 END) AS missing_dates_added,
 SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS missing_ratings,
 SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS missing_durations
 FROM titles;
 
 -- distribution of type
 SELECT type,COUNT(*)AS count
 from titles
 GROUP BY TYPE
 ORDER BY COUNT DESC;
 
 --  DISTRIBUTION OF RATING
 SELECT rating,COUNT(*)AS count
 from titles
 GROUP BY rating
 ORDER BY COUNT DESC;
 
 -- distribution of release year
 
 SELECT release_year,COUNT(*)AS count
 from titles
 GROUP BY release_year
 ORDER BY release_year;
 
 SELECT COUNT(CASE WHEN cast IS NULL THEN 1 ELSE 0 END)AS MISSING_DIRECTORS
from titles;


-- TOP 10 MOST COMMON DIRECTORS
SELECT director, count(*)as count
from titles
 GROUP BY director
 ORDER BY count DESC
 LIMIT 10;
 
 -- TOP 10 MOST COUNTRIES
SELECT country, count(*)as count
from titles
 GROUP BY country
 ORDER BY count DESC
 LIMIT 10;
 
 -- records added per month
 SELECT DATE_FORMAT(STR_TO_DATE(date_added,'%b %d,%Y'),'%Y-%m')as month ,count(*)as count
 from titles
  GROUP BY month
 ORDER BY month;
 
 -- cont dramas records
  SELECT COUNT(*) as count
  from titles
  WHERE listed_in LIKE'%dramas%';
  
  -- average duration of movies/shows
  SELECT AVG(CAST(SUBSTRING_INDEX(duration,' ',1)AS UNSIGNED)) as average_duration
  from titles
  WHERE duration REGEXP '^[0-9]+ min$';
  
  -- find records with no diector info
  SELECT COUNT(*)as count 
  from titles
  WHERE director="";
  
  -- RECORDS RELEASED IN LAST 5 YEARS
  SELECT * FROM titles
  WHERE release_year>= YEAR(CURDATE())-5;
  
  -- RECORDS FOR INDIA COUNTRY
  SELECT TYPE,title
  FROM titles
  WHERE country = 'india';
  
  -- find records which have seasons
  SELECT *
  FROM titles
  WHERE duration LIKE'%seasons%';
  
SELECT *
FROM titles
WHERE duration LIKE'%seasons%'
AND CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(duration,' ',1),' ',-1) AS UNSIGNED)>2;


  
  
  
  
  
 
 
 
 