-- === EXERCISE 1 ==
-- Fix formatting for the below query:

select name from student_table;

-- Answer --
SELECT name
FROM student_table;


-- === EXERCISE 2 ==
CREATE DATABASE FoodOrdering;

USE FoodOrdering;

CREATE TABLE Customers(
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255) ,
    email VARCHAR(255),
    created_at DATETIME
);

CREATE TABLE MenuItems(
    item_id INT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    price DECIMAL(10,2),
    availability BOOLEAN
);


-- === EXERCISE 3 ==

CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME ,
    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItems(
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),
    FOREIGN KEY (item_id)
    REFERENCES MenuItems(item_id)
);

INSERT INTO MenuItems VALUES
(1, "Pizza", "Deep Dish of Deliciousness", 10.99, TRUE),
(2, "Burger", "Brioche Bun", 8.99, TRUE),
(3, "Pasta", "Fresh Egg Pasta", 11.99, TRUE);


INSERT INTO Customers VALUES
(1, "Alice", "Adams", "alice@mail.com" , NOW()),
(2, "Brian", "Brioche", "brian@mail.com", NOW()),
(3, "Chelsey", "Cooper", "chelsey@mail.com", NOW());

INSERT INTO Orders VALUES
(1, 1, NOW()), -- Order 1 was ordered by Customer 1, therefore Alice
(2, 2, NOW()); -- Order 2 was ordered by Customer 2, therefore Brian

INSERT INTO OrderItems VALUES
(1, 1, 1, 2),  -- Order 1: 2x Pizza (the third field is our item_id, 1 is Pizza in MenuItems)
(2, 1, 2, 1),  -- Order 1: 1x Burger (the third field is our item_id, 2 is Burger in MenuItems)
(3, 2, 3, 3);  -- Order 2: 3x Pasta (the third field is our item_id, 3 is Pasta in MenuItems)

SELECT * FROM OrderItems;