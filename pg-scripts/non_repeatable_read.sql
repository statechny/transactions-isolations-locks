-- Transaction 1
START TRANSACTION;
SELECT value FROM test_table WHERE id = 1;

-- Transaction 2
START TRANSACTION;
UPDATE test_table SET value = 20 WHERE id = 1;
COMMIT;

-- Transaction 1 (continuation)
SELECT value FROM test_table WHERE id = 1;
COMMIT;
