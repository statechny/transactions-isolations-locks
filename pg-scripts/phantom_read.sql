-- Transaction 1
START TRANSACTION;
SELECT * FROM test_table WHERE value >= 10;

-- Transaction 2
START TRANSACTION;
INSERT INTO test_table (id, value) VALUES (2, 15);
COMMIT;

-- Transaction 1 (continuation)
SELECT * FROM test_table WHERE value >= 10;
COMMIT;
