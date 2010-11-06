DROP VIEW IF EXISTS summary_by_user CASCADE;

CREATE OR REPLACE VIEW summary_by_user AS
 SELECT b.bto_code, b.name,
MIN(CASE WHEN user_id = 'AP' THEN first_date ELSE NULL END) AS AP,
MIN(CASE WHEN user_id = 'EW' THEN first_date ELSE NULL END) AS EW,
MIN(CASE WHEN user_id = 'NG' THEN first_date ELSE NULL END) AS NG,
MIN(first_date) AS first_date
FROM birds b, observations o
WHERE b.bto_code = o.bto_code AND user_id != 'BG'
GROUP BY b.bto_code, b.name
ORDER BY first_date DESC;
