# SQL Project: User Churn Analysis for Codeflix

This project analyzes subscription churn trends for a fictional streaming service, **Codeflix**, during the early months of 2017.

## 📁 Project Overview

- **Goal:** Understand user churn and identify which user segment retains better.
- **Data Source:** One SQL table with subscription start/end dates and segment labels.
- **Tech Stack:** SQL (CTEs, CASE WHEN, Aggregation)

## 🧪 Key Questions

1. How long has Codeflix been operating?
2. What are the monthly churn rates from Jan–Mar 2017?
3. Which user segment churns less?

## 💡 Summary of Findings

- **Company Start Date:** Based on subscription_start, operations started in late 2016.
- **Churn Calculated For:** Jan–Mar 2017
- **Segments:** 87 and 30
- **Churn Trend:**
month |	churn_rate_87	| churn_rate_30
2017-01-01 | 0.25	| 0.08
2017-02-01 | 0.32 |	0.07
2017-03-01 | 0.48 |	0.12
- **Lower Churn:** Segment 30 had the lowest churn rate overall.
- **Recommendation:** Focus on growing Segment 30 as it shows better retention early on.

---

## 🖥️ Final Result: [View Presentation (PDF)]()  
