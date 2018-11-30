USE [RentalProject]
GO

/****** Object:  Table [dbo].[UserAccount]    Script Date: 11/30/2018 1:47:32 AM ******/
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

/****** Object:  Table [dbo].[Car]    Script Date: 11/30/2018 1:47:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Car](
	[carID] [nvarchar](50) NOT NULL,
	[carName] [nvarchar](max) NULL,
	[carType] [nvarchar](max) NULL,
	[carImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[carID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [RentalProject]
GO

/****** Object:  Table [dbo].[Pricing]    Script Date: 11/30/2018 1:47:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pricing](
	[pricingID] [nvarchar](50) NOT NULL,
	[carID] [nvarchar](50) NULL,
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

/****** Object:  Table [dbo].[Reservation]    Script Date: 11/30/2018 1:48:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reservation](
	[resID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[carID] [nvarchar](50) NULL,
	[fromDate] [datetime] NULL,
	[toDate] [datetime] NULL,
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

