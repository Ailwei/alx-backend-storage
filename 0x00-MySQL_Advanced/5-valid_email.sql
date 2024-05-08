-- Create a trigger that resets the attribute valid email
-- only when the email has been changed.

DELIMITER $$
CREATE TRIGGER reset_valid_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if the email has been changed
    IF OLD.email != NEW.email THEN
        -- Reset the valid_email attribute to 0
        SET NEW.valid_email = 0;
    END IF;
END$$
DELIMITER ;
