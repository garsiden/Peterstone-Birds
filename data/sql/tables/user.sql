-- Sqlite

DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    user_id CHAR(2) NOT NULL PRIMARY KEY,
    login VARCHAR(40) NOT NULL UNIQUE,   
    name VARCHAR(40) NOT NULL UNIQUE,
    openid VARCHAR(40) UNIQUE,
    crypted_password VARCHAR(40),
    salt VARCHAR(40),
    created_at DATETIME,
    updated_at DATETIME,
    is_admin BOOLEAN DEFAULT 'f'
);
