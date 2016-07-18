DROP SCHEMA PUBLIC CASCADE;

CREATE TABLE artist
(
  artist_id INT PRIMARY KEY NOT NULL IDENTITY,
  name      VARCHAR(150),
  type      VARCHAR(20),
  gender    VARCHAR(6)
);
CREATE INDEX artist_name ON artist (name);

CREATE TABLE album
(
  id        INT PRIMARY KEY NOT NULL IDENTITY,
  artist_id INTEGER         NOT NULL,
  name      VARCHAR(255),
  year      SMALLINT,
  length    TIME
);
CREATE INDEX album_name ON album (name);
ALTER TABLE album
  ADD CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES artist (artist_id);

CREATE TABLE track
(
  id       BIGINT PRIMARY KEY NOT NULL IDENTITY,
  album_id INTEGER            NOT NULL,
  position INTEGER            NOT NULL,
  name     VARCHAR(255),
  length   VARCHAR(20)
);
CREATE INDEX "track_position_uindex" ON track (position);
ALTER TABLE track
  ADD CONSTRAINT fk_album FOREIGN KEY (album_id) REFERENCES album (id);