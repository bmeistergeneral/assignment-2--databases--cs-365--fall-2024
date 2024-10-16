use passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('ThisKitchenIsForDancing', 512));
SET @init_vector = 1010101010101010;

insert into Passwords (website_name, website_url, user_id, password, comment)
values
("University of Hartford", "http://www.hartford.edu", 2, AES_ENCRYPT('uKAk@8r37j9#2wYgxSfH', @key_str, @init_vector), "My Hartford login.");

SELECT CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) AS 'Plain Text Password' FROM Passwords WHERE website_url = "https://www.jetbrains.com";

SELECT website_name, website_url, user_first_name, user_last_name, user_username, user_email, CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) AS 'Plain Text Password', comment 
FROM Passwords INNER JOIN Users ON Passwords.user_id = Users.user_id WHERE website_url LIKE "https%";

UPDATE Passwords SET website_url = "http://www.vordnpn.com" WHERE website_name = 'NordVPN';
UPDATE Passwords SET password = AES_ENCRYPT('A(V2wS),7>z-C3u;qa!mcv', @key_str, @init_vector) WHERE website_name = 'Atlassian' AND user_id = 1;

DELETE FROM Passwords WHERE website_url = "http://www.netflix.com";
DELETE FROM Passwords WHERE password = AES_ENCRYPT('Ef649#2P=r5%U+3Mh$eZq/', @key_str, @init_vector);