CREATE DATABASE [Warehouse]
Use Warehouse
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/23/2020 9:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/23/2020 9:40:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](256) NOT NULL,
	[DESCRIPTION] [varchar](256) NULL,
	[PRICE] [decimal](18, 0) NOT NULL,
	[UNIT] [varchar](256) NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK__PRODUCTS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([ID], [NAME], [DESCRIPTION]) VALUES (1, N'Fructe', N'img/Fruits.jpg')
GO
INSERT [dbo].[Category] ([ID], [NAME], [DESCRIPTION]) VALUES (2, N'Legume', N'img/Vegies.jpg')
GO
INSERT [dbo].[Category] ([ID], [NAME], [DESCRIPTION]) VALUES (3, N'Carne', N'img/Meat.jpg')
GO
INSERT [dbo].[Category] ([ID], [NAME], [DESCRIPTION]) VALUES (4, N'Lactate', N'img/Dairy.jpg')
GO
INSERT [dbo].[Category] ([ID], [NAME], [DESCRIPTION]) VALUES (5, N'Panificatie', N'img/Bakery.jpg')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (1, N'Mere', N'Jonatan', CAST(1 AS Decimal(18, 0)), N'Kg', 1)
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (2, N'Pere', N'Conference', CAST(2 AS Decimal(18, 0)), N'Kg', 1)
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (4, N'Carne', N'Vita', CAST(30 AS Decimal(18, 0)), N'Kg', 3)
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (7, N'Smantana', N'De vaci', CAST(15 AS Decimal(18, 0)), N'L', 4)
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (9, N'Franzela', N'Frantuseasca', CAST(6 AS Decimal(18, 0)), N'buc', 5)
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (10, N'Unt', N'82%', CAST(12 AS Decimal(18, 0)), N'200g', 4)
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (11, N'Lapte', N'3.5%', CAST(8 AS Decimal(18, 0)), N'L', 4)
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (12, N'Mici', N'Vita cu oaie', CAST(20 AS Decimal(18, 0)), N'Kg', 3)
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (13, N'Morcovi', NULL, CAST(3 AS Decimal(18, 0)), N'Kg', 2)
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (14, N'Dovleac', N'Placintar', CAST(2 AS Decimal(18, 0)), N'Kg', 1)
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (15, N'Afine', NULL, CAST(25 AS Decimal(18, 0)), N'Kg', 1)
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (16, N'Ceapa', N'Rosie', CAST(3 AS Decimal(18, 0)), N'Kg', 2)
GO
INSERT [dbo].[Products] ([ID], [NAME], [DESCRIPTION], [PRICE], [UNIT], [CategoryID]) VALUES (17, N'Usturoi', NULL, CAST(10 AS Decimal(18, 0)), N'Kg', 2)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
