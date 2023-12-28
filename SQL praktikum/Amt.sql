use shop;
-- 1. Выведите список имен покупателей, продавцов и итоговую сумму заказа (amt).
-- В выборке должны присутствовать три атрибута — cname, sname, amt.
Select
t1.CNAME,
t3.SNAME,
t2.amt
From customers t1
inner join orders t2
on t1.cust_id=t2.cust_id
inner join sellers t3
on t2.sell_id=t3.sell_id;


-- 2.В выборке должны присутствовать три атрибута — cname, sname, amt.
-- 2. Выведите список имен покупателей и итоговую сумму всех заказов (amt).
-- В выборке должны присутствовать два атрибута — cname, amt_total.
Select
t1.CNAME,
sum(t2.amt) as amt_total
From customers t1
inner join orders t2
on t1.cust_id=t2.cust_id
group by t1.cname;

-- 3. Выведите имена покупателей, которые совершили покупку, чья итоговая 
-- сумма превышает среднее значение цен в таблице.
-- В выборке должно присутствовать два атрибута — cname, amt.
Select
t1.CNAME,
t2.amt
From customers t1
inner join orders t2
on t1.cust_id=t2.cust_id
where t2.amt >(select avg(amt) from orders);

-- 4. Выведите имена только тех покупателей, которые сделали заказ.
-- Предусмотрите в выборке также имена продавцов.
-- Примечание: покупатели и продавцы должны быть из разных городов.
-- В выборке должно присутствовать два атрибута — cname, sname.

Select
t1.CNAME,
t3.SNAME
From customers t1
inner join orders t2
on t1.cust_id=t2.cust_id
where t1.city <> t3.city

