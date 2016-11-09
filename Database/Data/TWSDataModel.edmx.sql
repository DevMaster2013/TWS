
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/09/2016 16:53:59
-- Generated from EDMX file: E:\My Data\The World Story\TWS\Database\Data\TWSDataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TWSData];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Humen]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Humen];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Humen'
CREATE TABLE [dbo].[Humen] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [DateOfBirth] datetime  NOT NULL,
    [DateOfDeath] nvarchar(max)  NOT NULL,
    [Sex] bit  NOT NULL,
    [BaseFertilityLevel] float  NOT NULL,
    [BaseMarriageDesire] float  NOT NULL,
    [ChildInfo_ID] bigint  NOT NULL
);
GO

-- Creating table 'HumanMarriages'
CREATE TABLE [dbo].[HumanMarriages] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [MaleHumanID] bigint  NOT NULL,
    [FemaleHumanID] bigint  NOT NULL
);
GO

-- Creating table 'MarriageChilds'
CREATE TABLE [dbo].[MarriageChilds] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [HumanMarriageID] bigint  NOT NULL,
    [Pregnant_ID] bigint  NOT NULL
);
GO

-- Creating table 'Pregnants'
CREATE TABLE [dbo].[Pregnants] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [HumanMarriageID] bigint  NOT NULL
);
GO

-- Creating table 'IllegalPregnants'
CREATE TABLE [dbo].[IllegalPregnants] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [FemaleHumanID] bigint  NOT NULL,
    [MaleHumanID] bigint  NOT NULL
);
GO

-- Creating table 'IllegalChilds'
CREATE TABLE [dbo].[IllegalChilds] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [IllegalPregnant_ID] bigint  NOT NULL,
    [HumanInfo_ID] bigint  NOT NULL
);
GO

-- Creating table 'Humen_MaleHuman'
CREATE TABLE [dbo].[Humen_MaleHuman] (
    [ID] bigint  NOT NULL
);
GO

-- Creating table 'Humen_FemaleHuman'
CREATE TABLE [dbo].[Humen_FemaleHuman] (
    [ID] bigint  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Humen'
ALTER TABLE [dbo].[Humen]
ADD CONSTRAINT [PK_Humen]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'HumanMarriages'
ALTER TABLE [dbo].[HumanMarriages]
ADD CONSTRAINT [PK_HumanMarriages]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'MarriageChilds'
ALTER TABLE [dbo].[MarriageChilds]
ADD CONSTRAINT [PK_MarriageChilds]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Pregnants'
ALTER TABLE [dbo].[Pregnants]
ADD CONSTRAINT [PK_Pregnants]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'IllegalPregnants'
ALTER TABLE [dbo].[IllegalPregnants]
ADD CONSTRAINT [PK_IllegalPregnants]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'IllegalChilds'
ALTER TABLE [dbo].[IllegalChilds]
ADD CONSTRAINT [PK_IllegalChilds]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Humen_MaleHuman'
ALTER TABLE [dbo].[Humen_MaleHuman]
ADD CONSTRAINT [PK_Humen_MaleHuman]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Humen_FemaleHuman'
ALTER TABLE [dbo].[Humen_FemaleHuman]
ADD CONSTRAINT [PK_Humen_FemaleHuman]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MaleHumanID] in table 'HumanMarriages'
ALTER TABLE [dbo].[HumanMarriages]
ADD CONSTRAINT [FK_MaleHumanHumanMarriage]
    FOREIGN KEY ([MaleHumanID])
    REFERENCES [dbo].[Humen_MaleHuman]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MaleHumanHumanMarriage'
CREATE INDEX [IX_FK_MaleHumanHumanMarriage]
ON [dbo].[HumanMarriages]
    ([MaleHumanID]);
GO

-- Creating foreign key on [HumanMarriageID] in table 'MarriageChilds'
ALTER TABLE [dbo].[MarriageChilds]
ADD CONSTRAINT [FK_HumanMarriageMarriageChild]
    FOREIGN KEY ([HumanMarriageID])
    REFERENCES [dbo].[HumanMarriages]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HumanMarriageMarriageChild'
CREATE INDEX [IX_FK_HumanMarriageMarriageChild]
ON [dbo].[MarriageChilds]
    ([HumanMarriageID]);
GO

-- Creating foreign key on [FemaleHumanID] in table 'HumanMarriages'
ALTER TABLE [dbo].[HumanMarriages]
ADD CONSTRAINT [FK_FemaleHumanHumanMarriage]
    FOREIGN KEY ([FemaleHumanID])
    REFERENCES [dbo].[Humen_FemaleHuman]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FemaleHumanHumanMarriage'
