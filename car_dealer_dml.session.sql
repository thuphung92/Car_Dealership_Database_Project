INSERT INTO Department (department_id, name) VALUES
    (1, 'sales'),
    (2, 'mechanics');

INSERT INTO Employee (employee_id, first_name, last_name, phone, email, department_id) VALUES
    (1, 'James', 'Thompson', '714-159-4567', 'jthompson@gmail.com', 2),
    (2, 'Mary', 'Jacobs', '657-148-4597', 'm.jacobs@yahoo.com', 1),
    (3, 'George', 'Smith', '346-222-4892', 'georgesmith@gmail.com',2),
    (4, 'Rob', 'Christman', '949-398-4598', 'rob.christman@gmail.com',2),
    (5, 'Judy','Hayes','714-589-1576', 'judyhayes@gmail.com',1);

INSERT INTO Car_Category (group_id, name) VALUES
    (1, 'new'),
    (2, 'used');

INSERT INTO inventory_category (category_code, name) VALUES
    ('C', 'car'),
    ('S', 'spare part');

INSERT INTO Spare_Part_Category(sp_category_id, name) VALUES
    (1, 'battery'),
    (2, 'brake'),
    (3,'motor oil'),
    (4,'windshield wiper');

INSERT INTO Inventory (inventory_id, category_code, date_in, date_out, price)   VALUES
    (1,'C','2021-07-01',NULL, 29874),
    (2,'C','2021-07-01',NULL, 6995),
    (3,'C','2021-07-01',NULL, 7995),
    (4,'C','2021-07-01',NULL,18920),
    (5,'C','2021-07-01',NULL, 40120),
    (6,'S','2021-07-01',NULL, 119.99),
    (7,'S','2021-07-01',NULL,119.99),
    (8,'S','2021-07-01',NULL,4.49),
    (9,'S','2021-07-01',NULL,19.99),
    (10,'S','2021-07-01',NULL,31.99),
    (11,'S','2021-07-01',NULL,12.99),
    (12,'S','2021-07-01',NULL,112.99),
    (13,'S','2021-07-01',NULL,65.99),
    (14,'S','2021-07-01',NULL,4.49),
    (15,'S','2021-07-01',NULL,4.49),
    (16,'S','2021-07-01',NULL,4.49),
    (17,'S','2021-07-01',NULL,19.99),
    (18,'S','2021-07-01',NULL,19.99),
    (19,'S','2021-07-01',NULL,19.99);

INSERT INTO car_for_sales (inventory_id, make, model, year, color, vin, miles, description, group_id) VALUES
    (1,'Toyota','Prius Limited',2021,'Electric Storm Blue','JTDKAMFPXM3170596',NULL,NULL,1),
    (2,'Toyota','Prius',2012,'Clearwater Blue','JTDKN3DP1C3008193',179007, '1.8L 4-Cylinder Hybrid Gas/Electric Engine - Continuously Variable Automatic Transmission - 2 wheel drive - front - 11 Mile EV Range.',2),
    (3,'Infiniti','G25 Journey',2013, 'Moonlight White', 'JN1DV6AP5CM810516',173680, 'Graphite Leather Seats - 2.5L 6-Cylinder Gas Engine - 7-Speed Automatic Transmission - 2 wheel drive - rear',2),
    (4,'Huyndai','Venue SE',2021,'Galactic Gray','KMHRB8A37MU127394',10,'Black Interior - 1.6L 4-Cylinder Gas Engine - Continuously Variable Automatic Transmission - 2 wheel drive - front',1),
    (5,'Lexus', 'NX 300',2021,'Matador Red Mica','JTJDARBZ9M5030537',7,'Black Interior - 2.0L 4-Cylinder Turbo Gas Engine - 6-Speed Automatic Transmission - 2 wheel drive - front',1);

