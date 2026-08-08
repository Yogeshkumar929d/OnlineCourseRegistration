CREATE DATABASE course_registration;
USE course_registration;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    duration VARCHAR(50) NOT NULL
);

CREATE TABLE registrations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO courses(name, duration) VALUES
('Java Programming', '3 Months'),
('JSP and Servlet', '2 Months'),
('Database Management System', '3 Months'),
('Web Development', '3 Months');
