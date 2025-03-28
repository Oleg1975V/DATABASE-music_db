-- Задание 1

-- Заполнение таблицы жанров (3+ жанра)
INSERT INTO genres (name) 
VALUES 
    ('Rock'),
    ('Pop'),
    ('Hip-Hop'),
    ('Electronic');

-- Заполнение таблицы исполнителей (4+ исполнителя)
INSERT INTO artists (name) 
VALUES 
    ('The Beatles'),
    ('Madonna'),
    ('Eminem'),
    ('Daft Punk'),
    ('Queen');

-- Заполнение таблицы альбомов (3+ альбома)
INSERT INTO albums (title, year_release) 
VALUES 
    ('Abbey Road', 1969),
    ('Like a Virgin', 1984),
    ('The Marshall Mathers LP', 2000),
    ('Random Access Memories', 2013),
    ('Future Nostalgia', 2020),
    ('Minimal Album', 2023);

-- Заполнение таблицы треков (6+ треков)
INSERT INTO tracks (title, duration, album_id) 
VALUES 
    ('Come Together', 259, 1),         
    ('My Universe', 420, 1),           
    ('Material Girl', 244, 2),          
    ('Like a Virgin', 220, 2),          
    ('Stan', 404, 3),                   
    ('Мой последний трек', 210, 3),     
    ('Get Lucky', 369, 4),              
    ('Instant Crush', 337, 4),          
    ('Don''t Start Now', 330, 5),       
    ('Physical', 235, 5),
    ('Lonely Track', 180, 6);
    



-- Заполнение таблицы сборников (4+ сборника)
INSERT INTO collections (name, year_release) 
VALUES 
    ('Best of 60s', 2005),
    ('Pop Hits 80s', 2010),
    ('Rap Classics', 2015),
    ('Electronic Vibes', 2020),        
    ('Golden Rock Collection', 2018);
    
    
-- Связи исполнителей с жанрами
INSERT INTO artist_genre (artist_id, genre_id) 
VALUES 
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 1), (2, 1);

-- Связи исполнителей с альбомами
INSERT INTO artist_album (artist_id, album_id) 
VALUES 
    (1, 1), (2, 2), (3, 3), (4, 4),
    (5, 1), (4, 5), (5, 6);

-- Связи сборников с треками
INSERT INTO collection_track (collection_id, track_id) 
VALUES 
    (1, 1), (1, 2), (2, 3), (2, 4), 
    (3, 5), (3, 6), (4, 7), (4, 8), 
    (5, 1), (5, 2);