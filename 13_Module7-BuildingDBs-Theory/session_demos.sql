-- ===== CREATING DATABASE =====
CREATE DATABASE cfg_courses;

-- ===== USE DATABASE =====
USE cfg_courses;

-- ===== CREATE TABLE INSIDE DATABASE =====
CREATE TABLE courses(
   course_id INT PRIMARY KEY,
   course_title VARCHAR(255),
   duration INT,
   price DECIMAL(10,2)
);

-- ===== INSERT DATA INTO TABLE =====

INSERT INTO courses(course_id, course_title, duration, price)
VALUES
(1, "Introduction to SQL", 8, 19.99),
(2, "Advanced SQL", 12, 29.99),
(3, "Database Design", 10, 24.99),
(4, "CRUD Operations", 2, 5.00);

-- ===== QUERY TO RETURN ALL DATA FROM A TABLE =====
SELECT * FROM <table_name>;

/* GOOD QUERY TO KNOW FOR SMALL DATA CHECKS
 * IS OUR WILDCARD CHARACTER - IT MEANS "ALL"
YOU'RE NOT EXPECTED TO KNOW THE SELECT SYNTAX YET, IT WILL BE COVERED LATER THIS WEEK */
