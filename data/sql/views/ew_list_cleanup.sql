-- View: ew_list_cleanup

-- DROP VIEW ew_list_cleanup;

CREATE OR REPLACE VIEW ew_list_cleanup AS 
 SELECT o.bto_code, b.name
   FROM observations o, birds b
  WHERE (o.bto_code IN ( SELECT summary_by_user.bto_code
           FROM summary_by_user
          WHERE summary_by_user.ng = summary_by_user.ew))
          AND o.user_id = 'EW'
          AND o.bto_code = b.bto_code;

ALTER TABLE ew_list_cleanup OWNER TO garsiden;
