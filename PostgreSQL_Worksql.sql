CREATE DATABASE SelfProject1;

/* The Tables here were Extracted from my Excel Workbook for the Project, through Python coding. Each sheet = a Table. */

SELECT * FROM avg_adultheight_1896to1996;

/* Checking if there are Continent names in the "Country" Column */
SELECT country
FROM socioeconomicchanges_1965to2023
WHERE country ILIKE 'Africa';

SELECT *
FROM avg_adultheight_1896to1996 a
JOIN share_urbanpopulation_1960_2022 s ON a.code = s.code;

/* Deleting All Continents from the Tables, as they are to be Organized by Countries */

DELETE FROM avg_adultheight_1896to1996
WHERE country IN ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania', 'Antarctica', 'Africa%', 
	'%Asia', 'Asia%', '%Europe', 'Europe%', '%Europe%', '%North America', 'North America%', '%North America%', 'South America%',
	'%South America', '%South America%', 'Oceania%', '%Oceania', '%Oceania%', 'Antarctica%', '%Antarctica', '%Antarctica%');

DELETE FROM avg_performance_15yrs_sciandmath
WHERE country IN ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania', 'Antarctica', 'Africa%', 
	'%Asia', 'Asia%', '%Europe', 'Europe%', '%Europe%', '%North America', 'North America%', '%North America%', 'South America%',
	'%South America', '%South America%', 'Oceania%', '%Oceania', '%Oceania%', 'Antarctica%', '%Antarctica', '%Antarctica%');

DELETE FROM avg_performance_15yrs_scimath
WHERE country IN ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania', 'Antarctica', 'Africa%', 
	'%Asia', 'Asia%', '%Europe', 'Europe%', '%Europe%', '%North America', 'North America%', '%North America%', 'South America%',
	'%South America', '%South America%', 'Oceania%', '%Oceania', '%Oceania%', 'Antarctica%', '%Antarctica', '%Antarctica%');

DELETE FROM literacyrate_avgyearsschooling
WHERE entity IN ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania', 'Antarctica', 'Africa%', 
	'%Asia', 'Asia%', '%Europe', 'Europe%', '%Europe%', '%North America', 'North America%', '%North America%', 'South America%',
	'%South America', '%South America%', 'Oceania%', '%Oceania', '%Oceania%', 'Antarctica%', '%Antarctica', '%Antarctica%');

DELETE FROM share_urbanpopulation_1960_2022
WHERE entity IN ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania', 'Antarctica', 'Africa%', 
	'%Asia', 'Asia%', '%Europe', 'Europe%', '%Europe%', '%North America', 'North America%', '%North America%', 'South America%',
	'%South America', '%South America%', 'Oceania%', '%Oceania', '%Oceania%', 'Antarctica%', '%Antarctica', '%Antarctica%');

DELETE FROM socioeconomicchanges_1965to2023
WHERE entity IN ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania', 'Antarctica', 'Africa%', 
	'%Asia', 'Asia%', '%Europe', 'Europe%', '%Europe%', '%North America', 'North America%', '%North America%', 'South America%',
	'%South America', '%South America%', 'Oceania%', '%Oceania', '%Oceania%', 'Antarctica%', '%Antarctica', '%Antarctica%');

DELETE FROM tbl_10000bce_to2023_population
WHERE country IN ('Africa', 'Asia', 'Europe', 'North America', 'South America', 'Oceania', 'Antarctica', 'Africa%', 
	'%Asia', 'Asia%', '%Europe', 'Europe%', '%Europe%', '%North America', 'North America%', '%North America%', 'South America%',
	'%South America', '%South America%', 'Oceania%', '%Oceania', '%Oceania%', 'Antarctica%', '%Antarctica', '%Antarctica%');

/* The "avg_performance_15yrs_sciandmath" table ended up being a Wrongly Created and Empty one. Thus, it is going to be Deleted from the
Database. */
DROP TABLE IF EXISTS avg_performance_15yrs_sciandmath;


SELECT * FROM avg_performance_15yrs_scimath;

/* Refining the Columns, Values, and Data Types of Tables, first and foremost: */

-- First, Cleaning any Non-Numeric values:

UPDATE avg_performance_15yrs_scimath
SET averageperformanceof15yearoldmalestudentsonthemathematicsscale = NULL
WHERE averageperformanceof15yearoldmalestudentsonthemathematicsscale ~ '[^0-9.]';

