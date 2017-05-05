USE [Kreditkartenpruefung]
GO

/****** Object:  Table [dbo].[Person]    Script Date: 05.05.2017 20:41:55 ******/
DROP TABLE [dbo].[Person]
GO

/****** Object:  Table [dbo].[Person]    Script Date: 05.05.2017 20:41:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Person](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Vorname] [varchar](50) NOT NULL,
	[Geburtsdatum] [date] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING ON
GO

