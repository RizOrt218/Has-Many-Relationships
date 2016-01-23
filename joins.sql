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

-- Create a query to get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'

SELECT posts.*, users.username, users.first_name
FROM posts
INNER JOIN users
ON (posts.user_id = users.id)
WHERE first_name= 'Norene' AND last_name= 'Schmitt';

-- Create a query to get usernames from the users table where the user has created a post after January 1, 2015

SELECT users.username, posts.created_at
FROM users
INNER JOIN posts
ON (posts.user_id = users.id)
WHERE posts.created_at > '2015-01-01';

-- Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015

-- Time: 72.795 ms
-- Time: 66.751 ms w/ INDEX
SELECT posts.title, posts.content, users.username
FROM users
INNER JOIN posts
ON (posts.user_id = users.id)
WHERE users.created_at < '2015-01-01';

-- 7 Create a query to get all the rows in the comments table, showing post title (aliased as 'Post Title'), and all the comment's fields

SELECT c.*
FROM comments AS c
INNER JOIN posts AS PostTitle
ON (c.posts_id = PostTitle.id);

-- 8 Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015

SELECT c.*
FROM comments AS c
INNER JOIN posts AS post_title
ON (c.posts_id = post_title.id)
WHERE post_title.created_at > '2015-01-01';

-- 9 Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created after January 1, 2015

SELECT comments.*, posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
FROM comments
INNER JOIN posts
ON (comments.posts_id = posts.id)
WHERE posts.created_at > '2015-01-01';

-- 10 Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'

SELECT c.*, p.title, p.url
FROM comments c
INNER JOIN posts p
ON ( c.posts_id = p.id )
WHERE c.body LIKE '%USB%';

-- 11 Create a query to get the post title (aliased as post_title), first name of the author of the post, last name of the author of the post, and comment body (aliased to comment_body), where the comment body contains the word 'matrix' ( should have 855 results )

SELECT p.title, u.first_name, u.last_name, c.body
FROM posts p
INNER JOIN users u
ON ( p.user_id = u.id )
INNER JOIN comments c
ON ( c.posts_id = p.id )
WHERE c.body LIKE '%matrix%';

SELECT count(p.id)
FROM posts p
INNER JOIN users u
ON ( p.user_id = u.id )
INNER JOIN comments c
ON ( c.posts_id = p.id )
WHERE c.body LIKE '%matrix%';

-- 12 Create a query to get the first name of the author of the comment, last name of the author of the comment, and comment body (aliased to comment_body), where the comment body contains the word 'SSL' and the post content contains the word 'dolorum' ( should have 102 results )

SELECT u.first_name, u.last_name, c.body
FROM users u
INNER JOIN comments c ON ( c.user_id = u.id )
INNER JOIN posts p ON ( c.posts_id = p.id )
WHERE c.body LIKE '%SSL%' AND p.content LIKE '%dolorum%';

SELECT count(u.id)
FROM users u
INNER JOIN comments c ON ( c.user_id = u.id )
INNER JOIN posts p ON ( c.posts_id = p.id )
WHERE c.body LIKE '%SSL%' AND p.content LIKE '%dolorum%';

-- 13 Create a query to get the first name of the author of the post (aliased to post_author_first_name), last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo' ( should have 197 results )

SELECT u.first_name, u.last_name, p.title, cAuthor.username, c.body
FROM users u
INNER JOIN posts p ON p.user_id = u.id
INNER JOIN comments c ON c.posts_id = p.id
INNER JOIN users cAuthor ON cAuthor.id = c.user_id
WHERE (c.body LIKE '%SSL%' OR c.body LIKE '%firewall%') AND p.content LIKE '%nemo%';

SELECT count(*)
FROM users u
INNER JOIN posts p ON p.user_id = u.id
INNER JOIN comments c ON c.posts_id = p.id
INNER JOIN users cAuthor ON cAuthor.id = c.user_id
WHERE (c.body LIKE '%SSL%' OR c.body LIKE '%firewall%') AND p.content LIKE '%nemo%';
