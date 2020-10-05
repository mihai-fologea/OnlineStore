# [`Images`]

![Images Table](/tables_images/images.png)

## The [`Images`] table stores images for each product

```sql
USE [OnlineStore]
GO

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

ALTER TABLE [dbo].[Images] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Images] ADD  DEFAULT (getdate()) FOR [DateModified]
GO

ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [Images_fk_0_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([id])
GO

ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [Images_fk_0_ProductId]
GO

```
