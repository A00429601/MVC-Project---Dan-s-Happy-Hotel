USE [RentalProject]
GO

/****** Object:  Table [dbo].[UserAccount]    Script Date: 11/30/2018 1:22:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserAccount](
	[userID] [bigint] IDENTITY(1,1) NOT NULL,
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

/****** Object:  Table [dbo].[Car]    Script Date: 11/30/2018 1:22:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Car](
	[carID] [bigint] IDENTITY(1,1) NOT NULL,
	[carName] [nvarchar](max) NULL,
	[carType] [nvarchar](max) NULL,
	[carImage] [image] NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[carID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [RentalProject]
GO

/****** Object:  Table [dbo].[Pricing]    Script Date: 11/30/2018 1:22:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pricing](
	[pricingID] [bigint] IDENTITY(1,1) NOT NULL,
	[carID] [bigint] NULL,
	[rate] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Pricing] PRIMARY KEY CLUSTERED 
(
	[pricingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pricing]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_Car] FOREIGN KEY([carID])
REFERENCES [dbo].[Car] ([carID])
GO

ALTER TABLE [dbo].[Pricing] CHECK CONSTRAINT [FK_Pricing_Car]
GO

USE [RentalProject]
GO

/****** Object:  Table [dbo].[Reservation]    Script Date: 11/30/2018 1:22:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reservation](
	[resID] [bigint] IDENTITY(1,1) NOT NULL,
	[userID] [bigint] NULL,
	[carID] [bigint] NULL,
	[fromDate] [date] NULL,
	[toDate] [date] NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[resID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Car] FOREIGN KEY([carID])
REFERENCES [dbo].[Car] ([carID])
GO

ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Car]
GO

ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_UserAccount] FOREIGN KEY([userID])
REFERENCES [dbo].[UserAccount] ([userID])
GO

ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_UserAccount]
GO

