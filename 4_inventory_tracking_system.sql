-- Inventory Tracking System

CREATE TABLE suppliers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE inventory_logs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    supplier_id INT,
    action ENUM('add', 'remove') NOT NULL,
    qty INT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

-- Sample Data
INSERT INTO suppliers (name) VALUES ('ABC Supplies'), ('XYZ Traders');
INSERT INTO inventory_logs (product_id, supplier_id, action, qty) VALUES
(1, 1, 'add', 10),
(2, 2, 'remove', 5);

-- Trigger to update stock automatically
DELIMITER //
CREATE TRIGGER update_stock AFTER INSERT ON inventory_logs
FOR EACH ROW
BEGIN
    IF NEW.action = 'add' THEN
        UPDATE products SET stock = stock + NEW.qty WHERE id = NEW.product_id;
    ELSEIF NEW.action = 'remove' THEN
        UPDATE products SET stock = stock - NEW.qty WHERE id = NEW.product_id;
    END IF;
END;
//
DELIMITER ;

-- Example Query
SELECT id, name,
CASE 
    WHEN stock = 0 THEN 'Out of Stock'
    WHEN stock < 5 THEN 'Low Stock'
    ELSE 'In Stock'
END AS stock_status
FROM products;