use hr;

-- 1.-- 1. Найти самую высокую зарплату в каждом департаменте. 
-- Вывести айди департамента и самую высокую зарплату в этом департаменте

select 
department_id,
max(salary) as max_salary
from employees
group by department_id

-- 2. Найти самую высокую зарплату в каждом департаменте. 
-- Вывести название департамента и самую высокую зарплату в этом департаменте

Select
t2.department_name,
max(t1.salary) as max_salary
from employees t1
inner join departments t2
on t1.department_id=t2.department_id
group by t2.department_name

-- 3. Найти департаменты, в которых работает более 10 сотрудников
-- Вывести айди департамента и кол-во сотрудников в нем

Select
department_id,
count(*) as employees_cnt
from employees 
group by department_id
having employees_cnt >10;

-- 4. Найти департаменты, в которых работает более 10 сотрудников
-- Вывести название департамента и кол-во сотрудников в нем
Select

t2.department_name,
count(*) as employees_cnt
from employees t1
inner join departments t2
on t1.department_id=t2.department_id
group by t2.department_name
having employees_cnt >10;

-- 5. Найти сотрудников (имя/фамилия), которые зарабатывают больше всего в своем департаменте
select
departament_id,
max(salary) as  max_salary
from employees
group by departament_id