UPDATE avg_performance_15yrs_scimath
SET averageperformanceof15yearoldstudentsonthesciencescale = NULL
WHERE averageperformanceof15yearoldstudentsonthesciencescale ~ '[^0-9.]';

UPDATE avg_performance_15yrs_scimath
SET averageperformanceof15yearoldstudentsonthereadingscale = NULL
WHERE averageperformanceof15yearoldstudentsonthereadingscale ~ '[^0-9.]';

UPDATE avg_adultheight_1896to1996
SET meanmaleheightcm = NULL
WHERE meanmaleheightcm ~ '[^0-9.]';

UPDATE avg_adultheight_1896to1996
SET meanfemaleheightcm = NULL
WHERE meanfemaleheightcm ~ '[^0-9.]';

UPDATE avg_adultheight_1896to1996
SET urbanpopulationoftotalpopulation = NULL
WHERE urbanpopulationoftotalpopulation ~ '[^0-9.]';

UPDATE socioeconomics_1965to2023
SET populationhistorical = NULL
WHERE populationhistorical ~ '[^0-9.]';

UPDATE socioeconomics_1965to2023
SET gdppercapita = NULL
WHERE gdppercapita ~ '[^0-9.]';

UPDATE tbl_10000bce_to2023_population
SET populationhistorical = NULL
WHERE populationhistorical ~ '[^0-9.]';

-- Now, Converting all needed Columns to a more Appropriate Data Type:

ALTER TABLE avg_performance_15yrs_scimath
ALTER COLUMN averageperformanceof15yearoldmalestudentsonthemathematicsscale TYPE numeric(10, 2) USING averageperformanceof15yearoldmalestudentsonthemathematicsscale::NUMERIC;

ALTER TABLE avg_performance_15yrs_scimath
ALTER COLUMN averageperformanceof15yearoldstudentsonthesciencescale TYPE numeric(10, 2) USING averageperformanceof15yearoldstudentsonthesciencescale::NUMERIC;

ALTER TABLE avg_performance_15yrs_scimath
ALTER COLUMN averageperformanceof15yearoldstudentsonthereadingscale TYPE numeric(10, 2) USING averageperformanceof15yearoldstudentsonthereadingscale::NUMERIC;

ALTER TABLE avg_adultheight_1896to1996
ALTER COLUMN meanmaleheightcm TYPE numeric(10, 2) USING meanmaleheightcm::NUMERIC;

ALTER TABLE avg_adultheight_1896to1996
ALTER COLUMN meanfemaleheightcm TYPE numeric(10, 2) USING meanfemaleheightcm::NUMERIC;

ALTER TABLE avg_adultheight_1896to1996
ALTER COLUMN urbanpopulationoftotalpopulation TYPE numeric(10, 2) USING urbanpopulationoftotalpopulation::NUMERIC;

ALTER TABLE socioeconomics_1965to2023
ALTER COLUMN populationhistorical TYPE numeric(12, 0) USING populationhistorical::NUMERIC;

ALTER TABLE socioeconomics_1965to2023
ALTER COLUMN gdppercapita TYPE numeric(10, 0) USING gdppercapita::NUMERIC;

ALTER TABLE tbl_10000bce_to2023_population
ALTER COLUMN populationhistorical TYPE numeric(12, 0) USING populationhistorical::NUMERIC;

-- Renaming needed Columns as well:

ALTER TABLE avg_performance_15yrs_scimath
RENAME averageperformanceof15yearoldmalestudentsonthemathematicsscale TO avg_math_score;

ALTER TABLE avg_performance_15yrs_scimath
RENAME averageperformanceof15yearoldstudentsonthesciencescale TO avg_science_score;

ALTER TABLE avg_performance_15yrs_scimath
RENAME averageperformanceof15yearoldstudentsonthereadingscale TO avg_reading_score;

-- All-Time Average Performance Scores of each Country in Math, Science, and Reading:

SELECT country, ROUND(AVG(avg_math_score), 2) AS mean_math_score, ROUND(AVG(avg_science_score), 2) AS mean_science_score, 
	ROUND(AVG(avg_reading_score), 2) AS mean_reading_score
FROM avg_performance_15yrs_scimath
GROUP BY country
ORDER BY country;

/* Also Adding in Overall Averages and Differences of each Nation's Average Score from the
Overall Average Score of that Measure: */

