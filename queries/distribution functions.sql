-- =====================================================
-- Project: PL/SQL Window Functions – Schema Creation
-- Student Name: Humure Enock
-- Course: INSY 8311 – Database Development with PL/SQL
-- =====================================================

SELECT customer_name, total_spent,
    NTILE(4) OVER (ORDER BY total_spent DESC) as spending_quartile
FROM (
    SELECT c.customer_name, SUM(s.amount) as total_spent
    FROM sales s
    JOIN customers c ON s.customer_id = c.customer_id
    GROUP BY c.customer_name
)
ORDER BY total_spent DESC;