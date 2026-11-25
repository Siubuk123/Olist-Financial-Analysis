USE Olist_Finance;
GO

--- Zamówienia bez klienta 
SELECT COUNT(*) as orders_without_customer from orders o   
LEFT JOIN customers c ON c.customer_id = o.customer_id
where c.customer_id IS NULL;

--- zamowienia bez produktu
SELECT COUNT(*) as items_without_product from order_items oi 
LEFT JOIN products p ON p.product_id = oi.product_id
where p.product_id IS NULL;

--- zamowienia bez sprzedawcy
SELECT COUNT(*) as items_without_seller from order_items oi 
LEFT JOIN sellers s ON s.seller_id = oi.seller_id
where s.seller_id IS NULL;

--- platnosci bez zamowienia
SELECT COUNT(*) as payments_without_order from order_payments op   
LEFT JOIN orders o ON o.order_id = op.order_id
where o.order_id IS NULL;

--- opinie bez zamowienia
SELECT COUNT(*) as opinions_without_order from order_reviews orv   
LEFT JOIN orders o ON o.order_id = orv.order_id
where o.order_id IS NULL;


--- sprawdzenie co się stało z tym jednym zamowieniem bez platnosci oraz z tymi 775 zamowieniami bez produktow

-- 6. Podgląd zamówienia bez przypisanej płatności
SELECT 
    o.order_id,
    o.order_status,
    o.order_purchase_timestamp
FROM orders o
LEFT JOIN order_payments op ON o.order_id = op.order_id
WHERE op.order_id IS NULL;

-- 7. Rozbicie zamówień bez produktów według statusu
SELECT 
    o.order_status,
    COUNT(*) AS liczba_zamowien_bez_produktow
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL
GROUP BY o.order_status
ORDER BY liczba_zamowien_bez_produktow DESC;