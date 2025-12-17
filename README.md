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
4. Which one should the company invest in more?

## 💡 Summary of Findings

**Company Timeline**

| Earliest Start | Latest End |
|----------------|------------|
| 2016-12-01     | 2017-03-31 |

This means Codeflix has about 4 months of subscription data. Churn can be measured from **January to March 2017**.

**User Segments**: Codeflix has two user segments (87 and 30). These likely represent different acquisition channels (e.g. paid ads vs organic).

**Monthly Churn Rates**
| Month       | Churn Rate 87 | Churn Rate 30 |
|-------------|----------------|--------------|
| 2017-01-01  | 0.25           | 0.08         |
| 2017-02-01  | 0.32           | 0.07         |
| 2017-03-01  | 0.48           | 0.12         |

> **Segment 30 consistently shows a much lower churn rate** than Segment 87 across all months. This means users in Segment 30 are sticking around longer.

## ✅ Recommendation

The company should focus on **expanding Segment 30**, since it has stronger retention. If this segment is driven by a specific channel (e.g. referral, content, or product-led growth), that channel should receive more attention and budget.

---

## 🖥️ Final Result: [View Presentation (PDF)]()  
