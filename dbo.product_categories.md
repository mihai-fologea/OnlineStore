# [`Product Categories`]

![Product Categories](/tables_images/product_categories.png)

## The `Product Categories` table stores product categories used by products table

```sql
USE [OnlineStore]
GO

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

ALTER TABLE [dbo].[ProductsCategories] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[ProductsCategories] ADD  DEFAULT (getdate()) FOR [DateModified]
GO

```
