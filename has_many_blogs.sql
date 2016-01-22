-- drops database to avoid duplicates
DROP DATABASE IF EXISTS has_many_blogs;

--drops user for testing purposes
DROP USER IF EXISTS has_many_user;

--creating user
CREATE USER has_many_user;

--create database with user has_many_user
CREATE DATABASE has_many_blogs;
ALTER DATABASE has_many_blogs OWNER TO has_many_user;

--connects to database
\c has_many_blogs;

--create table titled 'users'
DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users
(
  id SERIAL NOT NULL,
  username varchar(90) NOT NULL,
  first_name varchar(90) NOT NULL,
  last_name varchar(90) NULL DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY (id)
);

--to create index for performance optimization
CREATE INDEX first_name_index ON users (username);

--create table titled 'posts'
DROP TABLE IF EXISTS posts;
CREATE TABLE IF NOT EXISTS posts
(
  id SERIAL NOT NULL,
  title varchar(180) NULL DEFAULT NULL,
  url varchar(510) NULL DEFAULT NULL,
  content text NULL DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now(),
  user_id integer REFERENCES users(id),
  -- first_name_id varchar(90) REFERENCES users(first_name),
  PRIMARY KEY (id)
);

CREATE INDEX title_index ON posts ( title );
CREATE INDEX user_id_index ON posts ( user_id );
-- CREATE INDEX created_at_index ON post ( created_at );
-- CREATE INDEX updated_at_index ON post ( updated_at );

--create table titled 'comments'
DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments
(
  id SERIAL NOT NULL,
  body varchar(510) NULL DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now(),
  user_id integer REFERENCES users(id),
  posts_id integer REFERENCES posts(id),
  PRIMARY KEY (id)
);

\i scripts/blog_data.sql;
\i joins.sql;

