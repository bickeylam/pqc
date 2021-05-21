USE [PQC]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CompanyCompliance] (
	[CompanyComplianceID] [int] IDENTITY(1, 1) NOT NULL
	,[ContactID] [int] NULL
	,[Response] [varchar](100) NULL
	,[Details] [varchar](250) NULL
	,[QuestionID] [int] NULL
	,[CompanyID] [int] NULL
	,[TemplateID] [int] NULL
	,[ContactName] [nvarchar](100) NULL
	,CONSTRAINT [PK_CompanyCompliance] PRIMARY KEY CLUSTERED ([CompanyComplianceID] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		,FILLFACTOR = 90
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CompanyCompliance]  WITH NOCHECK ADD  CONSTRAINT [FK_CompanyCompliance_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO

ALTER TABLE [dbo].[CompanyCompliance] CHECK CONSTRAINT [FK_CompanyCompliance_Company]
GO

ALTER TABLE [dbo].[CompanyCompliance]  WITH CHECK ADD  CONSTRAINT [FK_CompanyCompliance_Contact] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contact] ([ContactID])
GO

ALTER TABLE [dbo].[CompanyCompliance] CHECK CONSTRAINT [FK_CompanyCompliance_Contact]
GO

ALTER TABLE [dbo].[CompanyCompliance]  WITH CHECK ADD  CONSTRAINT [FK_CompanyCompliance_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionID])
GO

ALTER TABLE [dbo].[CompanyCompliance] CHECK CONSTRAINT [FK_CompanyCompliance_Question]
GO

ALTER TABLE [dbo].[CompanyCompliance]  WITH CHECK ADD  CONSTRAINT [FK_CompanyCompliance_Template] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[Template] ([TemplateID])
GO

ALTER TABLE [dbo].[CompanyCompliance] CHECK CONSTRAINT [FK_CompanyCompliance_Template]
GO
