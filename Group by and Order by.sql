-- Group by
-- When you use the GROUP BY clause in a MySQL query, it groups together rows that have the same values in the specified column or columns.
-- GROUP BY is going to allow us to group rows that have the same data and run aggregate functions on them

Select *
From employee_demographics;


-- when you use group by  you have to have the same columns you're grouping on in the group by statement
-- now the most useful reason we use group by is so we can perform out aggregate functions on them
Select gender, Avg(age)
From employee_demographics
Group by gender;



Select occupation, salary
From employee_salary
Group by occupation, salary;


Select gender, Avg(age), Max(age), Min(age), Count(age)
From employee_demographics
Group by gender;


-- Order By 
-- The ORDER BY keyword is used to sort the result-set in ascending or descending order

-- The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order use the DESC keyword
-- So let's try it out with our customer table
-- First let's start simple with just ordering by one column
SELECT *
FROM customers
ORDER BY first_name;

-- You can see that first name is ordered from a - z or Ascending

-- We can change that by specifying DESC after it
SELECT *
FROM employee_demographics;

-- if we use order by it goes a to z by default (ascending order)
SELECT *
FROM employee_demographics
ORDER BY first_name;

-- we can manually change the order by saying desc
SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

-- Now we can also do multiple columns like this:

SELECT *
FROM employee_demographics
ORDER BY gender, age;

SELECT *
FROM employee_demographics
ORDER BY gender DESC, age DESC;




