--  SQLite

DROP TABLE IF EXISTS observations;

CREATE TABLE observations
(
    user_id CHAR(2)  NOT NULL REFERENCES users
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    bto_code VARCHAR(2) NOT NULL REFERENCES birds
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    first_date DATE NOT NULL,
    note TEXT,
    PRIMARY KEY (user_id, bto_code)
);

DROP INDEX IF EXISTS idx_observations_user_id;
CREATE INDEX idx_observations_user_id ON observations (user_id);

DROP INDEX IF EXISTS idx_observations_bto_code;
CREATE INDEX idx_observations_bto_code ON observations (bto_code);
