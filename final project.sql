

CREATE DATABASE UniversityDB;
USE UniversityDB;



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



CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT
);


INSERT INTO Courses VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4);



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



 


CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE
);



INSERT INTO Enrollments VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01');





CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);


INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics');


--                REQUIRED QUERIES


-- 1. CRUD operations (examples)

INSERT INTO Students VALUES (3, 'Amit', 'Kumar', 'amit.k@univ.com', '2001-02-10', '2023-01-01');


SELECT * FROM Students;


UPDATE Students SET Email='amit.updated@univ.com' WHERE StudentID=3;


DELETE FROM Students WHERE StudentID=3;


SELECT * FROM Students
WHERE YEAR(EnrollmentDate) > 2022;


SELECT * FROM Courses
WHERE DepartmentID = 2
LIMIT 5;


SELECT CourseID, COUNT(StudentID) AS TotalStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID) > 5;


SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
WHERE s.StudentID IN (
    SELECT StudentID FROM Enrollments WHERE CourseID = 101
)
AND s.StudentID IN (
    SELECT StudentID FROM Enrollments WHERE CourseID = 102
);


SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID IN (101, 102);


SELECT AVG(Credits) AS AvgCredits FROM Courses;

-- 8. Maximum salary of instructors (salary column not provided in sample)
-- Assuming Salary column exists:
 SELECT MAX(Salary) FROM Instructors;


SELECT d.DepartmentName, COUNT(s.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Students s ON d.DepartmentID = s.StudentID
GROUP BY d.DepartmentName;


SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;


SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON c.CourseID = e.CourseID;


SELECT CourseID, CourseName
FROM Courses
WHERE CourseID IN (
    SELECT CourseID FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 10
);


SELECT StudentID, YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;


SELECT InstructorID,
       CONCAT(FirstName, ' ', LastName) AS FullName
FROM Instructors;


SELECT EnrollmentID,
       StudentID,
       CourseID,
       SUM(1) OVER (ORDER BY EnrollmentID) AS RunningTotal
FROM Enrollments;


SELECT StudentID,
       FirstName,
       LastName,
       CASE 
           WHEN YEAR(CURDATE()) - YEAR(EnrollmentDate) > 4 
               THEN 'Senior'
           ELSE 'Junior'
       END AS Status
FROM Students;
