-- tasks

-- 1 Get all customers and their addresses.
SELECT * FROM customers
JOIN addresses ON customers.id =addresses.customer_id;

--2 Get all orders and their line items.
SELECT * FROM orders
JOIN line_items ON orders.id= line_items.product_id;

--3 Which warehouses have cheetos?
SELECT warehouse.warehouse, products.description
FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON products.id = warehouse_product.product_id
WHERE products.description = 'cheetos';

--4 Which warehouses have diet pepsi
SELECT warehouse.warehouse, products.description
FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi';

--5 Get the number of orders for each customer
SELECT customers.first_name, customers.last_name
FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON addresses.id = orders.address_id
GROUP BY customers.first_name, customers.last_name;

--still need orders number

--6 How many customers do we have?
SELECT COUNT(customers) FROM customers;

--7 How many products do we carry?
SELECT COUNT(products) FROM products;

--8 What is the total available on-hand quantity of diet pepsi?
SELECT SUM (warehouse_product.on_hand)
FROM warehouse_product
JOIN products ON warehouse_product.product_id = products.id
WHERE products.description = 'diet pepsi';
