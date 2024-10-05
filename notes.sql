DROP SCHEMA IF EXISTS db_notebook;
CREATE SCHEMA db_notebook;
USE db_notebook;


CREATE TABLE IF NOT EXISTS subjects (
    subject_id       INT NOT NULL,
    subject_name     NVARCHAR(100),
    creation_date    DATETIME DEFAULT NOW(),
    PRIMARY KEY (subject_id),
    UNIQUE (subject_name)
);


CREATE TABLE IF NOT EXISTS notebooks (
    notebook_id      INT NOT NULL,
    owner_user_id    INT,
    notebook_name    NVARCHAR(100),
    creation_date    DATETIME DEFAULT NOW(),
    PRIMARY KEY (notebook_id),
    FOREIGN KEY (owner_user_id) REFERENCES db_user.users (user_id)
                                    ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS notes (
    note_id          INT NOT NULL,
    notebook_id      INT,
    parent_directory_id INT DEFAULT NULL,
    note_title       NVARCHAR(100),
    is_directory     BOOL DEFAULT FALSE,
    creation_date    DATETIME DEFAULT NOW(),
    PRIMARY KEY (note_id),
    FOREIGN KEY (notebook_id) REFERENCES notebooks (notebook_id)
                                ON DELETE SET NULL,
    FOREIGN KEY (parent_directory_id) REFERENCES notes (note_id)
                                      ON DELETE SET NULL
);
