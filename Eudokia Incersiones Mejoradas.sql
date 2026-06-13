-- USUARIOS
INSERT INTO users (name, email, password_hash, role)
SELECT 'Ana Perez', 'ana@example.com', 'hash123', 'cliente'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ana@example.com');

INSERT INTO users (name, email, password_hash, role)
SELECT 'Ezequiel', 'ezequielrubio763@gmail.com', 'hash789', 'admin'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'ezequielrubio763@gmail.com');

INSERT INTO users (name, email, password_hash, role)
SELECT 'Fernando', 'fersotelo05@gmail.com', 'hash987', 'admin'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'fersotelo05@gmail.com');

INSERT INTO users (name, email, password_hash, role)
SELECT 'Santiago', 'santiagolopez26@gmail.com', 'hash897', 'admin'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'santiagolopez26@gmail.com');

INSERT INTO users (name, email, password_hash, role)
SELECT 'Alejo', 'alejosimoiz@gmail.com', 'hash657', 'admin'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'alejosimoiz@gmail.com');

INSERT INTO users (name, email, password_hash, role)
SELECT 'Denise', 'denisebertoa@gmail.com', 'hash247', 'admin'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'denisebertoa@gmail.com');

-- DIRECCIONES
INSERT INTO addresses (user_id, address, city, country)
SELECT 1, 'Calle Falsa 123', 'Mendoza', 'Argentina'
WHERE NOT EXISTS (SELECT 1 FROM addresses WHERE user_id = 1);

-- CATEGORÍAS
INSERT INTO categories (name)
SELECT 'Proteínas' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Proteínas');

INSERT INTO categories (name)
SELECT 'Creatinas' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Creatinas');

INSERT INTO categories (name)
SELECT 'Vitaminas' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Vitaminas');

INSERT INTO categories (name)
SELECT 'Preentrenos' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Preentrenos');

-- PRODUCTOS
INSERT INTO products (name, description)
SELECT 'Whey Protein', 'Proteína en polvo'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Whey Protein');

INSERT INTO products (name, description)
SELECT 'Creatina Monohidratada', 'Mejora fuerza y rendimiento'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Creatina Monohidratada');

INSERT INTO products (name, description)
SELECT 'Multivitamínico', 'Apoyo inmunologico y energia diaria'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Multivitamínico');

INSERT INTO products (name, description)
SELECT 'Whey Pre-workout', 'Retrasa la fatiga'
WHERE NOT EXISTS (SELECT 1 FROM products WHERE name='Whey Pre-workout');

