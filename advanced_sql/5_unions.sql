SELECT *
FROM january_jobs;

SELECT *
FROM february_jobs;

SELECT *
FROM march_jobs;

/* 
UNION - combines results from two or more SELECT statements
      - They need to have the same amount of columns, and the data type must match.
*/

-- Get jobs and companies from January
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

-- Get jobs and companies from February
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION

-- Get jobs and companies from March
SELECT 
    job_title_short,
    company_id,
    job_location
FROM   
    march_jobs;

/*
UNION ALL - combines the results of two or more SELECT statements
          - They need to have the same amount of columns, and the data type must match.
          - Returns ALL rows, even duplicates (unlike UNION)
*/

-- Get jobs and companies from January
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

-- Get jobs and companies from February
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION ALL

-- Get jobs and companies from March
SELECT 
    job_title_short,
    company_id,
    job_location
FROM   
    march_jobs;