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