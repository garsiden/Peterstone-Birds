-- make birds.taxonomic_name unique
ALTER TABLE birds ADD CONSTRAINT BIRDS_TAXONOMIC_NAME_UNIQ UNIQUE (taxonomic_name);

-- add gos_code column to birds
ALTER TABLE birds ADD COLUMN gos_code CHAR(4) CONSTRAINT BIRDS_GOS_CODE_UNIQ UNIQUE;

-- populate birds.gos_code from gos_list 
UPDATE birds SET gos_code = gos_list.gos_code
        FROM gos_list
        WHERE birds.taxonomic_name = gos_list.scientific_name;
