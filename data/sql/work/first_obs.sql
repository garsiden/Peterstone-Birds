-- View: first_obs

DROP VIEW first_obs;

CREATE OR REPLACE VIEW first_obs AS 
  SELECT bto_code AS code, name AS species,
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
              FROM list_view lv
          WHERE is_migrant = true
          GROUP BY lv.bto_code, lv.name
  ORDER BY earliest, species;

COMMENT ON VIEW first_obs IS 'Crosstab by year of migrant arrival dates';
