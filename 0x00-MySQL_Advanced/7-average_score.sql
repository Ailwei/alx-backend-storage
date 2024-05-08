-- Write a SQL script that creates a stored procedure ComputeAverageScoreForUser
-- that computes and stores the average score for a student.

DELIMITER $$

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

CREATE PROCEDURE ComputeAverageScoreForUser(
        IN `user_id` INTEGER
)
BEGIN
    DECLARE avg_score DECIMAL(10, 2);

    -- Compute average score for the user
    SELECT AVG(score) INTO avg_score
    FROM corrections
    WHERE user_id = user_id;

    -- Store the average score for the user
    INSERT INTO average_scores (user_id, average_score)
    VALUES (user_id, avg_score);

END $$

DELIMITER ;
