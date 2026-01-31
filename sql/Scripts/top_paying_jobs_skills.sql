/* Question: What skills are required for the top-paying data analyst jobs?
-  Use the top 10 highest-paying Data Analyst jobs from first query
-  Add the specific skills required for these roles
*/

with top_paying_jobs as (
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
)

select 
	top_paying_jobs.*,
	skills_dim.skills 
from top_paying_jobs
inner join skills_job_dim on skills_job_dim.job_id = top_paying_jobs.job_id
inner join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id 