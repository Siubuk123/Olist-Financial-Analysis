USE Olist_Finance;

-- Przychód ogółem
SELECT ROUND(SUM(oi.price), 2) AS czysty_przychod_z_dostarczonych_produktow
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered' AND YEAR(o.order_purchase_timestamp) = 2017

-- Łączna liczba zamówień
SELECT COUNT(order_id) as laczna_liczba_zamowien from orders
WHERE YEAR(order_purchase_timestamp) = 2017;

-- Łączna liczba klientów
select COUNT(DISTINCT customer_unique_id) as laczna_liczba_klientow from customers
JOIN orders o ON customers.customer_id = o.customer_id
WHERE YEAR(o.order_purchase_timestamp) = 2017

-- srednia wartosc zamowienia AOV
select AVG(payment_value) as AOV from order_payments
JOIN orders o ON order_payments.order_id = o.order_id
WHERE YEAR(o.order_purchase_timestamp) = 2017

-- Ilość zamowien w zaleznosci od miesiaca

SELECT 
    COUNT(order_id) as liczba_zamowien,
    MONTH(orders.order_purchase_timestamp) as miesiac
    FROM orders
WHERE YEAR(orders.order_purchase_timestamp) = 2017
GROUP BY MONTH(orders.order_purchase_timestamp)
ORDER BY miesiac ASC;

-- Udział procentowy płatności kartą

