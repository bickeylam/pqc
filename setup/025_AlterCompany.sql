USE [PQC]
GO

ALTER TABLE [dbo].[Company] ADD  
	[IndigenousExperienceDetail] [VARCHAR](MAX)
	, [IsIndigenousBusiness] [bit] DEFAULT(0)
	, [IsRegisteredWithSupplyNation] [BIT] DEFAULT(0)
GO
