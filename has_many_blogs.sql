-- drops database to avoid duplicates
DROP DATABASE IF EXISTS has_many_blogs;

--drops user for testing purposes
DROP USER IF EXISTS has_many_user;

--creating user
CREATE USER has_many_user;

--create database with user has_many_user
CREATE DATABASE has_many_blogs;
ALTER DATABASE has_many_blogs OWNER TO has_many_user;

