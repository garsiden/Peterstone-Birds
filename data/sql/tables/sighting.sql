-- Table to hold Peterstone sightings only

DROP TABLE IF EXISTS sightings;

CREATE TABLE sightings
(
  sub_id VARCHAR (50) NOT NULL,
  bto_code VARCHAR (2) NOT NULL,
  species_count smallint NOT NULL,
  qualifier CHAR(1),
  CONSTRAINT sightings_pkey PRIMARY KEY (sub_id, bto_code),
  CONSTRAINT sightings_fk_bto_code FOREIGN KEY (bto_code)
      REFERENCES birds (bto_code) 
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT sightings_fk_sub_id FOREIGN KEY (sub_id)
      REFERENCES lists (sub_id) 
      ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE sighting OWNER TO garsiden;

DROP INDEX IF EXISTS idx_sightings_bto_code;
CREATE INDEX idx_sightings_bto_code ON sightings (bto_code);

DROP INDEX IF EXISTS idx_sightings_sub_id;
CREATE INDEX idx_sightings_sub_id ON sightings (sub_id);


