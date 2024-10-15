-- CODEBASICS RESUME CHALLENGE 4

/* REQUEST 1: Provide the list of markets in which customer  "Atliq  Exclusive"  operates its 
business in the  APAC  region. */
SELECT
	DISTINCT market
FROM
	dim_customer
WHERE
	customer = "Atliq Exclusive" AND
    region = "APAC";

/* REQUEST 2: What is the percentage of unique product increase in 2021 vs. 2020? The 
final output contains these fields, 
unique_products_2020 
unique_products_2021 
percentage_chg */

WITH unique_products AS(
	SELECT
		fiscal_year,
        COUNT(DISTINCT product_code) AS unique_products
	FROM
		fact_gross_price
	GROUP BY
		fiscal_year
)

SELECT
	up_2020.unique_products AS unique_products_2020,
    up_2021.unique_products AS unique_products_2021,
	ROUND((up_2021.unique_products - up_2020.unique_products)/ up_2020.unique_products * 100,2) AS percentage_change
FROM
	unique_products up_2020
JOIN
	unique_products up_2021
ON
	up_2020.fiscal_year = 2020 AND
    up_2021.fiscal_year = 2021;
    
    
/* REQUEST 3: Provide a report with all the unique product counts for each  segment  and 
sort them in descending order of product counts. The final output contains 2 fields, 
				segment 
				product_count */
SELECT
	segment,
    COUNT(DISTINCT product_code) as product_count
FROM
	dim_product
GROUP BY segment
ORDER BY product_count desc; 

/* REQUEST 4:  Follow-up: Which segment had the most increase in unique products in 
2021 vs 2020? The final output contains these fields, 
						segment 
						product_count_2020 
						product_count_2021 
						difference */

WITH unique_products AS(
	SELECT
		p.segment,
        s.fiscal_year,
        COUNT(DISTINCT s.product_code) AS product_count
	FROM
		fact_sales_monthly s
	JOIN
		dim_product p
	ON
		s.product_code = p.product_code
	GROUP BY
		p.segment,
        s.fiscal_year
)

SELECT
	up_2020.segment,
    up_2020.product_count AS product_count_2020,
    up_2021.product_count AS product_count_2021,
    up_2021.product_count - up_2020.product_count AS difference
FROM unique_products up_2020
JOIN unique_products up_2021
ON
	up_2020.segment = up_2021.segment AND
    up_2020.fiscal_year = 2020 AND
    up_2021.fiscal_year = 2021
ORDER BY difference DESC;

/* REQUEST 5 : Get the products that have the highest and lowest manufacturing costs. 
The final output should contain these fields, 
					product_code 
					product 
					manufacturing_cost */
SELECT 
	m.product_code,
    concat(product," (",variant,")") AS product,
    manufacturing_cost
FROM
	fact_manufacturing_cost m
JOIN
	dim_product p
ON
	m.product_code = p.product_code
WHERE manufacturing_cost = (
	SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost)
    OR
    manufacturing_cost = 
    (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost)
ORDER BY manufacturing_cost DESC;

/* REQUEST 6 :  Generate a report which contains the top 5 customers who received an 
average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
Indian  market. The final output contains these fields, 
			customer_code 
			customer 
			average_discount_percentage*/

WITH cte1 AS (SELECT 
	c.customer_code,
    c.customer,
    round(avg(pre_invoice_discount_pct),2) as average_discount_percentage
FROM dim_customer c
JOIN
	fact_pre_invoice_deductions pre
ON
	c.customer_code = pre.customer_code
WHERE
	pre.fiscal_year = 2021 AND
	market = "INDIA"
GROUP BY c.customer_code, c.customer)
    
SELECT *
FROM cte1
WHERE average_discount_percentage > (
SELECT round(avg(pre_invoice_discount_pct),2) as avg_pct from fact_pre_invoice_deductions)
ORDER BY average_discount_percentage DESC
LIMIT 5
;

/* REQUEST 7 : Get the complete report of the Gross sales amount for the customer  “Atliq 
Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
high-performing months and take strategic decisions. 
The final report contains these columns: 
						Month 
						Year 
						Gross sales Amount  */
 
 SELECT 
	concat(MONTHname(date), "(",year(date),")") AS Month,
    fiscal_year,
    round(sum(total_gross_price),2) AS gross_sales_amount
FROM
	fact_act_est ae
JOIN
	dim_customer c
ON
	ae.customer_code = c.customer_code
WHERE
	customer = 'Atliq Exclusive'
GROUP BY Month, fiscal_year
ORDER BY fiscal_year;

/* REQUEST 8:  In which quarter of 2020, got the maximum total_sold_quantity? The final 
output contains these fields sorted by the total_sold_quantity, 
	Quarter 
	total_sold_quantity*/
    
SELECT 
    CASE 
        WHEN FLOOR((MONTH(DATE_ADD(date, INTERVAL 4 MONTH)) - 1) / 3) + 1 = 1 THEN 'Q1'
        WHEN FLOOR((MONTH(DATE_ADD(date, INTERVAL 4 MONTH)) - 1) / 3) + 1 = 2 THEN 'Q2'
        WHEN FLOOR((MONTH(DATE_ADD(date, INTERVAL 4 MONTH)) - 1) / 3) + 1 = 3 THEN 'Q3'
        WHEN FLOOR((MONTH(DATE_ADD(date, INTERVAL 4 MONTH)) - 1) / 3) + 1 = 4 THEN 'Q4'
    END AS quarter,
    ROUND(SUM(sold_quantity) / 1000000, 2) AS total_sold_quantity_in_millions
FROM 
    fact_sales_monthly
WHERE 
    fiscal_year = 2020
GROUP BY 
    quarter
ORDER BY 
    total_sold_quantity_in_millions DESC;
    

/* REQUEST 9:  Which channel helped to bring more gross sales in the fiscal year 2021 
and the percentage of contribution?  The final output  contains these fields, 
		channel 
		gross_sales_mln 
		percentage */
SELECT 
  channel,
  round(sum(total_gross_price)/1000000,2) AS gross_sales_in_millions,
  round(sum(total_gross_price)/(sum(sum(total_gross_price)) OVER())*100,2) AS percentage 
FROM fact_act_est f
JOIN dim_customer c
ON f.customer_code = c.customer_code
GROUP BY channel
ORDER BY gross_sales_in_millions DESC;

/* REQUEST 10: Get the Top 3 products in each division that have a high 
total_sold_quantity in the fiscal_year 2021? The final output contains these 
fields, 
			division 
			product_code
			product 
			total_sold_quantity 
			rank_order */
WITH temp_table AS (
    SELECT 
        p.division,
        s.product_code, 
        CONCAT(p.product, " (", p.variant, ")") AS product, 
        SUM(s.sold_quantity) AS total_sold_quantity,
        RANK() OVER (PARTITION BY p.division ORDER BY SUM(s.sold_quantity) DESC) AS rank_order
    FROM 
        fact_sales_monthly s
    JOIN 
        dim_product p ON s.product_code = p.product_code
    WHERE 
        s.fiscal_year = 2021
    GROUP BY 
        p.division, 
        s.product_code, 
        p.product, 
        p.variant
)
SELECT 
    division, 
    product_code, 
    product, 
    total_sold_quantity, 
    rank_order
FROM 
    temp_table
WHERE 
    rank_order IN (1, 2, 3);
