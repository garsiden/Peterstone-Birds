CREATE TABLE web_species
(
    web_name VARCHAR(50) NOT NULL,
    bto_name VARCHAR(50) NOT NULL,

    CONSTRAINT web_species_pkey PRIMARY KEY (web_name),
    CONSTRAINT web_species_bto_name_fkey FOREIGN KEY (bto_name) REFERENCES birds(name)
               ON UPDATE CASCADE
               ON DELETE CASCADE
);

DROP INDEX IF EXISTS idx_web_species_bto_name;
CREATE INDEX idx_web_species_bto_name ON web_species(bto_name);
 
