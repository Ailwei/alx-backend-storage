-- Write a SQL script that creates a stored procedure AddBonus
-- that adds a new correction for a student.

DELIMITER $$

DROP PROCEDURE IF EXISTS AddBonus;

CREATE PROCEDURE AddBonus(
        IN `user_id`    INTEGER,
        IN `project_name` VARCHAR(255),
        IN `SCORE` INTEGER
)
BEGIN
        DECLARE project_id INTEGER;

        -- Insert project if not exists
        INSERT INTO projects (name)
        SELECT project_name
        FROM dual
        WHERE NOT EXISTS (SELECT * FROM projects WHERE name = project_name);

        -- Retrieve the project_id
        SELECT id INTO project_id FROM projects WHERE name = project_name;

        -- Insert correction
        INSERT INTO corrections (user_id, project_id, score)
        VALUES (user_id, project_id, SCORE);
END $$

DELIMITER ;
