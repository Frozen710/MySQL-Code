-- Data cleaning


Select * 
From layoffs;

-- first thing we want to do is create a staging table. This is the one we will work in and clean the data. We want a table with the raw data in case something happens

Create Table layoffs_staging
Like layoffs;


Select * 
From layoffs_staging;

Insert layoffs_staging
Select * 
From layoffs;

-- 1. Remove Duplicate
-- 2. Standarize the Data
-- 3. Null Values or blank values
-- 4. Remove Any Columns

-- 1. Remove Duplicates
-- First let's check for duplicates

Select *, 
Row_Number() Over(
Partition by company,location,industry,total_laid_off,`date`) as row_num
From layoffs_staging;

With duplicate_cte As
(Select *, 
Row_Number() Over(
Partition by company,location,industry,total_laid_off,`date`,
stage,country,funds_raised_millions) as row_num
From layoffs_staging)

Select *
From duplicate_cte
Where row_num > 1; 



With duplicate_cte As
(Select *, 
Row_Number() Over(
Partition by company,location,industry,total_laid_off,`date`,
stage,country,funds_raised_millions) as row_num
From layoffs_staging)

Select *
From duplicate_cte
Where row_num > 1; 

-- one solution, which I think is a good one. Is to create a new column and add those row numbers in. Then delete where row numbers are over 2, then delete that column

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` Int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


Select *
From layoffs_staging2
Where row_num > 1;

Insert Into layoffs_staging2
Select *, 
Row_Number() Over(
Partition by company,location,industry,total_laid_off,`date`,
stage,country,funds_raised_millions) as row_num
From layoffs_staging;

-- If your Sql don't delete you try this application then you run the code
Set SQL_SAFE_UPDATES = 0;

-- now that we have this we can delete rows were row_num is greater than 2

Delete
From layoffs_staging2
Where row_num > 1;

Select *
From layoffs_staging2;



-- Standarizing data

Select company, Trim(company)
From layoffs_staging2;

Update layoffs_staging2
Set company = Trim(company);

Select *
From layoffs_staging2
Where industry like 'Crypto%';

Update layoffs_staging2
Set industry = 'Crypto'
Where industry Like 'Crypto%';

Select *
From layoffs_staging2
Where country Like 'United States%'
Order by 1;


Select Distinct country, Trim(Trailing '.' From country)
From layoffs_staging2
Order by 1;

Update layoffs_staging2
Set country = Trim(Trailing '.' From country)
Where country like 'United States%';


-- We can go change date column

Select `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
From layoffs_staging2;

Update layoffs_staging2
Set `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

Alter table layoffs_staging2
Modify Column `date` Date;

-- 3. Null Values or blank values

Select *
From layoffs_staging2
Where total_laid_off Is Null
And percentage_laid_off Is Null;

Update layoffs_staging2
Set industry = Null 
Where industry = '';


Select *
From layoffs_staging2
Where industry Is NUll 
Or industry = '';

Select *
From layoffs_staging2
Where company = 'Airbnb';

Select t1.industry, t2.industry
From layoffs_staging2 t1
Join layoffs_staging2 t2
	On t1.company = t2.company
Where (t1.industry Is Null Or t1.industry = '')
And t2.industry Is Not Null;

Update layoffs_staging2 t1
Join layoffs_staging2 t2
	On t1.company = t2.company
Set t1.industry = t2.industry
Where t1.industry Is Null 
And t2.industry Is Not Null;



Select *
From layoffs_staging2;


Select *
From layoffs_staging2
Where total_laid_off Is Null
And percentage_laid_off Is Null;

Delete 
From layoffs_staging2
Where total_laid_off Is Null
And percentage_laid_off Is Null;


Select *
From layoffs_staging2;


Alter Table layoffs_staging2
Drop Column row_num;






