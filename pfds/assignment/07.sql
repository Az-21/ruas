-- Sample table
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
  StudentID INTEGER PRIMARY KEY,
  FirstName TEXT NOT NULL,
  LastName TEXT NOT NULL,
  Age INTEGER NOT NULL,
  Score FLOAT NOT NULL
);

INSERT INTO Students VALUES (1, 'John', 'Doe', 20, 85);
INSERT INTO Students VALUES (2, 'Jane', 'Smith', 19, 92);
INSERT INTO Students VALUES (3, 'Michael', 'Johnson', 18, 78);
INSERT INTO Students VALUES (4, 'Emily', 'Brown', 20, 90);
INSERT INTO Students VALUES (5, 'David', 'Lee', 19, 88);

-- Part A
INSERT INTO Students VALUES (6, 'Emma', 'Johnson', 20, 85.5);

-- Part B
UPDATE
  Students
SET
  Age = 22
WHERE
  StudentID = 3;

-- Part C
DELETE FROM
  Students
WHERE
  StudentID = 4;

-- Part D
SELECT * FROM
  Students
ORDER BY
  Score DESC
LIMIT
  3;

-- Part E
SELECT
  MIN(Score) AS MinimumScore,
  MAX(Score) AS MaximumScore
FROM
  Students;

-- Part F
SELECT
  COUNT(*) AS TotalNumberOfStudents
FROM
  Students;

-- Part G
SELECT
  AVG(Score) AS AverageScore
FROM
  Students;

-- Part H
SELECT
  SUM(Score) AS SumOfScore
FROM
  Students;
