/*
DROP TABLE bid
DROP TABLE bid_item
DROP TABLE bid_item_category
DROP TABLE user_login_location_map
DROP TABLE user_referral_source_map
DROP TABLE [user]
DROP TABLE login_location
DROP TABLE referral_source
*/

use sandbox;

SET NUMERIC_ROUNDABORT OFF;

SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON;

IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors;

CREATE TABLE #tmpErrors (Error int);

SET XACT_ABORT ON;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

BEGIN TRANSACTION;

PRINT N'Dropping foreign keys from [guest].[bid]';

ALTER TABLE [guest].[bid] DROP
CONSTRAINT [FK_bid_bid_item],
CONSTRAINT [FK_bid_user];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping foreign keys from [guest].[bid_item]';

ALTER TABLE [guest].[bid_item] DROP
CONSTRAINT [FK_bid_item_bid_item_category];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping foreign keys from [guest].[user_login_location_map]';

ALTER TABLE [guest].[user_login_location_map] DROP
CONSTRAINT [FK_user_login_location_map_login_location],
CONSTRAINT [FK_user_login_location_map_user];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping foreign keys from [guest].[user_referral_source_map]';

ALTER TABLE [guest].[user_referral_source_map] DROP
CONSTRAINT [FK_user_referral_source_map_referral_source],
CONSTRAINT [FK_user_referral_source_map_user];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping constraints from [guest].[bid]';

ALTER TABLE [guest].[bid] DROP CONSTRAINT [PK_bid];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping constraints from [guest].[bid_item]';

ALTER TABLE [guest].[bid_item] DROP CONSTRAINT [PK_bid_item];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping constraints from [guest].[bid_item_category]';

ALTER TABLE [guest].[bid_item_category] DROP CONSTRAINT [PK_bid_item_category];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping constraints from [guest].[login_location]';

ALTER TABLE [guest].[login_location] DROP CONSTRAINT [PK_login_location];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping constraints from [guest].[referral_source]';

ALTER TABLE [guest].[referral_source] DROP CONSTRAINT [PK_referral_source];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping constraints from [guest].[user]';

ALTER TABLE [guest].[user] DROP CONSTRAINT [PK_user];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping [guest].[user_referral_source_map]';

DROP TABLE [guest].[user_referral_source_map];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping [guest].[referral_source]';

DROP TABLE [guest].[referral_source];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping [guest].[user_login_location_map]';

DROP TABLE [guest].[user_login_location_map];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping [guest].[login_location]';

DROP TABLE [guest].[login_location];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping [guest].[user]';

DROP TABLE [guest].[user];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping [guest].[bid_item_category]';

DROP TABLE [guest].[bid_item_category];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping [guest].[bid]';

DROP TABLE [guest].[bid];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

PRINT N'Dropping [guest].[bid_item]';

DROP TABLE [guest].[bid_item];

IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION;

IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END;

IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION;

IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed';

DROP TABLE #tmpErrors;

