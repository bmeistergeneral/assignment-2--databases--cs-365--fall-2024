Create database passwords;

use passwords;

CREATE TABLE User (
user_id MEDIUMINT NOT NULL AUTO_INCREMENT,
user_first_name varchar(32) NOT NULL,
user_last_name varchar(32) NOT NULL,
user_username varchar(32) NOT NULL,
user_email varchar(40) NOT NULL,
PRIMARY KEY (user_id)
);

CREATE TABLE Website (
website_name varchar(255) NOT NULL,
website_url varchar(1000) NOT NULL,
user_id MEDIUMINT NOT NULL,
password varchar(40) NOT NULL,
comment varchar(255) NOT NULL,
create_time TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES User(user_id)
);
