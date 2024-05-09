-- Assuming names table structure: id (INT), name (VARCHAR), score (INT)
CREATE INDEX idx_name_first_score ON names (LEFT(name, 1), score);
