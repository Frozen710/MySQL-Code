 -- Where clause
 -- The WHERE clause is used to filter records (rows of data)

-- It's going to extract only those records that fulfill a specified condition.

-- So basically if we say "Where name is = 'Alex' - only rows were the name = 'Alex' will return
-- So this is only effecting the rows, not the columns
 
 Select *
 From employee_salary
 Where first_name = 'Leslie'
 ;
 
 
Select *
From employee_salary
Where salary <= 50000;
 
 
Select * 
From employee_demographics
Where gender != 'Female';
 
 
Select * 
From employee_demographics
Where birth_date > '1985-01-01';
 
 
 -- And Or Not -- Logical Operators
 
 
Select * 
From employee_demographics
Where birth_date > '1985-01-01'
And gender = 'male';
 
Select * 
From employee_demographics
Where birth_date > '1985-01-01'
Or Not gender = 'male';


Select * 
From employee_demographics
Where (first_name = 'Leslie' And age = 44) Or age > 55;


-- Like Statement
-- Special characters of those are ("%" and "_")
-- "%" meaning is anything and "_" means a specific value 
Select * 
From employee_demographics
Where first_name Like 'Jer%';


Select * 
From employee_demographics
Where first_name Like 'a__';


Select * 
From employee_demographics
Where first_name Like 'a__%';

