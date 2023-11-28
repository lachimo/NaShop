USE NaneShop;
GO

-- Tạo Stored Procedure checkLogin
CREATE PROCEDURE CheckLogin
    @username NVARCHAR(255),
    @password NVARCHAR(255)
AS
BEGIN
    SELECT a.account_id, a.fullname, a.username, r.role_ID
    FROM accounts a
    INNER JOIN roles r ON a.role_ID = r.role_ID
    WHERE a.username = @username AND a.password = @password;
END
GO

EXEC CheckLogin @username = 'hanabi', @password = '2'
GO

---------------------------------------------------------------------------------------------
--Save Google Data
CREATE PROCEDURE SaveGoogleData
    @google_id NVARCHAR(50),
    @email VARCHAR(255),
    @fullname NVARCHAR(100),
    @first_name NVARCHAR(50),
    @last_name NVARCHAR(50),
    @avatar_url NVARCHAR(MAX),
    @is_success BIT OUTPUT
AS
BEGIN
    SET @is_success = 0; -- Khởi tạo giá trị mặc định là false

    -- Kiểm tra nếu google_id đã tồn tại trong bảng "accounts"
    DECLARE @existing_account_id INT
    SELECT @existing_account_id = account_id FROM accounts WHERE googleID = @google_id;

    IF @existing_account_id IS NULL
    BEGIN
        -- Thêm dữ liệu vào bảng roles nếu chưa tồn tại
        IF NOT EXISTS (SELECT 1 FROM roles WHERE role_ID = 'US')
        BEGIN
            INSERT INTO roles (role_ID, role_name)
            VALUES ('US', 'User'); -- Vai trò người dùng (user)
        END

        -- Kiểm tra nếu email đã tồn tại trong bảng "accounts"
        SELECT @existing_account_id = account_id FROM accounts WHERE email = @email;

        IF @existing_account_id IS NULL
        BEGIN
            -- Thêm khách hàng mới vào bảng "accounts"
            INSERT INTO accounts (fullname, first_name, last_name, phone, email, password, address, googleID, avatarURL, username, role_ID)
            VALUES (@fullname, @first_name, @last_name, '', @email, '', '', @google_id, @avatar_url, '', 'US');

            SET @is_success = 1; -- Cập nhật giá trị true
        END
        ELSE
        BEGIN
            -- Cập nhật thông tin khách hàng từ googleID
            UPDATE accounts
            SET fullname = @fullname,
                first_name = @first_name,
                last_name = @last_name,
                googleID = @google_id,
                avatarURL = @avatar_url,
                role_ID = 'US'
            WHERE account_id = @existing_account_id;

            SET @is_success = 1; -- Cập nhật giá trị true
        END
    END
    ELSE
    BEGIN
        -- Cập nhật thông tin khách hàng từ googleID
        UPDATE accounts
        SET fullname = @fullname,
            first_name = @first_name,
            last_name = @last_name,
            avatarURL = @avatar_url
        WHERE account_id = @existing_account_id;

        SET @is_success = 1; -- Cập nhật giá trị true
    END
END
GO
-----------------------------------------------------------------------------------------
-- Tạo checkDuplicateEmail
CREATE PROCEDURE checkDuplicateEmail
    @email VARCHAR(255),
    @is_duplicate BIT OUTPUT
AS
BEGIN
    SET @is_duplicate = 0; -- Khởi tạo giá trị mặc định là false

    IF EXISTS (SELECT 1 FROM accounts WHERE email = @email)
        SET @is_duplicate = 1; -- Gán giá trị true nếu email đã tồn tại
END
GO

DECLARE @is_duplicate BIT;

EXEC checkDuplicateEmail 'bkhang160303@gmail.com', @is_duplicate OUTPUT;

SELECT @is_duplicate AS IsDuplicate;


-- Tạo checkDuplicateUsername
GO
CREATE PROCEDURE checkDuplicateUsername
    @username NVARCHAR(255),
    @is_duplicate BIT OUTPUT
AS
BEGIN
    SET @is_duplicate = 0; -- Khởi tạo giá trị mặc định là false

    IF EXISTS (SELECT 1 FROM accounts WHERE username = @username)
        SET @is_duplicate = 1; -- Gán giá trị true nếu username đã tồn tại
END
GO

------------------------------------------------------------------------------
-- Tạo RegisterAccount
CREATE PROCEDURE RegisterAccount
    @email VARCHAR(255),
    @username NVARCHAR(255),
    @password VARCHAR(255)
