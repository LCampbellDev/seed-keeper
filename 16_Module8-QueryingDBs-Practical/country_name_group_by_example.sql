-- for the example visual: https://docs.google.com/presentation/d/1t6oO2UhfNw_n0er-aM9qj-bz_MNC30UhBcol7DIant8/edit?slide=id.g3831f05ac55_0_10#slide=id.g3831f05ac55_0_10
CREATE DATABASE people;

USE people;

-- Create Table: people_data
CREATE TABLE people_data (
    name VARCHAR(50) NOT NULL,
    age INT,
    country VARCHAR(50)
);

INSERT INTO people_data (name, age, country) VALUES
('David', 25, 'Germany'),
('Jessy', 26, 'England'),
('Paul', 14, 'Australia'),
('Paul', 29, 'Wales'),
('David', 90, 'Germany'),
('David', 34, 'England'),
('Jessy', 56, 'Australia'),
('David', 7, 'Wales'),
('Paul', 64, 'Mexico'),
('Paul', 57, 'US'),
('Jessy', 86, 'Australia'),
('Paul', 35, 'Wales'),
('David', 75, 'Germany'),
('David', 86, 'England'),
('Jessy', 97, 'Australia');

-- try doing some group by, like the demo slide visual