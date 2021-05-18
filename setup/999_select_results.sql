USE [pqc_test]
GO

SELECT *
FROM [dbo].[Application]
;

SELECT *
FROM [pqc_test].[online].[Application]
;

SELECT * 
FROM [dbo].[Company];

SELECT *
FROM [online].[Company]
;

SELECT *
FROM [online].[ApplicationOnline]
;

EXECUTE [online].[xp_create_dbo_application_from_online_applicationonline] @ApplicationOnlineID = 1
EXECUTE [online].[xp_create_dbo_application_from_online_applicationonline] @ApplicationOnlineID = 2
