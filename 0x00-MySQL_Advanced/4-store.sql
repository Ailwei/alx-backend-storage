-- Create the trigger

CREATE TRIGGER decrease_quantity_after_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    -- UPDATE THE QUANTITY OF THE ITEM IN THE ITEMS TABLE
    UPDATE items
    SET quantity = quantity - NEW.number
    WHERE name = NEW.item_name;
