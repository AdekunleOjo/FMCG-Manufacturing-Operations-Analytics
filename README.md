# FMCG Manufacturing Operations & Performance Intelligence

> **End-to-End Manufacturing analytics project focused on identifying production losses, downtime drivers, equipment reliability risks, and quality losses using SQL Server and Microsoft Excel.**

## Overview

This project analyzes FMCG manufacturing operations to answer a practical question:

**Where are operational losses occurring, what is driving them, and where should management prioritize improvement?**

The analysis covers production performance, downtime, equipment reliability, maintenance, and quality.

---

## Business Problem

Manufacturing operations can lose significant capacity and revenue through:

- Equipment downtime and recurring failures
- Production losses caused by downtime
- Poor equipment reliability and maintainability
- Quality defects, rework, and scrap
- Operational bottlenecks that are not immediately visible from production volume alone

The objective was to transform operational data into **actionable improvement priorities**.

---

## Analytical Approach

**1. Data Preparation — SQL Server**
- Cleaned and validated manufacturing datasets
- Identified negative production values and abnormal downtime records
- Validated quality records and data relationships
- Prepared analysis-ready datasets

**2. Analysis — Advanced Microsoft Excel**
- Production and capacity analysis
- Downtime and production-loss analysis
- Pareto analysis of downtime, failure modes, and root causes
- Equipment reliability analysis using MTBF and MTTR
- Quality, defect, rework, and scrap analysis

**3. Decision Support**
- Identified major operational loss areas
- Prioritized recurring causes using Pareto analysis
- Connected equipment reliability with production losses
- Highlighted areas requiring management attention

---

## Dashboard

### 01 — Operations Performance Overview

![FMCG-Manufacturing-Operations-Analytics](https://github.com/AdekunleOjo/FMCG-Manufacturing-Operations-Analytics/blob/main/Dashboard/FMCGOverview.png)

### 02 — Production Loss & Downtime Performance Analysis

![FMCG-Manufacturing-Operations-Analytics](https://github.com/AdekunleOjo/FMCG-Manufacturing-Operations-Analytics/blob/main/Dashboard/FMCGDowntime.jpg)

### 03 — Equipment Reliability & Maintainability

![FMCG-Manufacturing-Operations-Analytics](https://github.com/AdekunleOjo/FMCG-Manufacturing-Operations-Analytics/blob/main/Dashboard/FMCGEquipment.jpg)

### 04 — Quality Performance & Loss Analysis

![FMCG-Manufacturing-Operations-Analytics](https://github.com/AdekunleOjo/FMCG-Manufacturing-Operations-Analytics/blob/main/Dashboard/FCMGQuality.png)

---

## Key Findings

The analysis revealed that:

- **Equipment availability and downtime were major operational constraints.**
- A relatively small group of recurring causes accounted for a significant share of operational losses.
- Equipment reliability varied considerably across assets, creating different levels of operational risk.
- Recurring failures and high repair times highlighted opportunities to improve maintenance effectiveness.
- Quality losses were concentrated in specific products, defect categories, and defect types.
- Production performance should therefore be evaluated alongside **downtime, reliability, and quality**, rather than production output alone.

---

## Recommendations

Based on the analysis, the following improvement priorities were identified:

1. **Prioritize high-impact downtime drivers** using Pareto analysis and focus improvement efforts on the causes contributing most to production losses.

2. **Target repeat equipment failures** through focused preventive and condition-based maintenance on critical assets.

3. **Improve maintenance response and repair effectiveness** for equipment with high MTTR and recurring failures.

4. **Protect production capacity** by addressing equipment and process constraints responsible for significant downtime-related losses.

5. **Focus quality improvement efforts** on the products, defect categories, and defect types contributing most to defects, rework, and scrap.

6. **Use integrated operational KPIs** combining production, downtime, reliability, and quality to support continuous improvement decisions.

----

## Tools

- **SQL Server** — Data cleaning, validation, transformation
- **Microsoft Excel** — Analysis, calculations, PivotTables, Pareto analysis, and dashboards

---

## Conclusion

The analysis demonstrates that **strong production output alone does not necessarily indicate strong manufacturing performance**.

By connecting production, downtime, equipment reliability, maintenance, and quality data, the project provides a clearer view of where operational losses occur and where improvement efforts should be prioritized.

The overall objective is to support a **data-driven continuous improvement approach** where management can identify major losses, focus resources on high-impact areas, and monitor operational performance over time.

---

## What This Project Demonstrates

- Manufacturing & Operations Analytics
- Production Performance Analysis
- Downtime & Loss Analysis
- Maintenance & Reliability Analytics
- MTBF & MTTR Analysis
- Quality & Scrap Analysis
- Root Cause & Pareto Analysis
- Data Quality & Validation
- Business-focused Data Storytelling

---

## Project Structure

```text
FMCG-Manufacturing-Operations-Analytics/
│
├── SQL/
├── Excel/
├── Dashboard/
└── Documentation/
