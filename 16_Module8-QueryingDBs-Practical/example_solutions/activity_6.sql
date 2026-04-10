--Group Orders by customer_id and count the total number of orders each customer has placed.
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id;

--Identify the date with the highest number of orders.
SELECT
    order_date,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY order_date
ORDER BY total_orders DESC
LIMIT 1;

--Calculate the total number of orders each customer has placed.
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id;