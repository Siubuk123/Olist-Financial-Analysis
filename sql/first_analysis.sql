USE Olist_Finance;

-- Total revenue from delivered orders
SELECT ROUND(SUM(payment_value), 2) AS przychod from order_payments p
JOIN orders o ON p.order_id = o.order_id
where o.order_status = 'delivered';

-- Number of customers by state
SELECT customer_state, COUNT(customer_id) as liczba_klientow from customers
GROUP BY customer_state
ORDER BY liczba_klientow DESC;

-- Products with their category names in English
select products.product_id, products.product_category_name, product_category_name_translation.product_category_name_english
from products
INNER JOIN product_category_name_translation ON products.product_category_name = product_category_name_translation.product_category_name

-- Average delivery time for delivered orders
SELECT AVG(DATEDIFF(day, order_purchase_timestamp, order_delivered_customer_date)) as avg_time_delivery FROM orders
WHERE order_status = 'delivered';

-- Filtracja z HAVING
select seller_id from order_items
group by seller_id
having count(order_id) > 100