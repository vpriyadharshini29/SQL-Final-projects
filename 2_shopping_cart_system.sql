-- Shopping Cart System

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE carts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE cart_items (
    cart_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (cart_id, product_id),
    FOREIGN KEY (cart_id) REFERENCES carts(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Sample Data
INSERT INTO users (name, email) VALUES ('John Doe', 'john@example.com');
INSERT INTO carts (user_id) VALUES (1);
INSERT INTO cart_items (cart_id, product_id, quantity) VALUES (1, 1, 2), (1, 2, 1);

-- Example Queries
SELECT ci.cart_id, p.name, p.price, ci.quantity, (p.price * ci.quantity) AS total_price
FROM cart_items ci
JOIN products p ON ci.product_id = p.id;

SELECT SUM(p.price * ci.quantity) AS cart_total
FROM cart_items ci
JOIN products p ON ci.product_id = p.id
WHERE ci.cart_id = 1;