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


CREATE TABLE IF NOT EXISTS active_tokens (
    token_id         INT NOT NULL,
    user_id          INT,
    ttl              INT DEFAULT 3600,  -- Time to live in seconds
    creation_date    DATETIME DEFAULT NOW(),
    PRIMARY KEY (token_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
