-- PARTE 1
/*
CREATE TABLE apartments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
	address VARCHAR(100),
	city VARCHAR(50),
    postal_code VARCHAR(10),
	bedrooms INT,
    area_m2 NUMERIC(6,2),
	price NUMERIC(10,2),
	available BOOLEAN,
    published_date DATE
);
*/
/*
INSERT INTO apartments (name, address, city, postal_code, bedrooms, area_m2, price, available, published_date) VALUES
('Piso 1 - Depto A', 'Av. Siempre Viva 123', 'Buenos Aires', 'C1000', 2, 55.5, 120000, TRUE, '2023-08-01'),
('Piso 1 - Depto B', 'Av. Siempre Viva 123', 'Buenos Aires', 'C1000', 1, 40.0, 85000, TRUE, '2023-08-02'),
('Piso 1 - Depto C', 'Av. Siempre Viva 123', 'Buenos Aires', 'C1000', 3, 75.0, 180000, FALSE, '2023-08-03'),
('Piso 1 - Depto D', 'Av. Siempre Viva 123', 'Buenos Aires', 'C1000', 2, 60.0, 145000, TRUE, '2023-08-04'),
('Piso 2 - Depto A', 'Calle San Martin 456', 'Corrientes', 'W3400', 2, 65.0, 155000, TRUE, '2023-08-05'),
('Piso 2 - Depto B', 'Calle San Martin 456', 'Corrientes', 'W3400', 1, 38.0, 90000, FALSE, '2023-08-06'),
('Piso 2 - Depto C', 'Calle San Martin 456', 'Corrientes', 'W3400', 3, 82.0, 210000, TRUE, '2023-08-07'),
('Piso 2 - Depto D', 'Calle San Martin 456', 'Corrientes', 'W3400', 2, 58.0, 130000, TRUE, '2023-08-08'),
('Piso 3 - Depto A', 'Av. Libertador 789', 'Cordoba', 'X5000', 1, 35.5, 95000, TRUE, '2023-08-09'),
('Piso 3 - Depto B', 'Av. Libertador 789', 'Cordoba', 'X5000', 2, 70.0, 175000, FALSE, '2023-08-10'),
('Piso 3 - Depto C', 'Av. Libertador 789', 'Cordoba', 'X5000', 3, 90.0, 230000, TRUE, '2023-08-11'),
('Piso 3 - Depto D', 'Av. Libertador 789', 'Cordoba', 'X5000', 2, 50.0, 125000, TRUE, '2023-08-12'),
('Piso 4 - Depto A', 'Calle Belgrano 321', 'Rosario', 'S2000', 2, 68.0, 165000, TRUE, '2023-08-13'),
('Piso 4 - Depto B', 'Calle Belgrano 321', 'Rosario', 'S2000', 1, 42.5, 110000, TRUE, '2023-08-14'),
('Piso 4 - Depto C', 'Calle Belgrano 321', 'Rosario', 'S2000', 4, 120.0, 350000, FALSE, '2023-08-15'),
('Piso 4 - Depto D', 'Calle Belgrano 321', 'Rosario', 'S2000', 3, 85.5, 195000, TRUE, '2023-08-16'),
('Piso 5 - Depto A', 'Av. 9 de Julio 654', 'Buenos Aires', 'C1001', 1, 45.0, 100000, TRUE, '2023-08-17'),
('Piso 5 - Depto B', 'Av. 9 de Julio 654', 'Buenos Aires', 'C1001', 2, 62.0, 140000, FALSE, '2023-08-18'),
('Piso 5 - Depto C', 'Av. 9 de Julio 654', 'Buenos Aires', 'C1001', 3, 88.0, 220000, TRUE, '2023-08-19'),
('Piso 5 - Depto D', 'Av. 9 de Julio 654', 'Buenos Aires', 'C1001', 2, 57.5, 135000, TRUE, '2023-08-20'),
('Piso 6 - Depto A', 'Calle Rivadavia 987', 'Mendoza', 'M5500', 2, 54.0, 115000, TRUE, '2023-08-21'),
('Piso 6 - Depto B', 'Calle Rivadavia 987', 'Mendoza', 'M5500', 1, 36.5, 88000, FALSE, '2023-08-22'),
('Piso 6 - Depto C', 'Calle Rivadavia 987', 'Mendoza', 'M5500', 3, 95.0, 250000, TRUE, '2023-08-23'),
('Piso 6 - Depto D', 'Calle Rivadavia 987', 'Mendoza', 'M5500', 2, 72.0, 190000, TRUE, '2023-08-24'),
('Piso 7 - Depto A', 'Av. Costanera 147', 'Corrientes', 'W3400', 1, 33.0, 78000, TRUE, '2023-08-25'),
('Piso 7 - Depto B', 'Av. Costanera 147', 'Corrientes', 'W3400', 2, 66.0, 160000, TRUE, '2023-08-26'),
('Piso 7 - Depto C', 'Av. Costanera 147', 'Corrientes', 'W3400', 3, 80.0, 200000, FALSE, '2023-08-27'),
('Piso 7 - Depto D', 'Av. Costanera 147', 'Corrientes', 'W3400', 2, 60.0, 145000, TRUE, '2023-08-28'),
('Piso 8 - Depto A', 'Calle Mitre 258', 'Salta', 'A4400', 2, 58.0, 130000, TRUE, '2023-08-29'),
('Piso 8 - Depto B', 'Calle Mitre 258', 'Salta', 'A4400', 3, 100.0, 280000, FALSE, '2023-08-30');
*/
-- Ejercicio 1:
SELECT * FROM apartments
WHERE available = TRUE
ORDER BY price;
-- Ejercicio 2:
SELECT ROUND(AVG(price), 2) AS avg_price, city FROM apartments
GROUP BY city;
-- Ejercicio 3:
SELECT * FROM apartments
WHERE bedrooms >= 2 AND area_m2 <60;
--------------------------------------------------------------------------------------------------------
-- PARTE 2
/*
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(30),
    price NUMERIC,
    quantity INT,
    sale_date DATE
);
*/
/*
INSERT INTO sales (product, category, price, quantity, sale_date) VALUES
('Mouse', 'Electronics', 15, 4, '2023-07-10'),
('Keyboard', 'Electronics', 30, 2, '2023-07-11'),
('Notebook', 'Stationery', 8, 10, '2023-07-12'),
('Pen', 'Stationery', 2, 25, '2023-07-13'),
('Headphones', 'Electronics', 40, 3, '2023-07-14'),
('Monitor', 'Electronics', 120, 1, '2023-07-15'),
('Desk Chair', 'Furniture', 85, 2, '2023-07-16'),
('Notebook Case', 'Accessories', 25, 3, '2023-07-17'),
('Printer Paper', 'Stationery', 6, 15, '2023-07-18'),
('USB Drive', 'Electronics', 12, 5, '2023-07-19'),
('Desk Lamp', 'Furniture', 35, 4, '2023-07-20'),
('Stapler', 'Stationery', 7, 6, '2023-07-21'),
('Calculator', 'Electronics', 20, 3, '2023-07-22'),
('Water Bottle', 'Accessories', 10, 8, '2023-07-23'),
('Laptop Stand', 'Accessories', 45, 2, '2023-07-24'),
('Office Desk', 'Furniture', 150, 1, '2023-07-25'),
('Whiteboard', 'Furniture', 60, 1, '2023-07-26'),
('Marker Set', 'Stationery', 5, 12, '2023-07-27'),
('Mouse Pad', 'Accessories', 8, 7, '2023-07-28'),
('Webcam', 'Electronics', 50, 2, '2023-07-29'),
('Smartphone', 'Electronics', 300, 1, '2023-07-30'),
('Notebook Pro', 'Electronics', 900, 1, '2023-07-31'),
('File Cabinet', 'Furniture', 120, 1, '2023-08-01'),
('Backpack', 'Accessories', 40, 3, '2023-08-02'),
('Binder', 'Stationery', 4, 20, '2023-08-03'),
('Headset Stand', 'Accessories', 15, 5, '2023-08-04'),
('Desk Organizer', 'Accessories', 12, 6, '2023-08-05'),
('Laptop Sleeve', 'Accessories', 30, 2, '2023-08-06'),
('Paper Clips', 'Stationery', 1, 50, '2023-08-07'),
('Surge Protector', 'Electronics', 25, 3, '2023-08-08'),
('Pen Holder', 'Accessories', 5, 10, '2023-08-09');
*/
-- Ejercicio 1
SELECT * FROM sales
WHERE category = 'Electronics';
-- Ejercicio 2
SELECT category, SUM(price * quantity) AS total_revenue FROM sales
GROUP BY category;
-- Ejercicio 3
SELECT category, SUM(price * quantity) AS max_revenue FROM sales
GROUP BY category
ORDER BY max_revenue DESC
LIMIT 1;
-- Ejercicio 4
SELECT * FROM sales
WHERE price > 20;
-- Ejercicio 5
SELECT product, SUM(quantity) AS quantity_sold FROM sales
GROUP BY product
ORDER BY product;
-- Ejercicio 6
SELECT product, ROUND(AVG(price * quantity),2) AS avg_sale FROM sales
GROUP BY product
ORDER BY product;
-- Ejercicio 7
SELECT product, SUM(quantity) AS quantity_sold from sales
GROUP BY product
ORDER BY quantity_sold DESC
LIMIT 3;
-- Ejercicio 8
SELECT * FROM sales
WHERE sale_date > '2023-07-12';
-- Ejercicio 9
SELECT category, SUM(price * quantity) AS revenue FROM sales
GROUP BY category
HAVING SUM(price * quantity) > 50
ORDER BY revenue DESC;
-- Ejercicio 10
SELECT * FROM sales
WHERE product LIKE 'H%';
-- Ejercicio 11
SELECT category, ROUND(AVG(quantity),2) AS avg_quantity FROM sales
GROUP BY category;
-- Ejercicio 12
SELECT product, SUM(price * quantity) AS revenue FROM sales
GROUP BY product
ORDER BY product;
-- Ejercicio 13
SELECT * FROM sales
WHERE category = 'Electronics' AND quantity > 2 AND price < 40;
---------------------------------------------------------------------
-- Tarea SQL en pgAdmin (localhost:8080) by Christian Maximiliano Fages.