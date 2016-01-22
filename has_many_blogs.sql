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

CREATE TABLE IF NOT EXISTS users
(
  id SERIAL NOT NULL,
  username varchar(90) NOT NULL,
  first_name varchar(90) NOT NULL,
  last_name varchar(90) NULL DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now()
);


