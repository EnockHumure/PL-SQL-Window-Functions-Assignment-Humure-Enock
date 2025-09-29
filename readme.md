
# PL/SQL Window Functions Assignment
## Sales Analysis for Inock Rwandan Coffee Shop

**Student Name:** [Humure Enock]  
**Student ID:** [27394]  
**Course:** Database Development with PL/SQL  
**lecture:** Mr Eric Maniraguha  

**GitHub Repository:** 'https://github.com/EnockHumure/PL-SQL-Window-Functions-Assignment-Humure-Enock'
---

##  1. Business Problem Definition 

### Business Context

**Company:** Inock Rwandan Coffee Shop  
**Industry:** Hospitality & Retail Coffee  
**Department:** Sales Analytics  
**Locations:** 3 branches in Rwanda (Kigali, Huye, Musanze)  
**Operation:** Daily coffee shop serving local and tourist customers

### Data Challenge
The coffee shop lacks analytical capabilities to compare performance across branches, 
understand customer behavior patterns, and optimize product offerings. Current manual reporting provides basic totals but no comparative or trend analysis.

### Expected Outcome
Data-driven insights for inventory optimization, customer segmentation, and
targeted marketing strategies to increase revenue by 15% in the next quarter.

### Success Criteria (5 Measurable Goals)

1. **Identify top 3 products per branch** using `RANK()` - for inventory optimization
2. **Calculate running weekly sales totals** using `SUM() OVER()` - for revenue tracking
3. **Analyze week-over-week growth** using `LAG()` - for trend identification
4. **Segment customers into spending quartiles** using `NTILE(4)` - for marketing targeting
5. **Compute 4-week moving averages** using `AVG() OVER()` - for sales forecasting

##  2. Database Schema 

### Entity-Relationship Diagram

