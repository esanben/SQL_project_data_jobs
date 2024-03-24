/* 
Subqueries and Common Table Expressions (CTEs) are used for organizing and simplifying complex queries.

> Helps break down the query into smaller, more manageable parts
> When to use one over the other?
    * Subqueries are for simpler queries
    * CTEs are for more complex queries.
*/

-- Subqueries: query nested inside a larger query.
-- It can be used in SELECT, FROM, AND WHERE clauses.

SELECT *
FROM ( -- subquery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;
-- subquery ends here


-- Common Table Expressions (CTEs) define a temporary result set that you can reference
-- * Can reference within a SELECT, INSERT, UPDATE, or DELETE statement
-- * Defined with WITH

WITH january_jobs AS ( -- CTE definition starts here
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
 ) -- CTE definition ends here

SELECT *
FROM january_jobs;


-- More examples on subqueries
-- Subqueries are exectuted first and the results are passed to the outer query
-- * It is used when you want to perform a calculation before the main query can complete its calculation

SELECT
    company_id,
    name AS company_name
FROM 
    company_dim
WHERE company_id IN ( -- start of subquery
    SELECT
        company_id
    FROM 
        job_postings_fact
    WHERE
        job_no_degree_mention = true
    ORDER BY
        company_id
); -- end of subquery


-- CTE is a temporary reuslt set that you can reference within a SELECT, INSERT, UPDATE or DELETE stateent.
-- * It exists only during the execution of a query
-- * It is a defined query that can be referenced in the main query or other CTEs
-- * WITH - used to define CTE at the beginning of a query.

/* Example
Find the companies that have the most job openings.
-- Get the total number of job postings per company id (job_posting_fact)
-- Return the total number of jobs with the company name (company_dim)
*/

WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM   
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM 
    company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC;

