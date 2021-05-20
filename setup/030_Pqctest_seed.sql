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
	,[NewCompanyID]
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
	)
;
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

INSERT INTO [online].[ContactCompany]
(
	[ContactID], 
	[CompanyID]
)
VALUES
(
	10001,
	101
),
(
	10003,
	101
),
(
	10004,
	101
),
(
	10002,
	102
),
(
	1003,
	103
),
(
	1004,
	104
)
;
go

select * from [online].[ContactCompany];

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

SELECT *
FROM [online].[CompanyPropriety];
GO

-- compliance
INSERT INTO [online].[CompanyPropriety] (
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