AS
BEGIN
    -- Thêm dữ liệu vào bảng roles nếu chưa tồn tại
    IF NOT EXISTS (SELECT 1 FROM roles WHERE role_ID = 'US')
    BEGIN
        INSERT INTO roles (role_ID, role_name)
        VALUES ('US', 'User'); -- Vai trò người dùng (user)
    END

    -- Thêm tài khoản mới và liên kết với vai trò người dùng (user)
    INSERT INTO accounts (email, username, password, role_ID)
    VALUES (@email, @username, @password, 'US');

    -- Lấy ID của tài khoản vừa tạo
    DECLARE @account_id INT;
    SET @account_id = SCOPE_IDENTITY();

    -- Thêm một bản ghi vào bảng cart tương ứng với tài khoản mới
    INSERT INTO cart (account_id)
    VALUES (@account_id);
END
GO

EXEC RegisterAccount
    @email = 'hana1212@gmail.com',
    @username = 'hanabi',
    @password = '2';

  -------------------------------------------------------------------------------
  -- Tạo phân trang
  GO
 CREATE PROCEDURE GetProductList
    @PageNumber INT,
    @PageSize INT,
    @Search NVARCHAR(255) = NULL,
    @TotalProducts INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SqlQuery NVARCHAR(MAX);

    SET @SqlQuery = N'
SELECT
    p.product_id,
    p.product_name,
    c.category_id,
    c.category_name,
    p.description,
    p.price,
    p.quantity,
    p.imageURL
FROM
    products p
    INNER JOIN categories c ON p.category_id = c.category_id
WHERE
    1=1'; -- Xóa phần điều kiện product_id IN (SELECT MIN(product_id) FROM products GROUP BY category_id)

IF @Search IS NOT NULL
BEGIN
    SET @SqlQuery += N' AND p.product_name LIKE ''%' + @Search + '%''';
END;

SET @SqlQuery += N'
ORDER BY
    p.product_id
OFFSET (@PageNumber - 1) * @PageSize ROWS
FETCH NEXT @PageSize ROWS ONLY;

SELECT @TotalProducts = COUNT(*)
FROM
(
    ' + @SqlQuery + N'
) AS SubQuery;';

    EXEC sp_executesql @SqlQuery,
        N'@PageNumber INT, @PageSize INT, @TotalProducts INT OUTPUT',
        @PageNumber = @PageNumber,
        @PageSize = @PageSize,
        @TotalProducts = @TotalProducts OUTPUT;
END;

GO
DECLARE @TotalProducts INT;
EXEC GetProductList
    @PageNumber = 1,
    @PageSize = 9,
    @Search = '',
    @TotalProducts = @TotalProducts OUTPUT;

SELECT @TotalProducts AS TotalProducts;

select * from products
GO
------------------------------------------------------------------------------------------------------
--Add to cart
GO
CREATE PROCEDURE AddProductToCart
    @accountId INT,
    @productId INT
AS
BEGIN
    -- Kiểm tra nếu sản phẩm đã tồn tại trong bảng "cart_item" của tài khoản
    DECLARE @existing_quantity INT;
    SELECT @existing_quantity = quantity
    FROM cart_item
    WHERE cart_id IN (SELECT cart_id FROM cart WHERE account_id = @accountId)
        AND product_id = @productId;

    IF @existing_quantity IS NULL
    BEGIN
        -- Sản phẩm chưa tồn tại trong bảng "cart_item", thêm mới với quantity là 1
        DECLARE @cartId INT;
        SELECT @cartId = cart_id FROM cart WHERE account_id = @accountId;

        IF @cartId IS NOT NULL
        BEGIN
            INSERT INTO cart_item (cart_id, product_id, quantity)
            VALUES (@cartId, @productId, 1);
        END
    END
    ELSE
    BEGIN
        -- Sản phẩm đã tồn tại trong bảng "cart_item", tăng quantity lên 1 đơn vị
        UPDATE cart_item
        SET quantity = quantity + 1
        WHERE cart_id IN (SELECT cart_id FROM cart WHERE account_id = @accountId)
            AND product_id = @productId;
    END
END
GO

EXEC AddProductToCart
    @accountId = 3,
    @productId = 4;
---------------------------------------------------------------------------------------------------
-- Add cart 
GO
CREATE PROCEDURE GetCartItem
    @account_id INT
AS
BEGIN
    SELECT ci.quantity, ci.cart_id, ci.cart_item_id, p.product_id, p.product_name, p.description, p.price, p.quantity AS product_quantity, p.imageURL
    FROM cart_item ci
    INNER JOIN products p ON ci.product_id = p.product_id
    INNER JOIN cart c ON ci.cart_id = c.cart_id
    WHERE c.account_id = @account_id;
END;

GO
DECLARE @accountId INT = 3; -- Giả sử accountId của khách hàng là 1

EXEC GetCartItems @accountId;
select cart_item_id from cart_item


