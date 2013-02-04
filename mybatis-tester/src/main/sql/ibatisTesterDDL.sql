USE sandbox
GO

SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
PRINT N'Creating [guest].[bid_item]'
GO
CREATE TABLE [guest].[bid_item]
(
[bid_item_id] [numeric] (18, 0) NOT NULL IDENTITY(1, 1),
[bid_item_category_id] [int] NOT NULL,
[name] [varchar] (50) NOT NULL,
[description] [varchar] (max) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_bid_item] on [guest].[bid_item]'
GO
ALTER TABLE [guest].[bid_item] ADD CONSTRAINT [PK_bid_item] PRIMARY KEY CLUSTERED  ([bid_item_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [guest].[bid]'
GO
CREATE TABLE [guest].[bid]
(
[bid_id] [numeric] (18, 0) NOT NULL IDENTITY(1, 1),
[bid_item_id] [numeric] (18, 0) NOT NULL,
[user_id] [int] NOT NULL,
[bid_time] [datetime] NOT NULL,
[is_winning_bid] [bit] NULL,
[bid_price] [numeric] (18, 2) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_bid] on [guest].[bid]'
GO
ALTER TABLE [guest].[bid] ADD CONSTRAINT [PK_bid] PRIMARY KEY CLUSTERED  ([bid_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [guest].[bid_item_category]'
GO
CREATE TABLE [guest].[bid_item_category]
(
[bid_item_category_id] [int] NOT NULL IDENTITY(1, 1),
[name] [varchar] (50) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_bid_item_category] on [guest].[bid_item_category]'
GO
ALTER TABLE [guest].[bid_item_category] ADD CONSTRAINT [PK_bid_item_category] PRIMARY KEY CLUSTERED  ([bid_item_category_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [guest].[user]'
GO
CREATE TABLE [guest].[user]
(
[user_id] [int] NOT NULL IDENTITY(1, 1),
[name] [varchar] (50) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_user] on [guest].[user]'
GO
ALTER TABLE [guest].[user] ADD CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED  ([user_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [guest].[login_location]'
GO
CREATE TABLE [guest].[login_location]
(
[login_location_id] [numeric] (18, 0) NOT NULL IDENTITY(1, 1),
[ip_address] [varchar] (50) NOT NULL,
[site] [varchar] (50) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_login_location] on [guest].[login_location]'
GO
ALTER TABLE [guest].[login_location] ADD CONSTRAINT [PK_login_location] PRIMARY KEY CLUSTERED  ([login_location_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [guest].[user_login_location_map]'
GO
CREATE TABLE [guest].[user_login_location_map]
(
[user_id] [int] NOT NULL,
[login_location_id] [numeric] (18, 0) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [guest].[referral_source]'
GO
CREATE TABLE [guest].[referral_source]
(
[referral_source_id] [int] NOT NULL IDENTITY(1, 1),
[name] [varchar] (50) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK_referral_source] on [guest].[referral_source]'
GO
ALTER TABLE [guest].[referral_source] ADD CONSTRAINT [PK_referral_source] PRIMARY KEY CLUSTERED  ([referral_source_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [guest].[user_referral_source_map]'
GO
CREATE TABLE [guest].[user_referral_source_map]
(
[user_id] [int] NOT NULL,
[referral_source_id] [int] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [guest].[bid]'
GO
ALTER TABLE [guest].[bid] ADD
CONSTRAINT [FK_bid_bid_item] FOREIGN KEY ([bid_item_id]) REFERENCES [guest].[bid_item] ([bid_item_id]),
CONSTRAINT [FK_bid_user] FOREIGN KEY ([user_id]) REFERENCES [guest].[user] ([user_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [guest].[bid_item]'
GO
ALTER TABLE [guest].[bid_item] ADD
CONSTRAINT [FK_bid_item_bid_item_category] FOREIGN KEY ([bid_item_category_id]) REFERENCES [guest].[bid_item_category] ([bid_item_category_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [guest].[user_login_location_map]'
GO
ALTER TABLE [guest].[user_login_location_map] ADD
CONSTRAINT [FK_user_login_location_map_login_location] FOREIGN KEY ([login_location_id]) REFERENCES [guest].[login_location] ([login_location_id]),
CONSTRAINT [FK_user_login_location_map_user] FOREIGN KEY ([user_id]) REFERENCES [guest].[user] ([user_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [guest].[user_referral_source_map]'
GO
ALTER TABLE [guest].[user_referral_source_map] ADD
CONSTRAINT [FK_user_referral_source_map_referral_source] FOREIGN KEY ([referral_source_id]) REFERENCES [guest].[referral_source] ([referral_source_id]),
CONSTRAINT [FK_user_referral_source_map_user] FOREIGN KEY ([user_id]) REFERENCES [guest].[user] ([user_id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO
