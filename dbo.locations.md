# [`Locations`]

![Locations Table](/tables_images/Locations.png)

## The `Locations` table stores mainly customer delivery addresses

```sql
USE [OnlineStore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Locations](
 [id] [int] IDENTITY(1,1) NOT NULL,
 [Name] [varchar](50) NOT NULL,
 [StreetAddress] [varchar](200) NOT NULL,
 [City] [varchar](50) NOT NULL,
 [PostalCode] [varchar](12) NOT NULL,
 [DateCreated] [datetime2](7) NOT NULL,
 [DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_shipping_location_id] UNIQUE NONCLUSTERED
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Locations] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Locations] ADD  DEFAULT (getdate()) FOR [DateModified]
GO

```
