SELECT job_posted_date
FROM job_postings_fact
LIMIT 10;

-- :: is used for casting, which means converting a value from one data type to another. 
-- e.g. SELECT '2023-02-19'::DATE, '124'::INTEGER, 'true'::BOOLEAN, '3.14'::REAL;

SELECT 
    job_title_short AS  title,
    job_location AS location,
    job_posted_date::DATE AS date -- only care about the Date from the timestamp column
FROM
    job_postings_fact;


SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM
    job_postings_fact
LIMIT 5; 


SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY    
    job_posted_count DESC;