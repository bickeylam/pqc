USE [pqc_test]
GO

--
-- adding seed to tables
--
SET IDENTITY_INSERT [online].[ApplicationOnline] ON
GO

INSERT INTO [online].[ApplicationOnline] (
	[ApplicationOnlineID]
	,[ReferenceCode]
	,[ApplicationID]
	,[CompanyID]
	,[CreatedAt]
	,[NewCompanyID]
	,[SubmittedAt]
	)
VALUES (
	1
	,N'58FB5506-7DD7-47DE-8337-3023DC0711E6'
	,1001
	,101
	,GetDate()
	,NULL
	,NULL
	)
	,(
	2
	,N'AD12AAE5-A60A-4EA7-ADD5-B15BBCD95C0C'
	,1002
	,102
	,GetDate()
	,NULL
	,NULL
	)

SET IDENTITY_INSERT [online].[ApplicationOnline] OFF
GO

SET IDENTITY_INSERT [online].[Application] ON
GO

INSERT INTO [online].[Application] (
	[ApplicationID]
	,[CompanyID]
	,[StatusID]
	,[NPSMaxContractValue]
	,[NPSWorkingCapital]
	,[NPSAVG3YearFinancialTurnover]
	,[LatestApplication]
	)
VALUES (
	1001
	,101
	,1 -- RECEIVED
	,0
	,0
	,0
	,1
	)
	,(
	1002
	,102
	,1 -- RECEIVED
	,0
	,0
	,0
	,1
	)
GO

SET IDENTITY_INSERT [online].[Application] OFF
GO

SET IDENTITY_INSERT [online].[Company] ON
GO

INSERT INTO [online].[Company] (
	[CompanyID]
	,[CompanyName]
	,[HeadOfficeID]
	,[Active]
	,[UsesETender]
	)
VALUES (
	101
	,N'Company one'
	,NULL
	,1
	,0
	)
	,(
	102
	,N'Company two'
	,NULL
	,1
	,0
	)
	,(
	103
	,N'Company one - branch one'
	,101
	,1
	,0
	)
	,(
	104
	,N'Company one - branch two'
	,101
	,1
	,0
	)
GO

SET IDENTITY_INSERT [online].[Company] OFF
GO


