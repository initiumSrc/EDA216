DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS performances;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS theaters;

CREATE TABLE users (
  username VARCHAR(25) NOT NULL UNIQUE,
  name VARCHAR(25) NOT NULL,
  address VARCHAR(25),
  phonenbr TINYINT(10),
  PRIMARY KEY(username)
);

CREATE TABLE movies (
  name VARCHAR(25) NOT NULL UNIQUE,
  PRIMARY KEY(name)
);

CREATE TABLE theaters (
  name VARCHAR(25) NOT NULL UNIQUE,
  seats TINYINT,
  PRIMARY KEY(name)
);

CREATE TABLE performances (
  moviename VARCHAR(25),
  date DATE,
  theatername VARCHAR(25),
  PRIMARY KEY(moviename, date),
  FOREIGN KEY(moviename) REFERENCES movies(name) ON DELETE CASCADE,
  FOREIGN KEY(theatername) REFERENCES theaters(name) ON DELETE CASCADE
);

CREATE TABLE reservations (
  resnbr INTEGER NOT NULL UNIQUE,
  date DATE,
  moviename VARCHAR(25),
  username VARCHAR(25),
  PRIMARY KEY(resnbr),
  FOREIGN KEY(moviename, date) REFERENCES performances(moviename, date) ON DELETE CASCADE,
  FOREIGN KEY(username) REFERENCES users(username) ON DELETE CASCADE
);

DESCRIBE users;
DESCRIBE movies;
DESCRIBE theaters;
DESCRIBE performances;
DESCRIBE reservations;
