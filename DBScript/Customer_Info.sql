USE [Housing]
GO

/****** Object:  Table [dbo].[Customer_Info]    Script Date: 04/26/2015 11:49:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer_Info](
	[USER_ID] [nvarchar](50) NULL,
	[USER_NAME] [nvarchar](50) NULL,
	[USER_PASSWORD] [nvarchar](50) NULL,
	[IS_ACTIVE] [nvarchar](50) NULL,
	[CREATED_SOURCE_TYPE_ID] [nvarchar](50) NULL,
	[CREATED_SOURCE] [nvarchar](50) NULL,
	[CREATED_DTTM] [datetime] NULL,
	[USER_FIRST_NAME] [nvarchar](50) NULL,
	[USER_MIDDLE_NAME] [nvarchar](50) NULL,
	[USER_LAST_NAME] [nvarchar](50) NULL,
	[USER_TITLE] [nvarchar](50) NULL,
	[TELEPHONE_NUMBER] [nvarchar](50) NULL,
	[ADDRESS_1] [nvarchar](50) NULL,
	[ADDRESS_2] [nvarchar](50) NULL,
	[CITY] [nvarchar](50) NULL,
	[STATE_PROV_CODE] [nvarchar](50) NULL,
	[POSTAL_CODE] [nvarchar](50) NULL,
	[COUNTRY_CODE] [nvarchar](50) NULL,
	[USER_EMAIL_1] [nvarchar](50) NULL,
	[USER_EMAIL_2] [nvarchar](50) NULL,
	[LAST_PASSWORD_CHANGE_DTTM] [datetime] NULL,
	[LAST_LOGIN_DTTM] [datetime] NULL,
	[BIRTH_DATE] [datetime] NULL,
	[GENDER_ID] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Customer_Info] ADD  CONSTRAINT [DF_Customer_Info_CREATED_DTTM]  DEFAULT (getdate()) FOR [CREATED_DTTM]
GO

ALTER TABLE [dbo].[Customer_Info] ADD  CONSTRAINT [DF_Customer_Info_LAST_PASSWORD_CHANGE_DTTM]  DEFAULT (getdate()) FOR [LAST_PASSWORD_CHANGE_DTTM]
GO


