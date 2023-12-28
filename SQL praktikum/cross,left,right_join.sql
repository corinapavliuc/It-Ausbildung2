use hr;

select
t1.first_name,
t1.last_name,
t2.department_name

from employees t1
left join departments t2
ON t1.department_id=t2.department_id;

-- left join--

Select distinct location_id From departments
Select  * From departments
Select * From locations 

select
t1.location_id,
t1.city,
t2.department_name

from locations t1
left join departments t2
ON t1.location_id=t2.location_id;

-- UNION a dubla a doua grupa--

select
t1.location_id,
t1.city,
t2.department_name

from locations t1
left join departments t2
ON t1.location_id=t2.location_id;
UNION
select
t1.location_id,
t1.city,
t2.department_name

from locations t1
left join departments t2
ON t1.location_id=t2.location_id;

Delete From locations
where location_id=1500;


-- cross join--
select
t1.location_id,
t1.city,
t2.department_name

from locations t1
inner join departments t2
ON 1 = 1;

-- Union all a unii doua grupuri de select--
select
first_name,
last_name
From employees
where job_id ='IT_prog'
Union all
select
first_name,
last_name
From employees
where job_id ='Sa_man'


