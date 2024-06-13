-- Updates a customer record
UPDATE customers
SET first_name = 'Fatma'
WHERE id = 1004;


CREATE TRIGGER customer_audit
AFTER UPDATE ON customers
FOR EACH ROW
   INSERT INTO customer_audit (customer_id, operation, timestamp)
   VALUES (NEW.id, 'INSERT', NOW());







INSERT INTO customers (id, first_name, last_name, email)
VALUES (1006, 'Mariam', 'Mohammad', 'fs@gmail.com');

UPDATE customers SET first_name='Mark' WHERE id=1002;
DELETE FROM customers WHERE id=1007;




{"before":null,"after":{"id":1005,"first_name":"Fatma","last_name":"Suroor","email":"f@gmail.com"},"source":{"version":"2.5.4.Final","connector":"mysql","name":"dbserver1","ts_ms":1718264705000,"snapshot":"false","db":"inventory","sequence":null,"table":"customers","server_id":223344,"gtid":null,"file":"mysql-bin.000003","pos":9557,"row":0,"thread":8,"query":null},"op":"c","ts_ms":1718264705697,"transaction":null}}



USE mysql;

CREATE TRIGGER customer_audit
AFTER INSERT ON customers
FOR EACH ROW
   INSERT INTO customer_audit (customer_id, operation, timestamp)
   VALUES (NEW.id, 'INSERT', NOW());


 CREATE TRIGGER delete_audit
AFTER DELETE ON customers
FOR EACH ROW
   INSERT INTO customer_audit (customer_id, operation, username, timestamp)
   VALUES (old.id, 'DELETE', USER(), NOW());


   CREATE TABLE customer_audit (
         id INT AUTO_INCREMENT PRIMARY KEY,
         customer_id INT,
       operation VARCHAR(10),
     username VARCHAR(255),
         timestamp TIMESTAMP
     );


    CREATE TABLE table_deletion_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_name VARCHAR(255),
    username VARCHAR(255),
    timestamp TIMESTAMP



    CREATE USER 'Fatma'@'%' IDENTIFIED BY 'fPassword';

    GRANT ALL PRIVILEGES ON inventory.* TO 'Fatma'@'%';

mysql -u Fatma -p


GRANT SUPER ON *.* TO 'Fatma'@'localhost';

