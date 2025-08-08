-- Product Review and Rating System

CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, product_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Sample Data
INSERT INTO reviews (user_id, product_id, rating, review) VALUES
(1, 1, 5, 'Excellent phone!'),
(1, 2, 4, 'Very comfortable shoes.');

-- Example Query: Top-rated products
SELECT p.name, AVG(r.rating) AS avg_rating
FROM reviews r
JOIN products p ON r.product_id = p.id
GROUP BY r.product_id
ORDER BY avg_rating DESC;