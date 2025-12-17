-- Get familiar with the data
-- View first 100 rows
SELECT * 
FROM subscriptions
LIMIT 100;

-- Identify user segments
SELECT DISTINCT segment FROM subscriptions;

-- Determine the range of months in the data
SELECT
MIN(subscription_start) AS earliest_start,
MAX(subscription_end) AS latest_end
FROM subscriptions;

-- Calculate churn rate for each segment
-- Step 1: Create months table for Jan, Feb, Mar 2017
WITH months AS (
  SELECT
    '2017-01-01' AS first_day,
    '2017-01-31' AS last_day
  UNION
  SELECT
    '2017-02-01' AS first_day,
    '2017-02-28' AS last_day
  UNION
  SELECT
    '2017-03-01' AS first_day,
    '2017-03-31' AS last_day
  ),
-- Step 2: Cross join months with subscriptions
cross_join AS (
  SELECT *
  FROM subscriptions
  CROSS JOIN months
),
-- Step 3: Create status table
status AS (
SELECT id, first_day AS month,
  CASE
    WHEN segment = 87
      AND subscription_start < first_day
      AND (subscription_end IS NULL OR subscription_end >= first_day)
    THEN 1 ELSE 0
  END AS is_active_87,
  CASE
    WHEN segment = 30
      AND subscription_start < first_day
      AND (subscription_end IS NULL OR subscription_end >= first_day) 
    THEN 1 ELSE 0
  END AS is_active_30,
  CASE
    WHEN segment = 87
      AND (subscription_end BETWEEN first_day AND last_day)
    THEN 1 ELSE 0
  END AS is_canceled_87,
  CASE
    WHEN segment = 30
      AND (subscription_end BETWEEN first_day AND last_day)
    THEN 1 ELSE 0
  END AS is_canceled_30
FROM cross_join),
-- Step 4: Aggregate churn numbers
status_aggregate AS (
SELECT
  month,
  SUM(is_active_87) AS sum_active_87,
  SUM(is_active_30) AS sum_active_30,
  SUM(is_canceled_87) AS sum_canceled_87,
  SUM(is_canceled_30) AS sum_canceled_30
FROM status
GROUP BY month)
-- Step 5: Calculate and compared churn rates
SELECT
  month,
  ROUND(1.0 * sum_canceled_87 / sum_active_87, 2) AS churn_rate_87,
  ROUND(1.0 * sum_canceled_30 / sum_active_30, 2) AS churn_rate_30,
  CASE
    WHEN ROUND(1.0 * sum_canceled_87 / sum_active_87, 2) < ROUND(1.0 * sum_canceled_30 / sum_active_30, 2)
      THEN "Segment 87 has lower churn"
    WHEN ROUND(1.0 * sum_canceled_87 / sum_active_87, 2) > ROUND(1.0 * sum_canceled_30 / sum_active_30, 2)
      THEN "Segment 30 has lower churn"
    ELSE "Churn rates are equal or missing"
  END AS lower_churn_segment
FROM status_aggregate
ORDER BY month;
