-- =====================================================
-- Enterprise Operational Data Warehouse
-- 01 - Staging Tables
-- Target: Microsoft SQL Server
-- =====================================================

CREATE TABLE stg_equipment (
    equipment_id VARCHAR(20),
    equipment_type VARCHAR(100),
    location VARCHAR(100),
    status VARCHAR(50),
    commission_date DATE
);

CREATE TABLE stg_personnel (
    personnel_id VARCHAR(20),
    name VARCHAR(150),
    specialization VARCHAR(100),
    team VARCHAR(50),
    location VARCHAR(100),
    years_experience INT
);

CREATE TABLE stg_maintenance (
    maintenance_id VARCHAR(20),
    equipment_id VARCHAR(20),
    personnel_id VARCHAR(20),
    maintenance_date DATE,
    maintenance_type VARCHAR(50),
    maintenance_cost DECIMAL(18,2),
    downtime_hours DECIMAL(10,2)
);

CREATE TABLE stg_incidents (
    incident_id VARCHAR(20),
    equipment_id VARCHAR(20),
    incident_date DATE,
    failure_type VARCHAR(100),
    severity VARCHAR(20),
    resolution_time_hours DECIMAL(10,2),
    downtime_hours DECIMAL(10,2)
);

CREATE TABLE stg_system_logs (
    log_id VARCHAR(30),
    equipment_id VARCHAR(20),
    log_timestamp DATETIME2,
    cpu_usage_percent DECIMAL(6,2),
    memory_usage_percent DECIMAL(6,2),
    availability_percent DECIMAL(6,3),
    alerts_count INT
);

CREATE TABLE stg_inventory (
    part_id VARCHAR(20),
    part_name VARCHAR(150),
    category VARCHAR(100),
    quantity_in_stock INT,
    reorder_level INT,
    unit_cost DECIMAL(18,2)
);

CREATE TABLE stg_procurement (
    procurement_id VARCHAR(20),
    part_id VARCHAR(20),
    supplier VARCHAR(100),
    order_date DATE,
    delivery_date DATE,
    quantity_ordered INT,
    unit_price DECIMAL(18,2)
);
