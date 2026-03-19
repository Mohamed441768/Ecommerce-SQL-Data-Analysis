# 🛒 E-Commerce SQL Data Analysis Project

## 📌 Overview
This project focuses on analyzing an E-commerce dataset using SQL to solve **20 real-world business scenarios**.  
The goal is to transform raw data into meaningful insights that support **data-driven decision-making**.

---

## 🎯 Business Problem
The company faced several challenges:
- Difficulty in linking customers, orders, and products
- Lack of visibility into sales trends and performance
- Inability to identify high-value customers
- Errors in financial calculations (e.g., arithmetic overflow)

---

## 💡 Objectives
- Analyze customer behavior and purchasing patterns  
- Calculate accurate revenue after discounts  
- Identify top-performing products and cities  
- Detect high-value customers for targeted marketing  
- Understand monthly sales trends  

---

## 🗂️ Dataset Description
The dataset includes:
- **Customers**: customer_id, customer_name, city  
- **Orders**: order_id, customer_id, product_id, quantity, discount, order_date, order_status, payment_method  
- **Products**: product_id, product_name, category, price  

---

## 🛠️ Tools & Technologies
- SQL Server  
- SQL (Joins, Aggregations, Group By, Having, Subqueries)  

---

## 📊 Key SQL Concepts Used
- INNER JOIN  
- GROUP BY  
- Aggregate Functions (SUM, COUNT, AVG)  
- HAVING Clause  
- Filtering (WHERE)  
- Data Type Casting (to avoid overflow errors)  

---

## 📈 Key Insights
- A small group of customers contributes significantly to total revenue  
- Certain cities generate higher sales compared to others  
- Top-selling products drive a large portion of business performance  
- Monthly trends reveal fluctuations in sales that can guide inventory planning  
- Payment methods vary in contribution to total revenue  

---

## 🚀 Sample Query
```sql
SELECT c.customer_name,
       SUM(price * quantity * (1 - discount / 100.0)) AS total_spent
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN products p ON p.product_id = o.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;