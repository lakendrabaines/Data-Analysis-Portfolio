# 🎓 Student Success & Academic Outcomes Analytics

## Project Overview

This project analyzes student academic outcomes to identify patterns associated with graduation, enrollment, and dropout. The analysis focuses on academic performance, tuition status, scholarship status, age, and course enrollment to better understand factors associated with student success.

The project demonstrates an end-to-end analytics workflow using **Python for data preparation, PostgreSQL for analysis, and Tableau for data visualization**.

---

## Business Problem

Universities need to understand which student populations may benefit from additional academic or financial support. This project explores student outcome data to answer questions such as:

- What proportion of students graduate, drop out, or remain enrolled?
- How does tuition payment status relate to dropout rates?
- Are scholarship recipients associated with different dropout rates?
- How do dropout rates vary across age groups?
- How does semester academic performance differ across student outcomes?
- Which academic programs have the highest dropout rates?

The goal is to transform student-level data into actionable insights that could help inform student-support and retention strategies.

---

## Tools & Technologies

- **Python:** Pandas, NumPy, Matplotlib
- **PostgreSQL:** Data storage, querying, aggregation, and analysis
- **Tableau:** Interactive dashboard development and visualization
- **Jupyter Notebook:** Data preparation and exploratory analysis
- **GitHub:** Project documentation and version control

---

## Data Preparation

Python was used to prepare and validate the dataset before analysis.

Key preparation steps included:

- Loaded and inspected the raw dataset
- Standardized column names
- Validated missing values and duplicate records
- Reviewed categorical and numerical variables
- Created analysis-ready fields
- Created student outcome indicators
- Calculated semester approval-rate metrics
- Created age groups for demographic analysis
- Exported a cleaned dataset for downstream SQL and Tableau analysis

The final dataset contains **4,424 student records**.

---

## SQL Analysis

The cleaned dataset was loaded into PostgreSQL for structured analysis.

SQL queries were used to examine:

- Overall student outcomes
- Dropout rates by tuition payment status
- Dropout rates by scholarship status
- Dropout rates across age groups
- Academic performance by student outcome
- Course-level dropout rates

This stage demonstrates the use of SQL for aggregation, segmentation, calculated metrics, and business-focused analysis.

---

## 📊 Tableau Dashboard

An interactive Tableau dashboard was developed to communicate the major findings from the analysis.

The dashboard includes:

- Student outcome distribution
- Dropout rate by tuition status
- Dropout rate by scholarship status
- Dropout rate by age group
- First- and second-semester approval rates by outcome
- Dropout rate by academic course

---

## 🔍 Key Findings

### Tuition Status

Students whose tuition fees were **not up to date had an 86.55% dropout rate**, compared with **24.74%** among students whose tuition fees were current.

This represents one of the strongest patterns observed in the analysis and suggests that financial circumstances may be an important consideration when designing student-retention support.

### Scholarship Status

Students without scholarships had a **38.71% dropout rate**, compared with only **12.19%** among scholarship recipients.

The results show a substantial association between scholarship status and student outcomes.

### Age

Dropout rates increased considerably among several older student groups:

- **26–30:** 59.79%
- **31–40:** 55.15%
- **41+:** 50.67%
- **21–25:** 35.63%
- **20 and under:** 21.25%

Students ages 26–30 had the highest dropout rate in the age-group analysis.

### Academic Performance

Semester approval rates showed a strong relationship with final student outcomes.

| Outcome | First Semester Approval Rate | Second Semester Approval Rate |
|---|---:|---:|
| Dropout | 40.6% | 31.0% |
| Enrolled | 71.4% | 67.3% |
| Graduate | 93.5% | 93.2% |

Students who ultimately graduated demonstrated substantially higher course approval rates during both semesters.

### Course-Level Outcomes

Dropout rates varied considerably across academic programs. Among the programs displayed in the dashboard, **Biofuel Production Technologies** had the highest dropout rate at **66.67%**, followed by **Equinculture at 55.32%** and **Informatics Engineering at 54.12%**.

These differences may help institutions identify programs where additional investigation or student-support resources could be beneficial.

---

## 📁 Repository Structure

    student-success-analytics/
    │
    ├── Data/
    │   ├── student_success_raw.csv
    │   └── student_success_cleaned.csv
    │
    ├── Python/
    │   └── Student_Success_Analysis.ipynb
    │
    ├── SQL/
    │   └── student_success_analysis.sql
    │
    ├── Tableau/
    │   └── Student Success & Academic Outcomes.twbx
    │
    └── README.md

---

## Skills Demonstrated

This project demonstrates practical experience with:

- Data cleaning and validation
- Exploratory data analysis
- Feature engineering
- SQL querying and aggregation
- Data visualization
- Dashboard development
- Analytical storytelling
- Translating data into business insights
- End-to-end analytics workflow development

---

## Conclusion

The analysis identified meaningful associations between student outcomes and financial, demographic, and academic indicators. Tuition status, scholarship status, age, and semester academic performance were all associated with differences in dropout rates.

These findings could help educational institutions identify areas for further investigation and develop more targeted student-support strategies.

> **Note:** The results describe associations within this dataset and should not be interpreted as evidence that any individual factor causes a student to drop out.