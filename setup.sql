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

CREATE TABLE Passwords (
website_name varchar(255) NOT NULL,
website_url varchar(1000) NOT NULL,
user_id MEDIUMINT NOT NULL,
password varbinary(512) NOT NULL,
comment varchar(255),
create_time TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

ALTER TABLE Passwords
MODIFY create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

insert into Users (user_first_name, user_last_name, user_username, user_email)
values
("Brecon", "Morgan", "edbob460", "breconiusmorg@gmail.com"),
("John", "Smith", "js780d", "johnsmith@icloud.com"),
("Draco", "Malfoy", "severusrocks", "dracosucks@yahoo.com");

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('ThisKitchenIsForDancing', 512));
SET @init_vector = RANDOM_BYTES(16);

-- Don't want to manually set user_id, but since it's initial data I think it is ok.
insert into Passwords (website_name, website_url, user_id, password, comment)
values
("Atlassian", "https://www.atlassian.com", 1, AES_ENCRYPT('VknsS>(LR#,G5d)8FA;jJ@', @key_str, @init_vector), NULL),
("JetBrains", "https://www.jetbrains.com", 1, AES_ENCRYPT('qp+6N8v754yK_PF/*HauBR', @key_str, @init_vector), NULL),
("MySQL", "https://www.mysql.com", 1, AES_ENCRYPT('C<@3a%ws9/TWe#`c$8}-7,', @key_str, @init_vector), NULL),
("AMC", "https://www.amctheatres.com", 1, AES_ENCRYPT('f^j2@!NJ8)(m[:5&*4Kk=Y', @key_str, @init_vector), "movie tickets"),
("Google", "https://www.google.com", 2, AES_ENCRYPT('Ef649#2P=r5%U+3Mh$eZq/', @key_str, @init_vector), NULL),
("Ableton", "https://www.ableton.com", 2, AES_ENCRYPT('t~Gv&Z`4?Ac6FjqbJM@mK^', @key_str, @init_vector), NULL),
("Netflix", "https://www.netflix.com", 2, AES_ENCRYPT('f+YLu{,@T")3}4N8c<wHr8', @key_str, @init_vector), NULL),
("NordVPN", "https://www.nordvpn.com", 3, AES_ENCRYPT('ps(6[S82DFEMg;ZTNCa+k=', @key_str, @init_vector), NULL),
("Spotify", "https://open.spotify.com", 3, AES_ENCRYPT('XVKW5$eG=h6s?mdL8x&bQ', @key_str, @init_vector), "student account"),
("Pearson", "https://www.pearson.com/en-us.html", 3, AES_ENCRYPT('Jv%{yX?35p9s,kV]TB8!"^', @key_str, @init_vector), NULL);
