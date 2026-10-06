import os
import random
from datetime import timedelta

import numpy as np
import pandas as pd
from faker import Faker

# --------------------------------------------------
# Configuration
# --------------------------------------------------

SEED = 42
random.seed(SEED)
np.random.seed(SEED)

fake = Faker()
Faker.seed(SEED)

OUTPUT_DIR = "data/raw"
os.makedirs(OUTPUT_DIR, exist_ok=True)

# --------------------------------------------------
# 1. Equipment Data
# --------------------------------------------------

equipment_types = [
    "Communication System",
    "Computer Server",
    "Network Device",
    "Monitoring System",
    "Power Unit",
    "Control System"
]

locations = [
    "Site A",
    "Site B",
    "Site C",
    "Site D"
]

equipment_statuses = [
    "Operational",
    "Under Maintenance",
    "Out of Service"
]

equipment_records = []

for i in range(1, 1001):
    equipment_records.append({
        "equipment_id": f"EQ{i:04d}",
        "equipment_type": random.choice(equipment_types),
        "location": random.choice(locations),
        "status": random.choice(equipment_statuses),
        "commission_date": fake.date_between(
            start_date="-10y",
            end_date="-1y"
        )
    })

equipment_df = pd.DataFrame(equipment_records)

# Intentional data quality problems
equipment_df.loc[10, "equipment_id"] = None
equipment_df.loc[25, "status"] = None

# Duplicate record
equipment_df = pd.concat(
    [equipment_df, equipment_df.iloc[[50]]],
    ignore_index=True
)

# --------------------------------------------------
# 2. Personnel Data
# --------------------------------------------------

specializations = [
    "Network Engineer",
    "Systems Engineer",
    "Maintenance Engineer",
    "Data Analyst",
    "Technician",
    "Operations Specialist"
]

personnel_records = []

for i in range(1, 301):
    personnel_records.append({
        "personnel_id": f"P{i:04d}",
        "name": fake.name(),
        "specialization": random.choice(specializations),
        "team": f"Team {random.randint(1, 10)}",
        "location": random.choice(locations),
        "years_experience": random.randint(1, 25)
    })

personnel_df = pd.DataFrame(personnel_records)

# --------------------------------------------------
# 3. Maintenance Data
# --------------------------------------------------

maintenance_types = [
    "Preventive",
    "Corrective",
    "Emergency",
    "Inspection"
]

maintenance_records = []

for i in range(1, 5001):

    equipment_id = f"EQ{random.randint(1, 1000):04d}"
    personnel_id = f"P{random.randint(1, 300):04d}"

    maintenance_date = fake.date_between(
        start_date="-3y",
        end_date="today"
    )

    maintenance_records.append({
        "maintenance_id": f"M{i:05d}",
        "equipment_id": equipment_id,
        "personnel_id": personnel_id,
        "maintenance_date": maintenance_date,
        "maintenance_type": random.choice(maintenance_types),
        "maintenance_cost": round(
            random.uniform(200, 15000),
            2
        ),
        "downtime_hours": round(
            random.uniform(0.5, 48),
            2
        )
    })

maintenance_df = pd.DataFrame(maintenance_records)

# Intentional issues
maintenance_df.loc[15, "equipment_id"] = None
maintenance_df.loc[20, "maintenance_cost"] = -500

# Duplicate
maintenance_df = pd.concat(
    [maintenance_df, maintenance_df.iloc[[100]]],
    ignore_index=True
)

# --------------------------------------------------
# 4. Incident / Failure Data
# --------------------------------------------------

failure_types = [
    "Network Failure",
    "Hardware Failure",
    "Software Error",
    "Power Failure",
    "Communication Loss",
    "Performance Degradation"
]

severity_levels = [
    "Low",
    "Medium",
    "High",
    "Critical"
]

incident_records = []

