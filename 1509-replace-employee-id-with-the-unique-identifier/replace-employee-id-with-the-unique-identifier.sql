# Write your MySQL query statement below
SELECT emp.name, emp1.unique_id
FROM Employees as emp
LEFT JOIN EmployeeUNI as emp1
    ON emp.id = emp1.id;