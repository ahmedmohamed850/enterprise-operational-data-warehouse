import os
import random
import pandas as pd
from faker import Faker

fake = Faker()
random.seed(42)

OUTPUT_DIR = "data/raw"
os.makedirs(OUTPUT_DIR, exist_ok=True)

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

statuses = [
    "Operational",
    "Under Maintenance",
    "Out of Service"
]

records = []

for i in range(1, 1001):

    equipment_id = f"EQ{i:04d}"

    commission_date = fake.date_between(
        start_date="-10y",
        end_date="-1y"
    )

    records.append({
        "equipment_id": equipment_id,
        "equipment_type": random.choice(equipment_types),
        "location": random.choice(locations),
        "status": random.choice(statuses),
        "commission_date": commission_date
    })

df = pd.DataFrame(records)

# Intentional data-quality issues
df.loc[10, "equipment_id"] = None
df.loc[25, "status"] = None

# Add duplicate record
df = pd.concat(
    [df, df.iloc[[50]]],
    ignore_index=True
)

output_file = os.path.join(
    OUTPUT_DIR,
    "equipment.csv"
)

df.to_csv(
    output_file,
    index=False
)

print(f"Generated {len(df)} equipment records")
print(f"Saved to: {output_file}")
print(df.head())
