-- Using Common Table Expressions (CTE)
-- A CTE allows you to define a subquery block that can be referenced within the main query. 
-- It is particularly useful for recursive queries or queries that require referencing a higher level

-- First, CTEs start using a "With" Keyword. Now we get to name this CTE anything we want
-- Then we say as and within the parenthesis we build our subquery/table we want

With CTE_Example As(
Select gender, Avg(salary) avg_sal, Max(salary) max_sal, Min(salary) min_sal, Count(salary) count_sal
From employee_demographics dem
Join employee_salary sal 
	On dem.employee_id = sal.employee_id
Group by gender)

Select *
From CTE_Example;


Select Avg(avg_sal)
From (Select gender, Avg(salary) avg_sal, Max(salary) max_sal, Min(salary) min_sal, Count(salary) count_sal
From employee_demographics dem
Join employee_salary sal 
	On dem.employee_id = sal.employee_id
Group by gender) example_subquery;


-- we also have the ability to create multiple CTEs with just one With Expression

With CTE_Example As(
Select employee_id, gender, birth_date
From employee_demographics 
Where birth_date > '1985-01-01'
),
CTE_Example2 As
(
Select employee_id, salary
From employee_salary
Where salary >50000
)
Select *
From CTE_Example
Join CTE_Example2
	On CTE_Example.employee_id = CTE_Example2.employee_id
    ;



