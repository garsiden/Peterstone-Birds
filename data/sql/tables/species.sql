--  $Id$
--  SQLite

DROP TABLE IF EXISTS species;

CREATE TABLE species
(
    bto_code		CHAR(2)     NOT NULL PRIMARY KEY,
    name		VARCHAR(50) NOT NULL UNIQUE,
    scientific_name	VARCHAR(75) NOT NULL UNIQUE,

    CHECK(LENGTH(bto_code) BETWEEN 1 AND 2)
);
