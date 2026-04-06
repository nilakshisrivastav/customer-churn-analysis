CREATE DATABASE churn_project;
USE churn_project;

CREATE TABLE customers (
    customer_id VARCHAR(50),
    gender VARCHAR(10),
    senior_citizen INT,
    partner VARCHAR(10),
    dependents VARCHAR(10),
    tenure INT,
    phone_service VARCHAR(10),
    multiple_lines VARCHAR(20),
    internet_service VARCHAR(20),
    online_security VARCHAR(20),
    online_backup VARCHAR(20),
    device_protection VARCHAR(20),
    tech_support VARCHAR(20),
    streaming_tv VARCHAR(20),
    streaming_movies VARCHAR(20),
    contract VARCHAR(20),
    paperless_billing VARCHAR(10),
    payment_method VARCHAR(50),
    monthly_charges FLOAT,
    total_charges FLOAT,
    churn VARCHAR(10),
    tenure_group VARCHAR(20),
    total_revenue FLOAT,
    churn_flag INT
);

SELECT * FROM customers LIMIT 10;

SELECT 
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    (SUM(churn_flag)/COUNT(*)) * 100 AS churn_rate
FROM customers;

SELECT contract, 
       COUNT(*) AS total_customers,
       SUM(churn_flag) AS churned,
       (SUM(churn_flag)/COUNT(*)) * 100 AS churn_rate
FROM customers
GROUP BY contract;

SELECT tenure_group,
       COUNT(*) AS total_customers,
       SUM(churn_flag) AS churned,
       (SUM(churn_flag)/COUNT(*)) * 100 AS churn_rate
FROM customers
GROUP BY tenure_group;

SELECT churn,
       SUM(total_revenue) AS total_revenue
FROM customers
GROUP BY churn;

SELECT customer_id, monthly_charges, tenure
FROM customers
WHERE churn = 'Yes'
ORDER BY monthly_charges DESC
LIMIT 10;