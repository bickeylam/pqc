USE [pqc_test]
GO

-- =============================================
-- Author:		billy.lam@epw.qld.gov.au
-- Create date: 18/05/2021
-- Description:	transfer [online].[Application] data to [dbo].[Application] and its associated objects
-- =============================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [online].[xp_create_dbo_application_from_online_applicationonline] @ApplicationOnlineID [int]
AS
BEGIN
	DECLARE @ApplicationID [int]
		,@NewApplicationID [int]
		,@CompanyID [int]
		,@NewCompanyID [int]

	SET NOCOUNT ON;

	---- read [online].[ApplicationOnline] details
	SELECT @ApplicationID = [ApplicationID]
		,@CompanyID = [CompanyID]
	FROM [online].[ApplicationOnline]
	WHERE [ApplicationOnlineID] = @ApplicationOnlineID

	-- create Company record(s) head office and/or branch office
	---- insert into [dbo].[company] for head office
	INSERT INTO [dbo].[Company] (
		[CompanyName]
		,[HeadOfficeID]
		,[Active]
		,[UsesETender]
		)
	SELECT [CompanyName]
		,[HeadOfficeID]
		,[Active]
		,[UsesETender]
	FROM [online].[Company]
	WHERE [online].[Company].[CompanyID] = @CompanyID

	SET @NewCompanyID = @@IDENTITY

	--PRINT @NewCompanyID
	---- insert into [dbo].[company] for branch office
	INSERT INTO [dbo].[Company] (
		[CompanyName]
		,[HeadOfficeID]
		,[Active]
		,[UsesETender]
		)
	SELECT [CompanyName]
		,@NewCompanyID
		,[Active]
		,[UsesETender]
	FROM [online].[Company]
	WHERE [online].[Company].[HeadOfficeID] = @CompanyID

	-- create [dbo].[Application] record
	---- insert selected [online].[Application] to [dbo].[Application]
	INSERT INTO [dbo].[Application] (
		[CompanyID]
		,[StatusID]
		,[NPSMaxContractValue]
		,[NPSWorkingCapital]
		,[NPSAVG3YearFinancialTurnover]
		,[LatestApplication]
		)
	SELECT @NewCompanyID
		,[StatusID]
		,[NPSMaxContractValue]
		,[NPSWorkingCapital]
		,[NPSAVG3YearFinancialTurnover]
		,[LatestApplication]
	FROM [online].[Application]
	WHERE [ApplicationID] = @ApplicationID

	SET @NewApplicationID = @@IDENTITY

	---- update [online].[ApplicationOnline] details
	------ save @NewCompanyID into [online].[ApplicationOnline].[NewCompanyID]
	UPDATE [online].[ApplicationOnline]
	SET [NewCompanyID] = @NewCompanyID
		,[NewApplicationID] = @NewApplicationID
		,[IsTransferred] = 1
	WHERE [online].[ApplicationOnline].[ApplicationOnlineID] = @ApplicationOnlineID
END
GO