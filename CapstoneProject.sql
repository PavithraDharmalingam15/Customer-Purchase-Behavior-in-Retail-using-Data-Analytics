use student;
select first_name from customers join orders on customers.customer_id = orders.customer_id;
select * from order_item;
select order_id, (round(sum(Total_sales),2)) as total_sale from order_item group by order_id;
	select c.first_name,
	(round(sum(oi.Total_sales),0)) as sales
	 from customers as c 
	 left join orders as o on c.customer_id = o.customer_id 
	 left join order_item as oi on o.order_id = oi.order_id group by c.first_name;
select s.store_name, (round(sum(oi.Total_sales),0)) as sales
from stores as s
left join orders as o on s.store_id = o.store_id
left join order_item as oi on o.order_id = oi.order_id group by s.store_name;
 select product_name, order_id from products 
 left join order_item on products.product_id = order_item.product_id
 where order_id is NULL;
 select product_name, product_id from products
 where not exists (select null from order_item where products.product_id = order_item.product_id);
 
 select s.store_name, (round(sum(oi.Total_sales),0)) as sales,
 rank() over (order by sum(oi.Total_sales) desc)  as rankno 
from stores as s
left join orders as o on s.store_id = o.store_id
left join order_item as oi on o.order_id = oi.order_id group by s.store_name;

alter table orders add column new_date DATE;
update orders
set new_date = (str_to_date(`order_date`, '%d-%m-%Y'));
alter table orders add column new_sdate DATE;
update orders
set new_sdate = (str_to_date(`shipped_date`, '%d-%m-%Y'));
select new_date , new_sdate from orders;
delete from orders
where concat(new_date,new_sdate) is null;

select order_id, 
datediff (new_sdate,new_date) as no_of_days 
from orders;

select order_id, 
(case
when order_status >= 0 and order_status <= 1 then 'First Category'
when order_status >= 1 and order_status <= 2 then 'Second Category'
when order_status >= 2 and order_status <= 3 then 'Third Category'
when order_status >= 4 then 'Fourth Category'
end) as category
 from orders;

select o.order_date,s.store_name, p.product_name , round(oi.Total_sales,0) as Sales
from orders as o
left join order_item as oi on o.order_id = oi.order_id
left join products as p on oi.product_id = p.product_id
left join stores as s on o.store_id = s.store_id ;


create temporary table temp_orders ( 
    order_id int, customer_id int, 
    order_date date, shipped_date date, 
    store_is int,staff_id int, customer_name VARCHAR(50), sales double); 
    
    select * from temp_orders;
select* from order_item;




select * from stocks;
alter table stocks 
add column Id int auto_increment primary key;


