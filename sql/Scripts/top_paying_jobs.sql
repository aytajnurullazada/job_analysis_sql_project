/* 
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
 */

select * from job_postings_fact limit 10

select
	job_id,
	job_title,
	company_dim.name as company_name,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date
from 
	job_postings_fact 
left join company_dim on company_dim.company_id = job_postings_fact.company_id 
where 
	job_location = 'Anywhere' and 
	job_title_short = 'Data Analyst' and 
	salary_year_avg is not null
order by salary_year_avg desc
limit 10


