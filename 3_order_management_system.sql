-- Order Management System

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    status ENUM('pending', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Sample Data
INSERT INTO orders (user_id, status) VALUES (1, 'pending');
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (1, 1, 1, 999.99), (1, 2, 2, 120.00);

-- Example Queries
SELECT o.id, o.status, o.created_at, SUM(oi.price * oi.quantity) AS total_amount
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
WHERE o.user_id = 1
GROUP BY o.id;