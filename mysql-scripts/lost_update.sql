-- Transaction 1
START TRANSACTION;
SELECT value FROM test_table WHERE id = 1;
UPDATE test_table SET value = value + 10 WHERE id = 1;

-- Transaction 2 (run concurrently)
START TRANSACTION;
SELECT value FROM test_table WHERE id = 1;
UPDATE test_table SET value = value + 5 WHERE id = 1;
COMMIT;

-- Transaction 1 (continuation)
COMMIT;
