-- Which employees have a salary that is less than the average salary of all employees
    
SELECT
    last_name
FROM employees
WHERE salary < (
    SELECT avg(salary) FROM employees);

-- Retrieve last_name, first_name of all employees getting the maximum salary 
SELECT
    last_name,
    first_name
FROM employees
WHERE salary = (
    SELECT max(salary) FROM employees);
-- Retrieve all the employees last_name and first_name who are getting the second highest salary
SELECT
    max(salary)
FROM employees
WHERE salary < (
    SELECT max(salary) FROM employees);

SELECT salary
FROM employees 
ORDER by salary desc;

SELECT min(salary) FROM (select salary from employees WHERE ROWNUM < 3);

-- Retrieve the last_name, first_name of all employees who earn more 
-- than the average
-- salary of all employees working in department 90

SELECT 
    last_name,
    first_name
FROM employees 
WHERE salary >= (
                    SELECT avg(salary) 
                    FROM employees 
                    WHERE department_id = 90

                );
-- Find the department names which do not have any employees working in them – Solve
-- using sub-queries
SELECT 
    department_name
FROM departments
WHERE department_id 
NOT IN (SELECT department_id 
        FROM employees 
        WHERE department_id 
        IS NOT NULL);

--Find the last_name, salary, job_id, department_id of all employees who work in the same
-- department and doing the same job as that of ‘Russell’ (‘Russell’ is the last name)
SELECT last_name,
       salary,
       job_id,
       department_id
FROM employees WHERE job_id IN (
        SELECT job_id 
        FROM employees 
        WHERE last_name = 'Russell');
--Retrieve the city name where employee ‘Ernst’ is working

SELECT city 
FROM locations
WHERE location_id IN (
                SELECT location_id 
                FROM departments
                WHERE department_id IN (
                            SELECT department_id 
                            FROM employees
                            WHERE last_name = 'Ernst'));
-- Retrieve the last_name, first_name of all employees who earn more than the min salary of
-- all employees working in Executive department
SELECT last_name,
       first_name,
       department_id
FROM employees 
WHERE department_id = (
                        SELECT department_id 
                        FROM departments 
                        WHERE department_name = 'Executive'
                      )
AND salary > (SELECT 
              MIN(salary) 
              FROM employees
              );
              
-- Retrieve the last_name, first_name of all employees who earn more than the salary of all
-- employees working in Finance department
SELECT salary, first_name,last_name
FROM employees
WHERE salary >= ALL
(
SELECT salary 
FROM employees 
WHERE department_id IN (SELECT department_id 
                        FROM departments 
                        WHERE departments.department_name = 'Finance'));
-- Retrieve Employees who are not IT programmers and whose salary is less than that of any
-- IT programmer.
SELECT employee_id,
        last_name
FROM employees
WHERE job_id NOT LIKE '%IT%'
AND salary < ANY(
        SELECT salary 
        FROM employees 
        WHERE job_id LIKE '%IT%'

    );
                        


















