--DROP VIEW wildfowl_max;

--CREATE OR REPLACE VIEW wildfowl_max AS
   SELECT bto_code, winter,
        max(CASE WHEN mnth =  7 THEN max_count ELSE NULL END) AS jul,
        max(CASE WHEN mnth =  8 THEN max_count ELSE NULL END) AS aug,
        max(CASE WHEN mnth =  9 THEN max_count ELSE NULL END) AS sep,
        max(CASE WHEN mnth = 10 THEN max_count ELSE NULL END) AS oct,
        max(CASE WHEN mnth = 11 THEN max_count ELSE NULL END) AS nov,
        max(CASE WHEN mnth = 12 THEN max_count ELSE NULL END) AS dec,
        max(CASE WHEN mnth =  1 THEN max_count ELSE NULL END) AS jan,
        max(CASE WHEN mnth =  2 THEN max_count ELSE NULL END) AS feb,
        max(CASE WHEN mnth =  3 THEN max_count ELSE NULL END) AS mar,
        max(CASE WHEN mnth =  4 THEN max_count ELSE NULL END) AS apr
   FROM (
      SELECT bto_code, max(lv.species_count) AS max_count,
      date_part('month', lv.list_date) AS mnth,
      CASE WHEN date_part('month', lv.list_date) < 7 THEN
          to_char(date_part('year', lv.list_date) - 1, 'FM0000') || to_char(lv.list_date, '-YY') ELSE
          to_char(lv.list_date, 'YYYY-') || to_char(date_part('year', lv.list_date) - 2000 + 1, 'FM00')
      END AS winter
      FROM list_view lv
      WHERE lv.list_date >= '2004-07-01'
      GROUP BY bto_code,  mnth, winter
      HAVING bto_code in ('PT', 'SV', 'WN', 'T', 'BW', 'RK', 'GV', 'KN', 'DN', 'RP', 'BA') AND
      date_part('month', lv.list_date) IN( 7,8,9,10,11,12,1,2,3,4)
   ORDER BY bto_code, winter, mnth) x
   GROUP BY bto_code, winter

