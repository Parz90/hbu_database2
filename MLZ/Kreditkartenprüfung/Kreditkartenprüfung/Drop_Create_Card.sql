USE [Kreditkartenpruefung]
GO

ALTER TABLE [dbo].[Karte] DROP CONSTRAINT [FK_Karte_Person]
GO

ALTER TABLE [dbo].[Karte] DROP CONSTRAINT [FK_Karte_Kartentyp]
GO

/****** Object:  Table [dbo].[Karte]    Script Date: 30.04.2017 21:46:19 ******/
DROP TABLE [dbo].[Karte]
GO

/****** Object:  Table [dbo].[Karte]    Script Date: 30.04.2017 21:46:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Karte](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonId] [bigint] NOT NULL,
	[KartentypId] [int] NOT NULL,
	[Kartennummer] [bigint] NOT NULL,
	[GueltigkeitMM] [tinyint] NOT NULL,
	[GueltigkeitYYYY] [smallint] NOT NULL,
	[Sicherheitscode] [smallint] NOT NULL,
	[Kartensperrung] [bit] NOT NULL,
	[Sperrzaehler] [int] NOT NULL,
 CONSTRAINT [PK_Karte] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Karte]  WITH CHECK ADD  CONSTRAINT [FK_Karte_Kartentyp] FOREIGN KEY([KartentypId])
REFERENCES [dbo].[Kartentyp] ([Id])
GO

ALTER TABLE [dbo].[Karte] CHECK CONSTRAINT [FK_Karte_Kartentyp]
GO

ALTER TABLE [dbo].[Karte]  WITH CHECK ADD  CONSTRAINT [FK_Karte_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO

ALTER TABLE [dbo].[Karte] CHECK CONSTRAINT [FK_Karte_Person]
GO

