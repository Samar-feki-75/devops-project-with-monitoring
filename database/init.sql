CREATE TABLE IF NOT EXISTS items (
  id serial PRIMARY KEY,
  name text NOT NULL
);
INSERT INTO items(name) VALUES ('sample');