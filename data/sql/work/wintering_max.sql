CREATE OR REPLACE VIEW wintering_max AS
SELECT bto_code, species, winter,
    max(CASE WHEN mnth =  7 THEN max_count ELSE NULL END) AS jul,
    max(CASE WHEN mnth =  8 THEN max_count ELSE NULL END) AS aug,
    max(CASE WHEN mnth =  9 THEN max_count ELSE NULL END) AS sep,
    max(CASE WHEN mnth = 10 THEN max_count ELSE NULL END) AS oct,
    max(CASE WHEN mnth = 11 THEN max_count ELSE NULL END) AS nov,
    max(CASE WHEN mnth = 12 THEN max_count ELSE NULL END) AS dec,
    max(CASE WHEN mnth =  1 THEN max_count ELSE NULL END) AS jan,
    max(CASE WHEN mnth =  2 THEN max_count ELSE NULL END) AS feb,
    max(CASE WHEN mnth =  3 THEN max_count ELSE NULL END) AS mar,
    max(CASE WHEN mnth =  4 THEN max_count ELSE NULL END) AS apr,
    max(max_count) as max
FROM (
  SELECT bto_code, species_name as species, max(lv.species_count) AS max_count,
  date_part('month', lv.list_date) AS mnth,
  'Maximum' AS winter
  FROM (
 SELECT l.sub_id, l.list_date, g.bto_code, b.name AS species_name, g.species_count
    FROM sightings g, birds b, lists l
    WHERE g.bto_code = b.bto_code
    AND g.sub_id = l.sub_id
    AND g.species_count >0) lv
  WHERE lv.list_date >= '2004-07-01'
  GROUP BY bto_code, species, mnth, winter
  HAVING bto_code in ('SU', 'PT', 'SV', 'WN', 'T', 'OC', 'BW', 'RK', 'GV', 'KN', 'DN', 'RP', 'BA',
    'L', 'WI') AND
  date_part('month', lv.list_date) IN( 7,8,9,10,11,12,1,2,3,4)) x
GROUP BY bto_code, species, winter
ORDER BY species, winter

