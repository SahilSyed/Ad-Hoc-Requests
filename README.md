# SQL Project: Consumer Goods Ad-Hoc Requests

---

## Project Overview

This project involves working on a set of ad-hoc business requests from a consumer goods company. The goal was to extract, analyze, and report data from the company’s database using SQL. The queries were designed to answer specific business questions related to market performance, product counts, customer discounts, and sales data.

---

## LinkedIn Presentation

You can view the detailed presentation of this project on my LinkedIn profile:  
[LinkedIn Presentation Link](#https://www.linkedin.com/posts/syedsahil_codebasics-sql-videopresentation-activity-7251950717270163456-NBul?utm_source=share&utm_medium=member_desktop)

---

## Ad-Hoc Requests

1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.
2. What is the percentage of unique product increase in 2021 vs. 2020?
3. Provide a report with all the unique product counts for each segment and sort them in descending order.
4. Which segment had the most increase in unique products in 2021 vs. 2020?
5. Get the products that have the highest and lowest manufacturing costs.
6. Generate a report of the top 5 customers who received the highest average pre-invoice discount percentage for 2021 in the Indian market.
7. Get the complete report of the Gross Sales amount for the customer “Atliq Exclusive” for each month.
8. In which quarter of 2020 did the maximum total sold quantity occur?
9. Which channel helped to bring more gross sales in the fiscal year 2021 and what was its percentage of contribution?
10. Get the top 3 products in each division that have a high total sold quantity in the fiscal year 2021.

---

## Steps Involved

1. **SQL Queries:**  
   SQL queries were written to address specific ad-hoc requests, extracting, filtering, and analyzing data from the consumer goods database.

2. **Data Export:**  
   The results of each query were exported into Excel (CSV format) for further analysis.

3. **Reporting:**  
   The exported CSV files were used to generate reports based on the business questions provided by the ad-hoc requests.

---

## Key SQL Concepts Applied

1. **Joins (Inner Join):**  
   SQL queries used joins (e.g., `JOIN`, `ON`) to combine data from different tables, including `dim_customer`, `dim_product`, and `fact_sales_monthly`.

2. **Common Table Expressions (CTEs):**  
   CTEs (e.g., `WITH`) simplified complex subqueries and improved code readability, especially for calculations like product counts and segment comparisons.

3. **Subqueries:**  
   Subqueries fetched the maximum and minimum manufacturing costs and performed comparisons, such as identifying high discount percentages.

4. **Aggregate Functions (SUM, COUNT, AVG, MAX, MIN):**  
   Aggregate functions were used to calculate totals, averages, and counts, particularly for summarizing product data, gross sales, and discounts.

5. **Window Functions (RANK, OVER):**  
   Window functions ranked products and calculated sales performance across divisions and segments.

6. **Date Functions (MONTH, YEAR, DATE_ADD):**  
   Date functions broke down data by specific time periods (e.g., months, quarters, or years) for detailed sales analysis.

7. **CASE Statements:**  
   `CASE` statements enabled conditional logic within queries, such as mapping months to quarters or defining segments.

8. **Filtering and Sorting (WHERE, ORDER BY):**  
   Queries applied filters (e.g., `WHERE`) and sorting (e.g., `ORDER BY`) to organize the data based on business requirements.

---

## Tools Used

- **SQL** for querying the database
- **Excel (CSV)** for data storage and transfer
- **Power BI** for data visualization

---

## How to Run the Queries

1. Clone this repository to your local machine.
2. Open your preferred SQL editor (e.g., SQL Server Management Studio).
3. Copy and paste the SQL queries from the **queries.sql** file into your SQL editor.
4. Execute the queries one by one, ensuring that the required database tables (`dim_customer`, `dim_product`, `fact_sales_monthly`, etc.) are available.
5. Export the results as CSV files if needed.

---

## SNAPSHOTS

![Screenshot 2024-10-15 172208](https://github.com/user-attachments/assets/00d537c9-3407-4ea9-8974-a7ed3056ec57)
![Screenshot 2024-10-15 183101](https://github.com/user-attachments/assets/c36399ca-4ba3-4182-88bf-6c29f7273f34)
![Screenshot 2024-10-15 183120](https://github.com/user-attachments/assets/4adb5d75-66b6-41f6-ab0d-169a5abfed90)
![Screenshot 2024-10-15 183144](https://github.com/user-attachments/assets/7e2e4696-3bbd-44bb-94f1-7e79794f1b00)
![Screenshot 2024-10-15 183208](https://github.com/user-attachments/assets/6b249e4b-136a-4a6b-bf7c-3187a06e033f)
![Screenshot 2024-10-15 183258](https://github.com/user-attachments/assets/39f8b245-8f5e-4a29-b2c0-320eb6478b41)
![Screenshot 2024-10-15 183322](https://github.com/user-attachments/assets/6d908f3b-63cf-4934-a95f-df3845738ff9)
![Screenshot 2024-10-15 183344](https://github.com/user-attachments/assets/d598023f-a70e-4487-b0a5-d1c687404ce8)
![Screenshot 2024-10-15 183408](https://github.com/user-attachments/assets/83bf7fb8-247c-4259-83a5-51a3e0d79396)
![Screenshot 2024-10-15 183428](https://github.com/user-attachments/assets/1013ed19-69e9-4d45-be01-cf7ac9e1f9fb)
![Screenshot 2024-10-15 183454](https://github.com/user-attachments/assets/0fd5b399-f37c-401e-a0bc-ccb821c82ccc)
![Screenshot 2024-10-15 183542](https://github.com/user-attachments/assets/cdd9527e-55a4-447f-a42a-c82f983f2434)
![Screenshot 2024-10-15 183557](https://github.com/user-attachments/assets/bc68fed1-7579-4c0e-895c-1a0066e8aa34)
![Screenshot 2024-10-15 183617](https://github.com/user-attachments/assets/588ca539-e77a-4b5c-8ef0-d1534815dc15)
![Screenshot 2024-10-15 183635](https://github.com/user-attachments/assets/912da689-6349-4288-8db5-e119657dac55)
![Screenshot 2024-10-15 183650](https://github.com/user-attachments/assets/afc5e9b6-5fb8-4e9d-8428-4415738361c5)
![Screenshot 2024-10-15 183705](https://github.com/user-attachments/assets/9f0bdbe2-6bd0-447c-bcdb-4bcea9187012)

---

## Conclusion

This project demonstrates the ability to respond to dynamic business requirements using SQL, showcasing proficiency in writing complex queries, using joins, aggregate functions, and applying various SQL concepts to deliver actionable business insights.

---

Feel free to reach out via LinkedIn if you have any questions or would like further details!

---

