USE [Housing]
GO

/****** Object:  Table [dbo].[Property_Info]    Script Date: 04/26/2015 11:45:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Property_Info](
	[Property_ID] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[SubType] [nvarchar](50) NULL,
	[InSold] [nvarchar](50) NULL,
	[Locality] [nvarchar](50) NULL,
	[Rate] [decimal](18, 0) NULL,
	[OwnerID] [int] NULL,
	[SellingBy] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[IsDeleted] [nvarchar](50) NULL,
	[IsSold] [nvarchar](50) NULL,
	[IsParking] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[IsVastu] [nvarchar](50) NULL,
	[FrontRoad] [nvarchar](50) NULL,
	[IsFreeHold] [nvarchar](50) NULL,
	[Area] [int] NULL,
	[CreatedDTTM] [datetime] NULL,
	[UpdatedDttm] [datetime] NULL,
	[NoOfView] [int] NULL,
	[NoOfPrsnInterest] [int] NULL,
	[Facility] [nvarchar](50) NULL,
	[Longitude] [nvarchar](15) NULL,
	[Latitude] [nvarchar](15) NULL
) ON [PRIMARY]

GO


