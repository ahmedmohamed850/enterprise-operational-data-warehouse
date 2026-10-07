# Enterprise Operational Data Warehouse Architecture

## Overview

This project implements an end-to-end operational data engineering pipeline that transforms synthetic raw operational data into a dimensional analytical warehouse.

## Data Flow

Synthetic Operational Data  
↓  
PySpark Ingestion  
↓  
Data Quality Validation  
↓  
Cleaning & Transformation  
↓  
Dimensional Modeling  
↓  
Star Schema  
↓  
Spark SQL / SQL Analytics  
↓  
Management Reports & Dashboard Outputs

## Source Data

The project uses seven synthetic operational datasets:

- Equipment
- Personnel
- Maintenance
- Incidents
- System Logs
- Inventory
- Procurement

No confidential or real operational data is used.

## ETL Layer

PySpark is used for:

- Reading raw CSV files
- Data type handling
- Missing-value detection
- Duplicate detection
- Invalid-value checks
- Referential-integrity checks
- Data cleaning
- Transformations
- Loading clean analytical datasets

## Data Quality Layer

The pipeline validates:

- Missing equipment IDs
- Missing operational status
- Duplicate business keys
- Negative maintenance costs
- Invalid equipment references
- Invalid availability percentages
- Negative inventory values

## Warehouse Layer

The warehouse follows a dimensional star-schema design.

### Dimensions

- DimEquipment
- DimPersonnel
- DimDate
- DimLocation
- DimSupplier

### Facts

- FactMaintenance
- FactIncidents
- FactInventory
- FactProcurement

## Analytics Layer

The analytical layer supports:

- Equipment failure analysis
- Maintenance cost analysis
- Downtime analysis
- Incident severity analysis
- Resolution-time analysis
- Inventory reorder monitoring
- Supplier delivery performance
- Operational KPI reporting

## Technology Stack

- Python
- PySpark
- Spark SQL
- Pandas
- Parquet
- SQL Server reference schema
- Git
- GitHub
- Matplotlib
