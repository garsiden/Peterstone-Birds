CREATE OR REPLACE VIEW ew_list_cleanup AS

 SELECT o.bto_code, b.name FROM observations o, birds b
       WHERE o.bto_code IN(SELECT bto_code FROM summary_by_user WHERE NG=EW) AND user_id ='EW'
       AND o.bto_code = b.bto_code;

--DELETE  FROM observations
--       WHERE bto_code  IN(SELECT bto_code FROM summary_by_user WHERE NG=EW) AND user_id ='EW';
