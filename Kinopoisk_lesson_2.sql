DROP DATABASE IF EXISTS `Kinopoisk`;
CREATE DATABASE `Kinopoisk`;
USE `Kinopoisk`;
SHOW TABLES;

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
id_User INT primary key not null auto_increment unique,
Surname CHAR(45) not null,
Name CHAR(45) not null,
Email CHAR(45) not null,
Phone INT unique not null);


DROP TABLE IF EXISTS `User_profile`;
CREATE TABLE `User_profile` (
id_Profile INT primary key not null auto_increment unique,
Gender CHAR(45),
Birthday date,
Photo_id INT unique,
Hometown CHAR(45),
User_id INT  unique not null,
FOREIGN KEY (User_id) REFERENCES `user` (id_User));



DROP TABLE IF EXISTS `Genre`;
CREATE TABLE `Genre` (
id_Genre INT primary key not null auto_increment unique,
Name_Genre CHAR(45));



DROP TABLE IF EXISTS `Director`;
CREATE TABLE `Director` (
id_Director INT primary key not null auto_increment unique,
Surname CHAR(45),
Name CHAR(45));



DROP TABLE IF EXISTS `Country`;
CREATE TABLE `Country` (
id_Country INT primary key not null auto_increment unique,
Name_Country CHAR(45));



DROP TABLE IF EXISTS `Actor`;
CREATE TABLE `Actor` (
id_Actor INT primary key not null auto_increment unique,
Surname CHAR(45),
Name CHAR(45));



DROP TABLE IF EXISTS `Films`;
CREATE TABLE `Films` (
id_Films int primary key not null auto_increment unique,
Name_Film CHAR(45),
Year_of_realease DATE,
Time_Film TIME,
Genre_id INT not null,
Country_id INT not null,
Director_id INT not null,
Actor_id INT not null,
FOREIGN KEY (Genre_id) REFERENCES `Genre` (id_Genre),
FOREIGN KEY (Country_id) REFERENCES `Country` (id_Country),
FOREIGN key (Director_id) REFERENCES `Director` (id_Director),
FOREIGN key (Actor_id) REFERENCES `Actor` (id_Actor));



DROP TABLE IF EXISTS `View`;
CREATE TABLE `View` (
id_View INT primary key not null auto_increment unique,
Films_id INT not null,
User_id INT not null,
FOREIGN KEY (Films_id) REFERENCES `Films` (id_Films),
FOREIGN KEY (User_id) REFERENCES `User` (id_User));

