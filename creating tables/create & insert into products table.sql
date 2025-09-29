-- =====================================================
-- Project: PL/SQL Window Functions – Schema Creation
-- Student Name: Humure Enock
-- Course: INSY 8311 – Database Development with PL/SQL
-- =====================================================

CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    category VARCHAR2(50),
    price NUMBER(8,2)
);

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

