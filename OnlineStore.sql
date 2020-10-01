USE [OnlineStore]
GO

-- Create table [dbo].[BillingEntities]
Print 'Create table [dbo].[BillingEntities]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingEntities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[TaxId] [varchar](20) NOT NULL,
	[StreetAddress] [varchar](200) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_billing_entity_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table [dbo].[CartItems]
Print 'Create table [dbo].[CartItems]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ShoppingCartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_cart_item_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table [dbo].[Customers]
Print 'Create table [dbo].[Customers]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](320) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[GenderId] [int] NOT NULL,
	[ShippingLocationId] [int] NOT NULL,
	[BillingEntityId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_customer_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table [dbo].[Genders]
Print 'Create table [dbo].[Genders]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_gender_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table [dbo].[Images]
Print 'Create table [dbo].[Images]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Name] [varchar](1) NOT NULL,
	[FileName] [varchar](1) NOT NULL,
	[ImageData] [varbinary](1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_image_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table [dbo].[Orders]
Print 'Create table [dbo].[Orders]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ShoppingCartId] [int] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[OrderStatusId] [smallint] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_order_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table [dbo].[OrderStatuses]
Print 'Create table [dbo].[OrderStatuses]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_order_status_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table [dbo].[PaymentTypes]
Print 'Create table [dbo].[PaymentTypes]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_payment_type_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table [dbo].[Products]
Print 'Create table [dbo].[Products]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[Stock] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_product_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table [dbo].[ProductsCategories]
Print 'Create table [dbo].[ProductsCategories]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsCategories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_product_category_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table [dbo].[Reviews]
Print 'Create table [dbo].[Reviews]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Message] [varchar](1000) NOT NULL,
	[Rating] [decimal](2, 2) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_review_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table [dbo].[ShippingLocations]
Print 'Create table [dbo].[ShippingLocations]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingLocations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[StreetAddress] [varchar](200) NOT NULL,
	[PostalCode] [varchar](12) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_shipping_location_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create table [dbo].[ShoppingCarts]
Print 'Create table [dbo].[ShoppingCarts]'
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_shoping_cart_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
 -- Add default values for [DateCreated] and [DateModified]
Print 'Add default values for [DateCreated] and [DateModified]'
ALTER TABLE [dbo].[BillingEntities] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[CartItems] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[CartItems] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('(getdate())') FOR [BirthDate]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO
ALTER TABLE [dbo].[Genders] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO
ALTER TABLE [dbo].[OrderStatuses] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[OrderStatuses] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO
ALTER TABLE [dbo].[PaymentTypes] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[PaymentTypes] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO
ALTER TABLE [dbo].[ProductsCategories] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[ProductsCategories] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO
ALTER TABLE [dbo].[ShippingLocations] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[ShippingLocations] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO
ALTER TABLE [dbo].[ShoppingCarts] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO
ALTER TABLE [dbo].[ShoppingCarts] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO

 -- Add relations between tables
Print 'Add relations between tables'
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [CartItems_fk_0_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [CartItems_fk_0_ProductId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [CartItems_fk_0_ShoppingCartId] FOREIGN KEY([ShoppingCartId])
REFERENCES [dbo].[ShoppingCarts] ([id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [CartItems_fk_0_ShoppingCartId]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [Customers_fk_0_BillingEntityId] FOREIGN KEY([BillingEntityId])
REFERENCES [dbo].[BillingEntities] ([id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [Customers_fk_0_BillingEntityId]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [Customers_fk_0_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Genders] ([id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [Customers_fk_0_GenderId]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [Customers_fk_0_ShippingLocationId] FOREIGN KEY([ShippingLocationId])
REFERENCES [dbo].[ShippingLocations] ([id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [Customers_fk_0_ShippingLocationId]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [Images_fk_0_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [Images_fk_0_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [Orders_fk_0_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [Orders_fk_0_CustomerId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [Orders_fk_0_OrderStatusId] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatuses] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [Orders_fk_0_OrderStatusId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [Orders_fk_0_PaymentTypeId] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentTypes] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [Orders_fk_0_PaymentTypeId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [Orders_fk_0_ShoppingCartId] FOREIGN KEY([ShoppingCartId])
REFERENCES [dbo].[ShoppingCarts] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [Orders_fk_0_ShoppingCartId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [Products_fk_0_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ProductsCategories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [Products_fk_0_CategoryId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [Reviews_fk_0_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [Reviews_fk_0_CustomerId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [Reviews_fk_0_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [Reviews_fk_0_ProductId]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [ShoppingCarts_fk_0_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [ShoppingCarts_fk_0_CustomerId]
GO
