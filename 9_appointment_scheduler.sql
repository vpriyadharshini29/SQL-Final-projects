-- Appointment Scheduler

CREATE TABLE services (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE appointments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    service_id INT,
    appointment_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (service_id) REFERENCES services(id),
    UNIQUE (service_id, appointment_time)
);

-- Sample Data
INSERT INTO services (name) VALUES ('Haircut'), ('Consultation');
INSERT INTO appointments (user_id, service_id, appointment_time) VALUES
(1, 1, '2025-08-09 10:00:00'),
(1, 2, '2025-08-09 15:00:00');

-- Example Query: Appointments by date
SELECT * FROM appointments WHERE DATE(appointment_time) = CURDATE();