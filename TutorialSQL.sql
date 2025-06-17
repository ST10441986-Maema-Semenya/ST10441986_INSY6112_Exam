-- DATABASE CREATION SECTION
CREATE SCHEMA TMSDB;
use TMSDB;

-- TABLE CREATION SECTION
-- Q.3.1
-- Creates student table
CREATE TABLE Student (
StudentID INT PRIMARY KEY AUTO_INCREMENT,
StudentName VARCHAR(150) NOT NULL,
StudentSurname VARCHAR(150) NOT NULL,
StudentNumber VARCHAR(20) NOT NULL
);

-- Q.3.2
-- Creates lecturer table
CREATE TABLE Lecturer(
LecturerID INT PRIMARY KEY AUTO_INCREMENT,
LecturerName VARCHAR(150) NOT NULL,
LecturerSurname VARCHAR(150) NOT NULL
);

-- Q.3.3
-- Creates tutorial table 
CREATE TABLE Tutorial(
TutorialID INT PRIMARY KEY AUTO_INCREMENT,
StudentID INT NOT NULL,
LecturerID INT NOT NULL,
TutorialDate DATE NOT NULL,
TutorialTime TIME NOT NULL,
TutorialDuration VARCHAR(3) NOT NULL,
FOREIGN KEY Student(StudentID) REFERENCES Lecturer(LecturerID)
);

-- TABLE INSERTION SECTION
INSERT INTO Student (StudentName, StudentSurname, StudentNumber)
VALUES( 'Zinhle', 'Theart', '123456'),
( 'Ravi', 'Maharaj', '654321');

INSERT INTO Lecturer (LecturerName, LecturerSurname)
VALUES( 'Zinhle', 'Nukani'),
( 'Ravi', 'Maharaj');

INSERT INTO Tutorial (TutorialDate, TutorialTime, TutorialDuration, LecturerID, StudentID)
VALUES ('2025-01-15', '9:00', '180','2','1'),
('2025-01-18', '15:00', '240','2','2'),
('2025-01-20', '10:00', '180','1','1'),
('2025-01-21', '11:00', '180','2','1');


-- TABLE MANIPULATION SECTION
SELECT * FROM Student;
SELECT * FROM Lecturer;
SELECT * FROM Tutorial;

-- Q.3.5
-- Display all tutorials between 2025-01-16 and 2025-01-20 (inclusive)
SELECT * FROM Tutorial
WHERE TutorialDate BETWEEN '2025-01-16' AND '2025-01-20';

-- Q.3.6
-- Display names and surnames of students, with total number of tutorials booked, sorted in descending order
SELECT 
    s.StudentName,
    s.StudentSurname,
    COUNT(t.TutorialID) AS TotalTutorials
FROM 
    Student s
LEFT JOIN 
    Tutorial t ON s.StudentID = t.StudentID
GROUP BY 
    s.StudentID
ORDER BY 
    TotalTutorials DESC;

-- Q.3.7
-- Create view for students that booked with lecturer 2 (just names and surnames in alphabetical surname order)
CREATE VIEW StudentWithLecturer2 AS
SELECT 
    s.StudentName,
    s.StudentSurname
FROM 
    Student s
JOIN 
    Tutorial t ON s.StudentID = t.StudentID
WHERE 
    t.LecturerID = 2
ORDER BY 
    s.StudentSurname;