 Staff & Store SQL Database

This project sets up a basic SQL database with two related tables: `staff` and `store`. It includes sample data, key SQL features (like `JOIN`, `GROUP BY`, subqueries), a view for reporting, and indexing for performance optimization.

Tables
store
- `store_id` (INT, Primary Key)
- `store_name` (VARCHAR)
- `location` (VARCHAR)

staff
- `staff_id` (INT, Primary Key)
- `first_name` (VARCHAR)
- `last_name` (VARCHAR)
- `email` (VARCHAR)
- `phone` (VARCHAR)
- `active` (TINYINT)
- `store_id` (Foreign Key → store)
- `manager_id` (Self-referencing Foreign Key)


