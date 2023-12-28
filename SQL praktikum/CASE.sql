-- case analag else ,uslomnaea operatara

-- ПРАКТИКА (БД hr)

-- 1. Разделить всех сотрудников на классы по зарплате.
-- Если сотрудник получает меньше 10 тыс, то обозначить его класс как 'low'.
-- Если между 10 и 20 тыс (вкл) - 'middle'
-- Если больше 20 тыс - 'high'
-- Вывести имя/фамилию, зп и поле salary_class

use hr;


Select
first_name,
last_name
salary,
Case
when salary < 10000 then 'low'
when salary between 10000 and 20000 then 'middle'
else   'high'

end as salary_class
From employees;

-- 2. Разделить всех сотрудников по фамилии.
-- Если фамилия содержит букву A, то сотрудник войдет в группу 'A'
-- Если фамилия не содержит букву A, то сотрудник войдет в группу 'B'
-- Вывести имя/фамилию и поле lastname_class

Select
first_name,
last_name,

Case
when last_name Like '%A%' then 'A'
else   'B'
end as lastname_class

From employees;

-- 3. Найти сумму зп тех сотрудников, кто зарабатывает больше 10000
-- Вывести одно значение - sum
-- Предложить два варианта решения
Select
sum(salary) as sum
from employees
where salary > 10000;

Select
sum(
case 
when salary > 10000 then salary
else 0
end 
)
as sum
from employees;

-- 4. Найти среднее значение зп среди тех сотрудников, кто зарабатывает меньше 10000
-- Вывести одно значение - avg_salary
-- Предложить два варианта решения

select
avg(salary) as avg_salary
from employees
where salary <10000;


select
avg(
case 
when salary < 10000 then salary
else null
end 
)
as avg_salary
from employees;


