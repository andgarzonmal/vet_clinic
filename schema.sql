/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT DEFAULT 0,
    neutered BOOLEAN DEFAULT true,
    weight_kg decimal
);

-- Add a column species of type string to your animals table. Modify your schema.sql file.

ALTER TABLE animals 
    ADD species VARCHAR(70);


--MILESTONE 3

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(120),
    age INT
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(120)
);

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id INT,
ADD COLUMN owner_id   INT,
ADD FOREIGN KEY (species_id) REFERENCES species(id),
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

--MILESTONE 4 

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(60),
    age INT,
    date_of_graduation DATE
)

CREATE TABLE specializations (
    vets_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id),
    PRIMARY KEY(vets_id, species_id)
);

CREATE TABLE visits (
    visit_date DATE,
    animals_id INT REFERENCES animals(id),
    vets_id    INT REFERENCES vets(id),
    PRIMARY KEY(animals_id, vets_id)
);

