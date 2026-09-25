# Workforce Attrition Analytics

## Project Overview

This project analyzes employee attrition patterns to identify workforce segments associated with elevated turnover risk. Using PostgreSQL, Python, and Tableau, I examined relationships between attrition and overtime, job role, compensation, tenure, and job satisfaction.

The analysis demonstrates an end-to-end analytics workflow, including data validation, SQL analysis, exploratory analysis and feature engineering in Python, and development of an interactive Tableau dashboard.

## Dashboard

![Workforce Attrition Analytics Dashboard](Tableau/Workforce%20Attrition%20Analytics%20Dashboard.png)

## Business Questions

This analysis was designed to answer the following questions:

- What is the overall employee attrition rate?
- Is overtime associated with higher attrition?
- Which job roles experience the highest attrition?
- Does the relationship between overtime and attrition vary by job role?
- How does compensation differ between employees who stay and leave?
- Is attrition concentrated among employees with shorter tenure?
- How does job satisfaction relate to attrition?

## Tools & Technologies

- **PostgreSQL** — data validation, aggregation, segmentation, and workforce analysis
- **Python** — data cleaning, exploratory analysis, feature engineering, and visualization
- **Pandas** — data manipulation and analysis
- **Matplotlib** — exploratory visualization
- **Tableau** — interactive workforce analytics dashboard
- **GitHub** — project documentation and portfolio presentation

## Dataset

The dataset contains **1,470 employee records** and 35 original variables covering employee demographics, compensation, job characteristics, satisfaction, tenure, overtime, and attrition.

During data preparation, three constant columns with no analytical variation were removed:

- EmployeeCount
- Over18
- StandardHours

A tenure grouping feature was also created to support employee lifecycle analysis.

## Key Findings

### Overall Attrition

The organization had an overall attrition rate of **16.1%**, with **237 of 1,470 employees** leaving.

### Overtime

Employees working overtime had an attrition rate of **30.5%**, compared with **10.4%** among employees who did not work overtime.

### Job Role

Attrition varied substantially across job roles. **Sales Representatives had the highest observed attrition rate at 39.8%**, followed by Laboratory Technicians at 23.9% and Human Resources employees at 23.1%.

### Job Role & Overtime

The relationship between overtime and attrition was especially pronounced among Sales Representatives.

- Sales Representatives working overtime: **66.7% attrition**
- Sales Representatives not working overtime: **28.8% attrition**

This suggests that job role and overtime should be evaluated together when identifying workforce segments associated with elevated attrition.

### Compensation

Employees who left earned an average monthly income of approximately **$4,787**, compared with **$6,833** among employees who stayed.

However, compensation patterns varied by job role, indicating that the overall difference should not be interpreted as evidence that compensation alone causes attrition.

### Tenure

Attrition was concentrated among employees earlier in their organizational tenure:

- Less than 1 year: **36.4%**
- 1–2 years: **28.9%**
- 3–5 years: **13.8%**
- 6–10 years: **12.3%**
- 11+ years: **8.1%**

The pattern suggests that the early employee lifecycle may be an important area for further retention analysis.

### Job Satisfaction

Employees reporting the lowest job satisfaction level had an attrition rate of **22.8%**, compared with **11.3%** among employees reporting the highest satisfaction level.

## Business Recommendations

Based on the observed patterns, leadership could prioritize further investigation into:

- Overtime practices within high-attrition job roles
- Early-tenure employee experiences and onboarding
- Employee satisfaction and engagement signals
- Compensation patterns within individual job roles
- Targeted retention interventions for workforce segments showing elevated attrition

A structured employee-listening and retention process could also be piloted for employees reporting low satisfaction. Outcomes should be measured over time to determine whether interventions are associated with improved retention.

## Analytical Limitations

This analysis identifies **associations rather than causal relationships**. The dataset represents employee characteristics and attrition outcomes but does not establish why individual employees left.

Additional longitudinal workforce data, employee feedback, exit interview data, and operational context would be needed to evaluate causal factors and measure the effectiveness of retention interventions.

## Project Structure

```text
workforce-attrition-analytics/
├── Data/
│   └── workforce_attrition_cleaned.csv
├── Python/
│   └── Workforce_Attrition_Analysis.ipynb
├── SQL/
│   └── workforce_attrition_analysis.sql
├── Tableau/
│   ├── Workforce Attrition Analytics Dashboard.png
│   └── Workforce Attrition Analytics Dashboard.twbx
└── README.md