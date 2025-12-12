# UniversityDB -- SQL Project

This project creates a simple University Course Management Database
using SQL.\
The database includes 5 main tables: Students, Courses, Instructors,
Enrollments, and Departments.\
It also contains sample data and a set of SQL queries for practice.

## Database Creation

``` sql
CREATE DATABASE UniversityDB;
USE UniversityDB;
```

## Tables and Sample Data

### Students Table

``` sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    BirthDate DATE,
    EnrollmentDate DATE
);

INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01');
```

### Courses Table

``` sql
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT
);

INSERT INTO Courses VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4);
```

### Instructors Table

``` sql
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID INT
);

INSERT INTO Instructors VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2);
```

### Enrollments Table

``` sql
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE
);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01');
```

### Departments Table

``` sql
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics');
```

## Queries

### CRUD

``` sql
INSERT INTO Students VALUES (3, 'Amit', 'Kumar', 'amit.k@univ.com', '2001-02-10', '2023-01-01');
SELECT * FROM Students;
UPDATE Students SET Email='amit.updated@univ.com' WHERE StudentID=3;
DELETE FROM Students WHERE StudentID=3;
```

### Additional Queries

(Contains all queries exactly as provided in SQL file.)
