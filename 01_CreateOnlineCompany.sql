USE [mytester]
GO
	/****** Object:  Table [dbo].[Company]    Script Date: 16/05/2021 2:26:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
CREATE TABLE [online].[Company](
		[CompanyID] [int] IDENTITY(1, 1) NOT NULL
		,[Name] [varchar](50) NOT NULL
		,[HeadOfficeID] [int] NULL 
		CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([CompanyID] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO