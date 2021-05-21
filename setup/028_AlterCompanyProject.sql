USE [PQC]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[CompanyProject] ADD
	[RefereeEmail] [nvarchar](100) NULL
	, [FeeInPercentage] [float] NULL
GO