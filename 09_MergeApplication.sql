SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
DROP PROCEDURE IF EXISTS [online].[xp_applicationonline_to_application];
GO 
CREATE PROCEDURE [online].[xp_applicationonline_to_application] @ApplicationID [uniqueidentifier], @CompanyID [int]
AS BEGIN 	
	SET NOCOUNT ON;
	
	INSERT INTO [dbo].[Company] ([Name]) 
	(
		SELECT [Name]
		FROM [online].[Company]
		WHERE [online].[Company].[CompanyID] = @CompanyID
	)
	
	DECLARE	@HeadOfficeID [INT] = @@IDENTITY
	PRINT @HeadOfficeID
	
	INSERT INTO [dbo].[Company] ([Name], [HeadOfficeID])
	(
		SELECT [Name], @HeadOfficeID
		FROM [online].[Company]
		WHERE [online].[Company].[HeadOfficeID] = @CompanyID
	)
END
GO