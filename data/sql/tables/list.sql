--  $Id$
--  SQLite

DROP TABLE IF EXISTS list;

CREATE TABLE list
(
    list_id		CHAR(8) NOT NULL PRIMARY KEY,
    site_id		CHAR(2) NOT NULL REFERENCES site(site_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    list_date	DATE    NOT NULL,
    start_time	TIME    NOT NULL,
    end_time	TIME    NOT NULL,

    UNIQUE (site_id, list_date),
    CHECK(start_time < end_time),
    CHECK(LENGTH(list_id) = 8)
);

DROP INDEX IF EXISTS idx_list_date;
CREATE INDEX idx_list_date ON list (list_date);

DROP INDEX IF EXISTS idx_list_site_id;
CREATE INDEX idx_list_site_id ON list (site_id);
