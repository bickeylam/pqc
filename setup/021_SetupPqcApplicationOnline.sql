USE [master]
go

CREATE DATABASE [pqc_test]
GO

USE [pqc_test]
GO

CREATE SCHEMA [online]
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
	,[IsSaved] [bit] DEFAULT(0)
	,[SubmittedAt] [datetime] NULL
	,[IsCancelled] [bit] DEFAULT(0)
	,[IsExpired] [bit] DEFAULT(0)
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

------------------------------------------------------------
-- create [online].[Contact]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactTypeID] [int] NULL,
	[TitleID] [int] NULL,
	[FirstName] [varchar](100) NULL,
	[Initial] [char](1) NULL,
	[PreferredName] [varchar](100) NULL,
	[Surname] [varchar](100) NULL,
	[Position] [varchar](100) NULL,
	[Email] [varchar](200) NULL,
	[ContactPhone] [varchar](50) NULL,
	[ContactFax] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[ContactMethod] [varchar](50) NULL,
	[PreferredContact] [bit] NULL,
	[PQCDefault] [bit] NULL,
	[Significant] [bit] NULL,
	[Password] [varchar](50) NULL,
	[Salt] [varchar](50) NULL,
	[CompanyID] [int] NULL,
	[ChangePassword] [bit] NULL,
	[PasswordDate] [datetime] NULL,
	[NoOfAttempts] [int] NULL,
	[Active] [bit] NOT NULL,
	[Deactivated] [bit] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

------------------------------------------------------------
-- create [online].[ContactCompany]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[ContactCompany](
	[ContactCompanyID] [int] IDENTITY(1,1) NOT NULL,
	[ContactID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
 CONSTRAINT [PK_ContactCompany] PRIMARY KEY CLUSTERED 
(
	[ContactCompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

------------------------------------------------------------
-- create [online].[ContactPassword]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[ContactPassword](
	[ContactPasswordID] [int] IDENTITY(1,1) NOT NULL,
	[ContactID] [int] NULL,
	[Password] [varchar](50) NULL,
	[Salt] [varchar](50) NULL,
	[PasswordDate] [datetime] NULL,
 CONSTRAINT [PK_ContactPassword] PRIMARY KEY CLUSTERED 
(
	[ContactPasswordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

------------------------------------------------------------
-- create [online].[CompanyWorkers]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[CompanyWorkers](
	[CompanyWorkersID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[HRCategoryID] [int] NULL,
	[NoOfWorkers] [float] NULL,
	[Details] [varchar](200) NULL,
 CONSTRAINT [PK_CompanyWorkers] PRIMARY KEY CLUSTERED 
(
	[CompanyWorkersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

------------------------------------------------------------
-- create [online].[CompanyManSystem]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[CompanyManSystem](
	[CompanyManSystemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NULL,
	[CompanyID] [int] NULL,
	[ManSystemStatus] [int] NULL,
	[Exclusions] [varchar](500) NULL,
	[Comments] [varchar](500) NULL,
	[ExpiryDate] [datetime] NULL,
	[TemplateID] [int] NULL,
	[ManVersionID] [int] NULL,
 CONSTRAINT [PK_CompanyManSystem] PRIMARY KEY CLUSTERED 
(
	[CompanyManSystemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

------------------------------------------------------------
-- create [online].[CompanyQuestion]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[CompanyQuestion](
	[CompanyQuestionID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Response] [varchar](100) NULL,
	[QuestionID] [int] NULL,
	[TemplateID] [int] NULL,
 CONSTRAINT [PK_CompanyQuestion] PRIMARY KEY CLUSTERED 
(
	[CompanyQuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

------------------------------------------------------------
-- create [online].[CompanyItem]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[CompanyItem](
	[CompanyItemID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[ItemID] [int] NULL,
	[TemplateID] [int] NULL,
 CONSTRAINT [PK_CompanyItem] PRIMARY KEY CLUSTERED 
(
	[CompanyItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

------------------------------------------------------------
-- create [online].[CompanyPropriety]
------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[CompanyPropriety](
	[CompanyProprietryID] [int] IDENTITY(1,1) NOT NULL,
	[ContactID] [int] NULL,
	[Response] [varchar](100) NULL,
	[Details] [varchar](250) NULL,
	[QuestionID] [int] NULL,
	[CompanyID] [int] NULL,
	[TemplateID] [int] NULL,
	[ContactName] [varchar](100) NULL
 CONSTRAINT [PK_CompanyProprietry] PRIMARY KEY CLUSTERED 
(
	[CompanyProprietryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
