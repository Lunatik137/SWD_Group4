CREATE DATABASE BookStoreDB;
GO

USE BookStoreDB;
GO

CREATE TABLE [User] (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(255),
    email NVARCHAR(255) UNIQUE,
    password NVARCHAR(255),
    role NVARCHAR(20) CHECK (role IN ('Customer', 'Seller', 'Admin')),
    status NVARCHAR(20) CHECK (status IN ('Active', 'Inactive'))
);

CREATE TABLE Category (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(255),
    description NVARCHAR(500)
);

CREATE TABLE Book (
    id INT IDENTITY PRIMARY KEY,
    seller_id INT,
    title NVARCHAR(255),
    author NVARCHAR(255),
    price FLOAT,
    description NVARCHAR(MAX),
    status NVARCHAR(20) CHECK (status IN ('Hidden', 'Pending')),
    stock_quantity INT,

    CONSTRAINT FK_Book_User FOREIGN KEY (seller_id) REFERENCES [User](id)
);

CREATE TABLE BookCategory (
    book_id INT,
    category_id INT,
    PRIMARY KEY (book_id, category_id),

    FOREIGN KEY (book_id) REFERENCES Book(id),
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

CREATE TABLE Promotion (
    id INT IDENTITY PRIMARY KEY,
    created_by INT,
    promotion_name NVARCHAR(255),
    discount_type NVARCHAR(20) CHECK (discount_type IN ('Percentage', 'FixedAmount')),
    discount_value FLOAT,
    promotion_scope NVARCHAR(20) CHECK (promotion_scope IN ('Platform', 'Shop')),
    status NVARCHAR(20) CHECK (status IN ('Active', 'Inactive')),
    start_date DATETIME,
    end_date DATETIME,

    FOREIGN KEY (created_by) REFERENCES [User](id)
);

CREATE TABLE [Order] (
    id INT IDENTITY PRIMARY KEY,
    customer_id INT,
    seller_id INT,
    promotion_id INT NULL,
    total_price FLOAT,
    status NVARCHAR(20) CHECK (status IN ('Pending', 'Confirmed', 'Rejected', 'Finished', 'Refunded')),
    payment_method NVARCHAR(20) CHECK (payment_method IN ('Cash', 'BankTransfer')),
    payment_transaction_id NVARCHAR(255),
    payment_date DATETIME,
    address NVARCHAR(500),

    FOREIGN KEY (customer_id) REFERENCES [User](id),
    FOREIGN KEY (seller_id) REFERENCES [User](id),
    FOREIGN KEY (promotion_id) REFERENCES Promotion(id)
);

CREATE TABLE OrderItem (
    id INT IDENTITY PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    price FLOAT,

    FOREIGN KEY (order_id) REFERENCES [Order](id),
    FOREIGN KEY (book_id) REFERENCES Book(id)
);

CREATE TABLE RefundRequest (
    id INT IDENTITY PRIMARY KEY,
    order_id INT,
    reason NVARCHAR(500),
    status NVARCHAR(20) CHECK (status IN ('Pending', 'Approved', 'Processed', 'Rejected', 'Failed')),

    FOREIGN KEY (order_id) REFERENCES [Order](id)
);