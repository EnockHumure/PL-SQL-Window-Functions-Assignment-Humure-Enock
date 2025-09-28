CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    branch_location VARCHAR2(50),
    customer_type VARCHAR2(20)
);

INSERT INTO customers VALUES (1, 'Alice Uwase', 'Kigali', 'Regular');
INSERT INTO customers VALUES (2, 'Bob Mugisha', 'Huye', 'Student');
INSERT INTO customers VALUES (3, 'Claire Iradukunda', 'Musanze', 'Tourist');
INSERT INTO customers VALUES (4, 'David Habimana', 'Kigali', 'Regular');
INSERT INTO customers VALUES (6, 'muturanyi romeo', 'Kigali', 'Regular');
INSERT INTO customers VALUES (7, 'njishi kamali', 'Huye', 'Student');
INSERT INTO customers VALUES (8, 'Claire uwikunze', 'Musanze', 'Tourist');
INSERT INTO customers VALUES (9 'David bayingana', 'Kigali', 'Regular');
INSERT INTO customers VALUES (10 'kubwimana aimable', 'Huye', 'Student');