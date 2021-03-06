/****** Object:  Table [online].[Application]    Script Date: 17/05/2021 2:44:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[Application](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[JVContractID] [int] NULL,
	[StatusID] [int] NOT NULL,
	[EmployContract] [bit] NULL,
	[PQCDeclined] [bit] NULL,
	[OldApplicantName] [varchar](5000) NULL,
	[OldApplicationDate] [datetime] NULL,
	[PQCRegistered] [bit] NULL,
	[TemplateID] [int] NULL,
	[RegistrantName] [varchar](5000) NULL,
	[SelfPQCLevel] [float] NULL,
	[StageNo] [int] NULL,
	[DateReceived] [datetime] NULL,
	[ProjectList] [bit] NULL,
	[AAToLicence] [float] NULL,
	[AAToDate] [datetime] NULL,
	[LicenceRenewal] [datetime] NULL,
	[AAToGovt] [float] NULL,
	[SelfAssessDate] [datetime] NULL,
	[AssessedBy] [int] NULL,
	[MaxProject] [float] NULL,
	[MaxContractValue] [float] NULL,
	[NPSMaxContractValue] [float] NOT NULL,
	[NPSWorkingCapital] [float] NOT NULL,
	[NPSAVG3YearFinancialTurnover] [float] NOT NULL,
	[LiquidRatio] [float] NULL,
	[SpecialFinancial] [bit] NULL,
	[LotusPQCLevel] [int] NULL,
	[LastAssessmentDate] [datetime] NULL,
	[AssessEarmarked] [bit] NULL,
	[AssessComments] [varchar](2000) NULL,
	[PQCApplication] [bit] NULL,
	[ApplicationName] [varchar](5000) NULL,
	[ApplicationDate] [datetime] NULL,
	[JointVenture] [bit] NULL,
	[OutcomeStatus] [varchar](50) NULL,
	[JVInterest] [bit] NULL,
	[OutcomePQCLevel] [int] NULL,
	[RecommendationID] [int] NULL,
	[ApplicationTypeID] [int] NULL,
	[ApprovalTypeID] [int] NULL,
	[LatestApplication] [bit] NOT NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

