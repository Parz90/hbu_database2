USE [Kreditkartenpruefung]
GO

/****** Object:  Table [dbo].[Kartentyp]    Script Date: 30.04.2017 21:47:14 ******/
DROP TABLE [dbo].[Kartentyp]
GO

/****** Object:  Table [dbo].[Kartentyp]    Script Date: 30.04.2017 21:47:14 ******/
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

