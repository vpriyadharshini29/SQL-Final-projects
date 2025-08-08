-- Employee Timesheet Tracker

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    dept VARCHAR(100)
);

CREATE TABLE projects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE timesheets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    project_id INT,
    hours DECIMAL(5,2),
    date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

-- Sample Data
INSERT INTO employees (name, dept) VALUES ('Alice', 'IT'), ('Bob', 'HR');
INSERT INTO projects (name) VALUES ('Website Development'), ('Recruitment Drive');
INSERT INTO timesheets (emp_id, project_id, hours, date) VALUES
(1, 1, 8, '2025-08-01'),
(2, 2, 6, '2025-08-02');

-- Example Query: Weekly hours per employee
SELECT e.name, SUM(t.hours) AS total_hours
FROM timesheets t
JOIN employees e ON t.emp_id = e.id
WHERE WEEK(t.date) = WEEK(CURDATE())
GROUP BY e.name;