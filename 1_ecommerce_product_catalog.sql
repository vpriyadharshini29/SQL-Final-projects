-- E-Commerce Product Catalog

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE brands (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    image_url VARCHAR(255),
    category_id INT,
    brand_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (brand_id) REFERENCES brands(id),
    INDEX idx_category (category_id),
    INDEX idx_brand (brand_id),
    INDEX idx_price (price)
);

-- Sample Data
INSERT INTO categories (name) VALUES ('Electronics'), ('Apparel');
INSERT INTO brands (name) VALUES ('Apple'), ('Nike');
INSERT INTO products (name, description, price, stock, image_url, category_id, brand_id) VALUES
('iPhone 14', 'Latest Apple iPhone', 999.99, 50, 'iphone.jpg', 1, 1),
('Nike Air Max', 'Comfortable sneakers', 120.00, 200, 'airmax.jpg', 2, 2);

-- Example Queries
SELECT * FROM products WHERE category_id = 1;
SELECT * FROM products WHERE brand_id = 1;
SELECT * FROM products WHERE price BETWEEN 100 AND 500;