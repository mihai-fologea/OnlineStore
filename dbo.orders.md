# [`Orders`]

![Orders](/tables_images/orders.png)

## The `Orders` table stores orders generated from a cart, customer details, payment details

```sql
USE [OnlineStore]
GO

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

ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [DateModified]
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

```
