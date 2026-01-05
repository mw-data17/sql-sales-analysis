-- Tworzenie tabeli klientów
CREATE TABLE customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    customer_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- Tworzenie tabeli produktów
CREATE TABLE products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Tworzenie tabeli zamówień (Nagłówek)
CREATE TABLE orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT NOT NULL,
    order_date DATE NOT NULL DEFAULT GETDATE(),
    total_amount DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Tworzenie tabeli pozycji zamówienia (Szczegóły - ETL Source)
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Items_Orders FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT FK_Items_Products FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Opcjonalne: Indeksy dla przyspieszenia JOIN-ów (Dobra praktyka Data Engineer)
CREATE INDEX IX_orders_customer_id ON orders(customer_id);
CREATE INDEX IX_order_items_order_id ON order_items(order_id);
