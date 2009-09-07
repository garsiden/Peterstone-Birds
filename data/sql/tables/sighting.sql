--  $Id$
--  SQLite

DROP TABLE IF EXISTS sighting;

CREATE TABLE sighting
(
    user_id	CHAR(8)	NOT NULL REFERENCES user
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    bto_code	CHAR(2)	NOT NULL REFERENCES species
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    first_date	DATE,
    note	TEXT,

    PRIMARY KEY (user_id, bto_code)
);

DROP INDEX IF EXISTS idx_sighting_user_id;
CREATE INDEX idx_sighting_user_id ON sighting (user_id);

DROP INDEX IF EXISTS idx_sighting_bto_code;
CREATE INDEX idx_sighting_bto_code ON sighting (bto_code);
