DROP VIEW IF EXISTS summary_by_user;

CREATE VIEW summary_by_user AS
SELECT b.bto_code, b.name,
MIN(CASE WHEN user_id = 'NG' THEN first_date ELSE NULL END) as NG,
MIN(CASE WHEN user_id = 'EW' THEN first_date ELSE NULL END) AS EW
FROM birds b, observations o
WHERE b.bto_code = o.bto_code
GROUP BY b.bto_code, b.name;
