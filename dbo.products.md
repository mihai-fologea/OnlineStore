# [`Products`]

![Customers Table](/tables_images/products.png)

## The `Products` table stores product information and details

```sql
USE [OnlineStore]
GO

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

ALTER TABLE [dbo].[Products] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO

ALTER TABLE [dbo].[Products] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [Products_fk_0_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ProductsCategories] ([id])
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [Products_fk_0_CategoryId]
GO

```
