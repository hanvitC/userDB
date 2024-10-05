DROP SCHEMA IF EXISTS db_user;
CREATE SCHEMA db_user;
USE db_user;


CREATE TABLE IF NOT EXISTS users (
    user_id          INT NOT NULL,
    user_name        NVARCHAR(100) NOT NULL,
    password         NVARCHAR(255) NOT NULL,
    email            NVARCHAR(100) NOT NULL,
    creation_date    DATETIME DEFAULT NOW(),
    last_login       DATETIME DEFAULT NOW(),
    PRIMARY KEY (user_id)
);
