--  SQLite

DROP TABLE IF EXISTS user;

CREATE TABLE user
(
    user_id	CHAR(8) NOT NULL PRIMARY KEY,
    name	VARCHAR(32),	
    password	VARCHAR(16) NOT NULL,
    email	VARCHAR(32) NOT NULL
);
