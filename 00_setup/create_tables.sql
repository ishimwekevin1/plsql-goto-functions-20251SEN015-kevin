-- PL/SQL GOTO and Functions Assignment
-- Database Setup
-- Student: ISHIMWE Kevin
-- ID: 20251SEN015
-- Group: B

-- Drop existing tables if they exist
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE departments CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

-- Create departments table
CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(100) NOT NULL
);

-- Create employees table
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    salary NUMBER(12,2) NOT NULL,
    hire_date DATE NOT NULL,
    dept_id NUMBER,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

-- Insert departments
INSERT INTO departments VALUES (10, 'IT');
INSERT INTO departments VALUES (20, 'Finance');
INSERT INTO departments VALUES (30, 'Human Resources');
INSERT INTO departments VALUES (40, 'Marketing');
INSERT INTO departments VALUES (50, 'Operations');

-- Insert employees
INSERT INTO employees VALUES
(101, 'John', 'Doe', 450000, DATE '2020-01-15', 10);

INSERT INTO employees VALUES
(102, 'Jane', 'Smith', 600000, DATE '2019-06-20', 20);

INSERT INTO employees VALUES
(103, 'Peter', 'Brown', 850000, DATE '2018-03-10', 10);

INSERT INTO employees VALUES
(104, 'Mary', 'Johnson', 350000, DATE '2021-09-05', 30);

INSERT INTO employees VALUES
(105, 'David', 'Wilson', 1200000, DATE '2017-11-12', 40);

INSERT INTO employees VALUES
(106, 'Sarah', 'Taylor', 700000, DATE '2022-02-18', 50);

COMMIT;

-- Verify the data
SELECT * FROM departments;

SELECT * FROM employees;
