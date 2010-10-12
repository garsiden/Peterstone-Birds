-- View: list_view

-- DROP VIEW list_view;

CREATE OR REPLACE VIEW list_view AS 
 SELECT l.sub_id, l.list_date, l.start_time,
 g.bto_code, b.name, b.is_migrant, g.species_count, g.qualifier
   FROM sighting g, birds b, list l
  WHERE g.bto_code = b.bto_code
  AND g.sub_id = l.sub_id
  ORDER BY l.list_date, g.bto_code;

ALTER TABLE list_view OWNER TO garsiden;
COMMENT ON VIEW list_view IS 'All sightings with expanded fields';
