# sql-sales-analytics-portfolio
# Sales & Customer Analytics Database

## 🏆 Project Overview
This is a **SQL Portfolio Project** designed to showcase my skills in database design, data modeling, and advanced SQL analytics.  
The project simulates a **Sales & Customer Analytics system**, including customers, orders, products, and payments.

**Skills demonstrated:**
- Database schema design (ERD)  
- Table creation & relationships (1:N, many-to-many)  
- Data insertion and DML operations  
- Complex queries: CTEs, window functions, aggregates, joins  
- Views for reporting  
- Stored procedures for operational tasks  
- Triggers for data integrity  

---

## 📊 Entity Relationship Diagram (ERD)
```mermaid
erDiagram
    CUSTOMERS ||--o{ ORDERS : places
    ORDERS ||--o{ ORDERDETAILS : contains
    PRODUCTS ||--o{ ORDERDETAILS : included_in
    ORDERS ||--|| PAYMENTS : paid_by
