USE [Housing]
GO

/****** Object:  Table [dbo].[Search_History]    Script Date: 04/26/2015 11:48:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Search_History](
	[User_Id] [int] NOT NULL,
	[Property_Id] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO


