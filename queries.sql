/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".
SELECT *
    FROM animals
    WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT name
    FROM animals
    WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

--List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name
    FROM animals
    WHERE neutered = true AND escape_attempts < 3;

--List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth
    FROM animals 
    WHERE name = 'Agumon' OR name = 'Pikachu';

--List name and escape attempts of animals that weigh more than 10.5kg
SELECT 
    name,
    escape_attempts
    FROM animals 
    WHERE weight_kg > 10.5;

--Find all animals that are neutered.
SELECT *
    FROM animals
    WHERE neutered = true;

--Find all animals not named Gabumon.
SELECT *
    FROM animals
    WHERE name != 'Gabumon';

--Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT *
    FROM animals
    WHERE weight_kg >= 10.4 AND weight_kg <=17.3;

-- MILESTONE 2
-- Inside a transaction update the animals table by setting the species column to unspecified. 
-- Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.

BEGIN;
    UPDATE animals SET species = 'unespecified';
    ROLLBACK;
COMMIT;

BEGIN;
    SAVEPOINT deleted_table;
    DELETE FROM animals;
    ROLLBACK TO deleted_table;
COMMIT;

BEGIN;
    DELETE FROM animals
        WHERE date_of_birth > '2022-01-01';
        
    SAVEPOINT delete_animals;
    
    UPDATE animals SET weight_kg = weight_kg * -1;
    ROLLBACK TO delete_animals;
    
    UPDATE animals SET weight_kg = weight_kg * -1
    WHERE weight_kg < 0;
COMMIT;

--milestone 2 queries 

SELECT count(*) FROM animals;


SELECT count(*) FROM animals
    WHERE escape_attempts=0;


SELECT avg(weight_kg) FROM animals;

SELECT neutered, avg(escape_attempts) "Average of escape attempts"
FROM animals
GROUP BY neutered;


SELECT 
    species, 
    MIN(weight_KG) "Min weight", 
    MAX(weight_KG) "Max weight" 
FROM animals 
GROUP BY species;


SELECT 
    species, 
    AVG(escape_attempts) "escape attempts average"
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

