# [`Reviews`]

![Reviews Table](/tables_images/reviews.png)

## The [`Reviews`] table stores product reviews written by customers

```sql
USE [OnlineStore]
GO

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

ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
GO

ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ('(getdate())') FOR [DateModified]
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

```
