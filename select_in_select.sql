-- List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world
WHERE continent = 'Europe'
AND gdp/population > (SELECT gdp/population FROM world
      WHERE name = 'United Kingdom')

-- List the name and continent of countries in the continents containing either Argentina or Australia.
SELECT name, continent FROM world
WHERE continent = 
(SELECT continent FROM world WHERE name = 'Argentina') 
OR continent = 
(SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name

-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population FROM world
WHERE population > 
(SELECT population FROM world WHERE name = 'Canada') 
AND population <
(SELECT population FROM world WHERE name = 'Poland')

-- AGGREGATE FUNCTIONS
SELECT SUM(population)
FROM world

SELECT DISTINCT continent FROM world

-- Give the total GDP of Africa
SELECT SUM(gdp) FROM world WHERE continent = 'Africa'

-- How many countries have an area of at least 1000000
SELECT COUNT(name) FROM world WHERE area >= 1000000

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population) FROM world 
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')


-- For each continent show the continent and number of countries.
SELECT continent, COUNT(continent) as Number FROM world GROUP BY continent

-- For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent FROM world 
GROUP BY continent
HAVING SUM(population) >= 100000000 