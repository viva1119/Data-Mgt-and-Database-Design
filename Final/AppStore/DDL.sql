/*
Created: 2/5/2018
Modified: 4/4/2018
Project: App Store
Model: App Store Draft Model
Author: Xin Luo
Version: 1.1.11
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table Payment

CREATE TABLE [Payment]
(
 [BankName] Varchar(50) NOT NULL,
 [PaymentMethod] Varchar(10) NOT NULL,
 [PaymentID] Char(5) NOT NULL,
 [UserID] Char(15) NULL,
 [DeviceID] Char(15) NULL
)
go

-- Create indexes for table Payment

CREATE INDEX [IX_Relationship19] ON [Payment] ([UserID])
go

CREATE INDEX [IX_Relationship24] ON [Payment] ([DeviceID])
go

-- Add keys for table Payment

ALTER TABLE [Payment] ADD CONSTRAINT [Key3] PRIMARY KEY NONCLUSTERED ([PaymentID])
go

-- Table Information

CREATE TABLE [Information]
(
 [Developer ID] Char(15) NOT NULL,
 [Author Name] Varchar(20) NOT NULL,
 [Size] Float NOT NULL,
 [Rating] Float NULL,
 [Category] Varchar(30) NOT NULL,
 [Compatibility] Varchar(20) NOT NULL,
 [Language] Varchar(15) NOT NULL,
 [Age limit] Int NOT NULL,
 [In-app Purchase Items] Varchar(50) NULL,
 [Privacy Policy] Varchar(200) NOT NULL,
 [InformationID] Char(15) NOT NULL,
 [ApplicationID] Char(15) NOT NULL
)
go

-- Add keys for table Information

ALTER TABLE [Information] ADD CONSTRAINT [Key5] PRIMARY KEY NONCLUSTERED ([InformationID],[ApplicationID])
go

-- Table Review

CREATE TABLE [Review]
(
 [ReviewID] Char(15) NOT NULL,
 [UserID] Char(15) NOT NULL,
 [Date] Date NOT NULL,
 [FeedBack] Varchar(300) NOT NULL,
 [ApplicationID] Char(15) NULL
)
go

-- Create indexes for table Review

CREATE INDEX [IX_Relationship16] ON [Review] ([ApplicationID])
go

-- Add keys for table Review

ALTER TABLE [Review] ADD CONSTRAINT [Key11] PRIMARY KEY NONCLUSTERED ([ReviewID],[UserID])
go

-- Table Application

CREATE TABLE [Application]
(
 [ApplicationID] Char(15) NOT NULL,
 [AppName] Varchar(15) NOT NULL,
 [Version] Varchar(15) NOT NULL,
 [Rating] Float NOT NULL,
 [Description] Varchar(300) NOT NULL,
 [Review] Varchar(300) NOT NULL,
 [Update] Varchar(300) NOT NULL,
 [Price] Money NOT NULL,
 [DeveloperID] Char(15) NULL,
 [OperatingSystemRequirements] Varchar(20) NOT NULL
)
go

-- Create indexes for table Application

CREATE INDEX [IX_Relationship9] ON [Application] ([DeveloperID])
go

-- Add keys for table Application

ALTER TABLE [Application] ADD CONSTRAINT [Key12] PRIMARY KEY NONCLUSTERED ([ApplicationID])
go

-- Table DownLoad

CREATE TABLE [DownLoad]
(
 [DownLoadID] Char(15) NOT NULL,
 [ApplicationID] Char(15) NOT NULL,
 [AppName] Varchar(20) NOT NULL,
 [Version] Varchar(15) NOT NULL,
 [DownLoadTime] Date NOT NULL,
 [DeviceID] Char(15) NOT NULL,
 [Status] Varchar(10) NOT NULL,
 [DeviceOperatingSystem] Varchar(20) NOT NULL
)
go

-- Add keys for table DownLoad

ALTER TABLE [DownLoad] ADD CONSTRAINT [Key13] PRIMARY KEY NONCLUSTERED ([DownLoadID],[DeviceID],[ApplicationID])
go

-- Table WishList

CREATE TABLE [WishList]
(
 [AppName] Varchar(15) NOT NULL,
 [Version] Varchar(15) NOT NULL,
 [ApplicationID] Char(15) NOT NULL,
 [UserID] Char(15) NOT NULL
)
go

-- Add keys for table WishList

ALTER TABLE [WishList] ADD CONSTRAINT [Key14] PRIMARY KEY NONCLUSTERED ([ApplicationID],[UserID])
go

-- Table Device

CREATE TABLE [Device]
(
 [DeviceID] Char(15) NOT NULL,
 [DeviceType] Varchar(15) NOT NULL,
 [UserID] Char(15) NOT NULL
)
go

-- Create indexes for table Device

CREATE INDEX [IX_Relationship13] ON [Device] ([UserID])
go

-- Add keys for table Device

ALTER TABLE [Device] ADD CONSTRAINT [Key15] PRIMARY KEY NONCLUSTERED ([DeviceID])
go

-- Table Developer

CREATE TABLE [Developer]
(
 [DeveloperID] Char(15) NOT NULL,
 [OfficialWebsite] Varchar(40) NOT NULL,
 [DeveloperType] Varchar(10) NOT NULL,
 [DeveloperName] Varchar(30) NOT NULL,
 [Introduction] Varchar(200) NULL
)
go

-- Add keys for table Developer

ALTER TABLE [Developer] ADD CONSTRAINT [Key16] PRIMARY KEY NONCLUSTERED ([DeveloperID])
go

-- Table User

CREATE TABLE [User]
(
 [UserID] Char(15) NOT NULL,
 [UserName] Varchar(20) NOT NULL,
 [Password] Char(20) NOT NULL,
 [PhoneNum] Int NOT NULL,
 [UserAccount] Varchar(20) NOT NULL,
 [Address] Varchar(30) NULL
)
go

-- Add keys for table User

ALTER TABLE [User] ADD CONSTRAINT [Key17] PRIMARY KEY NONCLUSTERED ([UserID])
go

-- Table Category

CREATE TABLE [Category]
(
 [CategoryID] Char(15) NOT NULL,
 [CategoryType] Varchar(20) NOT NULL,
 [ApplicationID] Char(15) NOT NULL
)
go

-- Add keys for table Category

ALTER TABLE [Category] ADD CONSTRAINT [Key18] PRIMARY KEY NONCLUSTERED ([CategoryID],[ApplicationID])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Application] ADD CONSTRAINT [Relationship9] FOREIGN KEY ([DeveloperID]) REFERENCES [Developer] ([DeveloperID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [WishList] WITH NOCHECK ADD CONSTRAINT [Relationship12] FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Device] ADD CONSTRAINT [Relationship13] FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [DownLoad] ADD CONSTRAINT [Relationship14] FOREIGN KEY ([DeviceID]) REFERENCES [Device] ([DeviceID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [DownLoad] ADD CONSTRAINT [Relationship15] FOREIGN KEY ([ApplicationID]) REFERENCES [Application] ([ApplicationID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Review] ADD CONSTRAINT [Relationship16] FOREIGN KEY ([ApplicationID]) REFERENCES [Application] ([ApplicationID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Information] ADD CONSTRAINT [Relationship17] FOREIGN KEY ([ApplicationID]) REFERENCES [Application] ([ApplicationID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Payment] ADD CONSTRAINT [Relationship19] FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [WishList] ADD CONSTRAINT [Relationship21] FOREIGN KEY ([ApplicationID]) REFERENCES [Application] ([ApplicationID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Review] ADD CONSTRAINT [Relationship23] FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Payment] ADD CONSTRAINT [Relationship24] FOREIGN KEY ([DeviceID]) REFERENCES [Device] ([DeviceID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Category] ADD CONSTRAINT [Relationship25] FOREIGN KEY ([ApplicationID]) REFERENCES [Application] ([ApplicationID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




