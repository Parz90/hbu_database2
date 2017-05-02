USE [Kreditkartenpruefung]
GO

/****** Object:  Table [dbo].[Log]    Script Date: 30.04.2017 21:47:38 ******/
DROP TABLE [dbo].[Log]
GO

/****** Object:  Table [dbo].[Log]    Script Date: 30.04.2017 21:47:38 ******/
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
	[Beschreibung] [varchar](50) NOT NULL,
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

