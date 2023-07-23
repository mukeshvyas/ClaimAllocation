USE [master]
GO
/****** Object:  Database [Claimallocation]    Script Date: 07/23/2023 21:42:12 ******/
CREATE DATABASE [Claimallocation] ON  PRIMARY 
( NAME = N'Claimallocation', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Claimallocation.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Claimallocation_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Claimallocation_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Claimallocation] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Claimallocation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Claimallocation] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Claimallocation] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Claimallocation] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Claimallocation] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Claimallocation] SET ARITHABORT OFF
GO
ALTER DATABASE [Claimallocation] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Claimallocation] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Claimallocation] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Claimallocation] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Claimallocation] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Claimallocation] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Claimallocation] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Claimallocation] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Claimallocation] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Claimallocation] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Claimallocation] SET  DISABLE_BROKER
GO
ALTER DATABASE [Claimallocation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Claimallocation] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Claimallocation] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Claimallocation] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Claimallocation] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Claimallocation] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Claimallocation] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Claimallocation] SET  READ_WRITE
GO
ALTER DATABASE [Claimallocation] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Claimallocation] SET  MULTI_USER
GO
ALTER DATABASE [Claimallocation] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Claimallocation] SET DB_CHAINING OFF
GO
USE [Claimallocation]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 07/23/2023 21:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[RoleId] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 07/23/2023 21:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](500) NULL,
	[FirstName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[DateOfCreation] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 07/23/2023 21:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 07/23/2023 21:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[DateOfCreation] [datetime] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimWorkflow]    Script Date: 07/23/2023 21:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimWorkflow](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClaimId] [bigint] NULL,
	[AssignerId] [bigint] NULL,
	[AssigneeId] [bigint] NULL,
	[ClaimStatusId] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_ClaimWorkflow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimStatus]    Script Date: 07/23/2023 21:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimStatus] [nvarchar](100) NULL,
 CONSTRAINT [PK_ClaimStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimDetail]    Script Date: 07/23/2023 21:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimDetail](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClaimId] [bigint] NULL,
	[CPTHCPC] [nvarchar](100) NULL,
	[AllowedAmount] [numeric](18, 2) NULL,
	[PaidAmount] [numeric](18, 2) NULL,
 CONSTRAINT [PK_ClaimDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimCommentHistory]    Script Date: 07/23/2023 21:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimCommentHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[CommentedBy] [bigint] NULL,
	[ClaimId] [bigint] NULL,
 CONSTRAINT [PK_ClaimCommentHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claim]    Script Date: 07/23/2023 21:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PatientName] [nvarchar](250) NULL,
	[ProviderName] [nvarchar](250) NULL,
	[ClaimAmount] [numeric](18, 2) NULL,
	[AllowedAmount] [numeric](18, 2) NULL,
	[PaidAmount] [numeric](18, 2) NULL,
	[ClaimStatusId] [int] NULL,
	[LastComment] [nvarchar](max) NULL,
	[ClientId] [bigint] NULL,
 CONSTRAINT [PK_Claim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
