-- Exercise 1
CREATE DATABASE animals;

-- Exercise 2
CREATE TABLE birds (
id serial PRIMARY KEY,
name varchar(25),
age int,
species varchar(15)
);

-- Exercise 3
INSERT INTO birds (name, age, species)
     VALUES ('Charlie', 3, 'Finch'),
            ('Allie', 5, 'Owl'),
            ('Jennifer', 3, 'Magpie'),
            ('Jamie', 4, 'Owl'),
            ('Roy', 8, 'Crow');

-- Exercise 4
SELECT * FROM birds;

-- Exercise 5
SELECT *
FROM birds
WHERE age < 5;

-- Exercise 6
UPDATE birds
SET species = 'Raven'
WHERE species = 'Crow';

-- Exercise 6 FE
UPDATE birds
SET species = 'Hawk'
WHERE name = 'Jamie';

-- Exercise 7
DELETE FROM birds
WHERE (age = 3) AND (species = 'Finch');

-- Exercise 8
ALTER TABLE birds
ADD CONSTRAINT negative_age CHECK (age > 0);

-- Exercise 9
DROP TABLE birds;

-- Exercise 10
DROP DATABASE animals;