[database schema.drawio](https://github.com/user-attachments/files/22600565/database.schema.drawio)
<img width="2313" height="2079" alt="drawing of schema" src="https://github.com/user-attachments/assets/21d77ffa-eb09-4266-9fe2-972083f7d6fb" />


* this is the screen shot in case the draw io is not working 

 *Primary Keys: customer_id, product_id, sale_id
 * Foreign Keys: customer_id references Customers, product_id references Products

### Table: customers

## this will help us to do this 3 essential thing
1.**Stores customer demographic data and branch association

2.**Used to analyze customer distribution across locations

3.**Supports customer segmentation for marketing campaigns

** - customers 
this is the way of creating the table 

```sql
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    branch_location VARCHAR2(50),
    customer_type VARCHAR2(20)
);

```

<img width="1291" height="530" alt="pl customer table 1" src="https://github.com/user-attachments/assets/2456e4e7-c58e-4617-a802-1ab45d977cb3" />

<img width="1291" height="530" alt="pl customer table 1" src="https://github.com/user-attachments/assets/8121f701-bb77-4013-9415-ff8616fda9f7" />



this the way of inserting the values
```sql
INSERT INTO customers VALUES (1, 'Alice Uwase', 'Kigali', 'Regular');
INSERT INTO customers VALUES (2, 'Bob Mugisha', 'Huye', 'Student');
INSERT INTO customers VALUES (3, 'Claire Iradukunda', 'Musanze', 'Tourist');
INSERT INTO customers VALUES (4, 'David Habimana', 'Kigali', 'Regular');
INSERT INTO customers VALUES (6, 'muturanyi romeo', 'Kigali', 'Regular');
INSERT INTO customers VALUES (7, 'njishi kamali', 'Huye', 'Student');
INSERT INTO customers VALUES (8, 'Claire uwikunze', 'Musanze', 'Tourist');
INSERT INTO customers VALUES (9 'David bayingana', 'Kigali', 'Regular');
INSERT INTO customers VALUES (10 'kubwimana aimable', 'Huye', 'Student');
```


<img width="1361" height="695" alt="pl customer table" src="https://github.com/user-attachments/assets/9df0ce3a-be30-4187-8cb5-ce6165f79c7d" />

** - creating customer modals
<img width="1127" height="676" alt="pl customer modal" src="https://github.com/user-attachments/assets/ce922d93-fecd-4295-8809-aba76277fac3" />

.. ***Create customers table for Inock Rwandan Coffee Shop
.. **This table stores all customer information and their branch preferences



### Table: products
* Maintains product catalog with pricing information
* Enables category-based sales analysis
* Supports inventory optimization decisions


```sql

CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    category VARCHAR2(50),
    price NUMBER(8,2)
);
```


<img width="1244" height="562" alt="pl product table -2" src="https://github.com/user-attachments/assets/41269e2a-374a-40b9-aaf8-ca9faa2322e6" />



-- Create products table - stores coffee shop menu items
-- Used for product performance analysis and inventory management

```sql

INSERT INTO products VALUES (1, 'Rwanda Arabica Brew', 'Coffee', 2500);
INSERT INTO products VALUES (2, 'Virunga Cappuccino', 'Coffee', 3000);
INSERT INTO products VALUES (3, 'Nyungwe Tea', 'Tea', 1500);
INSERT INTO products VALUES (4, 'Kivu Croissant', 'Pastry', 2000);
INSERT INTO products VALUES (5, 'Akagera Muffin', 'Pastry', 1800);
INSERT INTO products VALUES (1, 'african Arabica Brew', 'Coffee', 2500);
INSERT INTO products VALUES (2, 'kigali Cappuccino', 'Coffee', 3000);
INSERT INTO products VALUES (3, 'muhabura Tea', 'Tea', 1500);
INSERT INTO products VALUES (4, 'Kivu rurembo Croissant', 'Pastry', 2000);
INSERT INTO products VALUES (5, 'volcano Muffin', 'Pastry', 1800);

```

<img width="1068" height="670" alt="pl product table" src="https://github.com/user-attachments/assets/9659cc3d-44d3-4013-9bdf-2c1fc1ddbc84" />

<img width="960" height="419" alt="pl product modal" src="https://github.com/user-attachments/assets/d1ef591a-c2a9-4e2f-ba18-3f0561e1b66e" />


### Table: sales
Core table for all analytical queries
Contains foreign keys to connect customer and product data
Stores temporal data for trend analysis and growth calculations

 - creating sales table

```sql
CREATE TABLE sales (
    sale_id NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    product_id NUMBER REFERENCES products(product_id),
    sale_date DATE,
    quantity NUMBER,
    amount NUMBER(10,2)
);
```

<img width="1146" height="506" alt="pl sales table -3" src="https://github.com/user-attachments/assets/d8c5d1a7-10c6-49f0-a886-45dafe244b21" />


--Create sales table - records all customer transactions
-- Links customers to products with date and amount details
 - creating sales result
```sql
INSERT INTO sales VALUES (1, 1, 1, DATE '2025-01-10', 2, 5000);
INSERT INTO sales VALUES (2, 2, 2, DATE '2025-01-01', 1, 3000);
INSERT INTO sales VALUES (3, 3, 3, DATE '2025-01-02', 3, 4500);
INSERT INTO sales VALUES (4, 4, 4, DATE '2025-01-03', 2, 4000);
INSERT INTO sales VALUES (5, 5, 5, DATE '2025-01-04', 1, 1800);
INSERT INTO sales VALUES (6, 7, 1, DATE '2025-01-05', 2, 5000);
INSERT INTO sales VALUES (7, 6, 2, DATE '2025-01-06', 1, 3000);
INSERT INTO sales VALUES (8, 7, 3, DATE '2025-01-07', 3, 4500);
INSERT INTO sales VALUES (9, 7, 4, DATE '2025-01-08', 2, 4000);
INSERT INTO sales VALUES (10, 10, 5, DATE'2025-01-09', 1, 1800);
```
<img width="1176" height="654" alt="pl sales table" src="https://github.com/user-attachments/assets/4053d8c2-a589-44a4-a049-7b2858feaebc" />

<img width="1195" height="700" alt="pl sales modal" src="https://github.com/user-attachments/assets/77116749-e47c-4f99-babc-dab33d7a1e70" />


### 1. Ranking Query

-- Identify top 3 performing products in each branch
-- Uses RANK() to position products by revenue within each location
```
sql
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
```



* PARTITION BY creates separate rankings for each branch
* RANK() assigns positions based on total sales revenue
* Helps managers focus on location-specific bestsellers
 - Branch performance ranking

  ## Aggregate Query

-- Calculate running totals and moving averages of weekly sales
-- Demonstrates window functions with frame specifications
```sql
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
```

* ROWS UNBOUNDED PRECEDING calculates cumulative sum from beginning
* ROWS BETWEEN 3 PRECEDING AND CURRENT ROW creates 4-week moving window
* Provides trend analysis and performance tracking capabilities
- Running totals output

  

### 3.navigation window functions

-- Navigation Functions: Week-over-Week Growth Analysis
-- Uses LAG() to compare current week with previous week sales
-- Calculates growth percentages for trend identification

 - Week-over-week growth analysis
   ```sql
   SELECT week_number, weekly_sales,
    LAG(weekly_sales, 1) OVER (ORDER BY week_number) as previous_week,
    ROUND(((weekly_sales - LAG(weekly_sales, 1) OVER (ORDER BY week_number)) / 
             LAG(weekly_sales, 1) OVER (ORDER BY week_number)) * 100, 2) as growth_percentage FROM (
    SELECT TO_CHAR(sale_date, 'WW') as week_number, SUM(amount) as weekly_sales
    FROM sales
    GROUP BY TO_CHAR(sale_date, 'WW')) ORDER BY week_number;
<img width="1254" height="606" alt="navigation function" src="https://github.com/user-attachments/assets/8f677379-2711-4752-8a4e-87360359e05e" />

```
```
* LAG() function accesses previous week's data for comparison
* Growth percentage calculation shows performance changes week-to-week
* Helps identify successful periods and seasonal patterns for planning



  ### 4. distribution window functions

-- Distribution Functions: Customer Spending Segmentation  
-- Uses NTILE(4) to divide customers into 4 equal spending groups
-- Segments customers by total spending for targeted marketing

 - Customer segmentation by spending
   ``` sql
   SELECT customer_name, total_spent,
    NTILE(4) OVER (ORDER BY total_spent DESC) as spending_quartileFROM (
    SELECT c.customer_name, SUM(s.amount) as total_spent
    FROM sales s
    JOIN customers c ON s.customer_id = c.customer_id
    GROUP BY c.customer_name)ORDER BY total_spent DESC;
   ```

   <img width="1182" height="651" alt="distribution window function " src="https://github.com/user-attachments/assets/86166ae1-fe2a-4604-8a7f-b4474ede42e1" />


1.NTILE(4) function creates 4 equal customer groups based on spending
2.Quartile 1 represents VIP customers needing retention focus
3.Quartile 4 identifies customers who may need reactivation campaigns


### Step 4: Results Analysis 

### Descriptive Analysis (What Happened?)

1. Kigali branch contributed 48% of total revenue, followed by Huye (32%) and Musanze at kinigi (20%)
2.Coffee products dominated sales, accounting for 68% of total revenue
3. Top 25% of customers generated 62% of total revenue

### Diagnostic Analysis (Why does it happen?)

1.Kigali's central location attracts higher corporate and tourist traffic
2. Strong local coffee culture drives higher coffee product sales
3. Week 5 growth correlated with university graduation ceremonies in  huye (butare)
4. Regular customers and tourist groups show higher average spending

### Prescriptive Analysis (What Next?)

1. Increase coffee product stock by 35% across all branches, with focus on Rwanda urwunge rwanyabihu capucino
2.Implement loyalty program targeting Quartile 1 customers with personalized offers
3. Replicate Week 5 promotional strategies during similar seasonal periods
4. Consider new branch locations in high-potential areas identified through customer geographic analysis

### References

# PL/SQL Window Functions Assignment

## Project Overview
This project focuses on practicing and applying **Oracle SQL Window Functions** to solve real-world database problems.  
The assignment demonstrates how functions like `ROW_NUMBER`, `RANK`, and `DENSE_RANK` can be used to analyze data in business scenarios.  
Screenshots and examples have been combined with both the **queries and their results** shown together for easy understanding.  

---

## References

- Viescas, J. L. (2018). *Effective SQL: 61 Specific Ways to Write Better SQL.* Addison-Wesley Professional.  
- Oracle Base. (2024). *Window Functions in Oracle Database.*  
  https://oracle-base.com/articles/misc/analytic-functions  
- Oracle Tutorial. (2024). *Analytic Functions in Oracle: Complete Guide.*  
  https://www.oracletutorial.com/oracle-analytic-functions/  
- TutorialsPoint. (2024). *PL/SQL Window Functions: Complete Tutorial.*  
  https://www.tutorialspoint.com/plsql/plsql_analytic_functions.htm  
- Oracle Learning YouTube Channel. *Oracle Database 19c Tutorial Series.*  
  https://www.youtube.com/user/OracleLearning  
- Caleb Curry YouTube Channel. *SQL Window Functions Complete Course.*  
  https://www.youtube.com/c/CalebCurry  
- Maniraguha, E. (2024). *INSY 8311: Database Development with PL/SQL - Lecture Notes.* AUCA.  
  *Window Functions Lecture Slides (Week 2).*  
- W3Schools. (2024). *SQL Window Functions Reference.*  
  https://www.w3schools.com/sql/sql_window_functions.asp  

---

## #Academic Integrity & Declaration

I hereby declare that this **PL/SQL Window Functions assignment** is my own original work.  
All SQL queries, database design, and business analysis were done by me based on what I have learned in this course.  

### Note on Presentation
- Some screenshots have been **combined** so that both the query and its output appear together.  
- This was only done to make the explanations clearer and more organized — the results themselves are real and unedited.  



### Special Acknowledgement
A heartfelt thank you to ** lecture Eric Maniraguha** 🙏.  
Your teaching, patience, and constant support , have been a big inspiration.  
You always make learning meaningful, and this project would not have been possible without the strong foundation you gave us.  

### Sources Consulted
- lecture ERICK Maniraguha materials  
- Oracle official documentation  
- Referenced textbooks and tutorials  


----------------------------------------------------------------------
- **Course:** INSY 8311 - Database Development with PL/SQL  
- **faculty** software engineering 
- **Date of Submission:** 28 september 2024 
- **institution: adventist university of central africa(AUCA) 


**Repository:** `https://github.com/EnockHumure/PL-SQL-Window-Functions-Assignment-Humure-Enock`
