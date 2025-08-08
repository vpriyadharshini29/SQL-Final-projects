-- Leave Management System

CREATE TABLE leave_types (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(100)
);

CREATE TABLE leave_requests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    leave_type_id INT,
    from_date DATE,
    to_date DATE,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    FOREIGN KEY (emp_id) REFERENCES employees(id),
    FOREIGN KEY (leave_type_id) REFERENCES leave_types(id),
    CONSTRAINT no_overlap CHECK (from_date <= to_date)
);

-- Sample Data
INSERT INTO leave_types (type_name) VALUES ('Sick Leave'), ('Casual Leave');
INSERT INTO leave_requests (emp_id, leave_type_id, from_date, to_date, status) VALUES
(1, 1, '2025-08-05', '2025-08-07', 'approved'),
(2, 2, '2025-08-10', '2025-08-12', 'pending');

-- Example Query: Aggregate leaves by employee
SELECT e.name, lt.type_name, COUNT(*) AS total_leaves
FROM leave_requests lr
JOIN employees e ON lr.emp_id = e.id
JOIN leave_types lt ON lr.leave_type_id = lt.id
GROUP BY e.name, lt.type_name;