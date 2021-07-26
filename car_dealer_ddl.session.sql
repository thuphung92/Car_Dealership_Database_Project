DROP TABLE IF EXISTS
    Department,
    Employee,
    Sales_Invoice,
    Car_Mechanic,
    Inventory_Category,
    Inventory,
    Customer,
    Service_Ticket,
    Service_Category,
    Car_Serviced,
    Car_Category,
    Car_For_Sales,
    Spare_Part,
    Spare_Part_Category;

CREATE TABLE Department(
    department_id   SERIAL PRIMARY KEY,
    name            VARCHAR(50) NOT NULL
);

CREATE TABLE Service_Category(
    service_id SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    price       NUMERIC(6,2)
);

CREATE TABLE Car_Category(
    group_id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Spare_Part_Category(
    sp_category_id     SERIAL NOT NULL PRIMARY KEY,
    name            VARCHAR(50)
);

CREATE TABLE Inventory_Category(
    category_code   CHAR(10)       PRIMARY KEY    NOT NULL,
    name            VARCHAR(50)    NOT NULL
);

CREATE TABLE Inventory( --- A supertype having 02 subtypes (car & spareparts)
    inventory_id    SERIAL      PRIMARY KEY,
    category_code   CHAR(1),
    date_in         TIMESTAMP WITHOUT TIME ZONE DEFAULT timezone('utc', now()),
    date_out        TIMESTAMP WITHOUT TIME ZONE DEFAULT timezone('utc', now()),
    price           NUMERIC(12,2),
    FOREIGN KEY (category_code) REFERENCES Inventory_Category(category_code) ON DELETE CASCADE
);

CREATE TABLE Spare_Part( --- One of the subtypes of the Inventory supertype
    inventory_id   INT NOT NULL PRIMARY KEY, --- Must be constrained as a PRIMARY KEY and a FOREIGN KEY
    name    VARCHAR(250),
    sp_category_id  INT,
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id) ON DELETE CASCADE,
    FOREIGN KEY (sp_category_id) REFERENCES Spare_Part_Category(sp_category_id) ON DELETE CASCADE
);

CREATE TABLE Customer (
    customer_id     SERIAL PRIMARY KEY,
    first_name      VARCHAR(50)     NOT NULL,
    last_name       VARCHAR(50)     NOT NULL,
    phone           VARCHAR(15)     NOT NULL,
    email           VARCHAR(150)
);

CREATE TABLE Employee (
    employee_id     SERIAL          PRIMARY KEY,
    first_name      VARCHAR(50)     NOT NULL,
    last_name       VARCHAR(50)     NOT NULL,
    phone           VARCHAR(15),
    email           VARCHAR(100),
    department_id   INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id) ON DELETE CASCADE
);

CREATE TABLE Car_Serviced(
    vin             VARCHAR(17)     NOT NULL        PRIMARY KEY,
    make            VARCHAR(50)     NOT NULL,
    model           VARCHAR(50)     NOT NULL,
    year            INT             NOT NULL,
    color           VARCHAR(50),
    license_plate   VARCHAR(10)
);

CREATE TABLE Car_Mechanic( --- This table is used to track how many mechanics worked on 01 car-serviced
    employee_id     INT             NOT NULL,
    vin             VARCHAR(17)     NOT NULL,
    mechanic_order  INT NOT NULL,
    PRIMARY KEY (employee_id,vin),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (vin) REFERENCES Car_Serviced(vin) ON DELETE CASCADE
);

CREATE TABLE Car_For_Sales( --- One of the subtypes
    inventory_id      SERIAL          PRIMARY KEY, --- Must be constrained as the PRIMARY KEY and a FOREIGN KEY.
    make        VARCHAR(50)     NOT NULL,
    model       VARCHAR(100),
    year        INT             NOT NULL,
    color       VARCHAR(50),
    vin         VARCHAR(17),
    miles       INT,
    description TEXT,
    group_id    INT,
    FOREIGN KEY (group_id) REFERENCES Car_Category(group_id) ON DELETE CASCADE,
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id) ON DELETE CASCADE
);

CREATE TABLE Sales_Invoice(
    invoice_id    SERIAL          PRIMARY KEY,
    employee_id     INT             NOT NULL,
    inventory_id    INT             NOT NULL,
    date            TIMESTAMP WITHOUT TIME ZONE DEFAULT timezone('utc', now()),
    customer_id     INT             NOT NULL,
    amount          NUMERIC(12,2)   NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
    UNIQUE (invoice_id,inventory_id) --- force 1:1 relationship constraint beetween a sales-invoice and a car for sales
);

CREATE TABLE Service_Ticket(
    ticket_id           SERIAL      PRIMARY KEY,
    date TIMESTAMP WITHOUT TIME ZONE DEFAULT timezone ('utc', now()),
    customer_id         INT NOT NULL,
    vin                 VARCHAR(17) NOT NULL,
    service_id          INT         NOT NULL,
    inventory_id        INT         NOT NULL,
    amount              NUMERIC(5,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (vin) REFERENCES Car_Serviced(vin) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES Service_Category(service_id) ON DELETE CASCADE,
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id) ON DELETE CASCADE,
    UNIQUE (ticket_id,vin) --- force 1:1 relationship between a car-serviced and a service-ticket
);