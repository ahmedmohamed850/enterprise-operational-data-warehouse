# Data Dictionary

## Equipment

| Field | Description |
|---|---|
| equipment_id | Unique equipment identifier |
| equipment_type | Type of technical asset |
| location | Operational site |
| status | Current equipment status |
| commission_date | Date equipment entered service |

## Personnel

| Field | Description |
|---|---|
| personnel_id | Unique personnel identifier |
| name | Synthetic employee name |
| specialization | Technical specialization |
| team | Assigned technical team |
| location | Assigned site |
| years_experience | Years of professional experience |

## Maintenance

| Field | Description |
|---|---|
| maintenance_id | Unique maintenance event ID |
| equipment_id | Related equipment |
| personnel_id | Assigned personnel |
| maintenance_date | Maintenance date |
| maintenance_type | Preventive, corrective, emergency, inspection |
| maintenance_cost | Cost of maintenance |
| downtime_hours | Equipment downtime |

## Incidents

| Field | Description |
|---|---|
| incident_id | Unique incident identifier |
| equipment_id | Related equipment |
| incident_date | Incident date |
| failure_type | Type of failure |
| severity | Low, Medium, High, Critical |
| resolution_time_hours | Time required to resolve incident |
| downtime_hours | Resulting downtime |

## System Logs

| Field | Description |
|---|---|
| log_id | Unique system log identifier |
| equipment_id | Related equipment |
| timestamp | Log timestamp |
| cpu_usage_percent | CPU utilization |
| memory_usage_percent | Memory utilization |
| availability_percent | System availability |
| alerts_count | Number of alerts |

## Inventory

| Field | Description |
|---|---|
| part_id | Spare-part identifier |
| part_name | Spare-part name |
| category | Part category |
| quantity_in_stock | Current inventory quantity |
| reorder_level | Minimum stock threshold |
| unit_cost | Unit cost |

## Procurement

| Field | Description |
|---|---|
| procurement_id | Procurement transaction ID |
| part_id | Spare part ordered |
| supplier | Supplier name |
| order_date | Purchase order date |
| delivery_date | Delivery date |
| quantity_ordered | Ordered quantity |
| unit_price | Purchase price per unit |
