USE [master]
GO
/****** Object:  Database [GardenDB]    Script Date: 02.04.2017 16:20:40 ******/
CREATE DATABASE [GardenDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GardenDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GardenDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GardenDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GardenDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GardenDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GardenDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GardenDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GardenDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GardenDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GardenDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GardenDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GardenDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GardenDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GardenDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GardenDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GardenDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GardenDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GardenDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GardenDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GardenDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GardenDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GardenDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GardenDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GardenDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GardenDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GardenDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GardenDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GardenDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GardenDB] SET RECOVERY FULL 
GO
ALTER DATABASE [GardenDB] SET  MULTI_USER 
GO
ALTER DATABASE [GardenDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GardenDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GardenDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GardenDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GardenDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [GardenDB]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02.04.2017 16:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[Price] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 02.04.2017 16:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (1, N'Magic Lily', 1, CAST(49.9900 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (2, N'Autumn crocus', 1, CAST(22.4900 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (3, N'Compost bin', 15, CAST(57.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (4, N'Bat box', 13, CAST(13.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (5, N'English Ivy', 3, CAST(16.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (6, N'Sterilized soil', 7, CAST(8.5000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (7, N'Anise', 10, CAST(7.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (8, N'Hand trowel', 15, CAST(19.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (9, N'Ausstrian Pine', 9, CAST(24.9900 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (10, N'Currant', 6, CAST(9.9900 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (11, N'Scots Pine', 9, CAST(21.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (13, N'CurranStrawberriest', 16, CAST(5.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (14, N'Blackberries', 16, CAST(4.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (15, N'Bonsai toolkit', 11, CAST(35.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (16, N'Dwarf Jack Pine', 11, CAST(27.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (17, N'Peony', 1, CAST(23.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (18, N'Begonias', 1, CAST(31.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (19, N'Prickly Pear', 2, CAST(4.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (20, N'Butterworts', 2, CAST(7.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (21, N'Bubl fertilizer', 8, CAST(5.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (22, N'Tree fertilizer', 8, CAST(33.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (23, N'Daisy', 5, CAST(4.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (24, N'Baby''s Breath', 5, CAST(6.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (25, N'Redtop', 4, CAST(24.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (26, N'Decorator moss', 4, CAST(11.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (28, N'Beebalm', 10, CAST(9.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (30, N'Scarecat', 13, CAST(5.9900 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (31, N'Catawba Rhododendron', 12, CAST(19.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (32, N'Winterberry', 17, CAST(15.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (33, N'Beautybush', 17, CAST(17.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (34, N'Pea gravel', 7, CAST(28.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (35, N'Golden Larch', 9, CAST(29.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (36, N'Anacharis', 6, CAST(13.0000 AS Decimal(19, 4)))
INSERT [dbo].[Product] ([ProductID], [Name], [ProductCategoryID], [Price]) VALUES (37, N'Papyrus', 6, CAST(13.0000 AS Decimal(19, 4)))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (16, N'Berry bushes')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (11, N'Bonsai supplies')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (1, N'Bulbs')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (2, N'Cacti')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (14, N'Carnivorous')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (8, N'Fertilizers')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (5, N'Flowers')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (4, N'Grasses')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (3, N'Ground covers')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (10, N'Herbs')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (13, N'Pest control')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (12, N'Rhododendron')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (17, N'Shrubs/hedges')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (7, N'Soils/sand')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (15, N'Tools')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (9, N'Trees')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Name]) VALUES (6, N'Wetland plants')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Product_Name]    Script Date: 02.04.2017 16:20:40 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [UQ_Product_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_ProductCategory_Name]    Script Date: 02.04.2017 16:20:40 ******/
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [UQ_ProductCategory_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ProductCategoryID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_Product_Price] CHECK  (([Price]>(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_Product_Price]
GO
/****** Object:  StoredProcedure [dbo].[spGetProductByCategory]    Script Date: 02.04.2017 16:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetProductByCategory]
@Category nvarchar(50)
as
begin
select Product.Name, ProductCategory.Name AS Category, Price from Product
inner join ProductCategory
ON Product.ProductCategoryId = ProductCategory.ProductCategoryID 
where ProductCategory.Name = @Category OR @Category = '<All>'
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertProduct]    Script Date: 02.04.2017 16:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertProduct]
@Name nvarchar(50),
@ProductCategoryID int,
@Price decimal(19,4)
AS
BEGIN
Insert into Product VALUES (@Name, @ProductCategoryID, @Price)
END
GO
USE [master]
GO
ALTER DATABASE [GardenDB] SET  READ_WRITE 
GO
