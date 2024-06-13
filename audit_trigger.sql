-- Updates a customer record
UPDATE customers
SET first_name = 'Fatma'
WHERE id = 1004;


-- Insert a customers record
INSERT INTO customers (id, first_name, last_name, email)
VALUES (1006, 'Mariam', 'Mohammad', 'fs@gmail.com');


-- Deletes a customers record
DELETE FROM customers WHERE id=1007;


-- Creates a trigger called delete_audit
CREATE TRIGGER delete_audit
AFTER DELETE ON customers
FOR EACH ROW
INSERT INTO customer_audit (customer_id, operation, username, timestamp)
VALUES (old.id, 'DELETE', USER(), NOW());


-- Creates a trigger called update_audit
CREATE TRIGGER update_audit
AFTER UPDATE ON customers
FOR EACH ROW
INSERT INTO customer_audit (customer_id, operation, username, timestamp)
VALUES (NEW.id, 'UPDATE', USER(), NOW());


-- Creates a trigger called insert_audit
CREATE TRIGGER insert_audit
AFTER INSERT ON customers
FOR EACH ROW
INSERT INTO customer_audit (customer_id, operation, username, timestamp)
VALUES (NEW.id, 'INSERT', USER(), NOW());


-- Creates a table called customer_audit
CREATE TABLE customer_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    operation VARCHAR(10),
    username VARCHAR(255),
    timestamp TIMESTAMP
);







