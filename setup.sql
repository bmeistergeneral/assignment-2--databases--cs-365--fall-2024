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

CREATE TABLE Websites (
website_name varchar(255) NOT NULL,
website_url varchar(1000) NOT NULL,
user_id MEDIUMINT NOT NULL,
password varchar(40) NOT NULL,
comment varchar(255),
create_time TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

insert into Users (user_first_name, user_last_name, user_username, user_email)
values
("Brecon", "Morgan", "edbob460", "breconiusmorg@gmail.com"),
("John", "Smith", "js780d", "johnsmith@icloud.com"),
("Draco", "Malfoy", "severusrocks", "dracosucks@yahoo.com");

-- Don't want to manually set user_id, but since it's initial data I think it is ok.
insert into Websites (website_name, website_url, user_id, password, comment)
values
("Atlassian", "https://www.atlassian.com", 1, 'VknsS>(LR#,G5d)8FA;jJ@', NULL),
("JetBrains", "https://www.jetbrains.com", 1, 'qp+6N8v754yK_PF/*HauBR', NULL),
("MySQL", "https://www.mysql.com", 1, 'C<@3a%ws9/TWe#`c$8}-7,', NULL),
("AMC", "https://www.amctheatres.com", 1, 'f^j2@!NJ8)(m[:5&*4Kk=Y', "movie tickets"),
("Google", "https://www.google.com", 2, 'Ef649#2P=r5%U+3Mh$eZq/', NULL),
("Ableton", "https://www.ableton.com", 2, 't~Gv&Z`4?Ac6FjqbJM@mK^', NULL),
("Netflix", "https://www.netflix.com", 2, 'f+YLu{,@T")3}4N8c<wHr8', NULL),
("NordVPN", "https://www.nordvpn.com", 3, 'ps(6[S82DFEMg;ZTNCa+k=', NULL),
("Spotify", "https://open.spotify.com", 3, 'XVKW5$eG=h6s?mdL8x&bQ', "student account"),
("Pearson", "https://www.pearson.com/en-us.html", 3, 'Jv%{yX?35p9s,kV]TB8!"^', NULL);
