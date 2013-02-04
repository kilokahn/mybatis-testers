use sandbox
GO
		
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)
BEGIN TRANSACTION

-- Drop constraints from [guest].[bid]
ALTER TABLE [guest].[bid] DROP CONSTRAINT [FK_bid_bid_item]
ALTER TABLE [guest].[bid] DROP CONSTRAINT [FK_bid_user]

-- Drop constraints from [guest].[user_referral_source_map]
ALTER TABLE [guest].[user_referral_source_map] DROP CONSTRAINT [FK_user_referral_source_map_referral_source]
ALTER TABLE [guest].[user_referral_source_map] DROP CONSTRAINT [FK_user_referral_source_map_user]

-- Drop constraints from [guest].[user_login_location_map]
ALTER TABLE [guest].[user_login_location_map] DROP CONSTRAINT [FK_user_login_location_map_login_location]
ALTER TABLE [guest].[user_login_location_map] DROP CONSTRAINT [FK_user_login_location_map_user]

-- Drop constraints from [guest].[bid_item]
ALTER TABLE [guest].[bid_item] DROP CONSTRAINT [FK_bid_item_bid_item_category]

-- Delete rows from [guest].[bid]
DELETE FROM [guest].[bid] WHERE [bid_id]=1
DELETE FROM [guest].[bid] WHERE [bid_id]=2
DELETE FROM [guest].[bid] WHERE [bid_id]=3
DELETE FROM [guest].[bid] WHERE [bid_id]=4
DELETE FROM [guest].[bid] WHERE [bid_id]=5
DELETE FROM [guest].[bid] WHERE [bid_id]=6
DELETE FROM [guest].[bid] WHERE [bid_id]=7
DELETE FROM [guest].[bid] WHERE [bid_id]=8
-- Operation applied to 8 rows out of 8

-- Delete rows from [guest].[user_referral_source_map]
DELETE FROM [guest].[user_referral_source_map] WHERE [user_id]=1 AND [referral_source_id]=1
DELETE FROM [guest].[user_referral_source_map] WHERE [user_id]=1 AND [referral_source_id]=2
DELETE FROM [guest].[user_referral_source_map] WHERE [user_id]=1 AND [referral_source_id]=3
DELETE FROM [guest].[user_referral_source_map] WHERE [user_id]=2 AND [referral_source_id]=1
DELETE FROM [guest].[user_referral_source_map] WHERE [user_id]=3 AND [referral_source_id]=2
DELETE FROM [guest].[user_referral_source_map] WHERE [user_id]=5 AND [referral_source_id]=4
-- Operation applied to 6 rows out of 6

-- Delete rows from [guest].[user_login_location_map] with non-unique comparison key
SET ROWCOUNT 1
DELETE FROM [guest].[user_login_location_map] WHERE [user_id]=1 AND [login_location_id]=1
DELETE FROM [guest].[user_login_location_map] WHERE [user_id]=1 AND [login_location_id]=2
DELETE FROM [guest].[user_login_location_map] WHERE [user_id]=2 AND [login_location_id]=2
DELETE FROM [guest].[user_login_location_map] WHERE [user_id]=3 AND [login_location_id]=3
DELETE FROM [guest].[user_login_location_map] WHERE [user_id]=3 AND [login_location_id]=4
DELETE FROM [guest].[user_login_location_map] WHERE [user_id]=3 AND [login_location_id]=5
DELETE FROM [guest].[user_login_location_map] WHERE [user_id]=3 AND [login_location_id]=6
DELETE FROM [guest].[user_login_location_map] WHERE [user_id]=4 AND [login_location_id]=1
DELETE FROM [guest].[user_login_location_map] WHERE [user_id]=5 AND [login_location_id]=1
SET ROWCOUNT 0
-- Operation applied to 9 rows out of 9

-- Delete rows from [guest].[bid_item]
DELETE FROM [guest].[bid_item] WHERE [bid_item_id]=1
DELETE FROM [guest].[bid_item] WHERE [bid_item_id]=2
DELETE FROM [guest].[bid_item] WHERE [bid_item_id]=3
DELETE FROM [guest].[bid_item] WHERE [bid_item_id]=4
DELETE FROM [guest].[bid_item] WHERE [bid_item_id]=5
DELETE FROM [guest].[bid_item] WHERE [bid_item_id]=6
DELETE FROM [guest].[bid_item] WHERE [bid_item_id]=7
DELETE FROM [guest].[bid_item] WHERE [bid_item_id]=8
DELETE FROM [guest].[bid_item] WHERE [bid_item_id]=9
DELETE FROM [guest].[bid_item] WHERE [bid_item_id]=10
DELETE FROM [guest].[bid_item] WHERE [bid_item_id]=11
DELETE FROM [guest].[bid_item] WHERE [bid_item_id]=12
-- Operation applied to 12 rows out of 12

