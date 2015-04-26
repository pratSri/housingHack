USE [Housing]
GO

/****** Object:  Table [dbo].[Search_Criteria_History]    Script Date: 04/26/2015 11:47:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Search_Criteria_History](
	[user_Id] [int] NOT NULL,
	[SearchCriteria] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO


