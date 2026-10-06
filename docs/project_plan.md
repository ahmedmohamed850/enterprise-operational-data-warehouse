# Project Development Plan

## Phase 1 - Synthetic Operational Data
- Equipment
- Maintenance
- Incidents
- System logs
- Personnel
- Inventory
- Procurement

## Phase 2 - Data Quality
- Missing values
- Duplicate detection
- Invalid values
- Referential integrity
- Data-quality reporting

## Phase 3 - PySpark ETL
- Read raw data
- Clean data
- Transform data
- Validate data
- Export processed datasets

## Phase 4 - SQL Staging Layer
- Create staging tables
- Load cleaned datasets
- Validate loaded data

## Phase 5 - Data Warehouse

Dimensions:
- DimEquipment
- DimDate
- DimLocation
- DimPersonnel
- DimSupplier

Facts:
- FactMaintenance
- FactIncidents
- FactInventory
- FactProcurement

## Phase 6 - Analytics
- Failure analysis
- Downtime analysis
- Maintenance cost analysis
- Inventory analysis
- Supplier performance

## Phase 7 - Dashboard
Power BI management dashboard.

## Phase 8 - Documentation
- Architecture diagram
- Star schema
- Data dictionary
- GitHub README
- Interview preparation
