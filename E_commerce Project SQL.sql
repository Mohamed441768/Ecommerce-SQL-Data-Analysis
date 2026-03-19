--Q1/Retrieve all orders that occurred in 2023.
Select *from orders 
where year(order_date)=2023 

--Q2/Retrieve all orders with status = 'Delivered'.
SELECT * FROM Orders 
WHERE order_status = 'Delivered';

--Q3/Retrieve all customers who live in Cairo.
Select *from customers
where City='Cairo'; 

--Q4/ Retrieve all products with price greater than 5000.
Select *from products
where Price >5000;

--Q5/ Retrieve all orders where the discount is greater than 10%.
Select * from orders 
where discount > 10 ;

--Q6/ Count the total number of orders.
Select COUNT(*) AS Total_Orders 
FROM Orders ;

--Q7/Calculate the total quantity of products sold.
Select SUM(quantity) AS total_quantity
from orders 

--Q8/Calculate the average product price.
SELECT category, AVG(price) AS AVG_product
FROM Products
GROUP BY category;

--Q9/Count the number of orders for each order status (Delivered, Cancelled, Pending).
Select order_status ,COUNT(*) AS Count_ordre_status
From orders 
Group By order_status;

--Q10/Count the number of customers in each city.
Select COUNT(*),City AS Count_Customers 
From customers 
Group By City ;

--Q11/Retrieve each order along with the customer name who made it.
Select order_id,o.order_date,c.customer_id, c.customer_name 
from orders o
join customers c
ON c.customer_id=o.customer_id

--Q12/Retrieve each product along with the total quantity sold.
Select p.product_id,p.product_name,SUM(quantity) AS total_sold
from products p 
join orders o 
ON p.product_id=o.product_id
Group By p.product_id,p.product_name;
--Q13/Calculate total sales for each product (price × quantity × (1 - discount/100)).
Select p.product_id,p.product_name,
   SUM(CAST(price AS DECIMAL(18,2)) * CAST(quantity AS DECIMAL(18,2)) 
        *(1 - CAST(discount AS BIGINT) / 100)) AS Total_Sales_After_Dis
FROM products p  JOIN orders o 
    ON p.product_id = o.product_id
GROUP BY p.product_id,p.product_name;
--Q14/Find the top 5 customers based on total spending.
SELECT TOP 5 
p.product_id, p.product_name,
       SUM(CAST(price AS DECIMAL(18,2)) * CAST(quantity AS DECIMAL(18,2)) 
           * (1 - CAST(discount AS DECIMAL(18,2)) / 100.0)) AS Total_Sales_After_Dis
From products p 
JOIN orders o ON p.product_id = o.product_id
JOIN customers c ON c.customer_id=o.customer_id
Group BY p.product_id, p.product_name
Order BY Total_Sales_After_Dis DESC;

--Q15/Retrieve customers who made more than 3 orders.
SELECT c.customer_name, COUNT(o.order_id) AS Total_Orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 3;

--Q16/Find the total sales for each city.
Select c.City,
   SUM(CAST(price AS DECIMAL(18,2)) * CAST(quantity AS DECIMAL(18,2)) 
        *(1 - CAST(discount AS BIGINT) / 100)) AS City_Total_Sales
FROM products p  JOIN orders o 
    ON p.product_id = o.product_id
    join customers c ON c.customer_id=o.customer_id
GROUP BY C.City
ORDER BY City_Total_Sales DESC;

--Q17/Find the most sold product (by quantity).
Select top 1
p.product_name ,sum(o.quantity) AS Total_Quantity_Sold
from orders o join products p
ON o.product_id=p.product_id
Group By p.product_name
Order By Total_Quantity_Sold DESC;

--Q18/Calculate the total revenue generated for each payment method.
Select o.payment_method , 
SUM(CAST(price AS DECIMAL(18,2)) * CAST(quantity AS DECIMAL(18,2)) 
  *(1 - CAST(discount AS BIGINT) / 100)) Total_Revenue
  From orders o Join products p
  ON o.product_id=p.product_id
  Group By o.payment_method 
  Order BY Total_Revenue DESC ;

  --Q19/Find the monthly total sales trend.
 Select YEAR(o.order_date) AS Order_Year,
 MONTH(o.order_date) AS Order_Month,
SUM(CAST(price AS DECIMAL(18,2)) * CAST(quantity AS DECIMAL(18,2)) 
  *(1 - CAST(discount AS BIGINT) / 100)) AS Monthly_Revenue
  From orders o join products p 
  ON p.product_id=o.product_id
  Group By YEAR(o.order_date),MONTH(o.order_date) 
  Order BY Monthly_Revenue DESC ;

  --Q20/20.Identify high-value customers who:1•made more than 3 orders 2•and spent more than 20000
  Select c.customer_name ,
  COUNT(o.order_id) AS Total_Orders,
  SUM(CAST(price AS DECIMAL(18,2)) * CAST(quantity AS DECIMAL(18,2)) 
  *(1 - CAST(discount AS BIGINT) / 100))  AS Total_Spent
  From Orders o Join Customers c
  ON c.customer_id=o.customer_id
  join products p 
  ON p.product_id=o.product_id
  Group BY customer_name
  Having COUNT( o.order_id )> 3 AND 
  SUM(CAST(price AS DECIMAL(18,2)) * CAST(quantity AS DECIMAL(18,2)) 
  *(1 - CAST(discount AS BIGINT) / 100)) > 2000 
  Order BY Total_Spent DESC;

