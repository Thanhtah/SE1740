USE [master]
GO
/****** Object:  Database [AssesDB]    Script Date: 28/06/2023 12:05:24 SA ******/
CREATE DATABASE [AssesDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AssesDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER2014\MSSQL\DATA\AssesDB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AssesDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER2014\MSSQL\DATA\AssesDB_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AssesDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssesDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssesDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssesDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssesDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssesDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssesDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssesDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AssesDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssesDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssesDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssesDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssesDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssesDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssesDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssesDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssesDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AssesDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssesDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssesDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssesDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssesDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssesDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssesDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssesDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AssesDB] SET  MULTI_USER 
GO
ALTER DATABASE [AssesDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssesDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssesDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssesDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AssesDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AssesDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 28/06/2023 12:05:25 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 28/06/2023 12:05:25 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_date] [date] NULL,
	[total] [float] NULL,
	[notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 28/06/2023 12:05:25 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 28/06/2023 12:05:25 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](250) NULL,
	[price] [float] NULL,
	[stock] [int] NULL,
	[category_id] [int] NULL,
	[img] [ntext] NULL,
	[description] [nvarchar](3000) NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 28/06/2023 12:05:25 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/06/2023 12:05:25 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[phone] [nchar](11) NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Head Phone')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'Power Bank')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'Case')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'Glass Screen')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (5, N'Speaker')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (1, 1, CAST(N'2023-09-08' AS Date), 100, N'Shipping in weekend')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (2, 2, CAST(N'2023-06-27' AS Date), 100, N'Quick Ship')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (3, 2, CAST(N'2023-06-27' AS Date), 100, N'Easy break product')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (4, 3, CAST(N'2023-06-27' AS Date), 100, N'Shipping in workday')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (5, 3, CAST(N'2023-06-27' AS Date), 100, N'Shipping in workday')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (6, 3, CAST(N'2023-06-28' AS Date), 100, N'Shipping in weekend')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (7, 1, CAST(N'2023-06-27' AS Date), 100, N'Quick Ship')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (8, 1, CAST(N'2023-06-29' AS Date), 11.5, N'quick')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (9, 1, CAST(N'2023-06-27' AS Date), 9, N'quick')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (10, 1, CAST(N'2023-06-29' AS Date), 20, N'quick')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (11, 1, CAST(N'2023-06-30' AS Date), 7, N'ship sau 30p')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (1, 1, 2, 20, 6)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (2, 1, 3, 20, 5)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (3, 1, 5, 20, 4)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (4, 1, 7, 20, 9)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (5, 1, 8, 20, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (6, 2, 15, 20, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (7, 2, 10, 20, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (8, 2, 11, 20, 5)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (9, 3, 6, 20, 4)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (10, 3, 7, 20, 5)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (11, 4, 8, 20, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (12, 4, 15, 20, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (13, 5, 13, 20, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (14, 5, 12, 20, 5)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (15, 6, 11, 20, 6)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (16, 6, 10, 20, 5)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (17, 7, 16, 20, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (18, 7, 5, 20, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (19, 8, 16, 2.5, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (20, 8, 12, 4.5, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (21, 8, 28, 4.5, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (22, 9, 28, 4.5, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (23, 10, 25, 3, 5)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (24, 10, 16, 2.5, 2)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (25, 11, 2, 3.5, 2)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (2, N'Case-Mate iPhone 14 Pro Max Case - Twinkle Stardust [10FT Drop Protection] [Compatible with MagSafe]', 3.5, 98, 2, N'https://m.media-amazon.com/images/I/71o8qJdeQ3L._AC_UY327_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2023-05-04' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (3, N'Case-Mate iPhone 14 Pro Max Case - Twinkle Stardust [10FT Drop Protection] [Compatible with MagSafe]', 2.5, 85, 1, N'https://m.media-amazon.com/images/I/71o8qJdeQ3L._AC_UY327_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2023-01-10' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (4, N'Case-Mate iPhone 14 Pro Max Case - Twinkle Stardust [10FT Drop Protection] [Compatible with MagSafe]', 3, 100, 1, N'https://m.media-amazon.com/images/I/71o8qJdeQ3L._AC_UY327_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2023-09-12' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (5, N'Case-Mate iPhone 14 Pro Max Case - Twinkle Stardust [10FT Drop Protection] [Compatible with MagSafe]', 2.5, 200, 2, N'https://m.media-amazon.com/images/I/71jThE945YL._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2019-11-06' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (6, N'Spigen Tempered Glass Screen Protector [GlasTR EZ FIT] designed for iPhone 14 Pro [Case Friendly]', 4.5, 150, 2, N'https://m.media-amazon.com/images/I/71jThE945YL._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (7, N'Spigen Tempered Glass Screen Protector [GlasTR EZ FIT] designed for iPhone 14 Pro [Case Friendly]', 4, 90, 2, N'https://m.media-amazon.com/images/I/71jThE945YL._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2021-01-09' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (8, N'Spigen Tempered Glass Screen Protector [GlasTR EZ FIT] designed for iPhone 14 Pro [Case Friendly]', 5.5, 150, 3, N'https://m.media-amazon.com/images/I/71jThE945YL._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2020-09-12' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (10, N'Spigen Tempered Glass Screen Protector [GlasTR EZ FIT] designed for iPhone 14 Pro [Case Friendly]', 2.5, 70, 3, N'https://m.media-amazon.com/images/I/71jThE945YL._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2020-01-06' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (11, N'Spigen Tempered Glass Screen Protector [GlasTR EZ FIT] designed for iPhone 14 Pro [Case Friendly]', 3, 90, 3, N'https://m.media-amazon.com/images/I/61y8cbgj+TL._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2021-07-06' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (12, N'Spigen Tempered Glass Screen Protector [GlasTR EZ FIT] designed for iPhone 14 Pro [Case Friendly]', 4.5, 79, 4, N'https://m.media-amazon.com/images/I/61y8cbgj+TL._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2022-01-09' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (13, N'Spigen Tempered Glass Screen Protector [GlasTR EZ FIT] designed for iPhone 14 Pro [Case Friendly]', 4, 60, 4, N'https://m.media-amazon.com/images/I/61y8cbgj+TL._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2021-09-12' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (14, N'Orange Smoothie', 5.5, 70, 4, N'https://m.media-amazon.com/images/I/61y8cbgj+TL._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2020-06-06' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (15, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 2, 90, 5, N'https://m.media-amazon.com/images/I/61y8cbgj+TL._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2021-07-06' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (16, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 2.5, 77, 5, N'https://m.media-amazon.com/images/I/61y8cbgj+TL._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2022-01-09' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (18, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 3.5, 900, 1, N'https://m.media-amazon.com/images/I/31uO5FxdP5L._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2023-05-04' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (20, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 3, 100, 1, N'https://m.media-amazon.com/images/I/31uO5FxdP5L._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2023-09-12' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (21, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 2.5, 200, 2, N'https://m.media-amazon.com/images/I/31uO5FxdP5L._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2019-11-06' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (22, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 4.5, 150, 2, N'https://m.media-amazon.com/images/I/31uO5FxdP5L._AC_UL600_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2013-07-06' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (23, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 4, 90, 2, N'https://m.media-amazon.com/images/I/81RQt1+MZML._AC_UY327_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2023-01-09' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (24, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 5.5, 150, 3, N'https://m.media-amazon.com/images/I/81RQt1+MZML._AC_UY327_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2023-09-12' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (25, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 3, 145, 3, N'https://m.media-amazon.com/images/I/81RQt1+MZML._AC_UY327_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2021-09-12' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (26, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 2.5, 70, 3, N'https://m.media-amazon.com/images/I/81RQt1+MZML._AC_UY327_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2023-01-06' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (27, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 3, 90, 3, N'https://m.media-amazon.com/images/I/81RQt1+MZML._AC_UY327_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2023-07-06' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (28, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 4.5, 77, 4, N'https://m.media-amazon.com/images/I/81RQt1+MZML._AC_UY327_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2023-01-09' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (29, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 4, 60, 4, N'https://m.media-amazon.com/images/I/81RQt1+MZML._AC_UY327_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2021-09-12' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (30, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 5.5, 70, 4, N'https://m.media-amazon.com/images/I/71o8qJdeQ3L._AC_UY327_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2023-06-06' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (31, N'Audio-Technica ATH-AD700X Audiophile Open-Air Headphones Black', 8, 10, 3, N'https://m.media-amazon.com/images/I/71o8qJdeQ3L._AC_UY327_FMwebp_QL65_.jpg', N'About this item
