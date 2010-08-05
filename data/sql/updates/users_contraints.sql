ALTER TABLE users
ADD CONSTRAINT users_login_uniq UNIQUE (login),
ADD CONSTRAINT users_name_uniq UNIQUE (name),
ADD CONSTRAINT users_openid_uniq UNIQUE (openid);
