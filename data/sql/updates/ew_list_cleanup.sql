CREATE OR REPLACE VIEW ew_list_cleanup AS

SELECT * FROM observations
       WHERE bto_code IN(SELECT bto_code FROM summary_by_user WHERE NG=EW) AND user_id ='EW';
