--  Table to hold Peterstone lists only

DROP TABLE IF EXISTS lists;

CREATE TABLE lists
(
    sub_id		VARCHAR(50) NOT NULL PRIMARY KEY,
    list_date	DATE    NOT NULL,
    start_time	TIME    NOT NULL,
    end_time	TIME    NOT NULL,

    CHECK(start_time < end_time),
    CONSTRAINT lists_date_time_uniq UNIQUE (list_date, start_time)
);

ALTER TABLE lists OWNER TO garsiden;

DROP INDEX IF EXISTS idx_list_date;
CREATE INDEX idx_list_date ON lists (list_date);
