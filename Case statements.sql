-- Case statement 
-- A Case Statement allows you to add logic to your Select Statement, sort of like an if else statement in other programming languages or even things like Excel


Select first_name, last_name, age,
Case 
  When age <= 30 Then 'Young'
  When age Between 31 and 50 Then 'Old'
  When age >= 51 Then "On death's door"
  End As Age_bracket
FROM employee_demographics;

-- Pay increase bonus
-- <50000 = 5%
-- >50000 = 7%
-- Bonus to Finance = 10%

Select first_name, last_name, salary,
Case
  When salary <50000 Then salary + (salary * 1.05)
  When salary >50000 Then salary + (salary * 1.07)
End As New_salary
From employee_salary;

Select first_name, last_name, salary,
Case
  When salary <50000 Then salary + (salary * 1.05)
  When salary >50000 Then salary + (salary * 1.07)
End As New_salary,
Case 
  When dept_id = 6 Then salary * .10
End As Bonus
From employee_salary;




