-- View: first_obs

DROP VIEW first_obs;

CREATE OR REPLACE VIEW first_obs AS 
 SELECT code, species, "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", earliest, latest
   FROM ( SELECT bto_code AS code, name AS species,
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2003 THEN lv.list_date ELSE NULL END), 'DD Mon') AS "2003",
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2004 THEN lv.list_date ELSE NULL END), 'DD Mon') AS "2004",
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2005 THEN lv.list_date ELSE NULL END), 'DD Mon') AS "2005",
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2006 THEN lv.list_date ELSE NULL END), 'DD Mon') AS "2006",
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2007 THEN lv.list_date ELSE NULL END), 'DD Mon') AS "2007",
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2008 THEN lv.list_date ELSE NULL END), 'DD Mon') AS "2008",
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2009 THEN lv.list_date ELSE NULL END), 'DD Mon') AS "2009",
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2010 THEN lv.list_date ELSE NULL END), 'DD Mon') AS "2010",
   to_char(to_date('2004' || min(to_char(lv.list_date, 'MMDD')), 'YYYYMMDD'), 'DD Mon') AS earliest,
   to_char(to_date('2004' || max(to_char(lv.list_date, 'MMDD')), 'YYYYMMDD'), 'DD Mon') AS latest
           FROM list_view lv
          WHERE is_migrant = true
          GROUP BY lv.bto_code, lv.name) x
  ORDER BY to_date(earliest || '2004', 'DD Mon YYYY');

COMMENT ON VIEW first_obs IS 'Crosstab by year of migrant arrival dates';
