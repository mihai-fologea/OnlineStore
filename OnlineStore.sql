USE master;
ALTER DATABASE [OnlineStore] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE [OnlineStore];

CREATE DATABASE [OnlineStore];
GO

USE OnlineStore;

DROP TABLE IF EXISTS [Customer]
CREATE TABLE [Customer]
(
   [customer_id] INT IDENTITY,
   [email] VARCHAR(50) NOT NULL,
   [password] VARCHAR(16) NOT NULL,
   [first_name] VARCHAR(20) NOT NULL,
   [last_name] VARCHAR(20) NOT NULL,
   [birth_date] DATE,
   [gender_id] SMALLINT NOT NULL,
   [address_id] INT NOT NULL,
   [registered] DATETIME2(0) NOT NULL,
   PRIMARY KEY ([customer_id]),
   CONSTRAINT unique_customer_id UNIQUE (customer_id),
   CONSTRAINT unique_email UNIQUE (email)
);
GO

DROP TABLE IF EXISTS [Address]
CREATE TABLE [Address]
(
   [address_id] INT NOT NULL IDENTITY,
   [first_name] VARCHAR(20) NOT NULL,
   [last_name] VARCHAR(20) NOT NULL,
   [phone_number] VARCHAR(20) NOT NULL,
   [street_address] VARCHAR(200) NOT NULL,
   [postal_code] VARCHAR(10) NOT NULL,
   [company_id] INT,
   PRIMARY KEY ([address_id]),
   CONSTRAINT unique_address_id UNIQUE (address_id)
);
GO


DROP TABLE IF EXISTS [Company]
CREATE TABLE [Company]
(
   [company_id] INT NOT NULL IDENTITY,
   [tax_id] VARCHAR(10) NOT NULL,
   [street_address] VARCHAR(200) NOT NULL,
   [city] VARCHAR(20) NOT NULL,
   [post_code] VARCHAR(10) NOT NULL,
   PRIMARY KEY ([company_id])
);
GO

DROP TABLE IF EXISTS [Product]
CREATE TABLE [Product]
(
   [product_id] INT NOT NULL IDENTITY,
   [name] VARCHAR(50) NOT NULL,
   [category_id] INT NOT NULL,
   [description] VARCHAR(1000) NOT NULL,
   [image] VARBINARY(MAX) NOT NULL,
   [stock] INT NOT NULL,
   [price] DECIMAL(13,4) NOT NULL,
   PRIMARY KEY ([product_id]),
   CONSTRAINT unique_product_id UNIQUE (product_id)
);
GO

DROP TABLE IF EXISTS [ProductCategory]
CREATE TABLE [ProductCategory]
(
   [product_category_id] INT NOT NULL IDENTITY,
   [category] VARCHAR(30) NOT NULL,
   PRIMARY KEY ([product_category_id]),
   CONSTRAINT unique_product_category_id UNIQUE (product_category_id)
);
GO

DROP TABLE IF EXISTS [Gender]
CREATE TABLE [Gender]
(
   [gender_id] SMALLINT NOT NULL IDENTITY,
   [type] VARCHAR(10) NOT NULL,
   PRIMARY KEY ([gender_id]),
   CONSTRAINT unique_gender_id UNIQUE (gender_id)
);
GO

DROP TABLE IF EXISTS [Cart]
CREATE TABLE [Cart]
(
   [cart_id] INT NOT NULL IDENTITY,
   [customer_id] INT NOT NULL,
   [created] DATETIME2(0) NOT NULL,
   [modified] DATETIME2(0) NOT NULL,
   PRIMARY KEY ([cart_id]),
   CONSTRAINT unique_cart_id UNIQUE (cart_id)
);
GO

DROP TABLE IF EXISTS [CartItem]
CREATE TABLE [CartItem]
(
   [cart_item_id] INT NOT NULL IDENTITY,
   [cart_id] INT NOT NULL,
   [product_id] INT NOT NULL,
   [quantity] DECIMAL(13, 4) NOT NULL,
   PRIMARY KEY ([cart_item_id]),
   CONSTRAINT unique_cart_item_id UNIQUE (cart_item_id)
);
GO

