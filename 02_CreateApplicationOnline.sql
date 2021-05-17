USE [mytester]
GO

/****** Object:  Table [online].[ApplicationOnline]    Script Date: 16/05/2021 2:42:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[ApplicationOnline](
	[ApplicationOnlineID] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CompanyID] [int] NULL,
	[NewCompanyID] [int] NULL,
 CONSTRAINT [PK_ApplicationOnline] PRIMARY KEY CLUSTERED 
(
	[ApplicationOnlineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [online].[ApplicationOnline] ADD  CONSTRAINT [DF_ApplicationOnline_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO

ALTER TABLE [online].[ApplicationOnline]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationOnline_Company] FOREIGN KEY([CompanyID])
REFERENCES [online].[Company] ([CompanyID])
GO

ALTER TABLE [online].[ApplicationOnline] CHECK CONSTRAINT [FK_ApplicationOnline_Company]
GO

