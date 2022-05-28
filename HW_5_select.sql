--1. количество исполнителей в каждом жанре

SELECT name AS "Жанр", count(id_artist) AS "Количество исполниетелей"
FROM genre_artist ga 
JOIN genre g ON ga.id_genre = g.id_genre 
GROUP BY name

--2. количество треков, вошедших в альбомы 2019-2020 годов

SELECT count(s.id_song) AS "Количество"
FROM song s 
JOIN album a ON s.id_album = a.id_album 
WHERE year BETWEEN 2019 AND 2020

--3. средняя продолжительность треков по каждому альбому

SELECT a.name AS "Название альбома", avg(duration_seconds) AS "Средняя продолжительность треков"
FROM song s 
JOIN album a ON s.id_album = a.id_album 
GROUP BY a.name

--4. все исполнители, которые не выпустили альбомы в 2020 году

SELECT DISTINCT a.name
FROM album_artist aa 
JOIN artist a ON a.id_artist = aa.id_artist 
JOIN album a2 ON a2.id_album = aa.id_album
WHERE YEAR <> 2020

--5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами)

SELECT c.name
FROM compilation c 
JOIN compilation_song cs ON cs.id_compilation = c.id_compilation 
JOIN song s ON cs.id_song = s.id_song 
JOIN album a ON s.id_album = a.id_album 
JOIN album_artist aa ON a.id_album = aa.id_album 
JOIN artist a2 ON a2.id_artist = aa.id_artist 
WHERE a2.name = 'MGMT' 

--6. название альбомов, в которых присутствуют исполнители более 1 жанра

SELECT a.name
FROM album a 
JOIN album_artist aa ON a.id_album = aa.id_album 
JOIN artist a2 ON a2.id_artist = aa.id_artist
JOIN genre_artist ga ON ga.id_artist = a2.id_artist 
GROUP BY a2.name, a.name
HAVING count(ga.id_genre) > 1

--7. наименование треков, которые не входят в сборники

SELECT DISTINCT s.name
FROM compilation_song cs
JOIN song s ON s.id_song <> cs.id_song


--8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)

SELECT a.name AS "Исполнитель", s.duration_seconds AS "Продолжительность трека"
FROM artist a 
JOIN album_artist aa ON aa.id_artist = a.id_artist 
JOIN album a2 ON a2.id_album = aa.id_album 
JOIN song s ON s.id_album = a2.id_album 
GROUP BY a.name , s.duration_seconds 
HAVING s.duration_seconds = (SELECT MIN(duration_seconds) 
							FROM song s2)

--9. название альбомов, содержащих наименьшее количество треков
							
SELECT a.name AS "Название альбома", count(s.id_song) AS "Количетсво треков"
FROM album a 
JOIN song s ON s.id_album = a.id_album 
GROUP BY a.name 
HAVING count(s.id_song) in (
        SELECT count(s.id_song)
        FROM album a
        JOIN song s  ON s.id_album = a.id_album
        GROUP BY a.name
        ORDER BY count(s.id_song)
        LIMIT 1)