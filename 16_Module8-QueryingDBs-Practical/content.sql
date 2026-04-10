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
