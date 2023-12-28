use shop_2;

-- написать запрос, который выводит кол-во программ лояльности
Select
count(id) AS cnt
From loyalty_programs;

-- написать запрос, который выводит наибольшую и наименьшую сумму скидкиâ
Select
max(discount) as max_discount,
min(discount) as min_discount
From loyalty_programs;

-- написать запрос, который выводит разницу между максимальной и минимальной скидкой
Select
max(discount)- min(discount) as delta
From loyalty_programs;

-- написать запрос, который выводит программы лояльности (все поля)
-- у которых процент скидки больше средней
select
*
From loyalty_programs
where discount > (
Select
avg(discount)
From loyalty_programs );


-- написать запрос, который выводит id программы лояльности и кол-во людей с этой программой
Select
t2.loyalty_programs,
count(t2.id) as total_cnt_customers
from customers t2
where t2.loyalty_programs_id is not null
group by t2.loyalty_programs_id;

-- написать запрос, который выводит название программы лояльности и кол-во покупателей
-- у которых эта программа
Select
t1.program_name,
t2.cnt
from loyalty_programs t1
left join (
select
loyalty_programs_id,
count(id) as cnt
from customers
where loyalty_program_id is not null
group by loyalty_program_id 
) t2
on t1.id = t2.loyalty_program_id;

-- доработать запрос таким образом, чтобы вывелись только те программы, у которых кол-во покупателей 
-- больше 3
Select
t1.program_name,
t2.cnt
from loyalty_programs t1
left join (
select
loyalty_programs_id,
count(id) as cnt
from customers
where loyalty_program_id is not null
group by loyalty_program_id 
) t2
on t1.id = t2.loyalty_program_id
where t2.cnt > 3;

Select * From customers

-- написать запрос, который выводит идентификатор программы лояльности в которой больше 
-- всего покупателей
Select
loyalty_programs_id,
from  customers
where loyalty_program_id is not null
Group by loyalty_program_id
Having count(*) =(
select
max(cnt) as max_cnt
from customers
select
count(*) as cnt
From customers
where loyalty_program_id is not null
Group by loyalty_program_id
) t1
)

select * from orders

-- написать запрос, который выводит customer_id покупателя с самым большим кол-вом заказов
Select
customer_id,
count(*) as cnt
From orders
Group By customer_id
Having count(*) = (
Select
max(cnt) as max_cnt

From ( Select
count(*) as cnt
from orders 
group by customer_id
) t1
)


-- написать запрос, который выводит имя и фамилию всех покупателей 
-- и кол-во заказов, которые каждый из них сделал
select 
t1.first_name,
t1.last_name,
coalesce(t2.cnt, 0) as cnt
from customer t1
Left join (
Select
customer_id,
count(*) as cnt
from orders
group by customer_id
) t2
on t1.id = t2.customer_id;



