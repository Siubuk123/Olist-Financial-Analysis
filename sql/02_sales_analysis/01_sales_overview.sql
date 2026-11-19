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

-- Przychód w zależności od miesiąca
SELECT
    MONTH(o.order_purchase_timestamp) as miesiac,
    ROUND(SUM(oi.price),2) as przychod_miesiac FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    WHERE YEAR(o.order_purchase_timestamp) = 2017 AND order_status = 'delivered'
    GROUP BY MONTH(o.order_purchase_timestamp)
    ORDER BY miesiac ASC;

-- koszty dostawy poniesione przez klientów
select 
    round((SUM(freight_value)/(SUM(price)+SUM(freight_value)) * 100),2) as procent_udzialu_kosztu_dostawy
    from order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE YEAR(o.order_purchase_timestamp) = 2017 AND order_status = 'delivered'


-- Rozkład statusów zamówień (2017)
SELECT 
    order_status AS status_zamowienia,
    COUNT(order_id) AS liczba_zamowien,
    ROUND(COUNT(order_id) * 100.0 / SUM(COUNT(order_id)) OVER (), 2) AS udzial_procentowy
FROM orders
WHERE YEAR(order_purchase_timestamp) = 2017
GROUP BY order_status
ORDER BY liczba_zamowien DESC;