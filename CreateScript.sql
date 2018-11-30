USE [RentalProject]
GO

/****** Object:  Table [dbo].[UserAccount]    Script Date: 11/30/2018 12:48:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserAccount](
	[userID] [nvarchar](50) NOT NULL,
	[firstName] [nvarchar](max) NULL,
	[lastName] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


USE [RentalProject]
GO

/****** Object:  Table [dbo].[Cars]    Script Date: 11/30/2018 12:49:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cars](
	[carID] [nvarchar](50) NOT NULL,
	[carName] [nvarchar](max) NULL,
	[carType] [nvarchar](max) NULL,
	[carImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[carID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [RentalProject]
GO

/****** Object:  Table [dbo].[Pricing]    Script Date: 11/30/2018 12:49:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pricing](
	[carID] [nvarchar](50) NULL,
	[rate] [decimal](18, 2) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pricing]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_Cars] FOREIGN KEY([carID])
REFERENCES [dbo].[Cars] ([carID])
GO

ALTER TABLE [dbo].[Pricing] CHECK CONSTRAINT [FK_Pricing_Cars]
GO

USE [RentalProject]
GO

/****** Object:  Table [dbo].[Reservation]    Script Date: 11/30/2018 12:49:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reservation](
	[userID] [nvarchar](50) NULL,
	[carID] [nvarchar](50) NULL,
	[fromDate] [date] NULL,
	[toDate] [date] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Cars] FOREIGN KEY([carID])
REFERENCES [dbo].[Cars] ([carID])
GO

ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Cars]
GO

ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_UserAccount] FOREIGN KEY([userID])
REFERENCES [dbo].[UserAccount] ([userID])
GO

ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_UserAccount]
GO

