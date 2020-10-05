# [`Cart Items`]

![Cart Items Table](/tables_images/cart_items.png)

## The [`Cart Items`] table stores the products from an shopping cart

```sql
USE [OnlineStore]
GO

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

ALTER TABLE [dbo].[CartItems] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[CartItems] ADD  DEFAULT (getdate()) FOR [DateModified]
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

```
