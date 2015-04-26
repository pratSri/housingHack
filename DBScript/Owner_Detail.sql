USE [Housing]
GO

/****** Object:  Table [dbo].[Owner_Detail]    Script Date: 04/26/2015 11:45:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Owner_Detail](
	[Owner_Id] [int] NOT NULL,
	[Owner_Name] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO


