use passwords;

insert into Passwords (website_name, website_url, user_id, password, comment)
values
("University of Hartford", "https://www.hartford.edu", 2, AES_ENCRYPT('uKAk@8r37j9#2wYgxSfH', @key_str, @init_vector), "My Hartford login.");
