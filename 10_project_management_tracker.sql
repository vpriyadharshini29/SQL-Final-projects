-- Project Management Tracker

CREATE TABLE tasks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    name VARCHAR(255),
    status ENUM('pending', 'in_progress', 'completed') DEFAULT 'pending',
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE TABLE task_assignments (
    task_id INT,
    user_id INT,
    PRIMARY KEY (task_id, user_id),
    FOREIGN KEY (task_id) REFERENCES tasks(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Sample Data
INSERT INTO tasks (project_id, name, status) VALUES
(1, 'Design Homepage', 'in_progress'),
(1, 'Develop Backend', 'pending');
INSERT INTO task_assignments (task_id, user_id) VALUES
(1, 1),
(2, 1);

-- Example Query: Task count by status
SELECT p.name, t.status, COUNT(*) AS task_count
FROM tasks t
JOIN projects p ON t.project_id = p.id
GROUP BY p.name, t.status;