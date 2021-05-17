SELECT [online].[ApplicationOnline].*,
    [online].[Company].[Name] AS [CompanyName]
FROM [online].[ApplicationOnline]
    LEFT JOIN [online].[Company] ON [online].[Company].[CompanyID] = [online].[ApplicationOnline].[CompanyID];
SELECT *
FROM [online].[ApplicationOnline];
SELECT *
FROM [dbo].[Company];
SELECT *
FROM [online].[Company];