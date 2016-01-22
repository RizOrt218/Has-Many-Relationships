-- Create a query to get all fields from the users table
\c has_many_blogs;
SELECT * FROM users;

-- Create a query to get all fields from the posts table where the user_id is 100
SELECT * FROM posts WHERE user_id= '100';