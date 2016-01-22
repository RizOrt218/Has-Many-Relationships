\timing
-- Create a query to get all fields from the users table
\c has_many_blogs;
SELECT u.username, u.first_name, u.last_name, u.created_at, u.updated_at FROM users u;

-- Create a query to get all fields from the posts table where the user_id is 100
SELECT * FROM posts WHERE user_id= '100';

-- Create a query to get all posts fields, the user's first name, and the user's last name, from the posts table where the user's id is 200
SELECT posts.*, users.first_name, users.last_name
FROM posts
INNER JOIN users
ON (posts.user_id = users.id)
WHERE user_id= '200';