-- Delete rows from [guest].[user]
DELETE FROM [guest].[user] WHERE [user_id]=1
DELETE FROM [guest].[user] WHERE [user_id]=2
DELETE FROM [guest].[user] WHERE [user_id]=3
DELETE FROM [guest].[user] WHERE [user_id]=4
DELETE FROM [guest].[user] WHERE [user_id]=5
-- Operation applied to 5 rows out of 5

-- Delete rows from [guest].[referral_source]
DELETE FROM [guest].[referral_source] WHERE [referral_source_id]=1
DELETE FROM [guest].[referral_source] WHERE [referral_source_id]=2
DELETE FROM [guest].[referral_source] WHERE [referral_source_id]=3
DELETE FROM [guest].[referral_source] WHERE [referral_source_id]=4
-- Operation applied to 4 rows out of 4

-- Delete rows from [guest].[login_location]
DELETE FROM [guest].[login_location] WHERE [login_location_id]=1
DELETE FROM [guest].[login_location] WHERE [login_location_id]=2
DELETE FROM [guest].[login_location] WHERE [login_location_id]=3
DELETE FROM [guest].[login_location] WHERE [login_location_id]=4
DELETE FROM [guest].[login_location] WHERE [login_location_id]=5
DELETE FROM [guest].[login_location] WHERE [login_location_id]=6
DELETE FROM [guest].[login_location] WHERE [login_location_id]=7
-- Operation applied to 7 rows out of 7

-- Delete rows from [guest].[bid_item_category]
DELETE FROM [guest].[bid_item_category] WHERE [bid_item_category_id]=1
DELETE FROM [guest].[bid_item_category] WHERE [bid_item_category_id]=2
DELETE FROM [guest].[bid_item_category] WHERE [bid_item_category_id]=3
DELETE FROM [guest].[bid_item_category] WHERE [bid_item_category_id]=4
DELETE FROM [guest].[bid_item_category] WHERE [bid_item_category_id]=5
DELETE FROM [guest].[bid_item_category] WHERE [bid_item_category_id]=6
-- Operation applied to 6 rows out of 6

-- Add constraints to [guest].[bid]
ALTER TABLE [guest].[bid] ADD CONSTRAINT [FK_bid_bid_item] FOREIGN KEY ([bid_item_id]) REFERENCES [guest].[bid_item] ([bid_item_id])
ALTER TABLE [guest].[bid] ADD CONSTRAINT [FK_bid_user] FOREIGN KEY ([user_id]) REFERENCES [guest].[user] ([user_id])

-- Add constraints to [guest].[user_referral_source_map]
ALTER TABLE [guest].[user_referral_source_map] ADD CONSTRAINT [FK_user_referral_source_map_referral_source] FOREIGN KEY ([referral_source_id]) REFERENCES [guest].[referral_source] ([referral_source_id])
ALTER TABLE [guest].[user_referral_source_map] ADD CONSTRAINT [FK_user_referral_source_map_user] FOREIGN KEY ([user_id]) REFERENCES [guest].[user] ([user_id])

-- Add constraints to [guest].[user_login_location_map]
ALTER TABLE [guest].[user_login_location_map] ADD CONSTRAINT [FK_user_login_location_map_login_location] FOREIGN KEY ([login_location_id]) REFERENCES [guest].[login_location] ([login_location_id])
ALTER TABLE [guest].[user_login_location_map] ADD CONSTRAINT [FK_user_login_location_map_user] FOREIGN KEY ([user_id]) REFERENCES [guest].[user] ([user_id])

-- Add constraints to [guest].[bid_item]
ALTER TABLE [guest].[bid_item] ADD CONSTRAINT [FK_bid_item_bid_item_category] FOREIGN KEY ([bid_item_category_id]) REFERENCES [guest].[bid_item_category] ([bid_item_category_id])
COMMIT TRANSACTION
GO

-- Reseed identity on [guest].[bid]
DBCC CHECKIDENT('[guest].[bid]', RESEED, 0)
GO

-- Reseed identity on [guest].[bid_item]
DBCC CHECKIDENT('[guest].[bid_item]', RESEED, 0)
GO

-- Reseed identity on [guest].[user]
DBCC CHECKIDENT('[guest].[user]', RESEED, 0)
GO

-- Reseed identity on [guest].[referral_source]
DBCC CHECKIDENT('[guest].[referral_source]', RESEED, 0)
GO

-- Reseed identity on [guest].[login_location]
DBCC CHECKIDENT('[guest].[login_location]', RESEED, 0)
GO

-- Reseed identity on [guest].[bid_item_category]
DBCC CHECKIDENT('[guest].[bid_item_category]', RESEED, 0)
GO
