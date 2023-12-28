-- ПРАКТИКА (БД HR)
-- 1. Вывести имя, фамилию всех сотрудников и название департаментов, в которых они работают. 
-- Если отсутствует название департамента, то там будет null
        
  select
  t1.first_name,
  t1.last_name,
  t2.department_name
  from employees t1
   left join departments t2
   on t1.department_id=t2.department_id;
  
       --  2. Вывести названия департаментов, в которых никто не работает

select
*
  from departments t1
   left join employees t2
   on t1.department_id=t2.department_id;
        