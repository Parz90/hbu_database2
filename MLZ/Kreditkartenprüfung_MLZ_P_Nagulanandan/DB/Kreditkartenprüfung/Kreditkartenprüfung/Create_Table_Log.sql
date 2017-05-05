-- Author		: Parthipan Nagulanandan
-- Projekt		: HBU
-- Version		: 1.3
-- 
-- Change log
-- 29/04/2017   Planung und Beispiel Code
-- 02/05/2017   Grob Implementation
-- 05/05/2017   Fertigstellung Kreditkartenpruefung

USE [Kreditkartenpruefung]
GO

/****** Object:  Table [dbo].[Log]    Script Date: 05.05.2017 20:41:40 ******/
DROP TABLE [dbo].[Log]
GO

/****** Object:  Table [dbo].[Log]    Script Date: 05.05.2017 20:41:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Log](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Zeit] [datetime] NOT NULL,
	[Benutzer] [varchar](50) NOT NULL,
	[Beschreibung] [varchar](200) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Vorname] [varchar](50) NOT NULL,
	[Geburtsdatum] [date] NOT NULL,
	[Kartennummer] [bigint] NOT NULL,
	[GueltigkeitMM] [tinyint] NOT NULL,
	[GueltigkeitYYYY] [smallint] NOT NULL,
	[Sicherheitscode] [int] NOT NULL,
	[Kartentyp] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING ON
GO

