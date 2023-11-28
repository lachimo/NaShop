-- XÓA CƠ SỞ DỮ LIỆU NẾU ĐÃ TỒN TẠI --
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'NaneShop')
BEGIN
  ALTER DATABASE NaneShop SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE NaneShop;
END
GO

-- TẠO CƠ SỞ DỮ LIỆU --
CREATE DATABASE NaneShop;
GO

-- SỬ DỤNG CƠ SỞ DỮ LIỆU --
USE NaneShop;
GO

-- TẠO BẢNG categories --
CREATE TABLE categories (
  category_id INT IDENTITY(1,1) PRIMARY KEY,
  category_name NVARCHAR(255),
);
GO

-- TẠO BẢNG products --
CREATE TABLE products (
  product_id INT IDENTITY(1,1) PRIMARY KEY,
  product_name NVARCHAR(255),
  category_id INT,
  description NVARCHAR(MAX),
  price MONEY,
  quantity INT,
  imageURL VARCHAR(max),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
GO

-- TẠO BẢNG roles --
CREATE TABLE roles (
  role_ID NVARCHAR(10) PRIMARY KEY,
  role_name NVARCHAR(50)
);
GO

-- TẠO BẢNG accounts --
CREATE TABLE accounts (
  account_id INT IDENTITY(1,1) PRIMARY KEY,
  fullname NVARCHAR(255),
  first_name NVARCHAR(255),
  last_name NVARCHAR(255),
  phone VARCHAR(20),
  email VARCHAR(255),
  password VARCHAR(255),
  address TEXT,
  googleID NVARCHAR(255),
  avatarURL VARCHAR(max),
  username NVARCHAR(255),
  role_ID NVARCHAR(10),
  FOREIGN KEY (role_ID) REFERENCES roles(role_ID)
);
GO

-- TẠO BẢNG cart --
CREATE TABLE cart (
  cart_id INT IDENTITY(1,1) PRIMARY KEY,
  account_id INT,
  FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
GO

-- TẠO BẢNG cart_item --
CREATE TABLE cart_item (
  cart_item_id INT IDENTITY(1,1) PRIMARY KEY,
  cart_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
GO


-- TẠO BẢNG orders --
CREATE TABLE orders (
  order_id INT IDENTITY(1,1) PRIMARY KEY,
  account_id INT,
  quantity INT,
  order_status NVARCHAR(255),
  last_name NVARCHAR(50),
  first_name NVARCHAR(50),
  address NVARCHAR(100),
  phone_number NVARCHAR(20),
  payment_method NVARCHAR(255),
  total_amount MONEY,
  FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
GO

-- TẠO BẢNG order_details --
CREATE TABLE order_details (
  order_detail_id INT IDENTITY(1,1) PRIMARY KEY,
  product_id INT,
  order_id INT,
  quantity INT,
  total_price MONEY,
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
GO

-- TẠO BẢNG reviews --
CREATE TABLE reviews (
  review_id INT IDENTITY(1,1) PRIMARY KEY,
  account_id INT,
  product_id INT,
  feedback NVARCHAR(MAX),
  rating INT,
  FOREIGN KEY (account_id) REFERENCES accounts(account_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
GO
