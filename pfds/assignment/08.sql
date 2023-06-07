-- Sample table
DROP TABLE IF EXISTS Applicants;
CREATE TABLE Applicants (
  ApplicantID INT PRIMARY KEY,
  FirstName TEXT NOT NULL,
  LastName TEXT NOT NULL,
  Email TEXT NOT NULL,
  Age INT NOT NULL,
  PositionAppliedFor TEXT NOT NULL,
  DepartmentID INT NOT NULL,
  ExperienceYears INT NOT NULL
);

INSERT INTO
  Applicants
VALUES
  (1, 'Joe', 'Sanchez', 'js@example.com', 24, 'Software Developer', 2, 1),
  (2, 'Jane', 'Smith', 'js@domain.com', 45, 'Project Manager', 1, 21),
  (3, 'David', 'Johnson', 'dj@example.com', 25, 'Data Analyst', 3, 5),
  (4, 'Sam', 'Jones', 'sj@domain.com', 30, 'Market Coordinator', 4, 11),
  (5, 'Mike', 'Brown', 'mb@example.com', 35, 'Sales Representative', 4, 15),
  (6, 'Emily', 'Stone', 'es@example.com', 36, 'UX Designer', 2, 20),
  (7, 'Daniel', 'Taylor', 'dt@example.com', 44, 'Business Analyst', 3, 22),
  (8, 'Olivia', 'Clark', 'oc@some.com', 33, 'HR Specialist', 5, 13);

-- Part A
SELECT * FROM
  Applicants
WHERE
  LastName
LIKE
  'S%';

-- Part B
SELECT * FROM
  Applicants
WHERE
  Email
LIKE
  '%example.com';

-- Part C
SELECT * FROM
  Applicants
WHERE
  PositionAppliedFor
IN
  ('Software Developer', 'Data Analyst');

-- Part D
SELECT * FROM
  Applicants
WHERE
  Age
BETWEEN
  25 AND 35;

-- Part E
SELECT
  FirstName,
  LastName,
  ExperienceYears AS Experience
FROM
  Applicants;

-- Part F
DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments (
  DepartmentID INT PRIMARY KEY,
  DepartmentName TEXT NOT NULL
);

INSERT INTO
  Departments
VALUES
  (1, 'Administration'),
  (2, 'Development'),
  (3, 'Analysis'),
  (4, 'Sales'),
  (5, 'Management');

SELECT
  Applicants.FirstName, Applicants.LastName, Departments.DepartmentName
FROM
  Applicants INNER JOIN Departments
ON
  Applicants.DepartmentID = Departments.DepartmentID;

-- Part G
DROP TABLE IF EXISTS Interviews;
CREATE TABLE Interviews (
  ApplicantID INT PRIMARY KEY,
  InterviewDate DATE NOT NULL -- YYYY-MM-DD
);

INSERT INTO
  Interviews
VALUES
  (1, '2023-07-01'),
  (6, '2023-06-20'),
  (7, '2023-06-27');

SELECT
  Applicants.FirstName, Applicants.LastName, Interviews.InterviewDate
FROM
  Applicants LEFT JOIN Interviews
ON
  Applicants.ApplicantID = Interviews.ApplicantID;

-- Part H
DROP TABLE IF EXISTS Offers;
CREATE TABLE Offers (
  ApplicantID INT PRIMARY KEY,
  Status BOOL NOT NULL,
  Value INT
);

INSERT INTO
  Offers
VALUES
  (2, TRUE, 320000),
  (3, FALSE, NULL),
  (4, TRUE, 80000);

SELECT
  Applicants.FirstName, Applicants.LastName, Offers.Status AS OfferStatus
FROM
  Applicants RIGHT JOIN Offers
ON
  Applicants.ApplicantID = Offers.ApplicantID;

-- Part I
DROP TABLE IF EXISTS Contacts;
CREATE TABLE Contacts (
  ApplicantID INT PRIMARY KEY,
  PhoneNumber TEXT NOT NULL,
  AltPhoneNumber TEXT
);

INSERT INTO
  Contacts
VALUES
  (1, '+91-9000000000', '+91-91000000'),
  (2, '+91-9001001000', NULL),
  (7, '+91-8000000000', '+91-81000000'),
  (8, '+91-7000000000', NULL);

SELECT
  Applicants.FirstName, Applicants.LastName, Contacts.PhoneNumber, Contacts.AltPhoneNumber
FROM
  Applicants FULL JOIN Contacts
ON
  Applicants.ApplicantID = Contacts.ApplicantID;
