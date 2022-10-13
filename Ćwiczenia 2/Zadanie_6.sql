-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-13 23:04:37.386

-- tables
-- Table: DIMProduct
CREATE TABLE DIMProduct (
    ProductID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Date date  NOT NULL,
    Brand varchar(50)  NOT NULL,
    Price decimal(4,2)  NOT NULL,
    Amount int  NOT NULL,
    Current int  NOT NULL,
    CONSTRAINT DIMProduct_pk PRIMARY KEY (ProductID)
);

-- Table: DIMWarehouse
CREATE TABLE DIMWarehouse (
    WarehouseID int  NOT NULL,
    Address varchar(100)  NOT NULL,
    Country varchar(100)  NOT NULL,
    ProductID int  NOT NULL,
    CONSTRAINT DIMWarehouse_pk PRIMARY KEY (WarehouseID)
);

-- Table: FactsFMCG
CREATE TABLE FactsFMCG (
    FMCGID int  NOT NULL,
    WarehouseID int  NOT NULL,
    CONSTRAINT FactsFMCG_pk PRIMARY KEY (FMCGID)
);

-- foreign keys
-- Reference: DIMWarehouse_DIMProduct (table: DIMWarehouse)
ALTER TABLE DIMWarehouse ADD CONSTRAINT DIMWarehouse_DIMProduct
    FOREIGN KEY (ProductID)
    REFERENCES DIMProduct (ProductID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactsFMCG_DIMWarehouse (table: FactsFMCG)
ALTER TABLE FactsFMCG ADD CONSTRAINT FactsFMCG_DIMWarehouse
    FOREIGN KEY (WarehouseID)
    REFERENCES DIMWarehouse (WarehouseID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

