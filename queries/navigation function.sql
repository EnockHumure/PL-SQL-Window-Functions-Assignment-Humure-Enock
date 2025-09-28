SELECT week_number, weekly_sales,
    LAG(weekly_sales, 1) OVER (ORDER BY week_number) as previous_week,
    ROUND(((weekly_sales - LAG(weekly_sales, 1) OVER (ORDER BY week_number)) / 
             LAG(weekly_sales, 1) OVER (ORDER BY week_number)) * 100, 2) as growth_percentage
FROM (
    SELECT TO_CHAR(sale_date, 'WW') as week_number, SUM(amount) as weekly_sales
    FROM sales
    GROUP BY TO_CHAR(sale_date, 'WW')
)
ORDER BY week_number;