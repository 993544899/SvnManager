GO
CREATE TABLE [dbo].[System_Account] (
[UserName] varchar(255) NOT NULL ,
[Password] varchar(255) NULL ,
[ID] varchar(36) NOT NULL DEFAULT (newid()) ,
[IsDomainAccount] int NOT NULL DEFAULT ((1)) ,
[Description] varchar(255) NULL ,
[IsUse] int NULL ,
[RealName] varchar(255) NULL ,
[Picture] text NULL 
)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'System_Account', 
'COLUMN', N'IsDomainAccount')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�Ƿ����˺�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'System_Account'
, @level2type = 'COLUMN', @level2name = N'IsDomainAccount'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�Ƿ����˺�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'System_Account'
, @level2type = 'COLUMN', @level2name = N'IsDomainAccount'
GO
CREATE TABLE [dbo].[SVN_User] (
[ID] varchar(36) NOT NULL DEFAULT (newid()) ,
[DomainAccount] varchar(255) NOT NULL ,
[RealName] nvarchar(255) NOT NULL ,
[Description] nvarchar(255) NULL ,
[Password] varchar(255) NULL ,
[IsUse] int NULL 
)
GO
ALTER TABLE [dbo].[SVN_User] ADD PRIMARY KEY ([ID])
GO
CREATE TABLE [dbo].[SVN_Project] (
[ID] varchar(36) NOT NULL DEFAULT (newid()) ,
[Name] nvarchar(255) NOT NULL ,
[Url] text NOT NULL ,
[Type] int NOT NULL ,
[Description] varchar(255) NOT NULL ,
[Head] varchar(255) NOT NULL ,
[CreateTime] datetime NOT NULL DEFAULT (getdate()) ,
[City] nvarchar(255) NOT NULL ,
[ParentID] varchar(36) NULL ,
[UserID] varchar(36) NULL DEFAULT ('30A102FA-7885-4C1B-BC97-2A45A7D2589A') ,
[IsUse] int NOT NULL DEFAULT ((0)) ,
[Creator] varchar(255) NULL 
)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SVN_Project', 
'COLUMN', N'Type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'1Դ���룬2��Ʒ�ĵ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SVN_Project'
, @level2type = 'COLUMN', @level2name = N'Type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'1Դ���룬2��Ʒ�ĵ�'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SVN_Project'
, @level2type = 'COLUMN', @level2name = N'Type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SVN_Project', 
'COLUMN', N'UserID')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ʹ���ĸ�svn�˺Ż�ȡ��־������˺���Ҫ������'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SVN_Project'
, @level2type = 'COLUMN', @level2name = N'UserID'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ʹ���ĸ�svn�˺Ż�ȡ��־������˺���Ҫ������'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SVN_Project'
, @level2type = 'COLUMN', @level2name = N'UserID'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'SVN_Project', 
'COLUMN', N'IsUse')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'�Ƿ�ʹ�ã�1ʹ�ã�0����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SVN_Project'
, @level2type = 'COLUMN', @level2name = N'IsUse'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'�Ƿ�ʹ�ã�1ʹ�ã�0����'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'SVN_Project'
, @level2type = 'COLUMN', @level2name = N'IsUse'
GO
ALTER TABLE [dbo].[SVN_Project] ADD PRIMARY KEY ([ID])
GO
CREATE TABLE [dbo].[SVN_Log] (
[ProjectID] varchar(36) NOT NULL ,
[UserID] varchar(36) NOT NULL ,
[CreateTime] datetime NOT NULL ,
[Revision] int NOT NULL ,
[Message] text NULL ,
[ID] varchar(36) NOT NULL DEFAULT (newid()) 
)
GO
ALTER TABLE [dbo].[SVN_Log] ADD PRIMARY KEY ([ID])
GO
CREATE TABLE [dbo].[SVN_LogFile] (
[ID] varchar(36) NOT NULL DEFAULT (newid()) ,
[LogID] varchar(36) NOT NULL ,
[Path] text NULL ,
[Action] varchar(20) NULL 
)
GO
ALTER TABLE [dbo].[SVN_LogFile] ADD PRIMARY KEY ([ID])
GO
CREATE TABLE [dbo].[SVN_ProjectRelation] (
[ChildID] varchar(36) NOT NULL ,
[ParentID] char(36) NULL ,
[ID] varchar(36) NOT NULL DEFAULT (newid()) 
)
GO
CREATE TABLE [dbo].[SVN_RevisionPublish] (
[ID] varchar(36) NOT NULL DEFAULT (newid()) ,
[LogID] varchar(36) NOT NULL ,
[JenkinsID] varchar(36) NOT NULL ,
[CreateTime] datetime NULL DEFAULT (getdate()) ,
[Description] varchar(255) NULL ,
[SystemAccountID] varchar(36) NULL 
)
GO