SELECT ci.cart_item_id, ci.quantity, ci.cart_id, p.product_id, p.product_name, p.description, p.price, p.quantity AS product_quantity, p.imageURL FROM cart_item ci INNER JOIN products p ON ci.product_id = p.product_id INNER JOIN cart c ON ci.cart_id = c.cart_id WHERE c.account_id = 3;

---------------------------------------------------------------------------------------------------
--Update
GO
CREATE PROCEDURE UpdateOrder
    @accountId INT,
    @orderId INT,
    @firstName NVARCHAR(50),
    @lastName NVARCHAR(50),
    @address NVARCHAR(100),
    @phoneNumber NVARCHAR(20),
    @paymentMethod NVARCHAR(255)
AS
BEGIN
    -- Kiểm tra customerId và orderId trong bảng orders
    IF EXISTS (SELECT * FROM orders WHERE order_id = @orderId AND account_id = @accountId)
    BEGIN
        -- Cập nhật dữ liệu trong bảng orders
        UPDATE orders
        SET
            first_name = @firstName,
            last_name = @lastName,
            address = @address,
            phone_number = @phoneNumber,
            payment_method = @paymentMethod
        WHERE
            order_id = @orderId AND
            account_id = @accountId;
    END
END;


------------------------------------------------------------------------------------------------------------
--delete
--GO
--CREATE PROCEDURE InsertOrderDetailsFromCart
--    @account_id INT,
--    @total_amount MONEY
--AS
--BEGIN
    -- Tạo một bản ghi mới trong bảng "orders"
--    DECLARE @order_id INT;
--    INSERT INTO orders (acc_id, total_amount, order_status)
--    VALUES (@account_id, @total_amount, 'Pending');
--    SET @order_id = SCOPE_IDENTITY();

    -- Chuyển dữ liệu từ bảng cart_item vào bảng order_details
--    INSERT INTO order_details (order_id, product_id, quantity, total_price)
--    SELECT @order_id, ci.product_id, ci.quantity, ci.quantity * p.price
--    FROM cart_item ci
--    INNER JOIN products p ON ci.product_id = p.product_id
--    INNER JOIN cart c ON ci.cart_id = c.cart_id
--    WHERE c.account_id = @account_id;

    -- Xóa dữ liệu từ bảng cart_item
 --   DELETE FROM cart_item
 --   WHERE cart_id IN (SELECT cart_id FROM cart WHERE account_id = @account_id);
--END;


--xóa cart và thêm vào order 
CREATE PROCEDURE PlaceOrder
  @accountId INT,
  @totalAmount MONEY,
  @address NVARCHAR(100),
  @firstName NVARCHAR(50),
  @lastName NVARCHAR(50),
  @phone NVARCHAR(20)
AS
BEGIN
  -- Kiểm tra xem quantity ở cart_item có lớn hơn quantity ở product không
  IF EXISTS (
    SELECT ci.cart_item_id
    FROM cart_item ci
    INNER JOIN products p ON ci.product_id = p.product_id
    WHERE ci.quantity > p.quantity
  )
  BEGIN
    -- Nếu lớn hơn, trả về thông báo lỗi
    RAISERROR('Quantity in cart_item exceeds available quantity', 16, 1)
    RETURN
  END

  -- Trừ quantity ở product cho quantity ở cart_item
  UPDATE products
  SET quantity = p.quantity - ci.quantity
  FROM products p
  INNER JOIN cart_item ci ON p.product_id = ci.product_id
  WHERE ci.cart_id = (
    SELECT cart_id
    FROM cart
    WHERE account_id = @accountId
  )

  -- Chuyển dữ liệu từ cart_item vào order_detail và order
  DECLARE @orderId INT

  -- Thêm dữ liệu vào bảng orders
  INSERT INTO orders (account_id, quantity, order_status, last_name, first_name, address, phone_number, payment_method, total_amount)
  VALUES (
    @accountId,
    (SELECT SUM(quantity) FROM cart_item WHERE cart_id = (SELECT cart_id FROM cart WHERE account_id = @accountId)),
    'Pending', @lastName, @firstName, @address, @phone, null, @totalAmount
  )

  -- Lấy order_id vừa được tạo
  SET @orderId = SCOPE_IDENTITY()

  -- Thêm dữ liệu vào bảng order_details
  INSERT INTO order_details (product_id, order_id, quantity, total_price)
  SELECT ci.product_id, @orderId, ci.quantity, (ci.quantity * p.price)
  FROM cart_item ci
  INNER JOIN products p ON ci.product_id = p.product_id
  WHERE ci.cart_id = (SELECT cart_id FROM cart WHERE account_id = @accountId)

  -- Xóa dữ liệu ở cart_item
  DELETE FROM cart_item WHERE cart_id = (SELECT cart_id FROM cart WHERE account_id = @accountId)
END
GO
