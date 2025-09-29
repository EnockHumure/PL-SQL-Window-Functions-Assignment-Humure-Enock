-- =====================================================
-- Project: PL/SQL Window Functions – Schema Creation
-- Student Name: Humure Enock
-- Course: INSY 8311 – Database Development with PL/SQL
-- =====================================================

SELECT branch_location, product_name, total_sales, rn
FROM (
  SELECT c.branch_location,
         p.product_name,
         SUM(s.amount) AS total_sales,
         ROW_NUMBER() OVER (
           PARTITION BY c.branch_location
           ORDER BY SUM(s.amount) DESC
         ) AS rn
  FROM sales s
  JOIN customers c ON s.customer_id = c.customer_id
  JOIN products p  ON s.product_id = p.product_id
  GROUP BY c.branch_location, p.product_name
)
WHERE rn <= 3
ORDER BY branch_location, rn;
