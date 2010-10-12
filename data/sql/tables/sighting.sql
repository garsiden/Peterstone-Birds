-- Table to hold Peterstone sightings only

DROP TABLE IF EXISTS sighting;

CREATE TABLE sighting
(
  sub_id VARCHAR (50) NOT NULL,
  bto_code VARCHAR (2) NOT NULL,
  species_count smallint NOT NULL,
  qualifier CHAR(1),
  CONSTRAINT sighting_pkey PRIMARY KEY (sub_id, bto_code),
  CONSTRAINT sighting_fk_bto_code FOREIGN KEY (bto_code)
      REFERENCES birds (bto_code) 
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT sighting_fk_sub_id FOREIGN KEY (sub_id)
      REFERENCES list (sub_id) 
      ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE sighting OWNER TO garsiden;

DROP INDEX IF EXISTS idx_sighting_bto_code;
CREATE INDEX idx_sighting_bto_code ON sighting (bto_code);

DROP INDEX IF EXISTS idx_sighting_sub_id;
CREATE INDEX idx_sighting_sub_id ON sighting (sub_id);


