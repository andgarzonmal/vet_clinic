/* Populate database with sample data. */

INSERT INTO  animals (
  name, 
  date_of_birth, 
  weight_kg
)
VALUES (
    'Agumon',
    '2020-02-03',
    10.23
);

INSERT INTO  animals (
    name,
    date_of_birth,
    escape_attempts,
    weight_kg 
)
VALUES (
    'Gabumon',
    '2018-11-15',
    2,
    8
);

INSERT INTO  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg 
)
VALUES (
    'Pikachu',
    '2021-01-07',
    1,
    false,
    15.04
);

INSERT INTO  animals (
    name,
    date_of_birth,
    escape_attempts,
    weight_kg 
)
VALUES (
    'Devimon',
    '2017-05-12',
    5,
    11
);

-- Insert Milestone 2 Data

INSERT INTO animals (
      name,
      date_of_birth,
      escape_attempts,
      neutered,  
      weight_kg
)
VALUES 
    ('Charmander', '2020-02-08', 0, false, -11.00),
    ('Plantmon', '2021-11-15', 2, true, -5.70),
    ('Squirtle', '1993-04-2', 3, false, -12.13),
    ('Angemon', '2005-06-12', 1, true, -45.00),
    ('Boarmon', '2005-06-07', 7, true, 20.40),
    ('Blossom', '1998-10-13', 3, true, 17.00),
    ('Ditto', '2022-05-14', 4, true, 22.00);

-- MILESTONE 3

INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);


INSERT INTO species (name)
VALUES ('Pokemon'), ('Digimon')


UPDATE animals
    SET species_id = species.id
    FROM species
    WHERE species.name = 'Digimon' AND animals.name LIKE '%mon';
UPDATE animals
    SET species_id = species.id
    FROM species
    WHERE animals.name NOT LIKE '%mon' 
        AND species.name = 'Pokemon';

-- •	Modify your inserted animals to include owner information (owner_id):
--   o	Sam Smith owns Agumon.
--   o	Jennifer Orwell owns Gabumon and Pikachu.
--   o	Bob owns Devimon and Plantmon.
--   o	Melody Pond owns Charmander, Squirtle, and Blossom.
--   o	Dean Winchester owns Angemon and Boarmon.

UPDATE animals 
    SET owner_id = owners.id
    FROM owners
    WHERE owners.full_name = 'Sam Smith' 
        AND animals.name = 'Agumon';


UPDATE animals 
    SET owner_id = owners.id
    FROM owners
    WHERE owners.full_name = 'Jennifer Orwell' 
        AND (
            animals.name = 'Gabumon' 
            OR animals.name = 'Pikachu'
        );
        
UPDATE animals 
    SET owner_id = owners.id
    FROM owners
    WHERE owners.full_name = 'Bob' 
        AND (
            animals.name = 'Devimon' 
            OR animals.name = 'Plantmon'
        );

UPDATE animals 
    SET owner_id = owners.id
    FROM owners
    WHERE owners.full_name = 'Melody Pond' 
        AND (
            animals.name = 'Charmander' 
            OR animals.name = 'Squirtle'
            OR animals.name = 'Blossom'
        );


UPDATE animals 
    SET owner_id = owners.id
    FROM owners
    WHERE owners.full_name = 'Dean Winchester' 
        AND (
            animals.name = 'Angemon' 
            OR animals.name = 'Boarmon'
        );

---MILESTONE 4 

INSERT INTO vets (name, age, date_of_graduation)
VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(vets_id, species_id)
VALUES
(1,1),
(3,1),
(3,2),
(4,2);

INSERT INTO visits (visit_date, vets_id, animals_id)
VALUES
(
  '2020-05-24',  
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM animals WHERE name = 'Agumon')
),
(
  '2020-07-22',
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animals WHERE name = 'Agumon')
),
(
  '2021-02-02',  
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animals WHERE name = 'Gabumon')
),
(
  '2020-01-05',
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Pikachu')
),
(
  '2020-03-08',  
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Pikachu')
),
(
  '2020-05-14',  
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Pikachu')
),
(
  '2021-05-04', 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animals WHERE name = 'Devimon')
),
(
  '2021-02-24',
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animals WHERE name = 'Charmander')
),
(
  '2019-12-21', 
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Plantmon')
),
(
  '2020-08-10', 
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM animals WHERE name = 'Plantmon')
),
(
  '2021-04-07', 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Plantmon')
),
(
  '2019-09-29', 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animals WHERE name = 'Squirtle')
),
(
  '2020-10-03', 
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animals WHERE name = 'Angemon')
),
(
  '2020-11-04', 
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animals WHERE name = 'Angemon')
),
(
  '2019-01-24', 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Boarmon')
),
(
  '2019-05-15', 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Boarmon')
),
(
  '2020-02-27', 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Boarmon')
),
(
  '2020-08-03', 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Boarmon')
),
(
  '2020-05-24', 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animals WHERE name = 'Blossom')
),
(
  '2021-01-11', 
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM animals WHERE name = 'Blossom')
);