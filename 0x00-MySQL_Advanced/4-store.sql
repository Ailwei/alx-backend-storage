-- Create the trigger

CREATE TRIGGER decrease_quantinty
AFTER INSERT ON orders
FOR EACH ROW
	BEGIN
		--- UPDATE THE QUANTINY OF THE ITEM IN THE ITEMS TABLE
 UPDATE items
SET quantity = quantinty - NEW.quantinty
WHERE item_id = NEW.item_id;
END;
