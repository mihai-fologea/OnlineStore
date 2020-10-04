### [`Customers`]
![Customers Table](/tables_images/Customers.png)<br />
The `Customers` table stores login data and customer details.

```sql
USE [OnlineStore]
GO

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

ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('(getdate())') FOR [BirthDate]
GO

ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO

ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('(getdate())') FOR [DateModified]
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
REFERENCES [dbo].[Locations] ([id])
GO

ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [Customers_fk_0_ShippingLocationId]
GO


```