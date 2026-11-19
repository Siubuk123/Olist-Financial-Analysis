USE Olist_Finance;
GO

SELECT COUNT(*) as orders, COUNT(distinct order_id) as uniq_orders FROM orders

SELECT COUNT(*) as customers, COUNT(distinct customer_id) as uniq_customers FROM customers

SELECT COUNT(*) as order_items, COUNT(distinct order_id) as uniq_order_items FROM order_items

SELECT COUNT(*) as products, COUNT(distinct product_id) as uniq_products FROM products

SELECT COUNT(*) as sellers, COUNT(distinct seller_id) as uniq_sellers FROM sellers

SELECT COUNT(*) as order_payments, COUNT(distinct order_id) as uniq_order_payments FROM order_payments

SELECT COUNT(*) as order_reviews, COUNT(distinct review_id) as uniq_reviews,  COUNT(distinct order_id) as uniq_order FROM order_reviews

SELECT COUNT(*) as geolocation FROM geolocation

SELECT COUNT(*) as product_category_name_translation FROM product_category_name_translation


-- Szukanie duplikatów
SELECT 
    order_id, 
    order_item_id, 
    COUNT(*) AS ile_razy
FROM order_items
GROUP BY order_id, order_item_id
HAVING COUNT(*) > 1