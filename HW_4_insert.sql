INSERT INTO genre (name)
	VALUES ('Pop'), ('Hip-Hop'), ('Indie'), ('Rock'), ('Tehno');

INSERT INTO artist (name)
	VALUES('Britney Spears'),('Justin Bieber'),
			('Kendrick Lamar'),('Tyler the creator'),
			('Metronomy'),('MGMT'),
			('Red hot chili peppers'),('Limp Bizkit'),
			('Deadmau5'),('David Guetta');

INSERT INTO genre_artist (id_genre, id_artist) 	
	VALUES(1,1), (1,2), (1,4),
		(2,3), (2,4), (2,2),
		(3,5), (3,6), (1,5),
		(4,7), (4,8), (4,6),
		(5,9), (5,10);

INSERT INTO album (name, year) 
	VALUES('Blackout',2007), ('Believe',2012),
		('Damn',2018), ('Wolf',2013),
		('Love letters',2014), ('Kids',2008),
		('Californication',1999), ('Behind blue eyes',2003),
		('My Strobe',2010), ('One more love',2010);
	
INSERT INTO album_artist (id_album, id_artist) 
	VALUES (1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8),
		(1,2), (2,4), (3,6), (5,8), (4,7);
	
INSERT INTO song (id_album, name, duration_seconds) 
	VALUES (1, 'Gimme More', 300), (1, 'Piece of my', 250),
		(2, 'Boyfriend', 199), (2, 'Fall', 187), 
		(3, 'Humble', 205), (3, 'DNA', 320), 
		(4, 'Domo23"', 221), (4, 'Answer', 165), 
		(5, 'First', 111), (5, 'Second', 222),
		(6, 'New age', 325), (6, 'First class', 167),
		(7, 'Can stop', 200), (7, 'Snow', 220), 
		(8, 'Behind blue eyes', 265), (8, 'Just Drop Dead', 233),
		(9, 'Strobe1', 288), (9, 'Strobe2', 312), 
		(10, 'Memories', 302), (10, 'One love', 188);	

INSERT INTO compilation (name, year) 
	VALUES ('Compilation_1', 2007), ('Compilation_2', 2000),
		('Compilation_3', 2019), ('Compilation_4', 2011),
		('Compilation_5', 2017), ('Compilation_6', 2020),
		('Compilation_7', 2003), ('Compilation_8', 2008);

INSERT INTO compilation_song (id_song, id_compilation) 
	VALUES (1,5), (1,3), (1,4),
		(2,6), (2,4), (2,2),
		(3,5), (3,6), (1,5),
		(4,3), (4,8), (4,6),
		(5,2), (10,4), (5,3);

