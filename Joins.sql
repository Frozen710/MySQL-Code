-- Joins
-- joins allow you to combine 2 tables together (or more) if they have a common column
-- doesn't mean they need the same column name, but the data in it are the same and can be used to join the tables together
-- there are several joins we will look at today, inner joins, outer joins and self joins

-- here are the first 2 tables - let's see what columns and data in the rows we have in common that we can join on

Select *
From employee_demographics;  			

Select * 
From employee_salary;

-- let's start with an inner join -- inner joins return rows that are the same in both columns
-- since we have the same columns we need to specify which table they're coming from

Select dem.employee_id, occupation, age
From employee_demographics As dem
Inner Join employee_salary As sal   
ON dem.employee_id = sal.employee_id;
 
 
-- OUTER JOINS

-- for outer joins we have a left and a right join
-- a left join will take everything from the left table even if there is no match in the join but will only return matches from the right table
-- the exact opposite is true for a right join
Select *
From employee_demographics As dem
Right Join employee_salary As sal   
ON dem.employee_id = sal.employee_id;



-- Self Join
-- a self join is where you tie a table to itself

Select emp1.employee_id As emp_santa,
emp1.first_name As first_name_santa,
emp1.last_name As last_name_santa, 
emp2.employee_id As emp_name,
emp2.first_name As first_name_emp, 
emp2.last_name As last_name_emp 
From employee_salary emp1
Join employee_salary emp2
 On emp1.employee_id + 1 = emp2.employee_id;



-- Multiple Join

Select *
From employee_demographics As dem
Inner Join employee_salary As sal   
ON dem.employee_id = sal.employee_id
Inner join parks_departments pd
On sal.dept_id = pd.department_id;

-- now notice when we did that since it's an inner join it got rid of andy because he wasn't a part of any department
-- if we do a left join we would still include him because we are taking everything from the left table which is the salary table in this instance

Select *
From parks_departments;






				