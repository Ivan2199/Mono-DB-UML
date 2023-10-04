CREATE TABLE Student (
    Id INT PRIMARY KEY NOT NULL, 
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
);

CREATE TABLE ContactDetails (
    StudentID INT PRIMARY KEY REFERENCES Student(Id) NOT NULL,
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Department (
    Id INT PRIMARY KEY NOT NULL,
    DepartmentName VARCHAR(255) NOT NULL
);

CREATE TABLE Course (
    Id INT PRIMARY KEY NOT NULL,
    DepartmentID INT REFERENCES Department(Id) NOT NULL,
    CourseName VARCHAR(255) NOT NULL,
);

CREATE TABLE Professor (
    Id INT PRIMARY KEY NOT NULL,
	DepartmentId INT REFERENCES Department(Id) NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL
);

CREATE TABLE Teaching (
    Id INT PRIMARY KEY NOT NULL,
    CourseID INT REFERENCES Course(Id) NOT NULL,
    ProfessorID INT REFERENCES Professor(Id) NOT NULL,
    Semester VARCHAR(255) NOT NULL
);

CREATE TABLE Exam (
    Id INT PRIMARY KEY NOT NULL,
	TeachingID INT REFERENCES Teaching(Id) NOT NULL,
    ExamDate DATE NOT NULL,
	ExamName VARCHAR(255) NOT NULL
);

CREATE TABLE Registration (
    Id INT PRIMARY KEY NOT NULL,
    StudentID INT REFERENCES Student(Id) NOT NULL,
    ExamID INT REFERENCES Exam(Id) NOT NULL,
    Grade VARCHAR(255) NOT NULL
);


INSERT INTO Student (Id, FirstName, LastName, DateOfBirth)
VALUES (1, 'John', 'Doe', '1992-01-01');
INSERT INTO Student (Id, FirstName, LastName, DateOfBirth)
VALUES (2, 'Mark', 'Doe', '1993-01-01');
INSERT INTO Student (Id, FirstName, LastName, DateOfBirth)
VALUES (3, 'David', 'Doe', '1994-01-01');
INSERT INTO Student (Id, FirstName, LastName, DateOfBirth)
VALUES (4, 'Ivan', 'Doe', '1995-01-01');

INSERT INTO ContactDetails (StudentID, Email, Phone, Address)
VALUES (1, 'john.doe@example.com', '123-456-7890', '123 Main St');
INSERT INTO ContactDetails (StudentID, Email, Phone, Address)
VALUES (2, 'Mark.doe@example.com', '123-456-7890', '123 Main St');
INSERT INTO ContactDetails (StudentID, Email, Phone, Address)
VALUES (3, 'David.doe@example.com', '123-456-7890', '123 Main St');
INSERT INTO ContactDetails (StudentID, Email, Phone, Address)
VALUES (4, 'Ivan.doe@example.com', '123-456-7890', '123 Main St');

INSERT INTO Department (Id, DepartmentName)
VALUES (1, 'Computer Science');
INSERT INTO Department (Id, DepartmentName)
VALUES (2, 'Programming');
INSERT INTO Department (Id, DepartmentName)
VALUES (3, 'Database');
INSERT INTO Department (Id, DepartmentName)
VALUES (4, 'Machine Learning');

INSERT INTO Course (Id, DepartmentID, CourseName)
VALUES (1, 1, 'Introduction to Programming');

INSERT INTO Professor (Id, DepartmentId, FirstName, LastName)
VALUES (1, 1, 'Jane', 'Smith');

INSERT INTO Teaching (Id, CourseID, ProfessorID, Semester)
VALUES (1, 1, 1, 'Fall 2023');

INSERT INTO Exam (Id, TeachingID, ExamDate, ExamName)
VALUES (1, 1, '2023-12-15', 'Midterm Exam');

INSERT INTO Registration (Id, StudentID, ExamID, Grade)
VALUES (1, 1, 1, 'A');





SELECT * FROM Student;

SELECT s.*, cd.Email, cd.Phone, cd.Address
FROM Student s
JOIN ContactDetails cd ON s.Id = cd.StudentID;

SELECT * FROM Professor;

SELECT e.*
FROM Exam e
JOIN Teaching t ON e.TeachingID = t.Id
WHERE t.CourseID = 1;


UPDATE Student
SET FirstName = 'UpdatedFirstName', LastName = 'UpdatedLastName'
WHERE Id = 1;

UPDATE Professor
SET DepartmentId = 2
WHERE Id = 1;

SELECT * FROM Professor;

DELETE FROM Registration WHERE StudentID = 1;
DELETE FROM Exam WHERE TeachingID IN (SELECT Id FROM Teaching WHERE CourseID = 1);
DELETE FROM Teaching WHERE CourseID = 1;
DELETE FROM Course WHERE Id = 1;
