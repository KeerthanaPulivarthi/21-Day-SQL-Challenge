**MySQL Constraints Practice – 21-Day-SQL-Challenge**
-----------------------------------------------------------
This SQL script includes hands-on practice with MySQL constraints — a key foundation for relational database integrity and real-time data handling. The goal was to learn, test, and validate the behavior of constraints through various realistic scenarios.

🔐 MySQL Constraints Practice

This practice focuses on understanding and applying various MySQL constraints including:

PRIMARY KEY, FOREIGN KEY,

NOT NULL, UNIQUE, DEFAULT,

CHECK, ENUM,

AUTO_INCREMENT, ON DELETE/UPDATE CASCADE.

📂 Structure

The script creates two tables:

Customers,

Orders (with a foreign key referencing Customers.Customer_ID)

🚀 What I Practiced :

✅ Inserted a customer without specifying Status and Payment.

✔️ Defaults were correctly inserted.

❌ Tried to insert a customer with a duplicate Customer_ID.

🔒 PRIMARY KEY constraint blocked it.

❌ Inserted an order with a non-existent Customer_ID.

🔒 FOREIGN KEY constraint prevented invalid entry.

❌ Tried inserting a customer with Status = 'waiting'.

🔒 ENUM only allows 'active' or 'inactive'.

✅ Updated a customer's ID (e.g., from 1 → 345)

🔁 All related orders also updated — thanks to ON UPDATE CASCADE.

✅ Deleted a customer who had orders.

🧹 Related orders were also deleted — verified ON DELETE CASCADE.

✅ Inserted multiple orders for one customer and then deleted the customer.

✔️ All orders were auto-deleted due to ON DELETE CASCADE.

❌ Tried inserting a duplicate email after applying UNIQUE constraint on Email.

🔒 Error message confirmed: Duplicate entry 'mano@gmail.com' for key 'customers.unique_email'.

✅ Added a CHECK constraint to ensure Amount in Orders is non-negative.

❌ Tried to insert an order with a negative amount

📜 How to Use

You can run the entire script from my_practice.sql to:

Create the schema

Populate it with initial data

Run constraint-related test cases

💡 Key Learnings

Constraints are essential for maintaining data accuracy, consistency, and integrity. This practice helped me:

Understand cascading updates and deletions

See how ENUM and CHECK constraints behav
