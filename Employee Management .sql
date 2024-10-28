USE employeedata;

CREATE TABLE Job(
ID INT(4) AUTO_INCREMENT NOT NULL PRIMARY KEY,
Title VARCHAR(64) NOT NULL
);
ALTER TABLE Job MODIFY COLUMN Title VARCHAR(64) NOT NULL;

INSERT INTO Job(Title) VALUES
('Programmer'),('HR Assistant'), ('Chief Financial Officer'), ('Department Manager' );

CREATE TABLE Education(
ID INT(4) AUTO_INCREMENT NOT NULL PRIMARY KEY,
EdName VARCHAR(64) NOT NULL
);

INSERT INTO Education(EdName) VALUES
('HighSchool'), ('CollegeGrade'), ('Masteral'), ('PhD');

CREATE TABLE Relationship(
ID INT(4) AUTO_INCREMENT NOT NULL PRIMARY KEY,
RName VARCHAR(32) NOT NULL
);

INSERT INTO Relationship(RName) VALUES
('Spouse'), ('Child'),('Sibling'), ('Parent');

CREATE TABLE Employee(
ID INT(16) AUTO_INCREMENT NOT NULL PRIMARY KEY,
FirstName VARCHAR(32) NOT NULL,
LastName VARCHAR(16) NOT NULL,
Job_ID INT(4) NOT NULL,
Education_ID INT(4) NOT NULL,
BirthDate DATE NOT NULL,
HireDate DATE NOT NULL,
Salary INT(16) NOT NULL,
FOREIGN KEY (Job_ID) REFERENCES Job(ID),
FOREIGN KEY (Education_ID) REFERENCES Education (ID)
);

INSERT INTO Employee(FirstName, LastName, Job_ID, Education_ID, Birthdate, HireDate, Salary) VALUES
('Larry', 'Bob',1,2,'1995-03-04', '2019-02-23', 60000),
('Marky', 'Peel', 2,2,'1997-05-27', '2022-10-15', 45000),
('Grace','Phul', 3,4,'1980-11-30', '2005-06-23', 300000),
('John', 'Cena', 4,3,'2000-04-04', '2005-06-05', 75000),
('Calvin', 'Cllay', 4,3,'1998-05-25', '2003-07-16', 75000),
('Draymond','White', 4,4,'1989-03-15', '1999-11-01',75000);

CREATE TABLE DepartmentManager(
ID INT(16) NOT NULL AUTO_INCREMENT PRIMARY KEY,
DeptDesc VARCHAR(32) NOT NULL,
Employee_ID INT(16) NOT NULL,
FOREIGN KEY (Employee_ID) REFERENCES Employee(ID)
);

INSERT INTO DepartmentManager (DeptDesc, Employee_ID) VALUES
('IT',4 ),
('HR', 5),
('Finance',6);

CREATE TABLE Dependents(
ID INT(8) AUTO_INCREMENT NOT NULL PRIMARY KEY,
Employee_ID INT(4) NOT NULL,
FirstName VARCHAR(32) NOT NULL,
LastName VARCHAR(16) NOT NULL,
Relationship_ID INT(4) NOT NULL,
FOREIGN KEY (Employee_ID) REFERENCES Employee(ID),
FOREIGN KEY (Relationship_ID) REFERENCES Relationship(ID)
);

INSERT INTO Dependents (Employee_ID, FirstName, LastName, Relationship_ID) VALUES
(1,'Melissa','Bob', 2),
(1,'Merly','Bob', 1),	
(1,'May','Bob', 4),
(2,'Lea','Clay', 1),
(2,'Kaye','Clay', 3),
(3,'Gary','Phul', 1),
(3,'Jane','Phul', 2),
(3,'Philly','Phul', 2);

ALTER TABLE Employee ADD COLUMN DepartmentManager_ID INT(16);

UPDATE Employee
SET DepartmentManager_ID= CASE ID
WHEN 1 THEN 1
WHEN 2 THEN 2
WHEN 3 THEN 3
WHEN 4 THEN 1
WHEN 5 THEN 2
WHEN 6 THEN 3
ELSE NULL 
END;


SELECT * FROM Employee;
SELECT * FROM DepartmentManager;
SELECT * FROM Dependents;
SELECT * FROM Relationship;
SELECT * FROM Job;
SELECT * FROM Education;