USE [Warehouse]
GO

/****** Object:  Table [dbo].[Products]    Script Date: 2/10/2020 9:30:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--create Tables
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](256) NOT NULL,
	[DESCRIPTION] [varchar](256) NOT NULL,
	[PRICE] [decimal](18, 0) NOT NULL,
	[UNIT] [varchar](256) NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK__PRODUCTS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO

CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](256) NOT NULL,
	[DESCRIPTION] [varchar](256) NULL,
 CONSTRAINT [PK__CATEGORY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Insert into tables



INSERT INTO Category (NAME, DESCRIPTION)
VALUES ('Fructe', '');

INSERT INTO Category (NAME, DESCRIPTION)
VALUES ('Legume', '');

INSERT INTO Products (NAME, DESCRIPTION, PRICE, UNIT,CategoryID)
VALUES ('MERE', 'JONATAN', 1.2, 'KG', 1);

INSERT INTO PRODUCTS (NAME, DESCRIPTION, PRICE, UNIT,CategoryID)
VALUES ('PERE', 'CONFERENCE', 1.5, 'KG', 1);