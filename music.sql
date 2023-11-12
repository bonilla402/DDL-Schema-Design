-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artist
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producer
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
);

CREATE TABLE song_producer
(
  id SERIAL PRIMARY KEY,
  track_number INTEGER
  song_id  INTEGER REFERENCES song ON DELETE CASCADE,
  producer_id INTEGER REFERENCES producer ON DELETE CASCADE
);

CREATE TABLE song_artist
(
  id SERIAL PRIMARY KEY,
  track_number INTEGER
  song_id  INTEGER REFERENCES song ON DELETE CASCADE,
  artist_id INTEGER REFERENCES artist ON DELETE CASCADE
);

CREATE TABLE album_track
(
  id SERIAL PRIMARY KEY,
  track_numer INTEGER
  album_id INTEGER REFERENCES album ON DELETE CASCADE, 
  song_id  INTEGER REFERENCES song ON DELETE CASCADE,  
);