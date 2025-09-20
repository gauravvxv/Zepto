<img alt="Zepto-Featured-Image-Option-2" src="https://github.com/user-attachments/assets/4b7ae26d-29c2-4878-9b86-b822d5680a56" width="1000" height="300" />



# Zepto - 10 Min Grocery Delivery Analysis

## Overview
This project focuses on analyzing Zepto’s inventory dataset to uncover meaningful insights about products, pricing, discounts, stock availability, and revenue contribution.
The analysis highlights trends such as best-value products, high-MRP items that are out of stock, category-wise revenue, discount patterns, price efficiency per gram, and inventory weight distribution.

The goal of this project is to transform raw inventory data into actionable insights that can help in decision-making related to pricing strategies, stock management, and overall business performance.

---

## Key KPIs

- Total Revenue: `₹122M`
- Total Products: `1670`
- Average Discount: `7.62%`

## Data Exploration
- Total Rows: `3731`
- Different Category: `14`
- Product Stock Status:
   - In Stock: `3278`
   - Out of Stock: `453`
 
## Key Insights 
 * Top Best-Value Products (Highest Discount %)
     - `Borges Extra Light Olive Oil Bottle ` and `Dukes Waffy Orange Wafers` are the top best-value product with 50% and 47% discount.


 * Products with High MRP but Out of Stock
   - `Patanjali Cow's Ghee`,`MamyPoko Pants Standard Diapers, Extra Large (12 - 17 kg)`,`Aashirvaad Atta With Mutigrains` and `Everest Kashmiri Lal Chilli Powder` are the Products with High MRP but out of stock
  
 * Top 5 Revenue per Category:
   - `packaged Food`: ₹17.35M
   - `Munchies`:  ₹13.62M
   - `Paan Corner`: ₹12.62M
   - `Meats, Fish & Eggs`: ₹3.69M
   - `Dairy, Bread & Batter`: ₹3.34M

 * Products with High Price but Low Discount
     - `Dhara Kachi Ghani Mustard Oil Jar` (Price: ₹1250, Discount: 8%)
     -  `Saffola Gold (Jar)` (Price: ₹1240, Discount: 0%).

 * category that offers the highest average discount percent
   - `Fruits and Vegetables` (discount: 15%)
   - `Meats`,`Fish & Eggs` (discount: 11%)

---

## Tools Used:
* **PostgreSQL** – for storing and managing inventory data  
* **Power BI** – for creating interactive dashboards and visualizations  
* **DAX (Data Analysis Expressions)** – for writing custom measures and calculations in Power BI
---

## Database Schema 

```
create table zepto(
id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);
```

---

## Dashboard Preview
<img width="948" height="531" alt="Screenshot 2025-09-19 220615" src="https://github.com/user-attachments/assets/16ff6eec-3843-4ba6-adfa-3a0b5f9a58c3" />


  

