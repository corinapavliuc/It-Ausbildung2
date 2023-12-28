use hr;

-- 1. Найти кол-во сотрудников с зп выше 10000
-- Вывести одно значение - employees_cnt

select
count(*) as avg_salary
from employees
where salary > 10000;


select
count (
case 
when salary > 10000 then 1
end 
)
as avg_salary
from employees;

