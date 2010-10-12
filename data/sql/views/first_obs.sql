-- View: first_obs

DROP VIEW first_obs;

CREATE OR REPLACE VIEW first_obs AS 
 SELECT code, species, year03, year04, year05, year06, year07, year08, year09, year10, earliest, latest
   FROM ( SELECT bto_code AS code, name AS species,
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2003 THEN lv.list_date ELSE NULL END), 'DD Mon') AS year03,
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2004 THEN lv.list_date ELSE NULL END), 'DD Mon') AS year04,
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2005 THEN lv.list_date ELSE NULL END), 'DD Mon') AS year05,
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2006 THEN lv.list_date ELSE NULL END), 'DD Mon') AS year06,
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2007 THEN lv.list_date ELSE NULL END), 'DD Mon') AS year07,
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2008 THEN lv.list_date ELSE NULL END), 'DD Mon') AS year08,
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2009 THEN lv.list_date ELSE NULL END), 'DD Mon') AS year09,
   to_char(min(CASE WHEN date_part('year', lv.list_date) = 2010 THEN lv.list_date ELSE NULL END), 'DD Mon') AS year10,
   to_char(to_date(year04 || min(to_char(lv.list_date, 'MMDD')), 'YYYYMMDD'), 'DD Mon') AS earliest,
   to_char(to_date(year04 || max(to_char(lv.list_date, 'MMDD')), 'YYYYMMDD'), 'DD Mon') AS latest
           FROM list_view lv
          WHERE is_migrant = true
          GROUP BY lv.bto_code, lv.name) x
  ORDER BY to_date(x.earliest || x.year04, 'DD Mon YYYY');

COMMENT ON VIEW first_obs IS 'Crosstab by year of migrant arrival dates';