DROP TABLE IF EXISTS [Order]
CREATE TABLE [Order]
(
   [order_id] INT NOT NULL IDENTITY,
   [customer_id] INT NOT NULL,
   [cart_id] INT NOT NULL,
   [ammount] DECIMAL(18,4) NOT NULL,
   [status] SMALLINT NOT NULL,
   PRIMARY KEY ([order_id]),
   CONSTRAINT unique_order_id UNIQUE (order_id)
);
GO

DROP TABLE IF EXISTS [OrderStatus]
CREATE TABLE [OrderStatus]
(
   [order_status_id] SMALLINT NOT NULL IDENTITY,
   [name] VARCHAR(10) NOT NULL,
   PRIMARY KEY ([order_status_id])
);
GO

DROP TABLE IF EXISTS [Rating]
CREATE TABLE [Rating]
(
   [rating_id] INT NOT NULL IDENTITY,
   [customer_id] INT NOT NULL,
   [product_id] INT NOT NULL,
   [rating] DECIMAL(18,2) NOT NULL,
   PRIMARY KEY ([rating_id]),
   CONSTRAINT unique_rating_id UNIQUE (rating_id)
);
GO

DROP TABLE IF EXISTS [Comment]
CREATE TABLE [Comment]
(
   [comment_id] INT NOT NULL IDENTITY,
   [customer_id] INT NOT NULL,
   [product_id] INT NOT NULL,
   [message] VARCHAR(1000) NOT NULL,
   PRIMARY KEY ([comment_id]),
   CONSTRAINT unique_comment_id UNIQUE (comment_id)
);
GO

ALTER TABLE [Customer] ADD CONSTRAINT [Customer_fk_0_gender_id] FOREIGN KEY (gender_id) REFERENCES Gender([gender_id]) ;
ALTER TABLE [Customer] ADD CONSTRAINT [Customer_fk_0_address_id] FOREIGN KEY (address_id) REFERENCES Address([address_id]) ;
ALTER TABLE [Address] ADD CONSTRAINT [Address_fk_0_company_id] FOREIGN KEY (company_id) REFERENCES Company([company_id]) ;
ALTER TABLE [Product] ADD CONSTRAINT [Product_fk_0_category_id] FOREIGN KEY (category_id) REFERENCES ProductCategory([product_category_id]) ;
ALTER TABLE [Cart] ADD CONSTRAINT [Cart_fk_0_customer_id] FOREIGN KEY (customer_id) REFERENCES Customer([customer_id]) ;
ALTER TABLE [CartItem] ADD CONSTRAINT [CartItem_fk_0_cart_id] FOREIGN KEY (cart_id) REFERENCES Cart([cart_id]) ;
ALTER TABLE [CartItem] ADD CONSTRAINT [CartItem_fk_0_product_id] FOREIGN KEY (product_id) REFERENCES Product([product_id]) ;
ALTER TABLE [Order] ADD CONSTRAINT [Order_fk_0_customer_id] FOREIGN KEY (customer_id) REFERENCES Customer([customer_id]) ;
ALTER TABLE [Order] ADD CONSTRAINT [Order_fk_0_cart_id] FOREIGN KEY (cart_id) REFERENCES Cart([cart_id]) ;
ALTER TABLE [Order] ADD CONSTRAINT [Order_fk_0_status] FOREIGN KEY (status) REFERENCES OrderStatus([order_status_id]) ;
ALTER TABLE [Rating] ADD CONSTRAINT [Rating_fk_0_customer_id] FOREIGN KEY (customer_id) REFERENCES Customer([customer_id]) ;
ALTER TABLE [Rating] ADD CONSTRAINT [Rating_fk_0_product_id] FOREIGN KEY (product_id) REFERENCES Product([product_id]) ;
ALTER TABLE [Comment] ADD CONSTRAINT [Comment_fk_0_customer_id] FOREIGN KEY (customer_id) REFERENCES Customer([customer_id]) ;
ALTER TABLE [Comment] ADD CONSTRAINT [Comment_fk_0_product_id] FOREIGN KEY (product_id) REFERENCES Product([product_id]) ;
GO
