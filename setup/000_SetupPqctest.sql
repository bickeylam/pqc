USE [master]
GO

DROP DATABASE IF EXISTS [pqc_test] 
GO

CREATE DATABASE [pqc_test]
GO

USE [pqc_test]
GO

CREATE SCHEMA [online]
GO

------------------------------------------------------------
-- create [dbo].[Application]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Application] (
	[ApplicationID] [int] IDENTITY(1, 1) NOT NULL
	,[CompanyID] [int] NULL
	,[JVContractID] [int] NULL
	,[StatusID] [int] NOT NULL
	,[EmployContract] [bit] NULL
	,[PQCDeclined] [bit] NULL
	,[OldApplicantName] [varchar](5000) NULL
	,[OldApplicationDate] [datetime] NULL
	,[PQCRegistered] [bit] NULL
	,[TemplateID] [int] NULL
	,[RegistrantName] [varchar](5000) NULL
	,[SelfPQCLevel] [float] NULL
	,[StageNo] [int] NULL
	,[DateReceived] [datetime] NULL
	,[ProjectList] [bit] NULL
	,[AAToLicence] [float] NULL
	,[AAToDate] [datetime] NULL
	,[LicenceRenewal] [datetime] NULL
	,[AAToGovt] [float] NULL
	,[SelfAssessDate] [datetime] NULL
	,[AssessedBy] [int] NULL
	,[MaxProject] [float] NULL
	,[MaxContractValue] [float] NULL
	,[NPSMaxContractValue] [float] NOT NULL
	,[NPSWorkingCapital] [float] NOT NULL
	,[NPSAVG3YearFinancialTurnover] [float] NOT NULL
	,[LiquidRatio] [float] NULL
	,[SpecialFinancial] [bit] NULL
	,[LotusPQCLevel] [int] NULL
	,[LastAssessmentDate] [datetime] NULL
	,[AssessEarmarked] [bit] NULL
	,[AssessComments] [varchar](2000) NULL
	,[PQCApplication] [bit] NULL
	,[ApplicationName] [varchar](5000) NULL
	,[ApplicationDate] [datetime] NULL
	,[JointVenture] [bit] NULL
	,[OutcomeStatus] [varchar](50) NULL
	,[JVInterest] [bit] NULL
	,[OutcomePQCLevel] [int] NULL
	,[RecommendationID] [int] NULL
	,[ApplicationTypeID] [int] NULL
	,[ApprovalTypeID] [int] NULL
	,[LatestApplication] [bit] NOT NULL
	,CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED ([ApplicationID] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		,FILLFACTOR = 90
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

------------------------------------------------------------
-- create [dbo].[Company]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Company] (
	[CompanyID] [int] IDENTITY(1, 1) NOT NULL
	,[CompanyName] [varchar](5000) NOT NULL
	,[TradingName] [varchar](5000) NULL
	,[ShortName] [varchar](100) NULL
	,[StatusID] [int] NULL
	,[PQCNumber] [varchar](50) NULL
	,[CompanyTypeID] [int] NULL
	,[Address] [varchar](200) NULL
	,[Suburb] [varchar](200) NULL
	,[State] [varchar](25) NULL
	,[PostCode] [varchar](4) NULL
	,[PostalSame] [bit] NULL
	,[PostalAddress] [varchar](200) NULL
	,[PostalSuburb] [varchar](200) NULL
	,[PostalState] [varchar](25) NULL
	,[PostalPostCode] [varchar](4) NULL
	,[PQCLevel] [int] NULL
	,[ABN] [varchar](500) NULL
	,[ACN] [varchar](500) NULL
	,[RBN] [varchar](100) NULL
	,[WebAddress] [varchar](100) NULL
	,[WorkplaceNo] [varchar](200) NULL
	,[WorkplaceComment] [varchar](200) NULL
	,[RehabNumber] [varchar](100) NULL
	,[RehabExpiry] [datetime] NULL
	,[CoordinatorName] [varchar](50) NULL
	,[CoordinatorNumber] [varchar](50) NULL
	,[CoordinatorExpiry] [datetime] NULL
	,[Amount] [float] NULL
	,[HeadOfficeID] [int] NULL
	,[RegionID] [int] NULL
	,[WorkersInterstate] [int] NULL
	,[WorkersOverseas] [int] NULL
	,[QleaveNumber] [varchar](50) NULL
	,[QleaveComment] [varchar](2000) NULL
	,[OfficeNumber] [int] NULL
	,[OrganisationTypeID] [int] NULL
	,[StatusCategoryID] [int] NULL
	,[JVCompanyID] [int] NULL
	,[SeekAdvice] [bit] NULL
	,[SanctionID] [int] NULL
	,[SeekSummary] [varchar](2000) NULL
	,[SeekDate] [datetime] NULL
	,[SanctionSummary] [varchar](2000) NULL
	,[SanctionDate] [datetime] NULL
	,[RehabComments] [varchar](2000) NULL
	,[PrincipalConsultant] [bit] NULL
	,[IndigenousExperience] [bit] NULL
	,[Active] [bit] NOT NULL
	,[AgencyID] [int] NULL
	,[ClientManager] [varchar](40) NULL
	,[UsesETender] [bit] NOT NULL
	,[RegisteredOfficeSame] [bit] NULL
	,[RegisteredPostalSame] [bit] NULL
	,[RegisteredOfficeAddress] [varchar](200) NULL
	,[RegisteredOfficeSuburb] [varchar](200) NULL
	,[RegisteredOfficeState] [varchar](25) NULL
	,[RegisteredOfficePostCode] [varchar](4) NULL
	,[PreferredAddress] [int] NULL
	,CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([CompanyID] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		,FILLFACTOR = 90
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

------------------------------------------------------------
-- create [online].[ApplicationOnline]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[ApplicationOnline] (
	[ApplicationOnlineID] [int] identity(1, 1)
	,[ReferenceCode] [uniqueidentifier] NULL
	,[ApplicationID] [int] NULL
	,[NewApplicationID] [int] NULL
	,[CompanyID] [int] NULL
	,[NewCompanyID] [int] NULL
	,[CreatedAt] [datetime] DEFAULT(GetDate())
	,[SubmittedAt] [datetime] NULL
	,[IsTransferred] [bit] DEFAULT(0) CONSTRAINT [PK_ApplicationOnline] PRIMARY KEY CLUSTERED ([ApplicationOnlineID] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

------------------------------------------------------------
-- create [online].[Application]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[Application] (
	[ApplicationID] [int] IDENTITY(1, 1) NOT NULL
	,[CompanyID] [int] NULL
	,[JVContractID] [int] NULL
	,[StatusID] [int] NOT NULL
	,[EmployContract] [bit] NULL
	,[PQCDeclined] [bit] NULL
	,[OldApplicantName] [varchar](5000) NULL
	,[OldApplicationDate] [datetime] NULL
	,[PQCRegistered] [bit] NULL
	,[TemplateID] [int] NULL
	,[RegistrantName] [varchar](5000) NULL
	,[SelfPQCLevel] [float] NULL
	,[StageNo] [int] NULL
	,[DateReceived] [datetime] NULL
	,[ProjectList] [bit] NULL
	,[AAToLicence] [float] NULL
	,[AAToDate] [datetime] NULL
	,[LicenceRenewal] [datetime] NULL
	,[AAToGovt] [float] NULL
	,[SelfAssessDate] [datetime] NULL
	,[AssessedBy] [int] NULL
	,[MaxProject] [float] NULL
	,[MaxContractValue] [float] NULL
	,[NPSMaxContractValue] [float] NOT NULL
	,[NPSWorkingCapital] [float] NOT NULL
	,[NPSAVG3YearFinancialTurnover] [float] NOT NULL
	,[LiquidRatio] [float] NULL
	,[SpecialFinancial] [bit] NULL
	,[LotusPQCLevel] [int] NULL
	,[LastAssessmentDate] [datetime] NULL
	,[AssessEarmarked] [bit] NULL
	,[AssessComments] [varchar](2000) NULL
	,[PQCApplication] [bit] NULL
	,[ApplicationName] [varchar](5000) NULL
	,[ApplicationDate] [datetime] NULL
	,[JointVenture] [bit] NULL
	,[OutcomeStatus] [varchar](50) NULL
	,[JVInterest] [bit] NULL
	,[OutcomePQCLevel] [int] NULL
	,[RecommendationID] [int] NULL
	,[ApplicationTypeID] [int] NULL
	,[ApprovalTypeID] [int] NULL
	,[LatestApplication] [bit] NOT NULL
	,CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED ([ApplicationID] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		,FILLFACTOR = 90
		) ON [PRIMARY]
	) ON [PRIMARY]
GO

------------------------------------------------------------
-- create [online].[Company]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[Company] (
	[CompanyID] [int] IDENTITY(1, 1) NOT NULL
	,[CompanyName] [varchar](5000) NOT NULL
	,[TradingName] [varchar](5000) NULL
	,[ShortName] [varchar](100) NULL
	,[StatusID] [int] NULL
	,[PQCNumber] [varchar](50) NULL
	,[CompanyTypeID] [int] NULL
	,[Address] [varchar](200) NULL
	,[Suburb] [varchar](200) NULL
	,[State] [varchar](25) NULL
	,[PostCode] [varchar](4) NULL
	,[PostalSame] [bit] NULL
	,[PostalAddress] [varchar](200) NULL
	,[PostalSuburb] [varchar](200) NULL
	,[PostalState] [varchar](25) NULL
	,[PostalPostCode] [varchar](4) NULL
	,[PQCLevel] [int] NULL
	,[ABN] [varchar](500) NULL
	,[ACN] [varchar](500) NULL
	,[RBN] [varchar](100) NULL
	,[WebAddress] [varchar](100) NULL
	,[WorkplaceNo] [varchar](200) NULL
	,[WorkplaceComment] [varchar](200) NULL
	,[RehabNumber] [varchar](100) NULL
	,[RehabExpiry] [datetime] NULL
	,[CoordinatorName] [varchar](50) NULL
	,[CoordinatorNumber] [varchar](50) NULL
	,[CoordinatorExpiry] [datetime] NULL
	,[Amount] [float] NULL
	,[HeadOfficeID] [int] NULL
	,[RegionID] [int] NULL
	,[WorkersInterstate] [int] NULL
	,[WorkersOverseas] [int] NULL
	,[QleaveNumber] [varchar](50) NULL
	,[QleaveComment] [varchar](2000) NULL
	,[OfficeNumber] [int] NULL
	,[OrganisationTypeID] [int] NULL
	,[StatusCategoryID] [int] NULL
	,[JVCompanyID] [int] NULL
	,[SeekAdvice] [bit] NULL
	,[SanctionID] [int] NULL
	,[SeekSummary] [varchar](2000) NULL
	,[SeekDate] [datetime] NULL
	,[SanctionSummary] [varchar](2000) NULL
	,[SanctionDate] [datetime] NULL
	,[RehabComments] [varchar](2000) NULL
	,[PrincipalConsultant] [bit] NULL
	,[IndigenousExperience] [bit] NULL
	,[Active] [bit] NOT NULL
	,[AgencyID] [int] NULL
	,[ClientManager] [varchar](40) NULL
	,[UsesETender] [bit] NOT NULL
	,[RegisteredOfficeSame] [bit] NULL
	,[RegisteredPostalSame] [bit] NULL
	,[RegisteredOfficeAddress] [varchar](200) NULL
	,[RegisteredOfficeSuburb] [varchar](200) NULL
	,[RegisteredOfficeState] [varchar](25) NULL
	,[RegisteredOfficePostCode] [varchar](4) NULL
	,[PreferredAddress] [int] NULL
	,CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([CompanyID] ASC) WITH (
		PAD_INDEX = OFF
		,STATISTICS_NORECOMPUTE = OFF
		,IGNORE_DUP_KEY = OFF
		,ALLOW_ROW_LOCKS = ON
		,ALLOW_PAGE_LOCKS = ON
		,FILLFACTOR = 90
		) ON [PRIMARY]
	) ON [PRIMARY]
GO


