USE Olist_Finance;
GO

-- Przykład: liczenie braków (NULL) w datach w tabeli orders
SELECT
    COUNT(*) - COUNT(order_purchase_timestamp) AS brak_daty_zakupu,
    COUNT(*) - COUNT(order_approved_at) AS brak_daty_zatwierdzenia,
    COUNT(*) - COUNT(order_delivered_carrier_date) AS brak_daty_przewoznika,
    COUNT(*) - COUNT(order_delivered_customer_date) AS brak_daty_dostawy,
    COUNT(*) - COUNT(order_estimated_delivery_date) AS brak_daty_szacowanej,
    COUNT(*) - COUNT(customer_id) as brak_id_klienta
FROM orders;


SELECT
    order_status,
    COUNT(*) AS liczba_zamowien,
    COUNT(*) - COUNT(order_approved_at) AS brak_zatwierdzenia,
    COUNT(*) - COUNT(order_delivered_carrier_date) AS brak_przewoznika,
    COUNT(*) - COUNT(order_delivered_customer_date) AS brak_dostawy
FROM orders
GROUP BY order_status
ORDER BY liczba_zamowien DESC;

-- product's category without english translation
SELECT
    p.product_category_name,
    COUNT(*) as liczba_produktow
FROM products p
LEFT JOIN product_category_name_translation t
    ON p.product_category_name = t.product_category_name
WHERE t.product_category_name IS NULL
GROUP BY p.product_category_name
ORDER BY liczba_produktow DESC;