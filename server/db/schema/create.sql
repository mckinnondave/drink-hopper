DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS crawls CASCADE;
DROP TABLE IF EXISTS venues CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE crawls (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE venues (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  image_ref VARCHAR(255) NOT NULL,
  place_id VARCHAR(255) NOT NULL,
  crawl_id INTEGER REFERENCES crawls(id) ON DELETE CASCADE
);