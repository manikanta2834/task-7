-- Task 7: Creating Views
-- Demonstrates various types of views and their applications

-- 1. Basic View combining customer and order information
CREATE VIEW CustomerOrderSummary AS
SELECT c.customer_id, c.name, c.email, 
       COUNT(o.order_id) AS total_orders,
       SUM(o.amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.email;

-- 2. View with complex logic (products above average price)
CREATE VIEW HighValueProducts AS
SELECT product_id, product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products)
ORDER BY price DESC;

-- 3. Join view combining employee and department data
CREATE VIEW EmployeeDepartmentView AS
SELECT e.employee_id, e.first_name, e.last_name, 
       d.department_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 4. View implementing row-level security
CREATE VIEW SecureUserData AS
SELECT user_id, username, email, account_created
FROM users
WHERE is_active = 1;

-- 5. Complex aggregation view for sales performance
CREATE VIEW SalesPerformance AS
SELECT 
    s.salesperson_id,
    p.first_name || ' ' || p.last_name AS salesperson_name,
    COUNT(*) AS total_sales,
    SUM(s.amount) AS total_revenue,
    AVG(s.amount) AS average_sale,
    MAX(s.sale_date) AS last_sale_date
FROM sales s
JOIN personnel p ON s.salesperson_id = p.employee_id
GROUP BY s.salesperson_id, salesperson_name;








