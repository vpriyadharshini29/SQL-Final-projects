-- Sales CRM Tracker

CREATE TABLE leads (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    source VARCHAR(100)
);

CREATE TABLE deals (
    id INT PRIMARY KEY AUTO_INCREMENT,
    lead_id INT,
    user_id INT,
    stage VARCHAR(50),
    amount DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (lead_id) REFERENCES leads(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Sample Data
INSERT INTO leads (name, source) VALUES ('ABC Corp', 'Website'), ('XYZ Ltd', 'Referral');
INSERT INTO deals (lead_id, user_id, stage, amount) VALUES
(1, 1, 'Negotiation', 5000),
(2, 1, 'Closed Won', 10000);

-- Example Query: Deals by stage
SELECT stage, COUNT(*) AS deal_count, SUM(amount) AS total_amount
FROM deals
GROUP BY stage;