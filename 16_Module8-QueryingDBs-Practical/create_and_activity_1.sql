USE FoodOrdering;

-- DATA
-- INSERT INTO MenuItems
-- VALUES
-- (1, 'Pizza', 'Cheese and tomato pizza', 9.99, TRUE),
-- (2, 'Burger', 'Beef burger with lettuce and tomato', 6.99, TRUE),
-- (3, 'Pasta', 'Spaghetti with marinara sauce', 7.49, FALSE),
-- (4, 'Salad', 'Fresh mixed greens with vinaigrette', 4.99, TRUE),
-- (5, 'Soup', 'Tomato soup with croutons', 3.49, FALSE);
-- -- (item_id, name, description, price, availability)
-- INSERT INTO Customers 
-- VALUES
-- (1, 'Alice', 'Johnson', 'alice@example.com', '2024-01-15'),
-- (2, 'Bob', 'Smith', 'bob@example.com', '2024-02-20'),
-- (3, 'Charlie', 'Brown', 'charlie@example.com', '2024-03-10');

-- INSERT INTO Orders 
-- VALUES
-- (1, 1, '2024-04-01'),  
-- (2, 2, '2024-04-01'),  
-- (3, 3, '2024-03-30'), 
-- (4, 1, '2024-04-05'), 
-- (5, 2, '2024-04-04'); 

-- INSERT INTO OrderItems 
-- VALUES
-- (1, 1, 1, 2), 
-- (2, 2, 2, 3),  
-- (3, 3, 3, 1), 
-- (4, 4, 1, 1),  
-- (5, 5, 2, 2);

SELECT * FROM OrderItems; 


SELECT * FROM menuitems;
SELECT name, price FROM menuitems;
SELECT name AS Item_Name, price AS Cost FROM menuitems;