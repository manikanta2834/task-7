# task-7
sql internship
# Task 7 - SQL Views

## ✅ Objective
Practice creating and using SQL views to abstract and simplify complex queries.

## 🛠 Tools
- DB Browser for SQLite / MySQL Workbench

## 📚 What I Did
- Created base tables: `employees` and `departments`
- Made views:
  - `high_earners`: filters employees earning above 70k
  - `emp_with_dept_info`: joins employee data with department location
- Demonstrated how to query and optionally update (if DB supports) via views.


💬 Interview Questions & Answers
1. What is a view?
A view is a virtual table in SQL based on a SELECT query. It doesn't store data physically but presents data from one or more tables in a structured way.

2. Can we update data through a view?
Yes, but only if the view is updatable (i.e., it’s based on a single table without aggregate functions, GROUP BY, or DISTINCT).
You can also use INSTEAD OF triggers in some databases to enable updates.

3. What is a materialized view?
A materialized view stores the result of a query physically on disk. Unlike normal views, it doesn’t get updated in real time. You need to refresh it manually or at defined intervals.

4. Difference between view and table?

Feature	View	Table
Storage	Virtual (no physical storage)	Physical (stores data)
Updates	Sometimes possible	Always possible
Use case	Data abstraction, security	Storing actual data

5. How to drop a view?
Use this SQL command:

sql
Copy
Edit
DROP VIEW view_name;
6. Why use views?

Abstraction: Hide complex joins or filters

Security: Restrict access to certain columns

Reusability: Use complex queries repeatedly

Maintainability: Centralized logic

7. Can we create indexed views?
Yes, in some databases like SQL Server, you can create indexed views (also called materialized views in other DBMS) to improve performance, but with restrictions.

8. How to secure data using views?

Only expose selected columns or rows

Restrict user access to base tables and grant permission only on views

Use WITH CHECK OPTION to enforce rules on inserts/updates

9. What are limitations of views?

Cannot always update data through them

May have performance issues for complex views

Cannot index normal views

Cannot include certain clauses (e.g., ORDER BY in some DBMS)

10. How does WITH CHECK OPTION work?
It ensures that any insert or update made through the view must satisfy the view’s WHERE condition.
Example:

sql
Copy
Edit
CREATE VIEW active_users AS
SELECT * FROM users WHERE status = 'active'
WITH CHECK OPTION;
Now, inserting a user with status = 'inactive' via this view will fail.


