-- 1. Total Revenue by Product Type
SELECT product_type, 
       SUM(revenue_generated) AS Total_Revenue
FROM supply_chain_data
GROUP BY product_type
ORDER BY Total_Revenue DESC;

-- 2. Average Lead Time by Supplier
SELECT supplier_name, 
       AVG(lead_times) AS Avg_Lead_Time
FROM supply_chain_data
GROUP BY supplier_name
ORDER BY Avg_Lead_Time DESC;

-- 3. Average Defect Rate by Product Type
SELECT product_type, 
       AVG(defect_rates) AS Avg_Defect_Rate
FROM supply_chain_data
GROUP BY product_type
ORDER BY Avg_Defect_Rate DESC;

-- 4. Total Stock Levels by Product Type
SELECT product_type, 
       SUM(stock_levels) AS Total_Stock
FROM supply_chain_data
GROUP BY product_type
ORDER BY Total_Stock DESC;

-- 5. Top 5 Products by Revenue
SELECT sku, product_type, 
       ROUND(revenue_generated, 2) AS revenue
FROM supply_chain_data
ORDER BY revenue DESC
LIMIT 5;

-- 6. Orders by Shipping Carrier
SELECT shipping_carriers, 
       COUNT(*) AS total_orders
FROM supply_chain_data
GROUP BY shipping_carriers
ORDER BY total_orders DESC;

-- 7. Average Shipping Time by Location
SELECT location, 
       ROUND(AVG(shipping_times), 2) AS avg_shipping_days
FROM supply_chain_data
GROUP BY location
ORDER BY avg_shipping_days ASC;

-- 8. Stock Level vs Availability
SELECT product_type,
       SUM(stock_levels) AS total_stock,
       SUM(availability) AS total_availability
FROM supply_chain_data
GROUP BY product_type;

-- 9. Inspection Results Count
SELECT inspection_results, 
       COUNT(*) AS count
FROM supply_chain_data
GROUP BY inspection_results;

-- 10. Revenue by Location
SELECT location, 
       ROUND(SUM(revenue_generated), 2) AS total_revenue
FROM supply_chain_data
GROUP BY location
ORDER BY total_revenue DESC;

-- 11. High Defect Suppliers (above average)
SELECT supplier_name, 
       ROUND(AVG(defect_rates), 2) AS avg_defect_rate
FROM supply_chain_data
GROUP BY supplier_name
HAVING avg_defect_rate > (SELECT AVG(defect_rates) FROM supply_chain_data);

-- 12. Total Orders by Customer Type
SELECT customer_demographics,
       COUNT(*) AS total_orders
FROM supply_chain_data
GROUP BY customer_demographics
ORDER BY total_orders DESC;

-- 13. Revenue by Shipping Carrier
SELECT shipping_carriers,
       ROUND(SUM(revenue_generated), 2) AS total_revenue
FROM supply_chain_data
GROUP BY shipping_carriers
ORDER BY total_revenue DESC;

-- 14. Average Order Quantity by Product Type
SELECT product_type,
       ROUND(AVG(order_quantities), 2) AS avg_order_qty
FROM supply_chain_data
GROUP BY product_type
ORDER BY avg_order_qty DESC;