# 1. Get list of users with all data connected to them.
SELECT * FROM `user`;

# 2. Get list of users who has articles created after 2019-01-24T13:00:00+00:00.
SELECT `author_id` FROM `article` WHERE `created_at` > "2019-01-24T13:00:00+00:00";

# 3. Get list of articles connected to not top level categories.
SELECT * FROM `article` a
JOIN `category` c ON a.category_id = c.id AND c.parent_id <> 0;

# 4. Get list of users whose first name starts with letter 'V'.
SELECT * FROM `user` u
JOIN `user_data_first_name` ufname ON u.id = ufname.user_id AND ufname.value LIKE "V%";