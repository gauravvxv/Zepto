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

