Use shop_2;

-- написать запрос, который выводит название товара и название поставщика

Select
t1.name as product_name,
t2.name as suplier_name
From products t1
inner join suppliers t2
on t1.supplier_id=t2.id



-- написать запрос, который выводит название товара и название поставщика
-- вывести только те товары, которых больше 30 штук
Select
t1.name as product_name,
t2.name as supplier_name
From products t1
inner join suppliers t2
on t1.supplier_id =t2.id
where t1.amount > 30;


-- вывести названия поставщиков у которых в списке поставляемых продуктов есть продукт с 
-- кол-вом больше 30.

Select distinct
t1.name as product_name,
t2.name as supplier_name
From products t1
inner join suppliers t2
on t1.supplier_id =t2.id
where t1.amount < 30;

-- написать запрос, который выводит покупателей (имя и фамилию) 
-- у которых скидка от 10 до 20 процентов (включительно)

select * 
from customers t1
inner join loyalty_programs t2
on t1.loyalty_program_id =t2.id
where t2.discount between 10 and 20;

-- написать запрос, который выводит покупателей (имя и фамилию) 
-- у которых скидка от 10 до 20 процентов (включительно) или ее нет вовсе

select 
t1.first_name,
t1.last_name,
t2.discount
from customers t1
inner join loyalty_programs t2
on t1.loyalty_program_id =t2.id
where t2.discount between 10 and 20
or t2.id is null;

-- написать запрос, который выводит покупателей (имя и фамилию) 
-- у которых скидка от 10 до 20 процентов (включительно) или ее нет вовсе

-- вывести имя и фамилию покупателя и размер скидки

select 
t1.first_name,
t1.last_name,
coalesce(t2.discount,0) as discount
from customers t1
inner join loyalty_programs t2
on t1.loyalty_program_id =t2.id
where t2.discount between 10 and 20;
or t2.id is null;

-- написать запрос, который выводит название продуктов, которые ни разу не заказывались

select
t1.name as product_name
from products t1
left join order_details t2
on t1.id=t2.product_id
where t2.id is null;

-- написать запрос, который выводит имя и фамилию покупателя и идентификаторы продуктов, которые он заказал
Select
t1.first_name,
t1.last_name,
t3.product_id
from customers t1
left join orders t2
on t1.id=t2.customer_id
left join order_details t3
on t2.id =t3.order.id;



Select
t1.first_name,
t1.last_name,
t4.name as product_name
from customers t1
left join orders t2
on t1.id=t2.customer_id
left join order_details t3
on t2.id =t3.order.id
left join products t4
on t3.product_id =t4.id;



Select
t1.first_name,
t1.last_name,
t4.name as product_name
from customers t1
left join orders t2
on t1.id=t2.customer_id
left join order_details t3
on t2.id =t3.order.id
left join products t4
on t3.product_id =t4.id
where t2.paid_flg ='Y';


Select
t1.first_name,
t1.last_name,
t4.name as product_name
from customers t1
left join orders t2
on t1.id=t2.customer_id
left join order_details t3
on t2.id =t3.order.id
left join products t4
on t3.product_id =t4.id
where t2.paid_flg ='Y';



select
t1.name,
t1.price -t1.price / 100 * t2.discount
from products t1
inner join loyalty_programs t2
on 1=2
where t1.price -t1.price /100 * t2.discount < 30;