WITH overall_averages AS (
    SELECT 
        ROUND(AVG(avg_math_score), 2) AS overall_math_score,
        ROUND(AVG(avg_science_score), 2) AS overall_science_score,
        ROUND(AVG(avg_reading_score), 2) AS overall_reading_score
    FROM avg_performance_15yrs_scimath
)
SELECT 
    a.country, 
    ROUND(AVG(a.avg_math_score), 2) AS mean_math_score,
	    ROUND(AVG(a.avg_math_score) - oa.overall_math_score, 2) AS diff_avg_math, 	-- Difference from overall average
    ROUND(AVG(a.avg_science_score), 2) AS mean_science_score,
	    ROUND(AVG(a.avg_science_score) - oa.overall_science_score, 2) AS diff_avg_science,
    ROUND(AVG(a.avg_reading_score), 2) AS mean_reading_score,
	    ROUND(AVG(a.avg_reading_score) - oa.overall_reading_score, 2) AS diff_avg_reading,
    -- Overall average scores
    oa.overall_math_score,
    oa.overall_science_score,
    oa.overall_reading_score
FROM avg_performance_15yrs_scimath a
CROSS JOIN overall_averages oa -- Use CROSS JOIN to apply the overall averages to every row
GROUP BY a.country, oa.overall_math_score, oa.overall_science_score, oa.overall_reading_score
ORDER BY a.country;

-- Measuring All-Time Average Height of, respectively, Males and Females and Average of Population living in Urban areas for each Country:

SELECT country, ROUND(AVG(meanmaleheightcm), 2) AS avg_male_height_cm, ROUND(AVG(meanfemaleheightcm), 2) AS avg_female_height_cm,
	ROUND(AVG(urbanpopulationoftotalpopulation), 2) AS avg_share_urban_population
FROM avg_adultheight_1896to1996
GROUP BY country
ORDER BY country;

/* Now, Using WINDOW Functions to Measure Raw and Percent Male Height, Female Height, and Urban Population share changes: */

SELECT 
    country, 
    year,
    -- Male Height: Raw Change and Percent Change
    meanmaleheightcm AS male_height_cm,
    ROUND(meanmaleheightcm - LAG(meanmaleheightcm) OVER (PARTITION BY country ORDER BY year), 2) AS raw_male_height_change,
    CASE
        WHEN LAG(meanmaleheightcm) OVER (PARTITION BY country ORDER BY year) != 0
        THEN ROUND(((meanmaleheightcm - LAG(meanmaleheightcm) OVER (PARTITION BY country ORDER BY year)) 
               / LAG(meanmaleheightcm) OVER (PARTITION BY country ORDER BY year)) * 100, 2)
        ELSE NULL
    END AS percent_male_height_change,
    -- Female Height: Raw Change and Percent Change
    meanfemaleheightcm AS female_height_cm,
    ROUND(meanfemaleheightcm - LAG(meanfemaleheightcm) OVER (PARTITION BY country ORDER BY year), 2) AS raw_female_height_change,
    CASE
        WHEN LAG(meanfemaleheightcm) OVER (PARTITION BY country ORDER BY year) != 0
        THEN ROUND(((meanfemaleheightcm - LAG(meanfemaleheightcm) OVER (PARTITION BY country ORDER BY year)) 
               / LAG(meanfemaleheightcm) OVER (PARTITION BY country ORDER BY year)) * 100, 2)
        ELSE NULL
    END AS percent_female_height_change,
    -- Urban Population Share: Raw Change and Percent Change
    urbanpopulationoftotalpopulation AS urban_population_share,
    ROUND(urbanpopulationoftotalpopulation - LAG(urbanpopulationoftotalpopulation) OVER (PARTITION BY country ORDER BY year), 2)
	AS raw_urban_pop_change,
    CASE
        WHEN LAG(urbanpopulationoftotalpopulation) OVER (PARTITION BY country ORDER BY year) != 0
        THEN ROUND(((urbanpopulationoftotalpopulation - LAG(urbanpopulationoftotalpopulation) OVER (PARTITION BY country ORDER BY year)) 
               / LAG(urbanpopulationoftotalpopulation) OVER (PARTITION BY country ORDER BY year)) * 100, 2)
        ELSE NULL
    END AS percent_urban_pop_change
FROM avg_adultheight_1896to1996
ORDER BY country, year;

-- Socioeconomics:

SELECT * FROM socioeconomics_1965to2023;

SELECT entity AS country, year, populationhistorical AS population, gdppercapita
FROM socioeconomics_1965to2023
ORDER BY entity, year;

