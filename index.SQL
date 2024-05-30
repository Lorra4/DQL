SELECT * FROM Customer;  /*for 1*/

/*for 2*/
SELECT product_name, category 
FROM Product
WHERE Price BETWEEN 5000 AND 10000;

/*for 3*/
SELECT * 
FROM Product
ORDER BY Price DESC;

/*for 4*/
SELECT 
    COUNT(*) AS total_orders,
    AVG(total_amount) AS avg_amount,
    MAX(total_amount) AS max_amount,
    MIN(total_amount) AS min_amount
FROM Orders;

/*for 5*/
SELECT #Product_id, COUNT(*) AS order_count
FROM Orders
GROUP BY #Product_id;

/*for 6*/
SELECT #Customer_id
FROM Orders
GROUP BY #Customer_id
HAVING COUNT(*) > 2;

/*for 7*/
SELECT 
    MONTH(OrderDate) AS month,
    COUNT(*) AS order_count
FROM Orders
WHERE YEAR(OrderDate) = 2020
GROUP BY MONTH(OrderDate);


/*for 8*/
SELECT 
    p.product_name,
    c.customer_Name,
    o.OrderDate
FROM Orders o
JOIN Product p ON o.#Product_id = p.Product_id
JOIN Customer c ON o.#Customer_id = c.Customer_id;

/*for 9*/
SELECT *
FROM Orders
WHERE OrderDate BETWEEN DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AND CURDATE();

/*for 10*/
SELECT c.Customer_id
FROM Customer c
LEFT JOIN Orders o ON c.Customer_id = o.#Customer_id
WHERE o.#Customer_id IS NULL;