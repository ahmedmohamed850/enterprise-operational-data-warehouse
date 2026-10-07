-- =====================================================
-- 04 - Management Analytics Queries
-- =====================================================

-- 1. Equipment with highest incident frequency
SELECT TOP 10
    e.EquipmentID,
    e.EquipmentType,
    COUNT(i.IncidentKey) AS FailureCount
FROM FactIncidents i
JOIN DimEquipment e
    ON i.EquipmentKey = e.EquipmentKey
GROUP BY
    e.EquipmentID,
    e.EquipmentType
ORDER BY FailureCount DESC;


-- 2. Maintenance cost by equipment type
SELECT
    e.EquipmentType,
    COUNT(m.MaintenanceKey) AS MaintenanceEvents,
    SUM(m.MaintenanceCost) AS TotalMaintenanceCost,
    AVG(m.MaintenanceCost) AS AverageMaintenanceCost
FROM FactMaintenance m
JOIN DimEquipment e
    ON m.EquipmentKey = e.EquipmentKey
GROUP BY e.EquipmentType
ORDER BY TotalMaintenanceCost DESC;


-- 3. Total downtime by equipment type
SELECT
    e.EquipmentType,
    SUM(m.DowntimeHours) AS TotalDowntimeHours,
    AVG(m.DowntimeHours) AS AverageDowntimeHours
FROM FactMaintenance m
JOIN DimEquipment e
    ON m.EquipmentKey = e.EquipmentKey
GROUP BY e.EquipmentType
ORDER BY TotalDowntimeHours DESC;


-- 4. Incident severity distribution
SELECT
    Severity,
    COUNT(*) AS IncidentCount
FROM FactIncidents
GROUP BY Severity
ORDER BY IncidentCount DESC;


-- 5. Average incident resolution time
SELECT
    Severity,
    AVG(ResolutionTimeHours) AS AverageResolutionHours
FROM FactIncidents
GROUP BY Severity
ORDER BY AverageResolutionHours DESC;


-- 6. Inventory reorder alerts
SELECT
    PartID,
    PartName,
    Category,
    QuantityInStock,
    ReorderLevel
FROM FactInventory
WHERE QuantityInStock <= ReorderLevel
ORDER BY QuantityInStock ASC;


-- 7. Supplier delivery performance
SELECT
    s.SupplierName,
    COUNT(p.ProcurementKey) AS Orders,
    AVG(
        DATEDIFF(
            DAY,
            p.OrderDate,
            p.DeliveryDate
        )
    ) AS AverageDeliveryDays,
    SUM(p.TotalCost) AS TotalProcurementValue
FROM FactProcurement p
JOIN DimSupplier s
    ON p.SupplierKey = s.SupplierKey
GROUP BY s.SupplierName
ORDER BY AverageDeliveryDays ASC;


-- 8. Maintenance trend by year and month
SELECT
    d.YearNumber,
    d.MonthNumber,
    COUNT(m.MaintenanceKey) AS MaintenanceEvents,
    SUM(m.MaintenanceCost) AS TotalMaintenanceCost
FROM FactMaintenance m
JOIN DimDate d
    ON m.DateKey = d.DateKey
GROUP BY
    d.YearNumber,
    d.MonthNumber
ORDER BY
    d.YearNumber,
    d.MonthNumber;


-- 9. Critical incidents by equipment
SELECT
    e.EquipmentID,
    e.EquipmentType,
    COUNT(*) AS CriticalIncidents
FROM FactIncidents i
JOIN DimEquipment e
    ON i.EquipmentKey = e.EquipmentKey
WHERE i.Severity = 'Critical'
GROUP BY
    e.EquipmentID,
    e.EquipmentType
ORDER BY CriticalIncidents DESC;


-- 10. Maintenance KPI summary
SELECT
    COUNT(*) AS TotalMaintenanceEvents,
    SUM(MaintenanceCost) AS TotalMaintenanceCost,
    AVG(MaintenanceCost) AS AverageMaintenanceCost,
    SUM(DowntimeHours) AS TotalDowntimeHours,
    AVG(DowntimeHours) AS AverageDowntimeHours
FROM FactMaintenance;
