-- create table name zepto

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


-- Data Exploration

-- count of rows
select count(*) from zepto;

-- Sample data
select * from zepto limit 10;

-- Check null values
select * from zepto 
where
category is null
or
name is null
or 
mrp is null
or 
discountpercent is null
or
availablequantity is null
or 
discountedsellingprice is null
or
weightingms is null
or
outofstock is null
or 
quantity is null;

-- different category
select distinct category from zepto order by category;

-- product in stock vs out of stock
select outofstock, count(id) as total from zepto group by outofstock;

-- product name that present multiple times
select name,count(id) as total_count from zepto
group by name
having count(id) > 1
order by count(id) desc;

-- Data cleaning

-- product with price = 0
select * from zepto where mrp = 0;
delete from zepto where mrp = 0;

-- convert paise into rupees
	update zepto
	set mrp = mrp/100.00,
	discountedsellingprice = discountedsellingprice/100.00


-- Q1. Find the top 10 best-value products based on the discount percentage.
select
distinct name,mrp,discountpercent from zepto
order by discountpercent desc
 limit 10;

 -- Q2. What are the Products with High MRP but Out of Stock.
select distinct name,mrp,outofstock from zepto
 where outofstock = true
order by mrp desc limit 10;

-- Q3. Calculate Estimated Revenue for each category.
select  category,sum(discountedsellingprice * quantity) as revenue from zepto
group by category
order by revenue desc;

-- Q4. Find all products where MRP is greater than 500 and discount is less than 10%.
select name,mrp,discountpercent from zepto
where mrp > 500 and discountpercent < 10
order by mrp desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category,round(avg(discountpercent),0) as average_discountpercent from zepto
group by category
order by average_discountpercent desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort the best value. 
select name,round(avg(discountedsellingprice / weightingms),2) as price_per_gram
from zepto
where weightingms > 100
group by name
order by price_per_gram desc;

-- Q7. Group the products into cartegories like Low,Medium, Bulk.
select distinct name,weightingms,
case
when weightingms < 1000 then 'Low'
when weightingms < 5000 then 'Medium'
else 'Bulk'
end as weight_category
from zepto;

-- Q8. What is the total Inventory weight per Category.
select category, sum(weightingms * quantity) as total_weight
from zepto
group by category
order by total_weight desc



