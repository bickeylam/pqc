/****** Object:  Table [online].[Company]    Script Date: 17/05/2021 2:20:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [online].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](5000) NOT NULL,
	[TradingName] [varchar](5000) NULL,
	[ShortName] [varchar](100) NULL,
	[StatusID] [int] NULL,
	[PQCNumber] [varchar](50) NULL,
	[CompanyTypeID] [int] NULL,
	[Address] [varchar](200) NULL,
	[Suburb] [varchar](200) NULL,
	[State] [varchar](25) NULL,
	[PostCode] [varchar](4) NULL,
	[PostalSame] [bit] NULL,
	[PostalAddress] [varchar](200) NULL,
	[PostalSuburb] [varchar](200) NULL,
	[PostalState] [varchar](25) NULL,
	[PostalPostCode] [varchar](4) NULL,
	[PQCLevel] [int] NULL,
	[ABN] [varchar](500) NULL,
	[ACN] [varchar](500) NULL,
	[RBN] [varchar](100) NULL,
	[WebAddress] [varchar](100) NULL,
	[WorkplaceNo] [varchar](200) NULL,
	[WorkplaceComment] [varchar](200) NULL,
	[RehabNumber] [varchar](100) NULL,
	[RehabExpiry] [datetime] NULL,
	[CoordinatorName] [varchar](50) NULL,
	[CoordinatorNumber] [varchar](50) NULL,
	[CoordinatorExpiry] [datetime] NULL,
	[Amount] [float] NULL,
	[HeadOfficeID] [int] NULL,
	[RegionID] [int] NULL,
	[WorkersInterstate] [int] NULL,
	[WorkersOverseas] [int] NULL,
	[QleaveNumber] [varchar](50) NULL,
	[QleaveComment] [varchar](2000) NULL,
	[OfficeNumber] [int] NULL,
	[OrganisationTypeID] [int] NULL,
	[StatusCategoryID] [int] NULL,
	[JVCompanyID] [int] NULL,
	[SeekAdvice] [bit] NULL,
	[SanctionID] [int] NULL,
	[SeekSummary] [varchar](2000) NULL,
	[SeekDate] [datetime] NULL,
	[SanctionSummary] [varchar](2000) NULL,
	[SanctionDate] [datetime] NULL,
	[RehabComments] [varchar](2000) NULL,
	[PrincipalConsultant] [bit] NULL,
	[IndigenousExperience] [bit] NULL,
	[Active] [bit] NOT NULL,
	[AgencyID] [int] NULL,
	[ClientManager] [varchar](40) NULL,
	[UsesETender] [bit] NOT NULL,
	[RegisteredOfficeSame] [bit] NULL,
	[RegisteredPostalSame] [bit] NULL,
	[RegisteredOfficeAddress] [varchar](200) NULL,
	[RegisteredOfficeSuburb] [varchar](200) NULL,
	[RegisteredOfficeState] [varchar](25) NULL,
	[RegisteredOfficePostCode] [varchar](4) NULL,
	[PreferredAddress] [int] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO