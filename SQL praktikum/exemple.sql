use shop_2;

-- 1.найти кол-во покупателей мужского и женского пола 
-- поля: 
-- gender 
-- cnt

Select
gender,
count(id) As cnt
From customers
group by gender;


-- 2.найти общую сумму продуктов для каждого поставщика. 
-- на какую сумму какой поставшик поставил товаров 

-- поля: 
-- supplier_id
-- total_sum

Select
supplier_id,
sum(price * amount) AS total_sum
From products
group by supplier_id;

-- сформировать запрос, который выводит имя поставщика и сумму поставленных
-- товаров

Select
*
From suppliers t1
left join (
select 
supplier_id,
sum(price * amount) as total_sum
from products
group by supplier_id ) t2
on t1.id = t2.supplier_id;

SELECT 
 t1.name,
    COALESCE(t2.total_sum, 0) AS total_sum
    FROM suppliers t1
    LEFT JOIN (
    SELECT
  supplier_id,
  sum(price * amount) AS total_sum
    FROM products
    GROUP BY supplier_id)  t2
    ON t1.d = t2.supplier_id;
   --  
--     написать запрос, который выведет самую большую сумму товаров, поставленных одним поставщиком
SELECT 
  max(total_sum) AS max_total_sum
    FROM (
    select
    sum(price * amount ) as total_sum
    from products
    GROUP BY supplier_id)  t1;
    
-- написать запрос, который выведет самую большую сумму товаров, поставленных одним поставщиком
Select
*
From (
Select
supplier_id,
sum(price * amount ) as total_sum
    from products
    GROUP BY supplier_id
    )  t1
    where total_sum = (
    Select
    max(total_sum) as max_total_sum
    from (
    select
    sum(price * amount ) as total_sum
 from products
    GROUP BY supplier_id 
    ) t1 );


Select
supplier_id
From  products
    GROUP BY supplier_id
    having sum(price * amount) = (
    Select
    max(total_sum) as max_total_sum
    from (
    select
    sum(price * amount ) as total_sum
 from products
    GROUP BY supplier_id 
    ) t1 );

-- написать запрос, который выводит customer_id с максимальным кол-вом заказов
Select
customers_id
from orders
group by customers_id
having count(id) = (
Select
max(orders_cnt) as max_order_cnt
From 
(
Select
count(id) as orders_cnt
from  orders
GROUP BY customer_id 
    ) t1
    );

-- написать запрос, который выводит имя и фамилию покупателя и кол-во его заказов
Select
t1.first_name,
t1.last_name,
coalesce(t2.cnt, 0) as cnt
from customers t1
left join (
select
customer_id,
count(id) as cnt
from orders
group by customer_id
) t2
on t1.id=t2.customer_id;


-- написать запрос, который выводит имя и фамилию покупателя и кол-во его не оплаченных заказов
