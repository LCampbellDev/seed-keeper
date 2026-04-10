USE FoodOrdering;

SELECT * FROM menuitems;
-- SELECT name, price FROM menuitems;
-- SELECT name AS Item_Name, price AS Cost FROM menuitems;

-- Find all menu items that cost more than £5.
select name, price from menuitems
where price > 5;

-- Find all menu items that are less than £5 and are currently available.
select name, price, availability from menuitems
where price < 5 and availability = true;

select * from menuitems WHERE name = 'Pizza';

-- Update the available status of a menu item, where name is ‘Pizza’, to: FALSE.
UPDATE menuitems
SET availability = false 
WHERE name = 'Pizza'; 

-- Retrieve the top two most recent orders from the Orders table.
SELECT *
FROM Orders
ORDER BY order_date DESC
LIMIT 2;

select CONCAT('hi', ' my name is', ' Addi'); 

select * from menuitems;

-- the item 'name' has the description 'description'
select CONCAT('the item: ', name,  ' has the description: ', description) as descriptive_string
from menuitems;

-- Find the average price of items in the MenuItems table.
SELECT AVG(price) AS average_price
FROM MenuItems;
-- Calculate the total quantity of items ordered across all orders from the OrdersItems table.
SELECT SUM(quantity) AS total
FROM OrderItems; 
-- Determine the most expensive and cheapest menu items.
select * from menuitems;
SELECT min(price), max(price) FROM MenuItems;

SELECT availability 
FROM menuitems
GROUP BY availability;

SELECT availability, AVG(price) as average_price
FROM menuitems
GROUP BY availability;
