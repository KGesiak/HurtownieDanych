-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-13 20:49:08.574

-- tables
-- Table: DIMClient
CREATE TABLE DIMClient (
    ClientID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Surname varchar(50)  NOT NULL,
    Address varchar(100)  NOT NULL,
    PhoneNumber int  NOT NULL,
    CONSTRAINT DIMClient_pk PRIMARY KEY (ClientID)
);

-- Table: DIMCourier
CREATE TABLE DIMCourier (
    CourierID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Address varchar(100)  NOT NULL,
    NIP int  NOT NULL,
    CONSTRAINT DIMCourier_pk PRIMARY KEY (CourierID)
);

-- Table: DIMFruit
CREATE TABLE DIMFruit (
    FruitID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    PricePerKG decimal(4,2)  NOT NULL,
    Category varchar(50)  NOT NULL,
    CONSTRAINT DIMFruit_pk PRIMARY KEY (FruitID)
);

-- Table: FactsSales
CREATE TABLE FactsSales (
    TransactionID int  NOT NULL,
    ClientID int  NOT NULL,
    CourierID int  NOT NULL,
    FruitID int  NOT NULL,
    MonthOfTransaction int  NOT NULL,
    DayOfTransaction int  NOT NULL,
    TimeOfTransaction time  NOT NULL,
    AmountBought int  NOT NULL,
    PlaceOfTransaction varchar(100)  NOT NULL,
    TransactionPrice decimal(4,2)  NOT NULL,
    CONSTRAINT FactsSales_pk PRIMARY KEY (TransactionID)
);

-- foreign keys
-- Reference: FactsSales_DIMBook (table: FactsSales)
ALTER TABLE FactsSales ADD CONSTRAINT FactsSales_DIMBook
    FOREIGN KEY (FruitID)
    REFERENCES DIMFruit (FruitID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactsSales_DIMClient (table: FactsSales)
ALTER TABLE FactsSales ADD CONSTRAINT FactsSales_DIMClient
    FOREIGN KEY (ClientID)
    REFERENCES DIMClient (ClientID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FactsSales_DIMCourier (table: FactsSales)
ALTER TABLE FactsSales ADD CONSTRAINT FactsSales_DIMCourier
    FOREIGN KEY (CourierID)
    REFERENCES DIMCourier (CourierID)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

