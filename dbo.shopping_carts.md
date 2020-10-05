# [`Shopping Carts`]

![Shopping Carts Table](/tables_images/shopping_carts.png)

```sql
USE [OnlineStore]
GO

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

ALTER TABLE [dbo].[ShoppingCarts] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[ShoppingCarts] ADD  DEFAULT (getdate()) FOR [DateModified]
GO

ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [ShoppingCarts_fk_0_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([id])
GO

ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [ShoppingCarts_fk_0_CustomerId]
GO

```
