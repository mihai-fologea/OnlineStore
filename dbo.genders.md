# [`Genders`]

![Genders Table](/tables_images/genders.png)

## The `Genders` table stores gender types used in the `Customers` table

```sql
USE [OnlineStore]
GO

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

ALTER TABLE [dbo].[Genders] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
```
