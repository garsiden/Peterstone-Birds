-- View: web_species_lookup

-- DROP VIEW web_species_lookup;

-- CREATE OR REPLACE VIEW web_species_lookup AS 
SELECT 
        CASE
            WHEN web_species.web_name IS NULL THEN birds.name
            ELSE web_species.web_name
        END AS web_name, birds.bto_code
   FROM birds
   LEFT JOIN web_species ON birds.name = web_species.bto_name;

