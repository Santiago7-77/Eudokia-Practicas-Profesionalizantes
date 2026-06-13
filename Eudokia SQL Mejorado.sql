CREATE DATABASE Eudokia;
USE Eudokia;

-- USUARIOS
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('cliente','admin') DEFAULT 'cliente',
    is_active BOOLEAN DEFAULT TRUE,
    email_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- DIRECCIONES
CREATE TABLE addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    street VARCHAR(150) NOT NULL,
    number VARCHAR(10),
    apartment VARCHAR(20),
    city VARCHAR(100) NOT NULL,
    province VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100) DEFAULT 'Argentina',
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

-- PRODUCTOS
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- SKUs
CREATE TABLE product_skus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    sku_code VARCHAR(50) UNIQUE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    attributes JSON,
    FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE CASCADE
);

-- HISTORIAL DE PRECIOS
CREATE TABLE price_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sku_id INT NOT NULL,
    price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sku_id) REFERENCES product_skus(id)
        ON DELETE CASCADE
);

-- CATEGORÍAS
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    parent_id INT NULL,
    FOREIGN KEY (parent_id) REFERENCES categories(id)
        ON DELETE SET NULL
);

-- RELACIÓN PRODUCTO-CATEGORÍA
CREATE TABLE product_categories (
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES products(id)
        ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id)
        ON DELETE CASCADE
);

-- INVENTARIO
CREATE TABLE inventory_movements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sku_id INT NOT NULL,
    quantity INT NOT NULL,
    type ENUM('entrada','salida') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sku_id) REFERENCES product_skus(id)
        ON DELETE CASCADE
);

-- PEDIDOS
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    address_id INT NOT NULL,
    status ENUM('pendiente','pagado','procesando','enviado','entregado','cancelado') DEFAULT 'pendiente',
    total DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE RESTRICT,
    FOREIGN KEY (address_id) REFERENCES addresses(id)
        ON DELETE RESTRICT
);

-- ITEMS DEL PEDIDO
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    sku_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
        ON DELETE CASCADE,
    FOREIGN KEY (sku_id) REFERENCES product_skus(id)
        ON DELETE RESTRICT
);

-- PROVEEDORES DE PAGO
CREATE TABLE payment_providers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

-- PAGOS
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    provider_id INT,
    amount DECIMAL(10,2) NOT NULL,
    status ENUM('pending','ok','failed') DEFAULT 'pending',
    response JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id)
        ON DELETE RESTRICT,
    FOREIGN KEY (provider_id) REFERENCES payment_providers(id)
        ON DELETE SET NULL
);

-- REVIEWS
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    sku_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, sku_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE SET NULL,
    FOREIGN KEY (sku_id) REFERENCES product_skus(id)
        ON DELETE SET NULL
);

-- ÍNDICES
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_skus_product_id ON product_skus(product_id);