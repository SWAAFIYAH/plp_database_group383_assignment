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

-- Sample Inserts
INSERT INTO product_category (category_name)
VALUES ('Clothing'), ('Accessories'), ('Bottoms');

INSERT INTO brand (brand_name)
VALUES ('Nike'), ('Adidas');

INSERT INTO products(product_name, price, product_category_id, brand_id)
VALUES ('t-shirt', 100.00, 1, 1), 
       ('jeans', 150.00, 3, 2), 
       ('short', 350.00, 2, 1);
