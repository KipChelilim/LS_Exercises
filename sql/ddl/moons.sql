CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation serial,
  semi_major_axis numeric CHECK (semi_major_axis > 0),
  mass numeric CHECK (mass > 0),
  planet_id integer NOT NULL REFERENCES planets(id)
);