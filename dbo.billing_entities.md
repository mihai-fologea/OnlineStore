# [`Billing Entities`]

![Billing Entities Table](/tables_images/billing_entities.png)

```sql
USE [OnlineStore]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BillingEntities](
 [id] [int] IDENTITY(1,1) NOT NULL,
 [Name] [varchar](100) NOT NULL,
 [TaxId] [varchar](20) NOT NULL,
 [StreetAddress] [varchar](200) NOT NULL,
 [City] [varchar](50) NOT NULL,
 [DateCreated] [datetime2](7) NOT NULL,
 [DateModified] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_billing_entity_id] UNIQUE NONCLUSTERED
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BillingEntities] ADD  DEFAULT ('(getdate())') FOR [DateCreated]
ALTER TABLE [dbo].[BillingEntities] ADD  DEFAULT ('(getdate())') FOR [DateModified]
GO

```
