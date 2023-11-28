USE NaneShop
GO


INSERT INTO categories (category_name)
VALUES ('Category 1'),
       ('Category 2'),
       ('Category 3'),
       ('Category 4'),
       ('Category 5');


INSERT INTO products (product_name, category_id, description, price, quantity, imageURL)
VALUES ('Product 1', 1, 'Description 1', 10.99, 100, 'https://picsum.photos/640/640?r=1'),
       ('Product 2', 1, 'Description 2', 15.99, 50, 'https://picsum.photos/640/640?r=2'),
       ('Product 3', 2, 'Description 3', 12.99, 75, 'https://picsum.photos/640/640?r=3'),
       ('Product 4', 2, 'Description 4', 8.99, 200, 'https://picsum.photos/640/640?r=4'),
       ('Product 5', 3, 'Description 5', 19.99, 120, 'https://picsum.photos/640/640?r=5'),
	   ('Product 6', 3, 'Description 6', 9.99, 80, 'https://picsum.photos/640/640?r=6'),
       ('Product 7', 4, 'Description 7', 14.99, 60, 'https://picsum.photos/640/640?r=7'),
       ('Product 8', 1, 'Description 8', 11.99, 100, 'https://picsum.photos/640/640?r=8'),
       ('Product 9', 2, 'Description 9', 7.99, 150, 'https://picsum.photos/640/640?r=9'),
       ('Product 10', 5, 'Description 10', 17.99, 90, 'https://picsum.photos/640/640?r=10');


INSERT INTO roles (role_ID, role_name)
VALUES ('US', 'User'),
       ('AD', 'Admin');

INSERT INTO cart (account_id)
VALUES (3)

INSERT INTO accounts (fullname, first_name, last_name, phone, email, password, address, googleID, avatarURL, username, role_ID)
VALUES ('John Doe', 'John', 'Doe', '123456789', 'john.doe@example.com', 'password1', '123 Street', NULL, NULL, 'johndoe', 'US'),
       ('Jane Smith', 'Jane', 'Smith', '987654321', 'jane.smith@example.com', 'password2', '456 Avenue', NULL, NULL, 'janesmith', 'US');


INSERT INTO orders (account_id, quantity, order_status, payment_method, total_amount)
VALUES (1, 2, 'Pending', 'Credit Card', 25.98),
       (2, 3, 'Shipped', 'PayPal', 35.97);


INSERT INTO order_details (product_id, order_id, quantity, total_price)
VALUES (1, 1, 1, 10.99),
       (2, 1, 1, 15.99),
       (3, 2, 2, 25.98),
       (4, 2, 1, 8.99);


INSERT INTO reviews (account_id, product_id, feedback, rating)
VALUES (1, 1, 'Great product!', 5),
       (1, 2, 'Fast shipping!', 4),
       (2, 1, 'Good quality.', 4);

