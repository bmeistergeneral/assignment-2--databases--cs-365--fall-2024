Create database passwords;

use passwords;

CREATE TABLE Users (
user_id MEDIUMINT NOT NULL AUTO_INCREMENT,
user_first_name varchar(32) NOT NULL,
user_last_name varchar(32) NOT NULL,
user_username varchar(32) NOT NULL,
user_email varchar(40) NOT NULL,
PRIMARY KEY (user_id)
);