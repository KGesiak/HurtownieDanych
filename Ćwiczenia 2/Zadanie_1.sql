-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-13 19:49:14.375

-- tables
-- Table: DIMAuthor
CREATE TABLE DIMAuthor (
    AuthorID int  NOT NULL,
    Name int  NOT NULL,
    Surname int  NOT NULL,
    CONSTRAINT DIMAuthor_pk PRIMARY KEY  (AuthorID)
);

-- Table: DIMBook
CREATE TABLE DIMBook (
    ISBN int  NOT NULL,
    Title varchar(50)  NOT NULL,
    PublisherID int  NOT NULL,
    AuthorID int  NOT NULL,
    NumberOfPages int  NOT NULL,
    CONSTRAINT DIMBook_pk PRIMARY KEY  (ISBN)
);

-- Table: DIMClient
CREATE TABLE DIMClient (
    ClientID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Surname varchar(50)  NOT NULL,
    Address varchar(100)  NOT NULL,
    PhoneNumber int  NOT NULL,
    CONSTRAINT DIMClient_pk PRIMARY KEY  (ClientID)
);

-- Table: DIMCourier
CREATE TABLE DIMCourier (
    CourierID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Address varchar(100)  NOT NULL,
    NIP int  NOT NULL,
    CONSTRAINT DIMCourier_pk PRIMARY KEY  (CourierID)
);

-- Table: DIMPublisher
CREATE TABLE DIMPublisher (
    PublisherID int  NOT NULL,
    Name varchar(50)  NOT NULL,
    Address varchar(100)  NOT NULL,
    CONSTRAINT DIMPublisher_pk PRIMARY KEY  (PublisherID)
);

-- Table: FactsSales
CREATE TABLE FactsSales (
    TransactionID int  NOT NULL,
    ClientID int  NOT NULL,
    CourierID int  NOT NULL,
    ISBN int  NOT NULL,
    Date date  NOT NULL,
    CONSTRAINT FactsSales_pk PRIMARY KEY  (TransactionID)
);

-- foreign keys
-- Reference: DIMBook_DIMAuthor (table: DIMBook)
ALTER TABLE DIMBook ADD CONSTRAINT DIMBook_DIMAuthor
    FOREIGN KEY (AuthorID)
    REFERENCES DIMAuthor (AuthorID);

-- Reference: DIMBook_DIMPublisher (table: DIMBook)
ALTER TABLE DIMBook ADD CONSTRAINT DIMBook_DIMPublisher
    FOREIGN KEY (PublisherID)
    REFERENCES DIMPublisher (PublisherID);

-- Reference: FactsSales_DIMBook (table: FactsSales)
ALTER TABLE FactsSales ADD CONSTRAINT FactsSales_DIMBook
    FOREIGN KEY (ISBN)
    REFERENCES DIMBook (ISBN);

-- Reference: FactsSales_DIMClient (table: FactsSales)
ALTER TABLE FactsSales ADD CONSTRAINT FactsSales_DIMClient
    FOREIGN KEY (ClientID)
    REFERENCES DIMClient (ClientID);

-- Reference: FactsSales_DIMCourier (table: FactsSales)
ALTER TABLE FactsSales ADD CONSTRAINT FactsSales_DIMCourier
    FOREIGN KEY (CourierID)
    REFERENCES DIMCourier (CourierID);

-- End of file.