INSERT INTO Spare_Part (inventory_id, name, sp_category_id) VALUES
    (6, 'Duralast Platinum EFB Battery 27F-EFB Group Size 27F 810 CCA',1),
    (7,'Duralast Platinum EFB Battery H7-EFB Group Size H7 770 CCA',1),
    (8,'STP Engine Oil High Mileage Conventional 5W-30 1 Quart',3),
    (9,'STP Engine Oil High Mileage Conventional 5W-30 5 Quarts',3),
    (10,'Bosch Envision 28in Beam Wiper Blade',4),
    (11,'Bosch 11in Beam Wiper Blade',4),
    (12,'Duralast Remanufactured Brake Power Booster 53-2070',2),
    (13,'Duralast New Master Cylinder (Brake System) NM52231',2),
    (14,'STP Engine Oil High Mileage Conventional 5W-30 1 Quart',3),
    (15,'STP Engine Oil High Mileage Conventional 5W-30 1 Quart',3),
    (16,'STP Engine Oil High Mileage Conventional 5W-30 1 Quart',3),
    (17,'STP Engine Oil High Mileage Conventional 5W-30 5 Quarts',3),
    (18,'STP Engine Oil High Mileage Conventional 5W-30 5 Quarts',3),
    (19,'STP Engine Oil High Mileage Conventional 5W-30 5 Quarts',3);

INSERT INTO Customer (customer_id, first_name, last_name, phone, email) VALUES
    (1, 'Jim','Rogers','555-232-3456', 'jim.rogers@somewhere.com'),
    (2,'Mary','Keenan','555-232-4567','mary.keenan@somewhere.com'),
    (3,'Nigel','Melnik','555-232-5678','nigel.melnik@somewhere.com'),
    (4,'Jenny','Mayberry','657-232-1234','jenny.mayberry@somewhere.com'),
    (5,'Ken','Roberts','714-589-4567',NULL),
    (6,'Taylor','Sam','909-456-1234',NULL);

INSERT INTO Service_Category(service_id,name,price) VALUES
    (1,'oil change',45),
    (2, 'tire rotation', 60),
    (3, 'tire relacement',150),
    (4,'engine air filter relacement',35),
    (5,'brake pad replacement',250),
    (6,'wiper blade replacement',40),
    (7,'battery replacement',300);


----------------------- CAR SERVICE ---------------------
-- Step 1: Input car info if necessary
INSERT INTO Car_Serviced (vin,make,model,year,color,license_plate)  VALUES
    ('19XFC2F68KE200319','Honda','Civic LX',2019,'Steel Metallic',null),
    ('4T1BK36B58U306866', 'Toyota','Avalon XLS',2008,'Classic Silver Metallic',NULL),
    ('JHMCP26498C070619','Honda','Accord LX-P',2008,'white','6ENA687');

-- Step 2: Issue service ticket
INSERT INTO Service_Ticket (ticket_id, date,customer_id,vin,service_id,inventory_id,amount) VALUES
    (1, now(), 6,'19XFC2F68KE200319',6,11,40),
    (2,now(),1,'4T1BK36B58U306866',1,14,45),
    (3, now(),5,'JHMCP26498C070619',1,8,45);

-- Step 3: Update date_out of that spare part in the inventory if needed
UPDATE  Inventory
SET     date_out = now()
WHERE   inventory_id IN (11,14,8);

-- Step 4: Assign mechanic(s) for the car-serviced
INSERT INTO car_mechanic (employee_id,vin,mechanic_order) VALUES
    (1,'19XFC2F68KE200319',1), --- situation where 02 mechanics took care of 01 car
    (3,'19XFC2F68KE200319',2),
    (1,'4T1BK36B58U306866',1),
    (4,'JHMCP26498C070619',1);

------------------------- SELLING CAR ----------------------
-- Step 1: Issue Sales invoice
INSERT INTO Sales_Invoice(invoice_id,employee_id,inventory_id,date,customer_id,amount) VALUES
    (1,2,1,now(),4,31250),
    (2,5,5,now(),2,43050);

-- Step 2: MUST update the date_out of that car in the inventory
UPDATE Inventory --- update inventory to show that the car was sold
SET date_out = now()
WHERE inventory_id IN (1,5);


----------------------- STORED PROCEDURE ---------------------
DROP PROCEDURE IF EXISTS selling_car;

CREATE OR REPLACE PROCEDURE selling_car(_invoice_id INT,_employee_id INT,_inventory_id INT,_customer_id INT,_amount NUMERIC)
LANGUAGE plpgsql
AS
$$
BEGIN
    --- Issue Car_Invoice
    INSERT INTO Sales_Invoice(invoice_id,employee_id,inventory_id,date,customer_id,amount) VALUES
        (_invoice_id,_employee_id,_inventory_id,now(),_customer_id,_amount);
    
    --- Update inventory
    UPDATE Inventory
    SET date_out= now()
    WHERE inventory_id = _inventory_id;

    commit;
END;
$$

CALL selling_car(3,2,2,3,8500);

SELECT * FROM sales_invoice