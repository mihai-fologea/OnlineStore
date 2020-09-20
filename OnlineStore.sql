-- Company
DROP TABLE IF EXISTS [Company];
CREATE TABLE [Company]
(
    [company_id] int NOT NULL ,
    [companyName] varchar(30) NOT NULL ,
    [tax_id] varchar(10) NOT NULL ,
    [address] varchar(200) NOT NULL ,
    [city] varchar(20) NOT NULL ,
    [postcode] varchar(10) NOT NULL ,


    CONSTRAINT [PK_company] PRIMARY KEY CLUSTERED ([company_id] ASC)
);
GO


-- Address
DROP TABLE IF EXISTS [Address];
CREATE TABLE [Address]
(
    [address_id] int NOT NULL ,
    [firstName] varchar(20) NOT NULL ,
    [lastName] varchar(20) NOT NULL ,
    [address] varchar(200) NOT NULL ,
    [city] varchar(20) NOT NULL ,
    [postCode] varchar(10) NOT NULL ,
    [phoneNumber] varchar(20) NOT NULL ,
    [company_id] int NOT NULL ,


    CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED ([address_id] ASC),
    CONSTRAINT [FK_address_company_id] FOREIGN KEY ([company_id])  REFERENCES [Company]([company_id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_address_company_id] ON [Address] 
 (
  [company_id] ASC
 )
GO

-- Customer
DROP TABLE IF EXISTS [Customer];
CREATE TABLE [Customer]
(
    [customer_id] int NOT NULL ,
    [email] varchar(50) NOT NULL ,
    [password] varchar(16) NOT NULL ,
    [firstName] varchar(20) NOT NULL ,
    [lastName] varchar(20) NOT NULL ,
    [added] datetime NOT NULL ,
    [gender] varchar(8) NOT NULL ,
    [birthDate] date NOT NULL ,
    [address_id] int NOT NULL ,
    [registered] datetime NOT NULL ,


    CONSTRAINT [PK_credentials] PRIMARY KEY CLUSTERED ([customer_id] ASC),
    CONSTRAINT [FK_customer_address_id] FOREIGN KEY ([address_id])  REFERENCES [Address]([address_id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_customer_address_id] ON [Customer] 
 (
  [address_id] ASC
 )
GO

-- Product
DROP TABLE IF EXISTS [Product];
CREATE TABLE [Product]
(
    [product_id] int NOT NULL ,
    [productName] varchar(50) NOT NULL ,
    [productType] varchar(50) NOT NULL ,
    [productDescription] varchar(1000) NOT NULL ,
    [productImage] varbinary(max) NOT NULL ,
    [stock] decimal(18,2) NOT NULL ,
    [price] money NOT NULL ,


    CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED ([product_id] ASC)
);
GO

-- Comment
DROP TABLE IF EXISTS [Comment];
CREATE TABLE [Comment]
(
    [comment_id] int NOT NULL ,
    [customer_id] int NOT NULL ,
    [product_id] int NOT NULL ,
    [message] varchar(500) NOT NULL ,


    CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED ([comment_id] ASC),
    CONSTRAINT [FK_comment_customer_id] FOREIGN KEY ([customer_id])  REFERENCES [Customer]([customer_id]),
    CONSTRAINT [FK_comment_product_id] FOREIGN KEY ([product_id])  REFERENCES [Product]([product_id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_comment_customer_id] ON [Comment] 
 (
  [customer_id] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_comment_product_id] ON [Comment] 
 (
  [product_id] ASC
 )
 GO

-- Rating
DROP TABLE IF EXISTS [Rating];
CREATE TABLE [Rating]
(
    [rating_id] int NOT NULL ,
    [customer_id] int NOT NULL ,
    [product_id] int NOT NULL ,
    [value] decimal(18,2) NOT NULL ,


    CONSTRAINT [PK_rating] PRIMARY KEY CLUSTERED ([rating_id] ASC),
    CONSTRAINT [FK_rating_customer_id] FOREIGN KEY ([customer_id])  REFERENCES [Customer]([customer_id]),
    CONSTRAINT [FK_rating_product_id] FOREIGN KEY ([product_id])  REFERENCES [Product]([product_id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_rating_customer_id] ON [Rating] 
 (
  [customer_id] ASC
 )
GO

CREATE NONCLUSTERED INDEX [fkIdx_rating_product_id] ON [Rating] 
 (
  [product_id] ASC
 )
GO

-- Cart
DROP TABLE IF EXISTS [Cart];
CREATE TABLE [Cart]
(
    [cart_id] int NOT NULL ,
    [customer_id] int NOT NULL ,
    [dateCreated] datetime NOT NULL ,
    [status] bit NOT NULL ,


    CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED ([cart_id] ASC),
    CONSTRAINT [FK_car_customer_id] FOREIGN KEY ([customer_id])  REFERENCES [Customer]([customer_id])
);
GO


CREATE NONCLUSTERED INDEX [car_customer_id] ON [Cart] 
 (
  [customer_id] ASC
 )
GO

-- CartItems
DROP TABLE IF EXISTS [CartItems]
CREATE TABLE [CartItems]
(
    [cart_item_id] int NOT NULL ,
    [cart_id] int NOT NULL ,
    [product_id] int NOT NULL ,
    [quantity] decimal(18,2) NOT NULL ,
    [price] money NOT NULL ,


    CONSTRAINT [PK_cartitems] PRIMARY KEY CLUSTERED ([cart_item_id] ASC),
    CONSTRAINT [FK_cart_items_product_id] FOREIGN KEY ([product_id])  REFERENCES [Product]([product_id]),
    CONSTRAINT [FK_cart_items_cart_id] FOREIGN KEY ([cart_id])  REFERENCES [Cart]([cart_id])
);
GO

CREATE NONCLUSTERED INDEX [fkIdx_cart_items_cart_id] ON [CartItems] 
 (
  [cart_id] ASC
 )
GO

CREATE NONCLUSTERED INDEX [fkIdx_cart_items_product_id] ON [CartItems] 
 (
  [product_id] ASC
 )
GO

-- Orders
DROP TABLE IF EXISTS [Orders]
CREATE TABLE [Orders]
(
    [orider_id] int NOT NULL ,
    [customer_id] int NOT NULL ,
    [address_id] int NOT NULL ,
    [cart_item_id] int NOT NULL ,
    [created] datetime NOT NULL ,
    [status] bit NOT NULL ,
    [amount] decimal(18,2) NOT NULL ,


    CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED ([orider_id] ASC),
    CONSTRAINT [FK_orders_customer_id] FOREIGN KEY ([customer_id])  REFERENCES [Customer]([customer_id]),
    CONSTRAINT [FK_orders_address_id] FOREIGN KEY ([address_id])  REFERENCES [Address]([address_id]),
    CONSTRAINT [FK_orders_cart_items_id] FOREIGN KEY ([cart_item_id])  REFERENCES [CartItems]([cart_item_id])
);
GO

CREATE NONCLUSTERED INDEX [fkIdx_orders_customer_id] ON [Orders] 
 (
  [customer_id] ASC
 )
GO

CREATE NONCLUSTERED INDEX [fkIdx_orders_address_id] ON [Orders] 
 (
  [address_id] ASC
 )
GO

CREATE NONCLUSTERED INDEX [fkIdx_orders_cart_items_id] ON [Orders] 
 (
  [cart_item_id] ASC
 )
GO

