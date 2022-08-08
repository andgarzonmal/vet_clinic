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