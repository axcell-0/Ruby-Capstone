CREATE DATABASE catalog_of_my_things

CREATE TABLE item(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    archived BOOLEAN,
    genre_id INT,
    author_id INT,
    label_id INT
)

CREATE TABLE music_album (
  id INT GENERATED ALWAYS AS IDENTITY,
  archived BOOLEAN NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  label_id INT NOT NULL,
  publish_date DATE NOT NULL,
  genre_id INT NOT NULL,
  author_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors (id),
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres (id),
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES labels (id),
);

CREATE TABLE genres (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR (255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Movie (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    silent BOOLEAN,
    publish_date DATE
    archived BOOLEAN,
    source_id INTEGER REFERENCES source (id)  
);

CREATE TABLE source (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR,
);
