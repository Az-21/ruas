-- Sample table
DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
  EmployeeID INTEGER PRIMARY KEY,
  FirstName TEXT NOT NULL,
  LastName TEXT NOT NULL,
  Department TEXT NOT NULL,
  Salary INTEGER NOT NULL
);

INSERT INTO Employees VALUES (1, 'John', 'Doe', 'Sales', 60000);
INSERT INTO Employees VALUES (2, 'Jane', 'Doe', 'Sales', 50000);
INSERT INTO Employees VALUES (3, 'Jane', 'Smith', 'HR', 60000);
INSERT INTO Employees VALUES (4, 'Michael', 'Johnson', 'IT', 70000);
INSERT INTO Employees VALUES (5, 'Emily', 'Brown', 'Marketing', 55000);
INSERT INTO Employees VALUES (6, 'David', 'Lee', 'Finance', 75000);
INSERT INTO Employees VALUES (7, 'Martha', 'Lee', 'Sales', 75000);
INSERT INTO Employees VALUES (8, 'John', 'Johnson', 'Sales', 45000);
INSERT INTO Employees VALUES (9, 'Joe', 'Johnson', 'Sales', 80000);

-- Part A
SELECT
  FirstName, LastName, Salary
FROM
  Employees
WHERE
  Department = "Sales" AND Salary > 50000;

-- Part B
SELECT
  FirstName, LastName, Salary
FROM
  Employees
WHERE
  Department = "Sales" AND Salary > 50000
ORDER BY
  Salary DESC;
