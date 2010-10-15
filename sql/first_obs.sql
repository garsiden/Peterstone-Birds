-- View: first_obs

--DROP VIEW first_obs;

--CREATE OR REPLACE VIEW first_obs AS 
  SELECT bto_code AS code, species_name AS species,
   min(CASE WHEN date_part('year', lv.list_date) = 2003 THEN lv.list_date ELSE NULL END) AS "2003",
   min(CASE WHEN date_part('year', lv.list_date) = 2004 THEN lv.list_date ELSE NULL END) AS "2004",
   min(CASE WHEN date_part('year', lv.list_date) = 2005 THEN lv.list_date ELSE NULL END) AS "2005",
   min(CASE WHEN date_part('year', lv.list_date) = 2006 THEN lv.list_date ELSE NULL END) AS "2006",
   min(CASE WHEN date_part('year', lv.list_date) = 2007 THEN lv.list_date ELSE NULL END) AS "2007",
   min(CASE WHEN date_part('year', lv.list_date) = 2008 THEN lv.list_date ELSE NULL END) AS "2008",
   min(CASE WHEN date_part('year', lv.list_date) = 2009 THEN lv.list_date ELSE NULL END) AS "2009",
   min(CASE WHEN date_part('year', lv.list_date) = 2010 THEN lv.list_date ELSE NULL END) AS "2010",
   to_date('2004' || MIN(to_char(lv.list_date, 'MMDD')), 'YYYYMMDD') AS earliest,
   to_date('2004' || MAX(to_char(lv.list_date, 'MMDD')), 'YYYYMMDD') AS latest
   FROM (
     SELECT l.sub_id, l.list_date, g.bto_code, b.name AS species_name, is_migrant
        FROM sightings g, birds b, lists l
        WHERE g.bto_code = b.bto_code
        AND g.sub_id = l.sub_id) lv

          WHERE is_migrant = true
          GROUP BY lv.bto_code, lv.species_name
  ORDER BY earliest, species

