--DROP VIEW hotspot;

--CREATE VIEW hotspot AS

SELECT * FROM (
SELECT b.name as species,
		COUNT(
			CASE WHEN date_part('year', list_date) = 2003
				 THEN g.bto_code
				 ELSE NULL 
			END) AS "2003",
		COUNT(
			CASE WHEN date_part('year', list_date) = 2004
				THEN g.bto_code
				ELSE NULL
			END) AS "2004",
		COUNT(
			CASE WHEN date_part('year', list_date) = 2005
				THEN g.bto_code
				ELSE NULL
			END) AS "2005",
		COUNT(
			CASE WHEN date_part('year', list_date) = 2006
				THEN g.bto_code
				ELSE NULL
			END) AS "2006",
		COUNT(
			CASE WHEN date_part('year', list_date) = 2007
				 THEN g.bto_code
				 ELSE NULL 
			END) AS "2007",
		COUNT(
			CASE WHEN date_part('year', list_date) = 2008
				THEN g.bto_code
				ELSE NULL
			END) AS "2008",
		COUNT(
			CASE WHEN date_part('year', list_date) = 2009
				THEN g.bto_code
				ELSE NULL
			END) AS "2009",
		COUNT(
			CASE WHEN date_part('year', list_date) = 2010
				THEN g.bto_code
				ELSE NULL
			END) AS "2010"
	FROM sightings g, lists l, birds b
	WHERE
	g.sub_id = l.sub_id AND
	g.bto_code = b.bto_code
    AND b.bto_code IN('CS','CK','HM','LW','RW','SM','SW','SW','SL','SI','WM','WH','WW','BW','CW','GK','GV',
        'K','LG','SH','DR','WI','SC')
	GROUP BY g.bto_code, b.name) x

WHERE "2003" > 25 OR "2004" > 25 OR "2005" > 25 OR "2006" > 25 OR "2007" > 25 OR "2008" > 25 OR
      "2009" > 25 OR "2010" > 25
ORDER BY species

