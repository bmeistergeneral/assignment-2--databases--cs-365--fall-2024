use passwords;

insert into Passwords (website_name, website_url, user_id, password, comment)
values
("University of Hartford", "https://www.hartford.edu", 2, AES_ENCRYPT('uKAk@8r37j9#2wYgxSfH', @key_str, @init_vector), "My Hartford login.");

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('ThisKitchenIsForDancing', 512));
SET @init_vector = 1010101010101010;

SELECT CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) AS 'Plain Text Password' FROM Passwords where website_url = "https://www.jetbrains.com";