-- Obtaining Dynamic Average Measures for all possible Countries after JOINing:

SELECT a.country, a.year, ROUND(AVG(a.avg_math_score), 2) AS avg_math_score, ROUND(AVG(a.avg_science_score), 2) AS avg_science_score, 
	ROUND(AVG(a.avg_reading_score), 2) AS avg_reading_score, ROUND(AVG(h.meanmaleheightcm), 2) AS avg_male_height_cm, 
	ROUND(AVG(h.meanfemaleheightcm), 2) AS avg_female_height_cm, 
	ROUND(AVG(h.urbanpopulationoftotalpopulation), 2) AS avg_share_urban_population, 
	ROUND(AVG(s.populationhistorical), 0) AS alltime_avg_population, ROUND(AVG(s.gdppercapita), 2) AS alltime_avg_GDPperCapita
FROM avg_performance_15yrs_scimath a
JOIN avg_adultheight_1896to1996 h ON a.country = h.country
JOIN socioeconomics_1965to2023 s ON a.country = s.entity
GROUP BY a.country, a.year
ORDER BY a.country, a.year;

--	Getting an Overall Average for all Countries:

SELECT a.country, ROUND(AVG(a.avg_math_score), 2) AS avg_math_score, ROUND(AVG(a.avg_science_score), 2) AS avg_science_score, 
	ROUND(AVG(a.avg_reading_score), 2) AS avg_reading_score, ROUND(AVG(h.meanmaleheightcm), 2) AS avg_male_height_cm, 
	ROUND(AVG(h.meanfemaleheightcm), 2) AS avg_female_height_cm, 
	ROUND(AVG(h.urbanpopulationoftotalpopulation), 2) AS avg_share_urban_population, 
	ROUND(AVG(s.populationhistorical), 0) AS alltime_avg_population, ROUND(AVG(s.gdppercapita), 2) AS alltime_avg_GDPperCapita
FROM avg_performance_15yrs_scimath a
JOIN avg_adultheight_1896to1996 h ON a.country = h.country
JOIN socioeconomics_1965to2023 s ON a.country = s.entity
GROUP BY a.country
ORDER BY a.country;

/* Generally, $20,000 is a good Threshold for Developed or 'High-Income' Countries.
So, let's pull up all Countries which are or were 'High-Income' nations and the Years in which they held that Status and/or still do.
Using Subqueries. */

SELECT *
FROM socioeconomics_1965to2023
WHERE gdppercapita IN
(SELECT gdppercapita
FROM socioeconomics_1965to2023
WHERE gdppercapita > 20000
	AND populationhistorical IS NOT NULL
	AND year IS NOT NULL)
ORDER BY entity;

SELECT COUNT(DISTINCT(entity))
FROM socioeconomics_1965to2023
WHERE gdppercapita IN
(SELECT gdppercapita
FROM socioeconomics_1965to2023
WHERE gdppercapita > 20000
	AND populationhistorical IS NOT NULL
	AND year IS NOT NULL); /* A Total of 63 Countries have been in the "Developed Country" 
							   Range by GDP per Capita. */


/* Does per Capita GDP Correlate well (>0.7) with a Country's Population?
The Total GDP of a Nation might become Inflated due to just its Sheer size, in terms of Population. But, GDP per Capita will give us a 
Better and more Accurate Measure of how the Wealth of how the Country's Wealth is, very Crucially, BEING DISTRIBUTED. */

SELECT CORR(gdppercapita, populationhistorical) AS GDP_population_correlation
FROM socioeconomics_1965to2023; /* Wow - the Result is "-0.006043"; An almost Negligible Correlation. */

SELECT * FROM tbl_10000bce_to2023_population;

/* Using the Last Table to Calculate Raw Population Change and Percentage of Population Change for each Country from the last year of
Recording: */

SELECT 
    country, 
    year, 
    populationhistorical AS population,
    ROUND(populationhistorical - LAG(populationhistorical) OVER (PARTITION BY country ORDER BY year), 2) AS raw_population_change,
    CASE
        WHEN LAG(populationhistorical) OVER (PARTITION BY country ORDER BY year) != 0
        THEN ROUND(((populationhistorical - LAG(populationhistorical) OVER (PARTITION BY country ORDER BY year)) 
               / LAG(populationhistorical) OVER (PARTITION BY country ORDER BY year)) * 100, 2)
        ELSE NULL
    END AS percent_population_change
FROM tbl_10000bce_to2023_population
ORDER BY country, year;