USE [master]
GO
/****** Object:  Database [ClaimAllocation]    Script Date: 07/30/2023 22:43:59 ******/
CREATE DATABASE [ClaimAllocation] ON  PRIMARY 
( NAME = N'AlgoZy', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\AlgoZy.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AlgoZy_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\AlgoZy_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ClaimAllocation] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClaimAllocation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClaimAllocation] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ClaimAllocation] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ClaimAllocation] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ClaimAllocation] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ClaimAllocation] SET ARITHABORT OFF
GO
ALTER DATABASE [ClaimAllocation] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ClaimAllocation] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ClaimAllocation] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ClaimAllocation] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ClaimAllocation] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ClaimAllocation] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ClaimAllocation] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ClaimAllocation] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ClaimAllocation] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ClaimAllocation] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ClaimAllocation] SET  DISABLE_BROKER
GO
ALTER DATABASE [ClaimAllocation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ClaimAllocation] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ClaimAllocation] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ClaimAllocation] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ClaimAllocation] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ClaimAllocation] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ClaimAllocation] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ClaimAllocation] SET  READ_WRITE
GO
ALTER DATABASE [ClaimAllocation] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ClaimAllocation] SET  MULTI_USER
GO
ALTER DATABASE [ClaimAllocation] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ClaimAllocation] SET DB_CHAINING OFF
GO
USE [ClaimAllocation]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 07/30/2023 22:44:01 ******/
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
SET IDENTITY_INSERT [dbo].[Client] ON
INSERT [dbo].[Client] ([Id], [FullName], [Description], [DateOfCreation]) VALUES (1, N'Client 1', N'Client 1', CAST(0x0000B04E011A0738 AS DateTime))
INSERT [dbo].[Client] ([Id], [FullName], [Description], [DateOfCreation]) VALUES (2, N'Client 2', N'Client 2', CAST(0x0000B04E011A0738 AS DateTime))
SET IDENTITY_INSERT [dbo].[Client] OFF
/****** Object:  Table [dbo].[ClaimWorkflow]    Script Date: 07/30/2023 22:44:01 ******/
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
SET IDENTITY_INSERT [dbo].[ClaimWorkflow] ON
INSERT [dbo].[ClaimWorkflow] ([Id], [ClaimId], [AssignerId], [AssigneeId], [ClaimStatusId], [CreatedDate]) VALUES (1, 1, 1, 2, 1, CAST(0x0000B04E011D4E48 AS DateTime))
SET IDENTITY_INSERT [dbo].[ClaimWorkflow] OFF
/****** Object:  Table [dbo].[ClaimStatus]    Script Date: 07/30/2023 22:44:01 ******/
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
SET IDENTITY_INSERT [dbo].[ClaimStatus] ON
INSERT [dbo].[ClaimStatus] ([Id], [ClaimStatus]) VALUES (1, N'Unassigned')
INSERT [dbo].[ClaimStatus] ([Id], [ClaimStatus]) VALUES (2, N'Assigned')
INSERT [dbo].[ClaimStatus] ([Id], [ClaimStatus]) VALUES (3, N'WIP')
INSERT [dbo].[ClaimStatus] ([Id], [ClaimStatus]) VALUES (4, N'Completed')
SET IDENTITY_INSERT [dbo].[ClaimStatus] OFF
/****** Object:  Table [dbo].[ClaimDetail]    Script Date: 07/30/2023 22:44:01 ******/
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
SET IDENTITY_INSERT [dbo].[ClaimDetail] ON
INSERT [dbo].[ClaimDetail] ([Id], [ClaimId], [CPTHCPC], [AllowedAmount], [PaidAmount]) VALUES (1, 1, N'CPTHCPC', CAST(100000.00 AS Numeric(18, 2)), CAST(70000.00 AS Numeric(18, 2)))
INSERT [dbo].[ClaimDetail] ([Id], [ClaimId], [CPTHCPC], [AllowedAmount], [PaidAmount]) VALUES (2, 2, N'CPTHCPC', CAST(200000.00 AS Numeric(18, 2)), CAST(60000.00 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[ClaimDetail] OFF
/****** Object:  Table [dbo].[ClaimCommentHistory]    Script Date: 07/30/2023 22:44:01 ******/
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
SET IDENTITY_INSERT [dbo].[ClaimCommentHistory] ON
INSERT [dbo].[ClaimCommentHistory] ([Id], [Comment], [CommentedBy], [ClaimId]) VALUES (1, N'First Comment', 1, 1)
INSERT [dbo].[ClaimCommentHistory] ([Id], [Comment], [CommentedBy], [ClaimId]) VALUES (2, N'Second Comment', 1, 1)
INSERT [dbo].[ClaimCommentHistory] ([Id], [Comment], [CommentedBy], [ClaimId]) VALUES (3, N'Third Comment', 1, 1)
INSERT [dbo].[ClaimCommentHistory] ([Id], [Comment], [CommentedBy], [ClaimId]) VALUES (4, N'First Comment', 2, 2)
INSERT [dbo].[ClaimCommentHistory] ([Id], [Comment], [CommentedBy], [ClaimId]) VALUES (5, N'Second Comment', 2, 2)
SET IDENTITY_INSERT [dbo].[ClaimCommentHistory] OFF
/****** Object:  Table [dbo].[Claim]    Script Date: 07/30/2023 22:44:01 ******/
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
	[ClaimNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Claim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Claim] ON
INSERT [dbo].[Claim] ([Id], [PatientName], [ProviderName], [ClaimAmount], [AllowedAmount], [PaidAmount], [ClaimStatusId], [LastComment], [ClientId], [ClaimNo]) VALUES (1, N'Patient 1', N'Provider 1', CAST(100000.00 AS Numeric(18, 2)), CAST(100000.00 AS Numeric(18, 2)), CAST(50000.00 AS Numeric(18, 2)), 1, N'First Comment', 1, N'C101')
INSERT [dbo].[Claim] ([Id], [PatientName], [ProviderName], [ClaimAmount], [AllowedAmount], [PaidAmount], [ClaimStatusId], [LastComment], [ClientId], [ClaimNo]) VALUES (2, N'Patient 2', N'Provider 2', CAST(200000.00 AS Numeric(18, 2)), CAST(200000.00 AS Numeric(18, 2)), CAST(70000.00 AS Numeric(18, 2)), 1, N'First Comment', 2, N'C102')
SET IDENTITY_INSERT [dbo].[Claim] OFF
/****** Object:  Table [dbo].[UserRole]    Script Date: 07/30/2023 22:44:01 ******/
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
SET IDENTITY_INSERT [dbo].[UserRole] ON
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (1, 1, 1, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (2, 2, 2, 1)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
/****** Object:  Table [dbo].[User]    Script Date: 07/30/2023 22:44:01 ******/
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
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([Id], [UserName], [FirstName], [LastName], [Password], [IsActive], [DateOfCreation]) VALUES (1, N'Mukesh Vyas', N'Mukesh', N'Vyas', N'123456', 1, CAST(0x0000B04E01175754 AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [FirstName], [LastName], [Password], [IsActive], [DateOfCreation]) VALUES (2, N'Amit Sharma', N'Amit', N'Sharma', N'123456', 1, CAST(0x0000B04E01175754 AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[Role]    Script Date: 07/30/2023 22:44:01 ******/
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
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [IsActive]) VALUES (1, N'Manager', N'Manager', 1)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [IsActive]) VALUES (2, N'Agent', N'Agent', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
/****** Object:  StoredProcedure [dbo].[GetClaimlist]    Script Date: 07/30/2023 22:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClaimlist]
	
AS
BEGIN
	Select FullName As ClientName,ClaimNo,PatientName,ProviderName,claimstatus.ClaimStatus,AllowedAmount,PaidAmount,LastComment,[User].UserName as AssignedTo 
	from Claim 
	Inner join client on Claim.ClientId=Client.id
	Inner join claimstatus on claimstatus.id =Claim.ClaimStatusId
	Left join (select Max(ID) As MaxID,claimID from [ClaimWorkflow] group by claimid) as MaxClaimStatus on MaxClaimStatus.claimID=Claim.ID
	Left join [ClaimWorkflow] on [ClaimWorkflow].Id =MaxClaimStatus.MaxID
	Left join [User] on [User].Id =[ClaimWorkflow].AssigneeId 
	order by [ClaimWorkflow].CreatedDate
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateClaim]    Script Date: 07/30/2023 22:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateClaim] 
	@ClaimId BIGINT,
	@ClaimStatusId	INT,
	@ClaimComment NVARCHAR(Max),
	@CommentedBy INT
AS
BEGIN
	
	DECLARE @AssignerId BIGINT,@MaxId BIGINT
	
	INSERT INTO dbo.ClaimCommentHistory
	        ( Comment, CommentedBy, ClaimId )
	VALUES  ( @ClaimComment, -- Comment - nvarchar(max)
	          @CommentedBy, -- CommentedBy - bigint
	          @ClaimId  -- ClaimId - bigint
	          )
	
	UPDATE dbo.Claim SET ClaimStatusId =@ClaimStatusId,LastComment =@ClaimComment WHERE Id=@ClaimId

	SELECT @MaxId =MAX(id) FROM ClaimWorkflow WITH(NOLOCK) WHERE ClaimId =@ClaimId
	
	SELECT @AssignerId=AssignerId FROM dbo.ClaimWorkflow WHERE id=@MaxId
		
	
	INSERT dbo.ClaimWorkflow
	        ( ClaimId ,
	          AssignerId ,
	          AssigneeId ,
	          ClaimStatusId ,
	          CreatedDate
	        )
	VALUES  ( @ClaimId , -- ClaimId - bigint
	          @AssignerId , -- AssignerId - bigint
	          @CommentedBy , -- AssigneeId - bigint
	          @ClaimStatusId , -- ClaimStatusId - int
	          GETDATE()  -- CreatedDate - datetime
	        )	
	
END
GO
