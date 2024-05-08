-- Create a trigger to reset valid_email only when email has been changed


CREATE TRIGGER reset_valid_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN 
	IF OLD.email <> NEW.email THEN
		SET NEW.valid_email = 0;
	END IF;
END;
