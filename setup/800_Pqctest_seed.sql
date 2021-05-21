USE [PQC]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	,[NewCompanyID]
	,[NameOfApplicant]
	,[NameOfSigner]
	,[DateSigned]
	,[EmailConfirmation]
	,[CreatedAt]
	,[IsSaved]
	,[SubmittedAt]
	,[IsCancelled]
	,[IsExpired]
	,[IsTransferred]
	)
VALUES (
	1
	,NEWID()
	,1001
	,101
	,NULL
	, N'Name of applicant'
	, N'Name of signer'
	, GetDate()
	, N'signer@mail.com'	
	,GetDate()
	,0
	,NULL
	,0
	,0
	,0
	)
	,(
	2
	,NEWID()
	,1002
	,102
	,NULL
	, N'Name of applicant'
	, N'Name of signer'
	, GetDate()
	, N'signer@mail.com'
	,GetDate()
	,0
	,NULL
	,0
	,0
	,0
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
	,[TemplateID]
	,[DateReceived]
	)
VALUES (
	1001
	,101
	,1 -- RECEIVED
	,0
	,0
	,0
	,1
	,4
	, GetDate() -- [DateReceived]
	)
	,(
	1002
	,102
	,1 -- RECEIVED
	,0
	,0
	,0
	,1
	,4
	, GetDate() -- [DateReceived]
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
	,[ABN]
	,[WebAddress]
	,[Amount]
	,[Address]
	,[Suburb]
	,[State]
	,[PostCode]
	,[PostalSame]
	,[PostalAddress]
	,[PostalSuburb]
	,[PostalState]
	,[PostalPostCode]
	,[PrincipalConsultant]
	,[IndigenousExperience]
	,[IndigenousExperienceDetail]
	,[IsIndigenousBusiness]
	,[IsRegisteredWithSupplyNation]
	)
VALUES (
	101
	,N'Company one'
	,NULL
	,1
	,0
	,N'48123123101'
	,N'http://www.companyone.com'
	,1234567890
	,N'Main Road'
	,N'Brisbane City'
	,N'QLD'
	,N'4000'
	,1
	,N'Main Road'
	,N'Brisbane City'
	,N'QLD'
	,N'4000'
	,1 -- [PrincipalConsultant]	
	,1
	,N'Indigenous experience details'
	,1
	,1 -- Business is registered/certified with Supply Nation
	)
	,(
	102
	,N'Company two'
	,NULL
	,1
	,0
	,N'48123123102'
	,N'http://www.companytwo.com'
	,1234567890
	,N'2nd Road'
	,N'Brisbane City'
	,N'QLD'
	,N'4002'
	,1
	,N'3rd Road'
	,N'Brisbane City'
	,N'QLD'
	,N'4003'
	,1
	,0
	,NULL
	,1
	,0 -- Others
	)
	,(
	103
	,N'Company one - branch one'
	,101
	,1
	,0
	,N'48123123103'
	,N'http://www.companyone.com'
	,1234567890
	,N'4th Road'
	,N'Brisbane City'
	,N'QLD'
	,N'4004'
	,1
	,N'Main Road'
	,N'Brisbane City'
	,N'QLD'
	,N'4000'
	,0
	,0
	,NULL
	,0
	,NULL -- for Business is registered/certified with Supply Nation
	)
	,(
	104
	,N'Company one - branch two'
	,101
	,1
	,0
	,N'48123123104'
	,N'http://www.companyone.com'
	,1234567890
	,N'Main Road'
	,N'Brisbane City'
	,N'QLD'
	,N'4000'
	,1
	,N'Main Road'
	,N'Brisbane City'
	,N'QLD'
	,N'4000'
	,0
	,0
	,NULL
	,0
	,NULL -- for Business is registered/certified with Supply Nation
	)
GO

SET IDENTITY_INSERT [online].[Company] OFF
GO

SET IDENTITY_INSERT [online].[Contact] ON
GO

INSERT INTO [online].[Contact] (
	[ContactID]
	,[FirstName]
	,[Surname]
	,[Position]
	,[Email]
	,[ContactPhone]
	,[Mobile]
	,[Significant]
	,[CompanyID]
	,[Active]
	,[Deactivated]
	)
