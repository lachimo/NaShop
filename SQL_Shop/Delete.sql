USE NaneShop
GO

select * from categories
select * from accounts
select * from products
select * from roles
select * from cart
select * from cart_item
select * from orders


delete accounts
delete products
delete cart_item

DBCC CHECKIDENT ('accounts', RESEED, 0)
DBCC CHECKIDENT ('cart_item', RESEED, 0)



