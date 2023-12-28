use hr;


-- 1. Найти сотрудников (имя, фамилию, зп), которые зарабатывают больше всех в компании
select
first_name ,
last_name,
salary
from employees
where salary = (select max(salary) from employees);

-- 2. Найти сотрудников (имя, фамилию, зп), которые зарабатывают меньше среднего по компании
-- и работают в департаментах 90, 60, 80, 100

select
first_name ,
last_name,
salary
from employees
where department_id in (90,60,80,100) 
and salary < (select avg(salary) from employees);

-- 3. Найти сотрудников (имя, фамилию, зп), которые зарабатывают меньше среднего по компании 
-- и работают в департаментах 'Executive', 'IT', 'Sales', 'Finance'employees

select
t1.first_name ,
t1.last_name,
t1.salary
from employees t1
inner join departments t2
on t1.department_id=t2.department_id
where t2.department_name in ('Executive', 'IT', 'Sales', 'Finance') 
and salary < (select avg(salary) from employees);

-- 4. Вывести сотрудников (имя, фамилия, должность), 
-- которые работают на следующих должностях 'Finance Manager', 'Programmer', 'Sales Manager'
select
t1.first_name,
t1.last_name,
t2.job_title
from employees t1
inner join jobs t2
on t1.job_id=t2.job_id
where t2.job_title in ('Finance Manager', 'Programmer', 'Sales Manager');
