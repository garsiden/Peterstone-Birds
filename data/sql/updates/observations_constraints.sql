ALTER TABLE observations
      ADD CONSTRAINT observations_fk_user_id
      FOREIGN KEY (user_id) REFERENCES users(user_id)
               ON UPDATE RESTRICT
               ON DELETE RESTRICT,
      ADD CONSTRAINT observations_fk_bto_code
      FOREIGN KEY (bto_code) REFERENCES birds(bto_code)
               ON UPDATE CASCADE
               ON DELETE CASCADE;
