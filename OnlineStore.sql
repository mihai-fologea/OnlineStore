USE master;
ALTER DATABASE [OnlineStore] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE [OnlineStore];

CREATE DATABASE [OnlineStore];
GO

USE [OnlineStore]
GO

/****** Object:  Table [dbo].[CartItems]    Script Date: 9/29/2020 2:23:07 AM ******/
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
 CONSTRAINT [unique_cart_itme_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Companies]    Script Date: 9/29/2020 2:23:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Companies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TaxNo] [varchar](10) NOT NULL,
	[StreetAddress] [varchar](200) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[PostalCode] [varchar](10) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_company_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 9/29/2020 2:23:07 AM ******/
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
	[BirthDate] [date] NULL,
	[GenderId] [smallint] NOT NULL,
	[LocationId] [int] NOT NULL,
	[DateCreated] [datetime2](0) NOT NULL,
	[DateModified] [datetime2](0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_customer_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_customer_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Genders]    Script Date: 9/29/2020 2:23:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Genders](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
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

/****** Object:  Table [dbo].[ImageLists]    Script Date: 9/29/2020 2:23:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ImageLists](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProductImageId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_iamge_list_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Locations]    Script Date: 9/29/2020 2:23:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Locations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[StreetAddress] [varchar](200) NOT NULL,
	[PostalCode] [varchar](10) NOT NULL,
	[company_id] [int] NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_location_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 9/29/2020 2:23:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ShoppingCartId] [int] NOT NULL,
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

/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 9/29/2020 2:23:07 AM ******/
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

/****** Object:  Table [dbo].[ProductImages]    Script Date: 9/29/2020 2:23:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductImages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varbinary](1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_product_image_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Products]    Script Date: 9/29/2020 2:23:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[ImageListsId] [int] NOT NULL,
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

/****** Object:  Table [dbo].[ProductsCategories]    Script Date: 9/29/2020 2:23:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductsCategories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[DateCreated] [datetime2](0) NOT NULL,
	[DateModified] [datetime2](0) NOT NULL,
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

/****** Object:  Table [dbo].[Reviews]    Script Date: 9/29/2020 2:23:07 AM ******/
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

/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 9/29/2020 2:23:07 AM ******/
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
 CONSTRAINT [unique_shopping_cart_id] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CartItems] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO

ALTER TABLE [dbo].[CartItems] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO

ALTER TABLE [dbo].[Companies] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO

ALTER TABLE [dbo].[Companies] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO

ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('(getdate())') FOR [BirthDate]
GO

ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO

ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO

ALTER TABLE [dbo].[Genders] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO

ALTER TABLE [dbo].[ImageLists] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO

ALTER TABLE [dbo].[ImageLists] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO

ALTER TABLE [dbo].[Locations] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO

ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO

ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO

ALTER TABLE [dbo].[OrderStatuses] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO

ALTER TABLE [dbo].[OrderStatuses] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO

ALTER TABLE [dbo].[ProductImages] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
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

ALTER TABLE [dbo].[ShoppingCarts] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO

ALTER TABLE [dbo].[ShoppingCarts] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO

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

ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [Customers_fk_0_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Genders] ([id])
GO

ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [Customers_fk_0_GenderId]
GO

ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [Customers_fk_0_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([id])
GO

ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [Customers_fk_0_LocationId]
GO

ALTER TABLE [dbo].[ImageLists]  WITH CHECK ADD  CONSTRAINT [ImageList_fk_0_ProductImageId] FOREIGN KEY([ProductImageId])
REFERENCES [dbo].[ProductImages] ([id])
GO

ALTER TABLE [dbo].[ImageLists] CHECK CONSTRAINT [ImageList_fk_0_ProductImageId]
GO

ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [Locations_fk_0_company_id] FOREIGN KEY([company_id])
REFERENCES [dbo].[Companies] ([id])
GO

ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [Locations_fk_0_company_id]
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

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [Products_fk_0_ImageListsId] FOREIGN KEY([ImageListsId])
REFERENCES [dbo].[ImageLists] ([id])
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [Products_fk_0_ImageListsId]
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
