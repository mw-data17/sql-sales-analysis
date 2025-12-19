-- Całkowita sprzedaż według klientów
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;


-- Sprzedaż według kategorii produktów (CTE)
WITH category_sales AS (
    SELECT
        p.category,
        SUM(oi.quantity * oi.price) AS revenue
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.category
)
SELECT *
FROM category_sales
ORDER BY revenue DESC;
