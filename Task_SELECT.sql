-- Задание 2

-- 1. Самый длинный трек
SELECT title, duration FROM tracks ORDER BY duration DESC LIMIT 1;
-- Результат: My Universe | 420

-- 2. Треки ≥ 3,5 минут
SELECT title, duration FROM tracks WHERE duration >= 210;
-- Вернет 10 треков

-- 3. Сборники 2018-2020
SELECT name FROM collections WHERE year_release BETWEEN 2018 AND 2020;
-- Результат: Electronic Vibes, Golden Rock Collection

-- 4. Исполнители из одного слова
SELECT name FROM artists WHERE name NOT LIKE '% %';
-- Результат: Madonna, Eminem, Queen

-- 5. Треки с "мой" или "my"
SELECT title FROM tracks 
WHERE LOWER(title) LIKE '%my%' OR LOWER(title) LIKE '%мой%';
-- Результат: My Universe, Мой последний трек

-- Задание 3

-- Количество исполнителей в каждом жанре
SELECT g.name AS genre, COUNT(ag.artist_id) AS artists_count
FROM genres g
LEFT JOIN artist_genre ag ON g.id = ag.genre_id
GROUP BY g.name
ORDER BY artists_count DESC;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.id) AS tracks_count
FROM tracks t
JOIN albums a ON t.album_id = a.id
WHERE a.year_release BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому
SELECT a.title AS album, ROUND(AVG(t.duration)) AS avg_duration_sec
FROM tracks t
JOIN albums a ON t.album_id = a.id
GROUP BY a.title;

-- Исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name AS artist
FROM artists ar
WHERE ar.id NOT IN (
    SELECT DISTINCT aa.artist_id
    FROM artist_album aa
    JOIN albums a ON aa.album_id = a.id
    WHERE a.year_release = 2020
);

-- Названия сборников, в которых присутствует Madonna
SELECT DISTINCT c.name AS collection
FROM collections c
JOIN collection_track ct ON c.id = ct.collection_id
JOIN tracks t ON ct.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN artist_album aa ON a.id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.id
WHERE ar.name = 'Madonna';

-- Задание 4

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT a.title AS album
FROM albums a
JOIN artist_album aa ON a.id = aa.album_id
JOIN (
    SELECT artist_id 
    FROM artist_genre 
    GROUP BY artist_id 
    HAVING COUNT(genre_id) > 1
) multi_genre_artists ON aa.artist_id = multi_genre_artists.artist_id;

-- Наименования треков, которые не входят в сборники
SELECT t.title AS track
FROM tracks t
LEFT JOIN collection_track ct ON t.id = ct.track_id
WHERE ct.collection_id IS NULL;

-- Исполнители, написавшие самый короткий трек
SELECT ar.name AS artist
FROM artists ar
JOIN artist_album aa ON ar.id = aa.artist_id
JOIN tracks t ON aa.album_id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

-- Названия альбомов, содержащих наименьшее количество треков
SELECT a.title AS album, COUNT(t.id) AS tracks_count
FROM albums a
LEFT JOIN tracks t ON a.id = t.album_id
GROUP BY a.title
HAVING COUNT(t.id) = (
    SELECT COUNT(t.id) 
    FROM albums a
    LEFT JOIN tracks t ON a.id = t.album_id
    GROUP BY a.title
    ORDER BY 1
    LIMIT 1
);



