USE [master]
GO
/****** Object:  Database [ShopTraiCay]    Script Date: 3/6/2024 4:51:42 PM ******/
CREATE DATABASE [ShopTraiCay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopTraiCay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShopTraiCay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopTraiCay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShopTraiCay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShopTraiCay] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopTraiCay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopTraiCay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopTraiCay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopTraiCay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopTraiCay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopTraiCay] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopTraiCay] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopTraiCay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopTraiCay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopTraiCay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopTraiCay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopTraiCay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopTraiCay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopTraiCay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopTraiCay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopTraiCay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopTraiCay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopTraiCay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopTraiCay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopTraiCay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopTraiCay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopTraiCay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopTraiCay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopTraiCay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopTraiCay] SET  MULTI_USER 
GO
ALTER DATABASE [ShopTraiCay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopTraiCay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopTraiCay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopTraiCay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopTraiCay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopTraiCay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopTraiCay] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopTraiCay] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShopTraiCay]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/6/2024 4:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](100) NOT NULL,
	[pass] [varchar](1000) NOT NULL,
	[fullname] [nvarchar](1000) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[isAdmin] [int] NOT NULL,
	[isCus] [int] NOT NULL,
	[phone] [varchar](20) NULL,
	[address] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/6/2024 4:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[username] [varchar](100) NULL,
	[pId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[total_quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catelogy]    Script Date: 3/6/2024 4:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catelogy](
	[cId] [int] NOT NULL,
	[cName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/6/2024 4:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[order_date] [date] NOT NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
	[total_quantity] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[startus] [int] NOT NULL,
	[note] [nvarchar](max) NULL,
	[pay] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 3/6/2024 4:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[order_item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[pId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[amount] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/6/2024 4:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[img] [varchar](1000) NOT NULL,
	[des] [nvarchar](1000) NOT NULL,
	[cId] [int] NOT NULL,
	[status] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'group1', N'827ccb0eea8a706c4c34a16891f84e7b', N'group1', N'group1@fpt.edu.vn', 1, 0, N'0947472003', N'Ninh Kieu, Can Tho, Viet Nam')
INSERT [dbo].[Account] ([username], [pass], [fullname], [email], [isAdmin], [isCus], [phone], [address]) VALUES (N'MinhNguyet', N'827ccb0eea8a706c4c34a16891f84e7b', N'MinhNguyet', N'mingun04072003@gmail.com', 0, 1, N'0947472003', N'Ninh Kieu, Can Tho, Viet Nam')
GO
INSERT [dbo].[Cart] ([username], [pId], [quantity], [total_quantity]) VALUES (N'MinhNguyet', 23, 3, 36000)
INSERT [dbo].[Cart] ([username], [pId], [quantity], [total_quantity]) VALUES (N'MinhNguyet', 22, 2, 110000)
GO
INSERT [dbo].[Catelogy] ([cId], [cName]) VALUES (1, N'Strawberry')
INSERT [dbo].[Catelogy] ([cId], [cName]) VALUES (2, N'Berry')
INSERT [dbo].[Catelogy] ([cId], [cName]) VALUES (3, N'Lemon')
INSERT [dbo].[Catelogy] ([cId], [cName]) VALUES (4, N'Orther')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [username], [order_date], [total_amount], [total_quantity], [name], [address], [phone], [startus], [note], [pay]) VALUES (1, N'MinhNguyet', CAST(N'2024-03-05' AS Date), CAST(12000.00 AS Decimal(10, 2)), 1, N'MinhNguyet', N'Ninh Kieu, Can Tho, Viet Nam', N'0947472003', 1, N'', 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([order_item_id], [order_id], [pId], [quantity], [amount]) VALUES (1, 1, 23, 1, 12000)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (1, N'Raspberry', 123, N'assets/img/products/hero-bg-3.jpg', N'Huhu', 1, 0, 6)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (2, N'Berry', 70, N'assets/img/products/product-img-2_2.jpg', N'Grapes are small, sweet, and juicy fruits with a crisp skin and succulent pulp. They come in various colors, offering a delightful blend of flavors. Grapes are versatile, perfect for snacking, winemaking, and culinary uses. They''re not only delicious but also nutritious, rich in vitamins and antioxidants.', 2, 0, 15)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (3, N'Lemon', 35, N'assets/img/products/product-img-3.jpg', N'Lemons are small, yellow citrus fruits known for their tart, refreshing taste and versatility in cooking and beverages. They''re a rich source of vitamin C and add brightness to many dishes.', 3, 0, 10)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (4, N'Kiwi', 50, N'assets/img/products/product-img-4.jpg', N'Avocado is a creamy, green fruit known for its buttery texture and mild, nutty flavor. It''s often used in salads, spreads, and as a topping for various dishes. Avocado is also a good source of healthy fats and essential nutrients.', 4, 1, 9)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (5, N'Green Apple', 45, N'assets/img/products/product-img-5.jpg', N'Green apples are crisp, tart fruits with a bright green skin. They offer a refreshing and slightly sour taste, making them popular for snacking and use in pies and salads. Green apples are known for their firm texture and are a good source of dietary fiber and essential vitamins.', 4, 1, 9)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (6, N'Strawberry', 80, N'assets/img/products/product-img-6.jpg', N'Strawberries are vibrant red, heart-shaped berries known for their sweet and juicy flavor. They are a popular fruit for snacking, desserts, and preserves. Strawberries are celebrated for their delicious taste and high vitamin C content.', 1, 0, 10)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (10, N'Avocado 034', 80000, N'assets\img\products\bo034.jpg', N'Avocado 034 is an avocado variety that is considered a type of avocado that produces fruit in the main season and off-season, has high yield, and has the best fruit quality among current avocado varieties.', 1, 1, 30)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (11, N'Cau Duc Pineapple', 14000, N'assets\img\products\khom.jpg', N'Cau Duc pineapple belongs to the Queen variety. The unique feature of this variety is that the fruit has an elegant shape, short stem, small core, bulging eyes, slightly deep eye pits, dark yellow flesh, little fiber, little juice, crunchy and sweet. In particular, Cau Duc pineapple can be left for about 10-15 days without rotting.', 3, 1, 15)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (12, N'Hoa Loc Mango', 45000, N'assets\img\products\xoai.jpg', N'Hoa Loc mangoes are usually eaten when ripe. When eating a piece of mango in the mouth, the mango has a rich, pleasant aroma, the flesh is golden yellow, not at all greasy, the sweetness is deep, the aftertaste is good, and after eating, the mouth still smells. fragrant scent for an hour.', 1, 1, 65)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (13, N'Longan', 45000, N'assets\img\products\nhan.jpg', N'Longan is a longan variety that produces the largest fruit. The rice of the longan fruit is easy to recognize because it is ivory yellow, crunchy and very delicious.', 1, 1, 22)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (14, N'Luc Ngan Lychee', 50000, N'assets\img\products\vai.jpg', N'When ripe, Luc Ngan lychee is bright red, has small seeds, thick pulp, sweet and rich in nutrients. Lychees here are larger and have a unique flavor that is different from lychees in other lands.', 1, 1, 80)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (15, N'Nam Roi Pomelo', 28000, N'assets\img\products\buoi5roi.jpg', N'Nam Roi Pomelo is pear-shaped, can peel off its skin, has many succulent segments, is sweet, and has no seeds. Each year, this pomelo variety is harvested twice in August and December.', 2, 1, 20)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (16, N'Ri 6 Durian', 90000, N'assets\img\products\sr.jpg', N'Ri 6 durian is popular for its unique aroma, thick rice, flat seeds, sweet taste, and moderate fat.', 1, 1, 60)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (17, N'Star apple', 50000, N'assets\img\products\vs.jpg', N'Star apple is commonly grown in the orchards of central and southern parts of Viet Nam,it has sweet, tropical flavor and creamy, jellylike fruit flesh.', 2, 1, 43)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (18, N'Thai jackfruit', 21000, N'assets\img\products\mit.jpg', N'Thai jackfruit has large, thick segments that are sweet and have a subtle aroma when eaten. If you want to enjoy a lot of crunch, you can preserve and serve cold.', 1, 1, 40)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (19, N'Avocado', 75000, N'assets\img\products\bo.jpg', N'Avocado is a famous specialty fruit of the highlands. The avocado here stands out for its deliciousness and nutritional value. Avocados have outstanding advantages compared to regular avocados: the fruit is large and not rough, the fruit is not too round but not too long, and the skin of the avocado is plump when almost ripe but still a bit rough and very firm to hold.', 1, 2, 62)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (20, N'Sapoche', 45000, N'assets\img\products\spc.jpg', N'With a thin, light brown skin, fragrant, very sweet and succulent when ripe, saboche is an ideal fruit for dessert or refreshment. Saboche has a sweet taste because it contains a lot of fructose and sucrose, so this is a natural food that helps increase the body energy.', 2, 1, 35)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (21, N'Mangosteen', 50000, N'assets\img\products\mc.jpg', N'When ripe, mangosteen fruit has a thick, dark purple-red outer skin. The flesh is ivory white and divided into many segments, has a sweet and sour taste and an attractive aroma. Mangosteen contains a lot of protein, calcium, iron, phosphorus, etc., so it is very good for health.', 1, 1, 62)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (22, N'Thai Rambutan', 55000, N'assets\img\products\cc.jpg', N'Rambutan is as small as a golf ball with a hairy red and blue shell that looks a bit like a sea urchin. When eating rambutan, the clear white flesh has a mild sweet taste and has seeds in the center.', 1, 1, 94)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (23, N'Orange', 12000, N'assets\img\products\cx.jpg', N'Orange is a fruit tree in the same family as grapefruit. It has a fruit smaller than a grapefruit, with thin skin. Depending on the type, it is orange or green when ripe, with a sweet or slightly sour taste.', 1, 1, 94)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (24, N'Persimmon', 80000, N'assets\img\products\hong.jpg', N'Persimmons are orange-yellow to red depending on the variety. The fruit is spherical, heart-shaped, or flattened tomato-shaped. The calyx often sticks to the fruit when ripe.', 1, 2, 63)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (25, N'Tangerine', 45000, N'assets\img\products\qd.jpg', N'Lai Vung tangerines are succulent and sweet, a famous specialty of Lai Vung - Dong Thap. Characterized by a peel with a pleasant aroma like essential oils, large round fruit, thin and shiny peel that is easy to peel, super succulent tangerine segments, sweet taste mixed with a slight sourness.', 1, 1, 88)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (26, N'Dragon Fruit', 20000, N'assets\img\products\tl.jpg', N'Dragon fruit is an orchid tree, the fruit is oval in shape, has many green leaves, green skin, when ripe it turns purple and then dark red, many black seeds, mild sweet taste.', 1, 2, 77)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (27, N'Rose Apple', 13000, N'assets\img\products\man.jpg', N' The skin color of the fruit can be paled red, greenish-white, or cream-colored. The skin is thin and waxy. Inside the white flesh is spongy and dry, but can be juicy and crispy depending on the variety. it, have a mild, watery sweetness, although them and they can be bland or sour at times.', 2, 2, 64)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (28, N'Dalat strawberry', 200000, N'assets/img/products/product-img-1_1.jpg', N'Strawberries are red, succulent, have a sweet candy aroma and have a rich, sweet taste, different from all other types of strawberries being grown in Da Lat and surrounding areas today:', 1, 0, 0)
INSERT [dbo].[Product] ([pId], [name], [price], [img], [des], [cId], [status], [quantity]) VALUES (29, N'Areca Banana.', 20000, N'assets\img\products\chuoi.jpg', N'Originally called areca banana because it has a small, round shape, is thick and fat like an areca fruit in Vietnam. Currently, in our country market, areca bananas are grown the most in Tien Giang province. Areca bananas have more fruit density, smooth skin, rounder fruit and usually no beard at the top of the fruit. When the banana peel is ripe, it will turn yellow and have a sweet taste and characteristic aroma.', 2, 2, 77)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([pId])
REFERENCES [dbo].[Product] ([pId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([pId])
REFERENCES [dbo].[Product] ([pId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cId])
REFERENCES [dbo].[Catelogy] ([cId])
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 3/6/2024 4:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckLogin]
@username varchar(10),
@password varchar(32)
AS
SELECT username
FROM Account
WHERE username = @username AND pass = @password;

GO
USE [master]
GO
ALTER DATABASE [ShopTraiCay] SET  READ_WRITE 
GO
