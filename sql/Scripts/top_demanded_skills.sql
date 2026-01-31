/* Question: What are the most in-demand skills for data analysts?
- Identify the top 5 in-demand skills for a data analyst.
*/


select 
	skills_dim.skills as skills,
	count(skills_job_dim.job_id) as count
from 
	job_postings_fact
inner join skills_job_dim on skills_job_dim.job_id  = job_postings_fact.job_id 
inner join skills_dim on skills_dim.skill_id  = skills_job_dim.skill_id 
where job_postings_fact.job_title_short = 'Data Analyst'
group by skills_dim.skills
order by count desc
limit 5