-- SKUs
-- PRODUCTO 1: Whey Protein
INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 1, 'WP-1KG-VAN', 12000, 50, '{"flavor":"Vainilla","size":"1kg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='WP-1KG-VAN');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 1, 'WP-1KG-CHO', 12000, 30, '{"flavor":"Chocolate","size":"1kg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='WP-1KG-CHO');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 1, 'WP-1KG-FRU', 12000, 25, '{"flavor":"Frutilla","size":"1kg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='WP-1KG-FRU');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 1, 'WP-1KG-CC', 12500, 20, '{"flavor":"Cookies and Cream","size":"1kg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='WP-1KG-CC');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 1, 'WP-1KG-NAT', 11000, 15, '{"flavor":"Natural","size":"1kg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='WP-1KG-NAT');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 1, 'WP-3KG-VAN', 32000, 15, '{"flavor":"Vainilla","size":"3kg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='WP-3KG-VAN');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 1, 'WP-3KG-CHO', 32000, 18, '{"flavor":"Chocolate","size":"3kg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='WP-3KG-CHO');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 1, 'WP-3KG-FRU', 32000, 10, '{"flavor":"Frutilla","size":"3kg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='WP-3KG-FRU');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 1, 'WP-500G-VAN', 7000, 40, '{"flavor":"Vainilla","size":"500g"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='WP-500G-VAN');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 1, 'WP-500G-CHO', 7000, 35, '{"flavor":"Chocolate","size":"500g"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='WP-500G-CHO');


-- PRODUCTO 2: Creatina Monohidratada
INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 2, 'CR-300G', 8000, 40, '{"size":"300g", "flavor":"Neutro"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='CR-300G');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 2, 'CR-500G', 13000, 25, '{"size":"500g", "flavor":"Neutro"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='CR-500G');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 2, 'CR-1KG', 24000, 10, '{"size":"1kg", "flavor":"Neutro"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='CR-1KG');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 2, 'CR-300G-NAR', 8500, 30, '{"size":"300g", "flavor":"Naranja"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='CR-300G-NAR');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 2, 'CR-300G-MAN', 8500, 22, '{"size":"300g", "flavor":"Manzana"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='CR-300G-MAN');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 2, 'CR-300G-FRU', 8500, 18, '{"size":"300g", "flavor":"Frutos Rojos"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='CR-300G-FRU');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 2, 'CR-150G', 4500, 50, '{"size":"150g", "flavor":"Neutro"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='CR-150G');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 2, 'CR-CAPS-90', 9500, 15, '{"formato":"90 cápsulas", "size":"750mg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='CR-CAPS-90');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 2, 'CR-CAPS-120', 12000, 12, '{"formato":"120 cápsulas", "size":"750mg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='CR-CAPS-120');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 2, 'CR-CREAPURE-300', 14000, 8, '{"size":"300g", "calidad":"Creapure", "flavor":"Neutro"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='CR-CREAPURE-300');


-- PRODUCTO 3: Multivitamínico 
INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 3, 'VIT-30C', 5500, 100, '{"formato":"30 cápsulas", "size":"300mg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='VIT-30C');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 3, 'VIT-60C', 9800, 80, '{"formato":"60 cápsulas", "size":"300mg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='VIT-60C');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 3, 'VIT-90C', 13500, 45, '{"formato":"90 cápsulas", "size":"300mg"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='VIT-90C');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 3, 'VIT-W-60C', 10500, 30, '{"formato":"60 cápsulas", "tipo":"Mujer"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='VIT-W-60C');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 3, 'VIT-M-60C', 10500, 35, '{"formato":"60 cápsulas", "tipo":"Hombre"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='VIT-M-60C');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 3, 'VIT-E-60C', 11000, 20, '{"formato":"60 cápsulas", "tipo":"Senior +50"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='VIT-E-60C');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 3, 'VIT-GUM-60', 7500, 40, '{"formato":"60 gominolas", "flavor":"Frutilla"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='VIT-GUM-60');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 3, 'VIT-DROP-30', 4800, 25, '{"formato":"Gotero 30ml", "tipo":"Líquido"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='VIT-DROP-30');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 3, 'VIT-EFF-20', 3900, 60, '{"formato":"20 tabletas efervescentes", "flavor":"Naranja"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='VIT-EFF-20');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 3, 'VIT-PACK-30', 18000, 15, '{"formato":"30 packs de entrenamiento", "tipo":"Atletas"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='VIT-PACK-30');


-- PRODUCTO 4: Whey Pre-workout
INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 4, 'PW-FP-500G', 12000, 25, '{"flavor":"Fruit Punch", "size":"500g"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='PW-FP-500G');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 4, 'PW-BL-500G', 12000, 30, '{"flavor":"Blue Raspberry", "size":"500g"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='PW-BL-500G');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 4, 'PW-ED-500G', 12500, 20, '{"flavor":"Energy Drink", "size":"500g"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='PW-ED-500G');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 4, 'PW-LM-500G', 12000, 15, '{"flavor":"Limón Lime", "size":"500g"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='PW-LM-500G');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 4, 'PW-SANDIA-500', 12000, 18, '{"flavor":"Sandía", "size":"500g"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='PW-SANDIA-500');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 4, 'PW-FP-250G', 6800, 40, '{"flavor":"Fruit Punch", "size":"250g"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='PW-FP-250G');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 4, 'PW-BL-250G', 6800, 35, '{"flavor":"Blue Raspberry", "size":"250g"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='PW-BL-250G');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 4, 'PW-HARD-400G', 15000, 15, '{"flavor":"Infernus Black", "size":"400g", "estimulante":"Fuerte"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='PW-HARD-400G');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 4, 'PW-PUMP-500G', 13000, 12, '{"flavor":"Uva", "size":"500g", "estimulante":"Sin Cafeína"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='PW-PUMP-500G');

INSERT INTO product_skus (product_id, sku_code, price, stock, attributes)
SELECT 4, 'PW-SACHET-15G', 600, 150, '{"flavor":"Fruit Punch", "size":"15g", "formato":"Monodosis"}'
WHERE NOT EXISTS (SELECT 1 FROM product_skus WHERE sku_code='PW-SACHET-15G');

-- RELACIÓN PRODUCTO-CATEGORÍA
INSERT INTO product_categories (product_id, category_id)
SELECT 1, 1
WHERE NOT EXISTS (SELECT 1 FROM product_categories WHERE product_id=1 AND category_id=1);

INSERT INTO product_categories (product_id, category_id)
SELECT 2, 2
WHERE NOT EXISTS (SELECT 1 FROM product_categories WHERE product_id=2 AND category_id=2);

INSERT INTO product_categories (product_id, category_id)
SELECT 3, 3
WHERE NOT EXISTS (SELECT 1 FROM product_categories WHERE product_id=3 AND category_id=3);

INSERT INTO product_categories (product_id, category_id)
SELECT 4, 4 
WHERE NOT EXISTS (SELECT 1 FROM product_categories WHERE product_id=4 AND category_id=4);

-- PEDIDO
INSERT INTO orders (user_id, address_id, status, total)
SELECT 1, 1, 'pendiente', 0
WHERE NOT EXISTS (
    SELECT 1 FROM orders WHERE user_id=1 AND status='pendiente'
);

-- ITEMS DEL PEDIDO
INSERT INTO order_items (order_id, sku_id, quantity, price)
SELECT 1, 1, 2, 12000.00
WHERE NOT EXISTS (
    SELECT 1 FROM order_items WHERE order_id=1 AND sku_id=1
);

-- ACTUALIZAR TOTAL
UPDATE orders
SET total = (
    SELECT SUM(quantity * price)
    FROM order_items
    WHERE order_id = 1
)
WHERE id = 1;