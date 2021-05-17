
INSERT INTO [dbo].[Company] ([Name]) VALUES (N'Company first');
INSERT INTO [dbo].[Company] ([Name]) VALUES (N'Company second');
GO

INSERT INTO [online].[Company] ([Name], [HeadOfficeID]) VALUES (N'Company one', NULL);
INSERT INTO [online].[Company] ([Name], [HeadOfficeID]) VALUES (N'Company two', NULL);
GO

INSERT INTO [online].[ApplicationOnline] ([ApplicationOnlineID], [Name], [CompanyID]) VALUES (NEWID(), N'Application one', 1);
INSERT INTO [online].[ApplicationOnline] ([ApplicationOnlineID], [Name], [CompanyID]) VALUES (NEWID(), N'Application two', 2);
GO