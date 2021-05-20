USE [pqc_test]
GO

SELECT *
FROM [pqc_test].[online].[Application]
;

SELECT *
FROM [online].[Company]
;

SELECT * FROM [online].[Contact];
select * from [online].[ContactCompany];

SELECT * FROM [online].[CompanyQuestion];
SELECT * FROM [online].[CompanyPropriety];

SELECT *
FROM [online].[ApplicationOnline]
;

EXECUTE [online].[xp_transfer_online_application_to_dbo_application] @ApplicationOnlineID = 1
EXECUTE [online].[xp_transfer_online_application_to_dbo_application] @ApplicationOnlineID = 2
--;

SELECT *
FROM [dbo].[Application]
;

SELECT *
FROM [online].[ApplicationOnline]
;