Works For iPhone 14 Pro Max 2022 tempered glass screen protector and camera lens protector.Featuring maximum protection from scratches, scrapes, and bumps. <br>
Night shooting function: specially designed iPhone 14 Pro Max 6.7 Inch display 2022.The camera lens protector adopts the new technology of "seamless" integration of augmented reality, with light transmittance and night shooting function, without the need to design the flash hole position, when the flash is turned on at night, the original quality of photos and videos can be restored. <br>
It is 100% brand new, precise laser cut tempered glass, exquisitely polished. 0.33mm ultra-thin tempered glass screen protector provides sensor protection, maintains the original response sensitivity and touch, bringing you a good touch experience. <br>
Easiest Installation - Please watch our installation video tutorial before installation.Removing dust and aligning it properly before actual installation,no worrying about bubbles,enjoy your screen as if it wasn''t there. <br>
99.99% High-definition clear hydrophobic and oleophobic screen coating protects against sweat and oil residue from fingerprints,enhance the visibility of the screen.', CAST(N'2023-06-16' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (32, NULL, NULL, NULL, NULL, N'https://m.media-amazon.com/images/I/81RQt1+MZML._AC_UY327_FMwebp_QL65_.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (1, N'Customer')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (1, N'Thien Bao', N'thientm01@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Lang Nam, Hu,ng Tan, Nghe An', 1, N'0378387188 ', 2)
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (2, N'Manh Hieu', N'Hieu@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'TP Hai Phong, Hai Phong', 1, N'0195666789 ', 2)
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (3, N'Hieu Nguyen', N'Nguyen@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Dong Da, Ha Noi', 0, N'0123456789 ', 1)
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (4, N'Hung Nguyen', N'Hung@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Thanh Xuan,Ha Noi', 1, N'0156489635 ', 1)
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (5, N'tm01', N'tm01@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'hong cho anh oi', 1, N'0378387199 ', 1)
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (6, N'thientm01@gmail.com', N'tm01@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'hong cho anh oi', 1, N'0378387199 ', 1)
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (7, N'hieu@gmail.com', N'hieu@gmail.com', N'202cb962ac59075b964b07152d234b70', N'da nag ', 1, N'0123456789 ', 1)
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (8, N'thientm011@gmail.com', N'thientm011@gmail.com', N'202cb962ac59075b964b07152d234b70', N'hong cho anh oi', 1, N'0378387199 ', 1)
INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id]) VALUES (9, N'thientm0111@gmail.com', N'thientm0111@gmail.com', N'202cb962ac59075b964b07152d234b70', N'hong cho anh oi', 1, N'0378387199 ', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [AssesDB] SET  READ_WRITE 
GO
