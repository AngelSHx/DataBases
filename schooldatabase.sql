

-- CREATE DATABASE
DROP SCHEMA IF EXISTS `schooldatabase` ;
CREATE SCHEMA IF NOT EXISTS `schooldatabase` DEFAULT CHARACTER SET utf8mb4 ;

-- USE DATABASE
use schooldatabase;


-- CREATE TABLE SCHOOL
DROP TABLE IF EXISTS `school` ;

create table if not exists `school`(
    school_id INT(10) not NULL AUTO_INCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    position enum('Student', 'Staff'),
    PRIMARY KEY (school_id)
);

-- CREATE TABLE STUDENTS
DROP TABLE IF EXISTS `student` ;
create table if not exists `student`(
    student_id INT(10) not NULL AUTO_INCREMENT,
    age INT(10),
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    grade VARCHAR(45),
    FOREIGN KEY (student_id) REFERENCES school (school_id)
);


-- CREATE TABLE STAFF
DROP TABLE IF EXISTS `staff` ;
create table if not exists `staff`(
    staff_id INT(10) not NULL AUTO_INCREMENT,
    age INT(10),
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    staff_position VARCHAR(45),
    tenure enum('Yes', 'No'),
    FOREIGN KEY (staff_id) REFERENCES school (school_id)
);

