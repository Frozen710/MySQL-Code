-- Unions
-- A union is how you can combine rows together- not columns like we have been doing with joins where one column is put next to another
-- Joins allow you to combine the rows of data

-- Now you should keep it the same kind of data otherwise if you start mixing tips with first_names it would be really confusing, but you can do it.
-- Let's try it out and use Union to bring together some random data, then we will look at an actual use case

Select first_name, last_name
From employee_demographics       
Union All 
Select first_name, last_name
From employee_salary;       
                 

-- Now Let's actually try to use UNION
-- The Parks department is trying to cut their budget and wants to identify older employees they can push out or high paid employees who they can reduce pay or push out
-- let's create some queries to help with this

Select first_name, last_name, 'Old Man'As Label 
From employee_demographics       
Where age > 40 And gender = 'Male'
Union 
Select first_name, last_name, 'Old Lady'As Label 
From employee_demographics       
Where age > 40 And gender = 'Female'
Union 
Select first_name, last_name, 'Highly Paid Employee'As Label 
From employee_salary        
Where salary > 70000
Order by first_name, last_name 
;  


