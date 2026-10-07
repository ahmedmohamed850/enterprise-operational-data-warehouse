-- =====================================================
-- 02 - Dimension Tables
-- =====================================================

CREATE TABLE DimEquipment (
    EquipmentKey INT IDENTITY(1,1) PRIMARY KEY,
    EquipmentID VARCHAR(20) NOT NULL,
    EquipmentType VARCHAR(100),
    Location VARCHAR(100),
    Status VARCHAR(50),
    CommissionDate DATE,
    CONSTRAINT UQ_DimEquipment UNIQUE (EquipmentID)
);

CREATE TABLE DimPersonnel (
    PersonnelKey INT IDENTITY(1,1) PRIMARY KEY,
    PersonnelID VARCHAR(20) NOT NULL,
    PersonnelName VARCHAR(150),
    Specialization VARCHAR(100),
    Team VARCHAR(50),
    Location VARCHAR(100),
    YearsExperience INT,
    CONSTRAINT UQ_DimPersonnel UNIQUE (PersonnelID)
);

CREATE TABLE DimLocation (
    LocationKey INT IDENTITY(1,1) PRIMARY KEY,
    LocationName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE DimSupplier (
    SupplierKey INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL UNIQUE,
    DayNumber INT,
    MonthNumber INT,
    MonthName VARCHAR(20),
    QuarterNumber INT,
    YearNumber INT
);
