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