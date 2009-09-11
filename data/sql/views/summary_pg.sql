DROP VIEW IF EXISTS summary_pg;

CREATE VIEW summary_pg AS
SELECT b.bto_code, b.name,
MIN(CASE WHEN user_id = 'garsiden' THEN first_date ELSE NULL END) as NG,
MIN(CASE WHEN user_id = 'wange' THEN first_date ELSE NULL END) AS EW
FROM species b, sighting g
WHERE b.bto_code = g.bto_code
GROUP BY b.bto_code, b.name;
