# Isolation Levels and Parallel Access Problems

## 1. Lost Update
Description:
Occurs when two concurrent transactions read the same row and update it, but one update overwrites the other.

Steps to Reproduce:
1. Transaction 1 reads and updates value by 10.
2. Before Transaction 1 commits, Transaction 2 reads and updates value by 5.
3. Both transactions commit.

Result:
- Final value: 20 (Transaction 2's update is lost).

## 2. Dirty Read (MySQL Only)
Description:
A dirty read occurs when a transaction reads uncommitted data from another transaction.

Steps to Reproduce:
1. Transaction 1 updates a row but does not commit.
2. Transaction 2 reads the uncommitted value.
3. Transaction 1 rolls back.

Result:
- Transaction 2 reads the uncommitted value (100), but after the rollback, the final committed value remains unchanged.

## 3. Non-repeatable Read
Description:
Occurs when a transaction reads the same data twice, but a concurrent transaction modifies the data in between the reads.

Steps to Reproduce:
1. Transaction 1 reads value = 10.
2. Transaction 2 updates value = 20 and commits.
3. Transaction 1 reads the value again.

Result:
- First read: 10
- Second read: 20 (value changed by Transaction 2).

## 4. Phantom Read
Description:
Occurs when a transaction re-reads a set of rows and finds new rows that weren’t there before, because another transaction inserted them.

Steps to Reproduce:
1. Transaction 1 reads rows where value >= 10.
2. Transaction 2 inserts a new row with value = 15 and commits.
3. Transaction 1 re-reads the rows.

Result:
- First read: 1 row
- Second read: 2 rows (the new row from Transaction 2 appears).