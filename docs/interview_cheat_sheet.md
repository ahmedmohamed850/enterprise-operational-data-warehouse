# Enterprise Data Warehouse - Interview Cheat Sheet

## 1. What is this project?

This is an end-to-end operational data engineering project.

I created synthetic datasets representing equipment, maintenance, incidents, system-performance logs, personnel, inventory, and procurement.

I then used PySpark to validate, clean, and transform the data before creating a dimensional data warehouse and analytical reporting layer.

---

## 2. Why did you build this project?

The project connects my previous operational-data experience with modern enterprise data-engineering technologies.

It demonstrates how operational records can be transformed into structured analytical information for management decision-making.

---

## 3. Why did you use synthetic data?

Synthetic data allowed me to demonstrate a realistic enterprise architecture without exposing confidential or real operational information.

---

## 4. What is ETL?

ETL means:

Extract  
Transform  
Load

In this project, operational CSV files were ingested, validated and transformed using PySpark, then loaded into clean analytical warehouse structures.

---

## 5. Why PySpark?

PySpark provides distributed data-processing capabilities.

Although this portfolio dataset is relatively small, the same architecture and transformations can scale to much larger enterprise datasets.

---

## 6. What is Data Quality?

Data quality ensures that data are accurate, complete, valid, consistent, and suitable for analytical use.

In this project I checked for missing keys, duplicates, invalid values, referential-integrity problems, negative costs, invalid percentages, and negative inventory values.

---

## 7. What is a Data Warehouse?

A data warehouse is a centralized analytical data repository designed to integrate information from multiple operational sources for reporting, analytics, and decision support.

---

## 8. What is dimensional modeling?

Dimensional modeling organizes analytical data into fact and dimension tables.

Fact tables store measurable business events.

Dimension tables provide descriptive context.

---

## 9. What is a fact table?

A fact table stores measurable events.

Examples from this project include:

FactMaintenance  
FactIncidents  
FactInventory  
FactProcurement

FactMaintenance contains measures such as maintenance cost and downtime.

---

## 10. What is a dimension table?

A dimension provides descriptive information used to analyze facts.

Examples include:

DimEquipment  
DimPersonnel  
DimDate  
DimLocation  
DimSupplier

---

## 11. What is a Star Schema?

A star schema places a fact table at the center and connects it to related dimension tables.

For example:

DimEquipment → FactMaintenance ← DimPersonnel

DimDate is also connected to FactMaintenance.

This structure simplifies analytical queries and reporting.

---

## 12. What was the size of the project?

The pipeline generated 21,802 synthetic operational records.

After ETL and cleaning, 21,773 clean records remained.

The data-quality framework detected 18 issues.

The final warehouse contained 5 dimensions and 4 fact tables.

---

## 13. What types of analysis did you perform?

The project included:

Equipment failure analysis  
Maintenance-cost analysis  
Downtime analysis  
Incident severity  
Incident resolution time  
Inventory reorder risk  
Supplier delivery performance  
Management KPI reporting

---

## 14. Did you use SQL Server?

The main executable Kaggle pipeline uses PySpark and Spark SQL.

I also created a Microsoft SQL Server reference implementation for staging tables, dimensions, fact tables, and management analytics queries.

This demonstrates how the same dimensional model could be implemented in a SQL Server enterprise environment.

---

## 15. What would you improve in a production environment?

In production I would add:

Automated orchestration  
Incremental data loading  
Monitoring and alerting  
Role-based security  
Data lineage  
Metadata management  
Master-data management  
Cloud or enterprise DWH deployment  
CI/CD  
Automated testing  
Performance optimization

I would also integrate real-time or scheduled data ingestion depending on business requirements.
