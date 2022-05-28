CREATE TABLE Genre (
	id_genre SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE Artist (
	id_artist SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE Album (
	id_album SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	year INTEGER CHECK (year > 0)
);

CREATE TABLE Song (
	id_song SERIAL PRIMARY KEY,
	id_album INTEGER REFERENCES Album(id_album),
	name VARCHAR(60) NOT NULL,
	duration_seconds INTEGER CHECK (duration_seconds > 0)
);

CREATE TABLE Compilation (
	id_compilation SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	year INTEGER CHECK (year > 0)
);

CREATE TABLE Genre_Artist (
	id_genre INTEGER REFERENCES Genre(id_genre),
	id_artist INTEGER REFERENCES Artist(id_artist)
);

CREATE TABLE Album_Artist (
	id_album INTEGER REFERENCES Album(id_album),
	id_artist INTEGER REFERENCES Artist(id_artist)
);

CREATE TABLE Compilation_Song (
	id_compilation INTEGER REFERENCES Compilation(id_compilation),
	id_song INTEGER REFERENCES Song(id_song)
);