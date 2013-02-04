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

-- Add rows to [guest].[bid_item_category]
SET IDENTITY_INSERT [guest].[bid_item_category] ON
INSERT INTO [guest].[bid_item_category] ([bid_item_category_id], [name]) VALUES (1, 'Apparel')
INSERT INTO [guest].[bid_item_category] ([bid_item_category_id], [name]) VALUES (2, 'Cameras')
INSERT INTO [guest].[bid_item_category] ([bid_item_category_id], [name]) VALUES (3, 'Books')
INSERT INTO [guest].[bid_item_category] ([bid_item_category_id], [name]) VALUES (4, 'Gaming')
INSERT INTO [guest].[bid_item_category] ([bid_item_category_id], [name]) VALUES (5, 'Music')
INSERT INTO [guest].[bid_item_category] ([bid_item_category_id], [name]) VALUES (6, 'Fragrances')
SET IDENTITY_INSERT [guest].[bid_item_category] OFF
-- Operation applied to 6 rows out of 6

-- Add rows to [guest].[login_location]
SET IDENTITY_INSERT [guest].[login_location] ON
INSERT INTO [guest].[login_location] ([login_location_id], [ip_address], [site]) VALUES (1, '10.247.1.100', 'HYD')
INSERT INTO [guest].[login_location] ([login_location_id], [ip_address], [site]) VALUES (2, '10.247.1.101', 'NYC')
INSERT INTO [guest].[login_location] ([login_location_id], [ip_address], [site]) VALUES (3, '10.247.1.102', 'HYD')
INSERT INTO [guest].[login_location] ([login_location_id], [ip_address], [site]) VALUES (4, '10.247.1.103', 'NYC')
INSERT INTO [guest].[login_location] ([login_location_id], [ip_address], [site]) VALUES (5, '10.247.1.104', 'HYD')
INSERT INTO [guest].[login_location] ([login_location_id], [ip_address], [site]) VALUES (6, '10.247.1.105', 'NYC')
INSERT INTO [guest].[login_location] ([login_location_id], [ip_address], [site]) VALUES (7, '10.247.1.106', 'HYD')
SET IDENTITY_INSERT [guest].[login_location] OFF
-- Operation applied to 7 rows out of 7

-- Add rows to [guest].[referral_source]
SET IDENTITY_INSERT [guest].[referral_source] ON
INSERT INTO [guest].[referral_source] ([referral_source_id], [name]) VALUES (1, 'DESTalk')
INSERT INTO [guest].[referral_source] ([referral_source_id], [name]) VALUES (2, 'Word of mouth')
INSERT INTO [guest].[referral_source] ([referral_source_id], [name]) VALUES (3, 'Intranet')
INSERT INTO [guest].[referral_source] ([referral_source_id], [name]) VALUES (4, 'DIG updates')
SET IDENTITY_INSERT [guest].[referral_source] OFF
-- Operation applied to 4 rows out of 4

-- Add rows to [guest].[user]
SET IDENTITY_INSERT [guest].[user] ON
INSERT INTO [guest].[user] ([user_id], [name]) VALUES (1, 'baigm')
INSERT INTO [guest].[user] ([user_id], [name]) VALUES (2, 'javvajra')
INSERT INTO [guest].[user] ([user_id], [name]) VALUES (3, 'sivasams')
INSERT INTO [guest].[user] ([user_id], [name]) VALUES (4, 'mukundaj')
INSERT INTO [guest].[user] ([user_id], [name]) VALUES (5, 'gnanashe')
SET IDENTITY_INSERT [guest].[user] OFF
-- Operation applied to 5 rows out of 5

-- Add rows to [guest].[bid_item]
SET IDENTITY_INSERT [guest].[bid_item] ON
INSERT INTO [guest].[bid_item] ([bid_item_id], [bid_item_category_id], [name], [description]) VALUES (1, 1, 'Denim pants', 'Mint condition')
INSERT INTO [guest].[bid_item] ([bid_item_id], [bid_item_category_id], [name], [description]) VALUES (2, 2, 'Canon EOS550D SLR', 'Need I say more?')
INSERT INTO [guest].[bid_item] ([bid_item_id], [bid_item_category_id], [name], [description]) VALUES (3, 2, 'Nikon Coolpix N142', 'Hardly used')
INSERT INTO [guest].[bid_item] ([bid_item_id], [bid_item_category_id], [name], [description]) VALUES (4, 2, 'Nikon N143', 'Mint condition. Original packaging available')
INSERT INTO [guest].[bid_item] ([bid_item_id], [bid_item_category_id], [name], [description]) VALUES (5, 2, 'Sony Cybershot S120', 'Minor scratches')
INSERT INTO [guest].[bid_item] ([bid_item_id], [bid_item_category_id], [name], [description]) VALUES (6, 3, 'India after Gandhi', 'A good read')
INSERT INTO [guest].[bid_item] ([bid_item_id], [bid_item_category_id], [name], [description]) VALUES (7, 3, 'Steve Jobs: The Exclusive Biography', 'Overrated')
INSERT INTO [guest].[bid_item] ([bid_item_id], [bid_item_category_id], [name], [description]) VALUES (8, 4, 'Angry Birds', 'iOS, Android and PC versions')
INSERT INTO [guest].[bid_item] ([bid_item_id], [bid_item_category_id], [name], [description]) VALUES (9, 4, 'Max Payne 3', 'PC version')
INSERT INTO [guest].[bid_item] ([bid_item_id], [bid_item_category_id], [name], [description]) VALUES (10, 5, 'Tom Petty: Learning to fly', 'Collector edition DVD')
INSERT INTO [guest].[bid_item] ([bid_item_id], [bid_item_category_id], [name], [description]) VALUES (11, 5, 'Credence Clearwater Revival: Fortunate Son', 'Collector edition DVD')
INSERT INTO [guest].[bid_item] ([bid_item_id], [bid_item_category_id], [name], [description]) VALUES (12, 6, 'Angel', 'Perfume for her')
SET IDENTITY_INSERT [guest].[bid_item] OFF
-- Operation applied to 12 rows out of 12

