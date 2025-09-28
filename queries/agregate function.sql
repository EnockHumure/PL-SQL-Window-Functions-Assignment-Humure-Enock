SELECT week_number, weekly_sales,
       SUM(weekly_sales) OVER (
         ORDER BY week_number ROWS UNBOUNDED PRECEDING
       ) AS running_total,
       AVG(weekly_sales) OVER (
         ORDER BY week_number ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
       ) AS four_week_avg
FROM (
    SELECT TO_NUMBER(TO_CHAR(sale_date, 'WW')) AS week_number,
           SUM(amount) AS weekly_sales
    FROM sales
    GROUP BY TO_NUMBER(TO_CHAR(sale_date, 'WW'))
)
ORDER BY week_number; 