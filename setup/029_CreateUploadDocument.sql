USE [PQC]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UploadDocument] (
	[UploadDocumentID] [int] IDENTITY(1, 1) NOT NULL
	,[FileName] [nvarchar](500) NOT NULL
	,[FileType] [nvarchar](100) NOT NULL
	,[FilePath] [nvarchar](500) NOT NULL
	,[ReferenceCode] [uniqueidentifier] NOT NULL
	,[SubmittedAt] [datetime] NOT NULL
	,CONSTRAINT [PK_UploadDocument] PRIMARY KEY CLUSTERED ([UploadDocumentID] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UploadDocument] ADD CONSTRAINT [DF_UploadDocument_SubmittedAt] DEFAULT(getdate())
FOR [SubmittedAt]
GO