for i in range(1, 3001):

    incident_date = fake.date_between(
        start_date="-3y",
        end_date="today"
    )

    incident_records.append({
        "incident_id": f"INC{i:05d}",
        "equipment_id": f"EQ{random.randint(1, 1000):04d}",
        "incident_date": incident_date,
        "failure_type": random.choice(failure_types),
        "severity": random.choice(severity_levels),
        "resolution_time_hours": round(
            random.uniform(0.5, 72),
            2
        ),
        "downtime_hours": round(
            random.uniform(0.1, 48),
            2
        )
    })

incidents_df = pd.DataFrame(incident_records)

# Invalid equipment reference
incidents_df.loc[
    30,
    "equipment_id"
] = "EQ9999"

# --------------------------------------------------
# 5. System Performance Logs
# --------------------------------------------------

system_logs = []

for i in range(1, 10001):

    system_logs.append({
        "log_id": f"LOG{i:06d}",
        "equipment_id": f"EQ{random.randint(1, 1000):04d}",
        "timestamp": fake.date_time_between(
            start_date="-1y",
            end_date="now"
        ),
        "cpu_usage_percent": round(
            random.uniform(5, 100),
            2
        ),
        "memory_usage_percent": round(
            random.uniform(10, 100),
            2
        ),
        "availability_percent": round(
            random.uniform(90, 100),
            3
        ),
        "alerts_count": random.randint(0, 20)
    })

system_logs_df = pd.DataFrame(system_logs)

# Invalid availability value
system_logs_df.loc[
    40,
    "availability_percent"
] = 150

# --------------------------------------------------
# 6. Inventory Data
# --------------------------------------------------

part_categories = [
    "Network Parts",
    "Server Components",
    "Power Components",
    "Communication Parts",
    "Cables",
    "Electronic Components"
]

inventory_records = []

for i in range(1, 501):

    quantity = random.randint(0, 500)
    reorder_level = random.randint(10, 100)

    inventory_records.append({
        "part_id": f"PART{i:04d}",
        "part_name": f"Spare Part {i}",
        "category": random.choice(part_categories),
        "quantity_in_stock": quantity,
        "reorder_level": reorder_level,
        "unit_cost": round(
            random.uniform(10, 5000),
            2
        )
    })

inventory_df = pd.DataFrame(inventory_records)

# Invalid stock
inventory_df.loc[
    12,
    "quantity_in_stock"
] = -10

# --------------------------------------------------
# 7. Procurement Data
# --------------------------------------------------

suppliers = [
    "Supplier A",
    "Supplier B",
    "Supplier C",
    "Supplier D",
    "Supplier E"
]

procurement_records = []

for i in range(1, 2001):

    order_date = fake.date_between(
        start_date="-3y",
        end_date="-30d"
    )

    delivery_days = random.randint(2, 60)

    delivery_date = (
        pd.Timestamp(order_date)
        + timedelta(days=delivery_days)
    ).date()

    procurement_records.append({
        "procurement_id": f"PO{i:05d}",
        "part_id": f"PART{random.randint(1, 500):04d}",
        "supplier": random.choice(suppliers),
        "order_date": order_date,
        "delivery_date": delivery_date,
        "quantity_ordered": random.randint(1, 200),
        "unit_price": round(
            random.uniform(10, 5000),
            2
        )
    })

procurement_df = pd.DataFrame(
    procurement_records
)

# --------------------------------------------------
# Save Data
# --------------------------------------------------

datasets = {
    "equipment.csv": equipment_df,
    "personnel.csv": personnel_df,
    "maintenance.csv": maintenance_df,
    "incidents.csv": incidents_df,
    "system_logs.csv": system_logs_df,
    "inventory.csv": inventory_df,
    "procurement.csv": procurement_df
}

print("\nGenerating operational datasets...\n")

for filename, dataframe in datasets.items():

    file_path = os.path.join(
        OUTPUT_DIR,
        filename
    )

    dataframe.to_csv(
        file_path,
        index=False
    )

    print(
        f"{filename:<20} "
        f"{len(dataframe):>8} records"
    )

print("\nAll datasets generated successfully.")
print(f"Output directory: {OUTPUT_DIR}")
