SELECT population FROM world
WHERE name = 'Germany'

-- Checking a list The word IN allows us to check if an item is in a list. 
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values).
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000

-- SELECT from world. Source: https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial
SELECT name, continent, population FROM world

-- Show the name for the countries that have a population of at least 200 million.
SELECT name FROM world
WHERE population >= 200000000

-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, GDP/population AS PCGDP
FROM world
WHERE population >= 200000000

-- Show the name and population in millions for the countries of the continent 'South America'. 
SELECT name, population/1000000
FROM world
WHERE continent IN ('South America')

-- Show the name and population for France, Germany, Italy
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

-- Show the countries which have a name that includes the word 'United'
SELECT name
FROM world
WHERE name LIKE '%United%'

-- Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

-- One or the other (but not both)
SELECT name, population, area
FROM world
WHERE NOT area > 3000000 OR population > 250000000

-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. 
SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2) FROM world
WHERE continent = 'South America'

-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros).
SELECT name, ROUND(GDP/population, -3) as pcgdp
FROM world
WHERE GDP >= 1000000000000

-- Show the name and capital where the name and the capital have the same number of characters.
SELECT name, LENGTH(name), continent, LENGTH(continent), capital, LENGTH(capital)
FROM world
WHERE LENGTH('name') == LENGTH('capital')