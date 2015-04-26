USE [Housing]
GO

/****** Object:  Table [dbo].[Property_SubType]    Script Date: 04/26/2015 11:46:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Property_SubType](
	[Propert_Sub_Type_Id] [int] NOT NULL,
	[Property_Sub_Type] [nvarchar](50) NOT NULL,
	[Property_Id] [int] NOT NULL,
 CONSTRAINT [PK_Property_SubType] PRIMARY KEY CLUSTERED 
(
	[Propert_Sub_Type_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


