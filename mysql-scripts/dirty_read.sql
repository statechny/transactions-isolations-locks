-- Transaction 1
START TRANSACTION;
UPDATE test_table SET value = 100 WHERE id = 1;

-- Transaction 2
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT value FROM test_table WHERE id = 1;

-- Transaction 1 (rollback)
ROLLBACK;
