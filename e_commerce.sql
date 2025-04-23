DROP DATABASE IF EXISTS e_commerce_database;
CREATE DATABASE e_commerce_database;
USE e_commerce_database;

-- Table: attribute_type
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    attribute_type VARCHAR(50) NOT NULL
);

-- Table: attribute_category
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    attribute_category VARCHAR(50) NOT NULL,
    attribute_type_id INT,
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

-- Table: product_category
CREATE TABLE product_category (
    product_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Table: brand
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(50) NOT NULL
);

-- Table: products
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL, 
    price FLOAT NOT NULL,
    product_category_id INT NOT NULL,
    brand_id INT NOT NULL,
    FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

-- Table: product_item
CREATE TABLE product_item (
    product_item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Table: product_attribute
CREATE TABLE product_attribute (
    product_attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    material VARCHAR(50),
    weight VARCHAR(50),
    attribute_category_id INT,
    attribute_variation_id INT,
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);

-- Table: color
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL,
    color_code VARCHAR(7) NOT NULL
);

-- Table: product_image
CREATE TABLE product_image (
    product_image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    product_image_url VARCHAR(255) NOT NULL,
    is_primary BOOLEAN DEFAULT false,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Table: size_category
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_name VARCHAR(50) NOT NULL 
);

-- Table: size_option
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT NOT NULL,
    size_option VARCHAR(20) NOT NULL, 
    size_order INT NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Table: product_variation
CREATE TABLE product_variation (
    product_variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_item_id INT NOT NULL,
    color_id INT,
    size_option_id INT,
    quantity_in_stock INT NOT NULL DEFAULT 0,
    FOREIGN KEY (product_item_id) REFERENCES product_item(product_item_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- Sample inserts
INSERT INTO attribute_type (attribute_type) 
VALUES ('Text'), ('Number'), ('Boolean'), ('Date'), ('Color');

INSERT INTO attribute_category (attribute_category, attribute_type_id) 
VALUES  ('Material', 1),
        ('Weight', 2),
        ('Waterproof', 3),
        ('Manufacturing Date', 4),
        ('Pattern', 1),
        ('Size', 2),
        ('Durability', 1),
        ('Care Instructions', 1),
        ('Thickness', 2),
        ('Style', 1);

INSERT INTO product_category (category_name) 
VALUES  ('Traditional Wear'), ('Athletic Wear'), ('Casual Wear'), ('Office Wear'), ('Evening Wear'), ('Outdoor Gear'), ('Accessories'), ('Footwear'), ('Kids Wear'), ('Beach Wear');

INSERT INTO brand (brand_name)
VALUES ('Vivo Activewear'), ('Kikoromeo'), ('Alladin Wear'), ('Keyara'), ('Nike'), ('Adidas'), ('Puma'), ('LC Waikiki'), ('Truworths'), ('Mr Price'), ('Woolworths'), ('Bata');

INSERT INTO color (color_name, color_code) 
VALUES  ('Kitenge Blue', '#1B4B8A'),
        ('Maasai Red', '#E31B23'),
        ('Safari Khaki', '#C3B091'),
        ('Savanna Green', '#8F9779'),
        ('African Sun', '#FFB700'),
        ('Tribal Brown', '#704214'),
        ('Lake Victoria Blue', '#0077BE'),
        ('Mount Kenya Grey', '#808080'),
        ('Mombasa Sand', '#F4D03F'),
        ('Nairobi Night', '#2C3E50');

INSERT INTO size_category (category_name) 
VALUES  ('Kenya Traditional'), ('Western Sizing'), ('Kids Sizing'), ('Shoe Sizing'), ('Plus Size');

INSERT INTO size_option (size_category_id, size_name, size_order) 
VALUES  (1, 'Small', 1),
        (1, 'Medium', 2),
        (1, 'Large', 3),
        (2, 'UK 8', 1),
        (2, 'UK 10', 2),
        (2, 'UK 12', 3),
        (3, '3-4Y', 1),
        (3, '5-6Y', 2),
        (3, '7-8Y', 3),
        (4, '36', 1),
        (4, '37', 2),
        (4, '38', 3),
        (4, '39', 4),
        (4, '40', 5);

INSERT INTO products(product_name, price, product_category_id, brand_id)
VALUES  ('t-shirt', 1100.00, 1, 1), 
        ('jeans', 2500.00, 3, 2), 
        ('short', 1550.00, 2, 1),
        ('Kitenge Dress', 3500.00, 1, 2),
        ('Running Shoes', 8999.99, 8, 5),
        ('Maasai Shuka', 2500.00, 1, 3),
        ('Office Blazer', 6500.00, 4, 4),
        ('Kids School Uniform', 2999.99, 9, 8),
        ('Athletic Shorts', 1899.99, 2, 6),
        ('Beach Sandals', 1299.99, 8, 12),
        ('Evening Gown', 12999.99, 5, 2),
        ('Safari Jacket', 7500.00, 6, 3),
        ('Traditional Scarf', 999.99, 7, 4);

INSERT INTO product_item (product_id) 
VALUES  (1), (1), (1),
        (2), (2), (2),
        (3), (3), (3),
        (4), (4), (4),
        (5), (5), (5),
        (6), (6), (6),
        (7), (7), (7),
        (8), (8), (8),
        (9), (9), (9),
        (10), (10), (10);

INSERT INTO product_image (product_id, image_url, is_primary) 
VALUES  (1, '/images/kitenge-dress-1.jpg', true),
        (1, '/images/kitenge-dress-2.jpg', false),
        (2, '/images/running-shoes-1.jpg', true),
        (3, '/images/maasai-shuka-1.jpg', true),
        (4, '/images/blazer-1.jpg', true),
        (5, '/images/uniform-1.jpg', true),
        (6, '/images/shorts-1.jpg', true),
        (7, '/images/sandals-1.jpg', true),
        (8, '/images/gown-1.jpg', true),
        (9, '/images/safari-1.jpg', true);

INSERT INTO product_variation (product_item_id, color_id, size_option_id, quantity_in_stock) 
VALUES  (1, 1, 1, 50),
        (2, 2, 2, 30),
        (3, 3, 3, 20),
        (4, 4, 11, 40),
        (5, 5, 12, 35),
        (6, 6, 13, 25),
        (7, 7, 1, 60),
        (8, 8, 2, 45),
        (9, 9, 3, 30),
        (10, 10, 2, 40);

-- Displaying Data
-- Products with category and brand
SELECT 
    p.product_id,
    p.product_name,
    FORMAT(p.price, 2) as price_kes,
    pc.category_name,
    b.brand_name
FROM products p
INNER JOIN product_category pc ON p.product_category_id = pc.product_category_id
INNER JOIN brand b ON p.brand_id = b.brand_id;

-- Products variation with color and size
SELECT 
    p.product_name,
    c.color_name,
    so.size_name,
    pv.quantity_in_stock,
    FORMAT(p.price, 2) as unit_price
FROM product_variation pv
INNER JOIN product_item pi ON pv.product_item_id = pi.product_item_id
INNER JOIN products p ON pi.product_id = p.product_id
LEFT JOIN color c ON pv.color_id = c.color_id
LEFT JOIN size_option so ON pv.size_option_id = so.size_option_id;

