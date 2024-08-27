CREATE TABLE stars(
  id SERIAL PRIMARY KEY,
  name varchar(25) UNIQUE NOT NULL,
  distance INTEGER NOT NULL CHECK (distance > 0),
  spectral_type varchar(1) CHECK (spectral_type SIMILAR TO 'O|B|A|F|G|K|M'),
  companions INTEGER NOT NULL CHECK (companions >= 0)
);

CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  designation varchar(1) UNIQUE,
  mass INTEGER
);