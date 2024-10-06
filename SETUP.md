# Setup

## 1. Run Docker Compose:
Run the following command to start both MySQL and PostgreSQL containers:

```bash
docker-compose up -d
```

## 2. Initialize the Databases

### 2.1 Access the MySQL container:
```bash
docker-compose exec mysql mysql -uroot -proot
```

### 2.2 ACreate the MySQL table:
```sql
CREATE DATABASE isolation_test;
USE isolation_test;
CREATE TABLE test_table (
    id INT PRIMARY KEY,
    value INT
) ENGINE=InnoDB;
INSERT INTO test_table (id, value) VALUES (1, 10);
```

### 2.3 Access the PostgreSQL container:
```bash
docker-compose exec postgres psql -U postgres
```

### 2.4 ACreate the MySQL table:
```sql
CREATE DATABASE isolation_test;
\c isolation_test;
CREATE TABLE test_table (
    id INT PRIMARY KEY,
    value INT
);
INSERT INTO test_table (id, value) VALUES (1, 10);
```

## 3. Execute the SQL Scripts

### 3.1 For MySQL:
Access the MySQL container and run your SQL scripts:
```bash
docker-compose exec mysql mysql -uroot -proot isolation_test < /mysql-scripts/lost_update.sql
docker-compose exec mysql mysql -uroot -proot isolation_test < /mysql-scripts/dirty_read.sql
docker-compose exec mysql mysql -uroot -proot isolation_test < /mysql-scripts/non_repeatable_read.sql
docker-compose exec mysql mysql -uroot -proot isolation_test < /mysql-scripts/phantom_read.sql
```

### 3.2 For MySQL:
Access the PostgreSQL container and run your SQL scripts:
```bash
docker-compose exec postgres psql -U postgres -d isolation_test -f /pg-scripts/lost_update.sql
docker-compose exec postgres psql -U postgres -d isolation_test -f /pg-scripts/non_repeatable_read.sql
docker-compose exec postgres psql -U postgres -d isolation_test -f /pg-scripts/phantom_read.sql
```
