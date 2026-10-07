-- =====================================================
-- 03 - Fact Tables
-- =====================================================

CREATE TABLE FactMaintenance (
    MaintenanceKey INT IDENTITY(1,1) PRIMARY KEY,
    MaintenanceID VARCHAR(20) NOT NULL,

    EquipmentKey INT,
    PersonnelKey INT,
    DateKey INT,

    MaintenanceType VARCHAR(50),
    MaintenanceCost DECIMAL(18,2),
    DowntimeHours DECIMAL(10,2),

    FOREIGN KEY (EquipmentKey)
        REFERENCES DimEquipment(EquipmentKey),

    FOREIGN KEY (PersonnelKey)
        REFERENCES DimPersonnel(PersonnelKey),

    FOREIGN KEY (DateKey)
        REFERENCES DimDate(DateKey)
);


CREATE TABLE FactIncidents (
    IncidentKey INT IDENTITY(1,1) PRIMARY KEY,
    IncidentID VARCHAR(20) NOT NULL,

    EquipmentKey INT,
    DateKey INT,

    FailureType VARCHAR(100),
    Severity VARCHAR(20),
    ResolutionTimeHours DECIMAL(10,2),
    DowntimeHours DECIMAL(10,2),

    FOREIGN KEY (EquipmentKey)
        REFERENCES DimEquipment(EquipmentKey),

    FOREIGN KEY (DateKey)
        REFERENCES DimDate(DateKey)
);


CREATE TABLE FactInventory (
    InventoryKey INT IDENTITY(1,1) PRIMARY KEY,

    PartID VARCHAR(20),
    PartName VARCHAR(150),
    Category VARCHAR(100),

    QuantityInStock INT,
    ReorderLevel INT,
    UnitCost DECIMAL(18,2),

    InventoryValue AS
        (QuantityInStock * UnitCost)
);


CREATE TABLE FactProcurement (
    ProcurementKey INT IDENTITY(1,1) PRIMARY KEY,
    ProcurementID VARCHAR(20) NOT NULL,

    SupplierKey INT,

    PartID VARCHAR(20),

    OrderDate DATE,
    DeliveryDate DATE,

    QuantityOrdered INT,
    UnitPrice DECIMAL(18,2),

    TotalCost AS
        (QuantityOrdered * UnitPrice),

    FOREIGN KEY (SupplierKey)
        REFERENCES DimSupplier(SupplierKey)
);
