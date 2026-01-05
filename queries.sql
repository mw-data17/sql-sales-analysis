/* 1. Ranking klientów pod kątem wygenerowanego obrotu.
Użycie funkcji okienkowej DENSE_RANK(), aby precyzyjnie uszeregować klientów 
nawet w przypadku identycznych wyników sprzedaży.
*/
SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_sales,
    DENSE_RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS sales_rank
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name;


/* 2. Analiza wydajności kategorii produktowych (CTE).
Zastosowanie CTE do obliczenia przychodów, a następnie wyliczenie 
procentowego udziału każdej kategorii w całkowitym obrocie firmy.
*/
WITH category_sales AS (
    SELECT
        p.category,
        SUM(oi.quantity * oi.price) AS category_revenue
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.category
)
SELECT 
    category,
    category_revenue,
    -- Funkcja okienkowa wyliczająca udział procentowy w całości
    ROUND(category_revenue * 100.0 / SUM(category_revenue) OVER(), 2) AS pct_share
FROM category_sales
ORDER BY category_revenue DESC;
