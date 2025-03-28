-- Создание БД
CREATE DATABASE music_db;

-- Создание таблицы жанров
CREATE TABLE IF NOT EXISTS genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- Создание таблицы исполнителей
CREATE TABLE IF NOT EXISTS artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Создание таблицы альбомов
CREATE TABLE IF NOT EXISTS albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year_release INT NOT NULL CHECK (year_release > 1900)
);

-- Создание таблицы треков
CREATE TABLE IF NOT EXISTS tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INT NOT NULL CHECK (duration > 0),
    album_id INT NOT NULL REFERENCES albums(id) ON DELETE CASCADE
);

-- Создание таблицы сборников
CREATE TABLE IF NOT EXISTS collections (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    year_release INT NOT NULL CHECK (year_release > 1900)
);

-- Создание таблицы связи исполнителей и жанров (многие-ко-многим)
CREATE TABLE IF NOT EXISTS artist_genre (
    artist_id INT NOT NULL REFERENCES artists(id) ON DELETE CASCADE,
    genre_id INT NOT NULL REFERENCES genres(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, genre_id)
);


-- Создание таблицы связи сборников и треков (многие-ко-многим)
CREATE TABLE IF NOT EXISTS collection_track (
    collection_id INT NOT NULL REFERENCES collections(id) ON DELETE CASCADE,
    track_id INT NOT NULL REFERENCES tracks(id) ON DELETE CASCADE,
    PRIMARY KEY (collection_id, track_id)
);

-- Создание таблицы связи исполнителей и альбомов (многие-ко-многим)
CREATE TABLE IF NOT EXISTS artist_album (
    artist_id INT NOT NULL REFERENCES artists(id) ON DELETE CASCADE,
    album_id INT NOT NULL REFERENCES albums(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, album_id)
);