VALUES (
	10001
	,N'One'
	,N'First'
	,N'one position'
	,N'one.first@mail.com'
	,N'1234567890'
	,N'041234567890'
	,1
	,101
	,1
	,0
	)
	,(
	10002
	,N'Two'
	,N'Second'
	,N'two position'
	,N'two.second@mail.com'
	,N'2234567890'
	,N'042234567890'
	,0
	,101
	,1
	,0
	);

-- individual
INSERT INTO [online].[Contact] (
	[ContactID]
	,[FirstName]
	,[Surname]
	,[Position]
	,[Active]
	,[Deactivated]
	)
VALUES (
	10003
	,N'firstname-11'
	,N'surname-11'
	,N'position - 11'
	,1
	,0
	)
	,(
	10004
	,N'firstname-12'
	,N'surname-12'
	,N'position - 12'
	,1
	,0
	)

SET IDENTITY_INSERT [online].[Contact] OFF
GO

INSERT INTO [online].[ContactCompany] (
	[ContactID]
	,[CompanyID]
	)
VALUES (
	10001
	,101
	)
	,(
	10003
	,101
	)
	,(
	10004
	,101
	)
	,(
	10002
	,102
	)
	,(
	1003
	,103
	)
	,(
	1004
	,104
	);
GO

SELECT *
FROM [online].[ContactCompany];

-- minimum requirements
INSERT INTO [online].[CompanyQuestion] (
	[CompanyID]
	,[Response]
	,[QuestionID]
	,[TemplateID]
	)
VALUES (
	101
	,1
	,251
	,4
	)
	,(
	101
	,1
	,252
	,4
	)
	,(
	101
	,1
	,253
	,4
	)
	,(
	101
	,1
	,254
	,4
	)
GO

-- requirements under the ethical supplier threshold
INSERT INTO [online].[CompanyQuestion] (
	[CompanyID]
	,[Response]
	,[QuestionID]
	,[TemplateID]
	)
VALUES (
	101
	,0
	,256
	,4
	)
	,(
	101
	,0
	,257
	,4
	)
	,(
	101
	,0
	,258
	,4
	)
	,(
	101
	,0
	,258
	,4
	)
	,(
	101
	,0
	,259
	,4
	)
	,(
	101
	,0
	,260
	,4
	)
	,(
	101
	,0
	,261
	,4
	)
	,(
	101
	,0
	,262
	,4
	)
	,(
	101
	,0
	,263
	,4
	)
GO

-- propriety
INSERT INTO [online].[CompanyPropriety] (
	[Response]
	,[QuestionID]
	,[CompanyID]
	,[TemplateID]
	,[Details]
	,[ContactName]
	)
VALUES (
	0
	,20
	,101
	,4
	,NULL
	,NULL
	)
	,(
	1
	,21
	,101
	,4
	,N'details'
	,N'contact name'
	)
	,(
	1
	,24
	,101
	,4
	,N'details'
	,N'contact name'
	)
	,(
	1
	,25
	,101
	,4
	,N'details'
	,N'contact name'
	)
	,(
	1
	,26
	,101
	,4
	,N'details'
	,N'contact name'
	)
GO

