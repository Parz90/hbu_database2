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

/****** Object:  Table [dbo].[Kartentyp]    Script Date: 05.05.2017 20:41:17 ******/
DROP TABLE [dbo].[Kartentyp]
GO

/****** Object:  Table [dbo].[Kartentyp]    Script Date: 05.05.2017 20:41:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Kartentyp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Kartentyp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING ON
GO

