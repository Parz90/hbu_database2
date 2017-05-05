USE [master]
GO

/****** Object:  Database [Kreditkartenpruefung]    Script Date: 05.05.2017 20:40:26 ******/
DROP DATABASE [Kreditkartenpruefung]
GO

/****** Object:  Database [Kreditkartenpruefung]    Script Date: 05.05.2017 20:40:26 ******/
CREATE DATABASE [Kreditkartenpruefung]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kreditkartenpruefung', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Kreditkartenpruefung.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Kreditkartenpruefung_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Kreditkartenpruefung.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Kreditkartenpruefung] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kreditkartenpruefung].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Kreditkartenpruefung] SET ANSI_NULL_DEFAULT ON 
GO

ALTER DATABASE [Kreditkartenpruefung] SET ANSI_NULLS ON 
GO

ALTER DATABASE [Kreditkartenpruefung] SET ANSI_PADDING ON 
GO

ALTER DATABASE [Kreditkartenpruefung] SET ANSI_WARNINGS ON 
GO

ALTER DATABASE [Kreditkartenpruefung] SET ARITHABORT ON 
GO

ALTER DATABASE [Kreditkartenpruefung] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Kreditkartenpruefung] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Kreditkartenpruefung] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Kreditkartenpruefung] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Kreditkartenpruefung] SET CURSOR_DEFAULT  LOCAL 
GO

ALTER DATABASE [Kreditkartenpruefung] SET CONCAT_NULL_YIELDS_NULL ON 
GO

ALTER DATABASE [Kreditkartenpruefung] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Kreditkartenpruefung] SET QUOTED_IDENTIFIER ON 
GO

ALTER DATABASE [Kreditkartenpruefung] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Kreditkartenpruefung] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Kreditkartenpruefung] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Kreditkartenpruefung] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Kreditkartenpruefung] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Kreditkartenpruefung] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Kreditkartenpruefung] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Kreditkartenpruefung] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Kreditkartenpruefung] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Kreditkartenpruefung] SET RECOVERY FULL 
GO

ALTER DATABASE [Kreditkartenpruefung] SET  MULTI_USER 
GO

ALTER DATABASE [Kreditkartenpruefung] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Kreditkartenpruefung] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Kreditkartenpruefung] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Kreditkartenpruefung] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [Kreditkartenpruefung] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Kreditkartenpruefung] SET  READ_WRITE 
GO

