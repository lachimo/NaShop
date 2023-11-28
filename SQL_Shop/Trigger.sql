-- Trigger để tự động cập nhật tổng số lượng trong kho (TotalQuantity) của mỗi sản phẩm trong bảng "Products" khi
--có một đơn hàng mới được thêm vào bảng "OrderDetails"
CREATE TRIGGER UpdateTotalQuantity ON OrderDetails
BEFORE INSERT
AS
BEGIN
  -- Kiểm tra xem có đủ số lượng sản phẩm trong kho hay không
  IF EXISTS (
    SELECT *
    FROM Products
    WHERE ProductID IN (SELECT ProductID FROM inserted)
      AND TotalQuantity < (SELECT SUM(Quantity) FROM inserted WHERE ProductID = Products.ProductID)
  )
  BEGIN
    -- Nếu không đủ số lượng sản phẩm, ngăn chặn việc chèn dữ liệu vào bảng OrderDetails
    RAISERROR ('Số lượng sản phẩm trong kho không đủ', 16, 1);
    ROLLBACK TRANSACTION
    RETURN
  END
END
GO

--Trigger để tính tổng giá trị đơn hàng (TotalAmount) khi có một đơn hàng mới được thêm vào bảng "Orders" 
--dựa trên số lượng (Quantity) và giá sản phẩm (Price) từ bảng "Products"
CREATE TRIGGER CalculateTotalAmount ON Orders
AFTER INSERT
AS
BEGIN
  -- Khai báo biến để lưu trữ tổng giá trị đơn hàng
  DECLARE @totalAmount DECIMAL(18,2);

  -- Lấy thông tin của đơn hàng mới chèn vào
  DECLARE @newOrderID INT;
  SELECT @newOrderID = inserted.OrderID FROM inserted;

  -- Tính tổng giá trị đơn hàng
  SELECT @totalAmount = SUM(Quantity * Price)
  FROM Products
  INNER JOIN inserted ON Products.ProductID = inserted.ProductID
  WHERE inserted.OrderID = @newOrderID;

  -- Cập nhật tổng giá trị đơn hàng vào bảng Orders
  UPDATE Orders SET TotalAmount = @totalAmount WHERE OrderID = @newOrderID;
END;

--Trigger để tự động tạo mã đơn hàng mới
CREATE TRIGGER GenerateOrderID ON Orders
BEFORE INSERT 
AS
BEGIN
DECLARE @max_order_id INT;
SELECT MAX(OrderID) INTO max_order_id FROM Orders;
IF max_order_id IS NULL THEN
SET NEW.OrderID = 1;
ELSE
SET NEW.OrderID = max_order_id + 1;
END IF;
END
GO