-- =====================================================
-- Project: PL/SQL Window Functions – Schema Creation
-- Student Name: Humure Enock
-- Course: INSY 8311 – Database Development with PL/SQL
-- =====================================================

CREATE TABLE sales (
    sale_id NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    product_id NUMBER REFERENCES products(product_id),
    sale_date DATE,
    quantity NUMBER,
    amount NUMBER(10,2)
);

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