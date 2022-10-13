-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-13 22:33:51.567

-- tables
-- Table: DIMMark
CREATE TABLE DIMMark (
    MarkID int  NOT NULL,
    Mark int  NOT NULL,
    Date date  NOT NULL,
    "Current" int  NOT NULL,
    CONSTRAINT DIMMark_pk PRIMARY KEY  (MarkID)
);

-- Table: FactsEmployee
CREATE TABLE FactsEmployee (
    PESEL int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Surname varchar(50)  NOT NULL,
    Address varchar(50)  NOT NULL,
    Salary decimal(6,2)  NOT NULL,
    MarkID int  NOT NULL,
    DIMMark_MarkID int  NOT NULL,
    CONSTRAINT FactsEmployee_pk PRIMARY KEY  (PESEL)
);

-- foreign keys
-- Reference: FactsEmployee_DIMMark (table: FactsEmployee)
ALTER TABLE FactsEmployee ADD CONSTRAINT FactsEmployee_DIMMark
    FOREIGN KEY (DIMMark_MarkID,MarkID)
    REFERENCES DIMMark (MarkID,MarkID);

-- End of file.

