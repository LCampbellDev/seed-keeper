--Use DISTINCT to retrieve a list of unique item_ids from OrdersItems to identify which items have been ordered.
SELECT DISTINCT item_id
FROM OrderItems;

--List all unique customers who have placed an order.
SELECT DISTINCT customer_id
FROM Orders;

--Retrieve all unique order dates.
SELECT DISTINCT order_date
FROM Orders;