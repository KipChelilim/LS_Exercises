DROP DATABASE IF EXISTS auction;

CREATE DATABASE auction;

\c auction

CREATE TABLE bidders(
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE items(
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price numeric(6, 2) NOT NULL CHECK (initial_price BETWEEN 0.00 AND 1000.00),
  sales_price numeric(6, 2) CHECK (sales_price BETWEEN 0.00 AND 1000.00)
);

CREATE TABLE bids(
  id serial PRIMARY KEY,
  bidder_id integer NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
  item_id integer NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  amount numeric(6, 2) NOT NULL CHECK (amount BETWEEN 0.00 AND 1000.00)
);

CREATE INDEX ON bids(bidder_id, item_id);

\copy bidders FROM './csv_files/bidders.csv' WITH HEADER CSV
\copy items FROM './csv_files/items.csv' WITH HEADER CSV
\copy bids FROM './csv_files/bids.csv' WITH HEADER CSV