-- compliance
INSERT INTO [online].[CompanyCompliance] (
	--INSERT INTO [online].[CompanyComplicance] (
	[Response]
	,[QuestionID]
	,[CompanyID]
	,[TemplateID]
	,[Details]
	,[ContactName]
	)
VALUES (
	1
	,267
	,101
	,4
	,NULL
	,NULL
	)
	,(
	1
	,268
	,101
	,4
	,N'details'
	,N'contact name'
	)
	,(
	1
	,269
	,101
	,4
	,N'details'
	,N'contact name'
	)
	,(
	1
	,270
	,101
	,4
	,N'details'
	,N'contact name'
	)
	,(
	1
	,271
	,101
	,4
	,N'details'
	,N'contact name'
	);

SELECT *
FROM [online].[CompanyPropriety];

-- self assessment
INSERT INTO [online].[CompanyQuestion] (
	[CompanyID]
	,[Response]
	,[QuestionID]
	,[TemplateID]
	)
VALUES (
	101
	,1
	,11
	,4
	)
	,(
	101
	,1
	,12
	,4
	)
	,(
	101
	,1
	,13
	,4
	)
	,(
	101
	,1
	,14
	,4
	)
	,(
	101
	,1
	,15
	,4
	)
	,(
	101
	,1
	,16
	,4
	)
	,(
	101
	,1
	,17
	,4
	)
	,(
	101
	,1
	,18
	,4
	)
	,(
	101
	,1
	,19
	,4
	)
	,(
	101
	,1
	,30
	,4
	)
	,(
	101
	,1
	,31
	,4
	)
	,(
	101
	,1
	,32
	,4
	)
	,(
	101
	,1
	,33
	,4
	);
GO

-- PART 2
INSERT INTO [online].[CompanyQuestion] (
	[CompanyID]
	,[Response]
	,[QuestionID]
	,[TemplateID]
	)
VALUES (
	101
	,1
	,34
	,4
	)
	,(
	101
	,1
	,35
	,4
	)
	,(
	101
	,1
	,36
	,4
	)
	,(
	101
	,1
	,37
	,4
	)
	,(
	101
	,1
	,39
	,4
	)
	,(
	101
	,1
	,40
	,4
	)
	,(
	101
	,1
	,41
	,4
	);
GO

SELECT *
FROM [online].[CompanyQuestion];
GO

INSERT INTO [online].[CompanyRegion] (
	[RegionID]
	,[Mainland]
	,[CompanyID]
	,[TemplateID]
	)
VALUES (
	13
	,1
	,101
	,4
	)
	,(
	14
	,1
	,101
	,4
	)
	,(
	15
	,1
	,101
	,4
	)
	,(
	16
	,1
	,101
	,4
	)
	,(
	17
	,1
	,101
	,4
	)
	,(
	18
	,1
	,101
	,4
	)
	,(
	19
	,1
	,101
	,4
	)
	,(
	20
	,1
	,101
	,4
	)
	,(
	21
	,1
	,101
	,4
	)
	,(
	22
	,1
	,101
	,4
	)
	,(
	23
	,1
	,101
	,4
	)
	,(
	24
	,1
	,101
	,4
	);

SELECT *
FROM [online].[CompanyRegion];
GO

-- Human resources
---- number of employees [dbo].[CompanyWorkers]
INSERT INTO [online].[CompanyWorkers] (
	[CompanyID]
	,[NoOfWorkers]
	)
VALUES (
	101
	,101
	);

SELECT *
FROM [online].[CompanyWorkers];
GO

-- [online].[CompanyManSystem]
INSERT INTO [online].[CompanyManSystem] (
	[ItemID]
	,[CompanyID]
	,[TemplateID]
	)
VALUES (
	4 -- AS/NZS ISO 9001
	,101
	,4
	)
	,(
	531 -- AS/NZS ISO 14001
	,101
	,4
	)
	,(
	405 -- none
	,102
	,4
	)
	,(
	406 -- none
	,102
	,4
	)
GO

SELECT *
FROM [online].[CompanyManSystem];
GO

-- [online].[CompanyItem]
INSERT INTO [online].[CompanyItem] (
	[CompanyID]
	,[ItemID]
	,[TemplateID]
	)
VALUES (
	101
	,8
	,4
	)
	,(
	101
	,9
	,4
	)
	,(
	101
	,10
	,4
	);
GO

SELECT *
FROM [online].[CompanyItem];
GO

-- [online].[CompanyProjectType]
INSERT INTO [online].[CompanyProjectType] (
	[CompanyID]
	,[ItemID]
	,[TemplateID]
	)
VALUES (
	101
	,14
	,4
	)
	,(
	101
	,13
	,4
	)
	,(
	101
	,16
	,4
	)
	,(
	101
	,20
	,4
	)
	,(
	101
	,528
	,4
	)
	,(
	101
	,530
	,4
	)
	,(
	101
	,529
	,4
	)
	,(
	101
	,527
	,4
	)
	,(
	101
	,15
	,4
	)
	,(
	101
	,526
	,4
	)
	,(
	101
	,18
	,4
	)
	,(
	101
	,17
	,4
	)
	,(
	101
	,19
	,4
	)
	,(
	101
	,460
	,4
	)
	,(
	101
	,32
	,4
	)
	,(
	101
	,36
	,4
	)
	,(
	101
	,35
	,4
	)
	,(
	101
	,66
	,4
	)
	,(
	101
	,592
	,4
	)
	,(
	101
	,33
	,4
	)
	,(
	101
	,65
	,4
	)
	,(
	101
	,31
	,4
	)
	,(
	101
	,461
	,4
	)
	,(
	101
	,67
	,4
	)
	,(
	101
	,591
	,4
	)
	,(
	101
	,34
	,4
	)
	,(
	101
	,84
	,4
	)
	,(
	101
	,43
	,4
	)
	,(
	101
	,85
	,4
	)
	,(
	101
	,45
	,4
	)
	,(
	101
	,86
	,4
	)
	,(
	101
	,44
	,4
	)
	,(
	101
	,87
	,4
	)
	,(
	101
	,593
	,4
	)
	,(
	101
	,520
	,4
	)
	,(
	101
	,521
	,4
	)
	,(
	101
	,523
	,4
	)
	,(
	101
	,524
	,4
	)
	,(
	101
	,522
	,4
	)
	,(
	101
	,525
	,4
	)
	,(
	101
	,52
	,4
	)
	,(
	101
	,53
	,4
	)
	,(
	101
	,54
	,4
	)
	,(
	101
	,55
	,4
	)
	,(
	101
	,89
	,4
	)
	,(
	101
	,56
	,4
	)
	,(
	101
	,59
	,4
	)
	,(
	101
	,57
	,4
	)
	,(
	101
	,73
	,4
	)
	,(
	101
	,72
	,4
	)
	,(
	101
	,74
	,4
	)
	,(
	101
	,58
	,4
	)
	,(
	101
	,60
	,4
	)
	,(
	101
	,62
	,4
	)
	,(
	101
	,463
	,4
	)
	,(
	101
	,64
	,4
	)
	,(
	101
	,462
	,4
	)
	,(
	101
	,61
	,4
	)
	,(
	101
	,69
	,4
	)
	,(
	101
	,63
	,4
	)
	,(
	101
	,68
	,4
	)
GO

SELECT *
FROM [online].[CompanyProjectType];
GO

INSERT INTO [online].[CompanyService] (
	[CompanyID]
	,[ItemID]
	,[Licence]
	,[TemplateID]
	,[LicenceDescription]
	)
VALUES (
	101
	,536
	,101536
	,4
	,N'LicenceDescription 536'
	)
	,(
	101
	,535
	,101535
	,4
	,N'LicenceDescription 535'
	)
	,(
	101
	,534
	,101534
	,4
	,N'LicenceDescription 534'
	)
	,(
	101
	,546
	,101546
	,4
	,N'LicenceDescription 546'
	)
	,(
	101
	,519
	,101519
	,4
	,N'LicenceDescription 519'
	)
	,(
	101
	,538
	,101538
	,4
	,N'LicenceDescription 538'
	)
	,(
	101
	,537
	,101537
	,4
	,N'LicenceDescription 537'
	)
	,(
	101
	,150
	,101150
	,4
	,N'LicenceDescription 150'
	)
	,(
	101
	,151
	,101151
	,4
	,N'LicenceDescription 151'
	)
	,(
	101
	,152
	,101152
	,4
	,N'LicenceDescription 152'
	)
	,(
	101
	,546
	,101546
	,4
	,N'LicenceDescription 546'
	)
	,(
	101
	,519
	,101519
	,4
	,N'LicenceDescription 519'
	)
	,(
	101
	,538
	,101538
	,4
	,N'LicenceDescription 538'
	)
	,(
	101
	,537
	,101537
	,4
	,N'LicenceDescription 537'
	)
	,(
	101
	,118
	,101118
	,4
	,N'LicenceDescription 118'
	)
	,(
	101
	,119
	,101119
	,4
	,N'LicenceDescription 119'
	)
	,(
	101
	,120
	,101120
	,4
	,N'LicenceDescription 120'
	)
	,(
	101
	,121
	,101121
	,4
	,N'LicenceDescription 121'
	)
	,(
	101
	,125
	,101125
	,4
	,N'LicenceDescription 125'
	)
	,(
	101
	,126
	,101126
	,4
	,N'LicenceDescription 126'
	)
	,(
	101
	,127
	,101127
	,4
	,N'LicenceDescription 127'
	)
	,(
	101
	,128
	,101128
	,4
	,N'LicenceDescription 128'
	)
	,(
	101
	,129
	,101129
	,4
	,N'LicenceDescription 129'
	)
	,(
	101
	,130
	,101130
	,4
	,N'LicenceDescription 130'
	)
	,(
	101
	,131
	,101131
	,4
	,N'LicenceDescription 131'
	)
	,(
	101
	,132
	,101132
	,4
	,N'LicenceDescription 132'
	)
	,(
	101
	,133
	,101133
	,4
	,N'LicenceDescription 133'
	)
	,(
	101
	,134
	,101134
	,4
	,N'LicenceDescription 134'
	)
	,(
	101
	,136
	,101136
	,4
	,N'LicenceDescription 136'
	)
	,(
	101
	,137
	,101137
	,4
	,N'LicenceDescription 137'
	)
	,(
	101
	,138
	,101138
	,4
	,N'LicenceDescription 138'
	)
	,(
	101
	,139
	,101139
	,4
	,N'LicenceDescription 139'
	)
	,(
	101
	,140
	,101140
	,4
	,N'LicenceDescription 140'
	)
	,(
	101
	,141
	,101141
	,4
	,N'LicenceDescription 141'
	)
	,(
	101
	,142
	,101142
	,4
	,N'LicenceDescription 142'
	)
	,(
	101
	,143
	,101143
	,4
	,N'LicenceDescription 143'
	)
	,(
	101
	,145
	,101145
	,4
	,N'LicenceDescription 145'
	)
	,(
	101
	,146
	,101146
	,4
	,N'LicenceDescription 146'
	)
	,(
	101
	,148
	,101148
	,4
	,N'LicenceDescription 148'
	)
	,(
	101
	,149
	,101149
	,4
	,N'LicenceDescription 149'
	)
	,(
	101
	,587
	,101587
	,4
	,N'LicenceDescription 587'
	)
GO

SELECT *
FROM [online].[CompanyService];
GO

INSERT INTO [online].[CompanyProject] (
	[ProjectName]
	,[RegionID]
	,[CommenceDate]
	,[CompleteDate]
	,[ProjectValue]
	,[Fee]
	,[RefereeName]
	,[RefereeRole]
	,[RefereePhone]
	,[RefereeFax]
	,[RefereeMobile]
	,[CompanyID]
	,[WorkCategoryID]
	,[ProjectTypeID]
	,[CommissionTypeID]
	,[ServiceID]
	,[Duration]
	,[ProcurementMethod]
	,[OtherDetails]
	,[RefereeEmail]
	,[FeeInPercentage]
	)
VALUES (
	N'Project Name'
	,13 -- [RegionID] [Location]
	,N'2021-05-21' -- [CommenceDate]
	,N'2021-05-22' -- [CompleteDate]
	,1234567890 -- [ProjectValue] 
	,1234567 --[Fee]
	,N'Referee Name' -- [RefereeName]
	,N'Referee Role' -- [RefereeRole]
	,N'0412345678' -- [RefereePhone] (Preferred phone)
	,NULL -- [RefereeFax]
	,NULL -- [RefereeMobile]
	,101 -- [CompanyID]
	,8 -- [WorkCategoryID]
	,14 -- [ProjectTypeID] High rise (over three storeys)
	,2 -- [CommissionTypeID]
	,21 -- [ServiceID]
	,NULL -- [Duration]
	,NULL -- [ProcurementMethod]
	,N'No other details provided' -- [OtherDetails]
	,N'referee@mail.com'
	,100.0
	);
GO

SELECT *
FROM [online].[CompanyProject];