CREATE INDEX [IX_FK_FemaleHumanHumanMarriage]
ON [dbo].[HumanMarriages]
    ([FemaleHumanID]);
GO

-- Creating foreign key on [ChildInfo_ID] in table 'Humen'
ALTER TABLE [dbo].[Humen]
ADD CONSTRAINT [FK_HumanMarriageChild]
    FOREIGN KEY ([ChildInfo_ID])
    REFERENCES [dbo].[MarriageChilds]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HumanMarriageChild'
CREATE INDEX [IX_FK_HumanMarriageChild]
ON [dbo].[Humen]
    ([ChildInfo_ID]);
GO

-- Creating foreign key on [Pregnant_ID] in table 'MarriageChilds'
ALTER TABLE [dbo].[MarriageChilds]
ADD CONSTRAINT [FK_PregnantMarriageChild]
    FOREIGN KEY ([Pregnant_ID])
    REFERENCES [dbo].[Pregnants]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PregnantMarriageChild'
CREATE INDEX [IX_FK_PregnantMarriageChild]
ON [dbo].[MarriageChilds]
    ([Pregnant_ID]);
GO

-- Creating foreign key on [HumanMarriageID] in table 'Pregnants'
ALTER TABLE [dbo].[Pregnants]
ADD CONSTRAINT [FK_HumanMarriagePregnant]
    FOREIGN KEY ([HumanMarriageID])
    REFERENCES [dbo].[HumanMarriages]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HumanMarriagePregnant'
CREATE INDEX [IX_FK_HumanMarriagePregnant]
ON [dbo].[Pregnants]
    ([HumanMarriageID]);
GO

-- Creating foreign key on [FemaleHumanID] in table 'IllegalPregnants'
ALTER TABLE [dbo].[IllegalPregnants]
ADD CONSTRAINT [FK_FemaleHumanIllegalPregnant]
    FOREIGN KEY ([FemaleHumanID])
    REFERENCES [dbo].[Humen_FemaleHuman]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FemaleHumanIllegalPregnant'
CREATE INDEX [IX_FK_FemaleHumanIllegalPregnant]
ON [dbo].[IllegalPregnants]
    ([FemaleHumanID]);
GO

-- Creating foreign key on [MaleHumanID] in table 'IllegalPregnants'
ALTER TABLE [dbo].[IllegalPregnants]
ADD CONSTRAINT [FK_MaleHumanIllegalPregnant]
    FOREIGN KEY ([MaleHumanID])
    REFERENCES [dbo].[Humen_MaleHuman]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MaleHumanIllegalPregnant'
CREATE INDEX [IX_FK_MaleHumanIllegalPregnant]
ON [dbo].[IllegalPregnants]
    ([MaleHumanID]);
GO

-- Creating foreign key on [IllegalPregnant_ID] in table 'IllegalChilds'
ALTER TABLE [dbo].[IllegalChilds]
ADD CONSTRAINT [FK_IllegalPregnantIllegalChild]
    FOREIGN KEY ([IllegalPregnant_ID])
    REFERENCES [dbo].[IllegalPregnants]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_IllegalPregnantIllegalChild'
CREATE INDEX [IX_FK_IllegalPregnantIllegalChild]
ON [dbo].[IllegalChilds]
    ([IllegalPregnant_ID]);
GO

-- Creating foreign key on [HumanInfo_ID] in table 'IllegalChilds'
ALTER TABLE [dbo].[IllegalChilds]
ADD CONSTRAINT [FK_HumanIllegalChild]
    FOREIGN KEY ([HumanInfo_ID])
    REFERENCES [dbo].[Humen]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HumanIllegalChild'
CREATE INDEX [IX_FK_HumanIllegalChild]
ON [dbo].[IllegalChilds]
    ([HumanInfo_ID]);
GO

-- Creating foreign key on [ID] in table 'Humen_MaleHuman'
ALTER TABLE [dbo].[Humen_MaleHuman]
ADD CONSTRAINT [FK_MaleHuman_inherits_Human]
    FOREIGN KEY ([ID])
    REFERENCES [dbo].[Humen]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ID] in table 'Humen_FemaleHuman'
ALTER TABLE [dbo].[Humen_FemaleHuman]
ADD CONSTRAINT [FK_FemaleHuman_inherits_Human]
    FOREIGN KEY ([ID])
    REFERENCES [dbo].[Humen]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------