-- Add rows to [guest].[user_login_location_map] with non-unique comparison key
SET ROWCOUNT 1
INSERT INTO [guest].[user_login_location_map] ([user_id], [login_location_id]) VALUES (1, 1)
INSERT INTO [guest].[user_login_location_map] ([user_id], [login_location_id]) VALUES (1, 2)
INSERT INTO [guest].[user_login_location_map] ([user_id], [login_location_id]) VALUES (2, 2)
INSERT INTO [guest].[user_login_location_map] ([user_id], [login_location_id]) VALUES (3, 3)
INSERT INTO [guest].[user_login_location_map] ([user_id], [login_location_id]) VALUES (3, 4)
INSERT INTO [guest].[user_login_location_map] ([user_id], [login_location_id]) VALUES (3, 5)
INSERT INTO [guest].[user_login_location_map] ([user_id], [login_location_id]) VALUES (3, 6)
INSERT INTO [guest].[user_login_location_map] ([user_id], [login_location_id]) VALUES (4, 1)
INSERT INTO [guest].[user_login_location_map] ([user_id], [login_location_id]) VALUES (5, 1)
SET ROWCOUNT 0
-- Operation applied to 9 rows out of 9

-- Add rows to [guest].[user_referral_source_map]
INSERT INTO [guest].[user_referral_source_map] ([user_id], [referral_source_id]) VALUES (1, 1)
INSERT INTO [guest].[user_referral_source_map] ([user_id], [referral_source_id]) VALUES (1, 2)
INSERT INTO [guest].[user_referral_source_map] ([user_id], [referral_source_id]) VALUES (1, 3)
INSERT INTO [guest].[user_referral_source_map] ([user_id], [referral_source_id]) VALUES (2, 1)
INSERT INTO [guest].[user_referral_source_map] ([user_id], [referral_source_id]) VALUES (3, 2)
INSERT INTO [guest].[user_referral_source_map] ([user_id], [referral_source_id]) VALUES (5, 4)
-- Operation applied to 6 rows out of 6

-- Add rows to [guest].[bid]
SET IDENTITY_INSERT [guest].[bid] ON
INSERT INTO [guest].[bid] ([bid_id], [bid_item_id], [user_id], [bid_time], [is_winning_bid], [bid_price]) VALUES (1, 1, 1, '2012-04-09 04:16:42.440', NULL, 10.10)
INSERT INTO [guest].[bid] ([bid_id], [bid_item_id], [user_id], [bid_time], [is_winning_bid], [bid_price]) VALUES (2, 1, 2, '2012-04-09 04:16:42.440', NULL, 10.20)
INSERT INTO [guest].[bid] ([bid_id], [bid_item_id], [user_id], [bid_time], [is_winning_bid], [bid_price]) VALUES (3, 2, 1, '2012-04-09 04:16:42.440', NULL, 200.00)
INSERT INTO [guest].[bid] ([bid_id], [bid_item_id], [user_id], [bid_time], [is_winning_bid], [bid_price]) VALUES (4, 2, 3, '2012-04-09 04:16:42.440', NULL, 200.10)
INSERT INTO [guest].[bid] ([bid_id], [bid_item_id], [user_id], [bid_time], [is_winning_bid], [bid_price]) VALUES (5, 8, 1, '2012-04-09 04:16:42.440', NULL, 10.00)
INSERT INTO [guest].[bid] ([bid_id], [bid_item_id], [user_id], [bid_time], [is_winning_bid], [bid_price]) VALUES (6, 8, 4, '2012-04-09 04:16:42.440', NULL, 10.20)
INSERT INTO [guest].[bid] ([bid_id], [bid_item_id], [user_id], [bid_time], [is_winning_bid], [bid_price]) VALUES (7, 10, 1, '2012-04-09 04:16:42.440', NULL, 10.00)
INSERT INTO [guest].[bid] ([bid_id], [bid_item_id], [user_id], [bid_time], [is_winning_bid], [bid_price]) VALUES (8, 10, 5, '2012-04-09 04:16:42.440', NULL, 100.00)
SET IDENTITY_INSERT [guest].[bid] OFF
-- Operation applied to 8 rows out of 8

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
DBCC CHECKIDENT('[guest].[bid]', RESEED, 8)
GO

-- Reseed identity on [guest].[bid_item]
DBCC CHECKIDENT('[guest].[bid_item]', RESEED, 12)
GO

-- Reseed identity on [guest].[user]
DBCC CHECKIDENT('[guest].[user]', RESEED, 5)
GO

-- Reseed identity on [guest].[referral_source]
DBCC CHECKIDENT('[guest].[referral_source]', RESEED, 4)
GO

-- Reseed identity on [guest].[login_location]
DBCC CHECKIDENT('[guest].[login_location]', RESEED, 7)
GO

-- Reseed identity on [guest].[bid_item_category]
DBCC CHECKIDENT('[guest].[bid_item_category]', RESEED, 6)
GO
