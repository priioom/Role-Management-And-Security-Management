USE [master]
GO
/****** Object:  Database [Role_N_User_N_Page_Management]    Script Date: 10/19/2019 9:39:59 PM ******/
CREATE DATABASE [Role_N_User_N_Page_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Role_N_User_N_Page_Management', FILENAME = N'G:\Role_User_Page_Management\Role_User_Page_Management_Database\Role_N_User_N_Page_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Role_N_User_N_Page_Management_log', FILENAME = N'G:\Role_User_Page_Management\Role_User_Page_Management_Database\Role_N_User_N_Page_Management_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Role_N_User_N_Page_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET QUERY_STORE = OFF
GO
USE [Role_N_User_N_Page_Management]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Role_N_User_N_Page_Management]
GO
/****** Object:  Table [dbo].[AccessArea]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessArea](
	[AccessAreaId] [int] IDENTITY(1,1) NOT NULL,
	[AceessArea] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[AddBy] [int] NULL,
	[AddDate] [datetime] NULL,
	[Modifyby] [int] NULL,
	[ModifyDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccessAreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagePath]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagePath](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [varchar](50) NULL,
	[ImagePath] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModuleInfo]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleInfo](
	[ModuleId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleName] [varchar](100) NOT NULL,
	[ModuleIcon] [varchar](100) NULL,
	[HostInfo] [varchar](250) NULL,
	[URL] [varchar](200) NULL,
	[ParentModuleID] [int] NULL,
	[Priority] [int] NULL,
	[IsActive] [bit] NULL,
	[AddBy] [int] NULL,
	[AddDate] [datetime] NULL,
	[Modifyby] [int] NULL,
	[ModifyDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageInfo]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageInfo](
	[PageId] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [varchar](100) NOT NULL,
	[URL] [varchar](200) NULL,
	[Description] [varchar](200) NULL,
	[ModuleId] [int] NULL,
	[Rank] [int] NULL,
	[IsActive] [bit] NULL,
	[AddBy] [int] NULL,
	[AddDate] [datetime] NULL,
	[Modifyby] [int] NULL,
	[ModifyDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolBranch]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolBranch](
	[BranchId] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [varchar](50) NULL,
	[Code] [char](3) NULL,
	[BranchAddress] [varchar](100) NULL,
	[SchoolId] [int] NULL,
	[IsActive] [bit] NULL,
	[AddBy] [int] NULL,
	[AddDate] [datetime] NULL,
	[Modifyby] [int] NULL,
	[ModifyDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolMaster]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolMaster](
	[SchoolId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolName] [varchar](50) NULL,
	[SchoolCode] [char](3) NULL,
	[SchoolAddress] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Website] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[AddBy] [int] NULL,
	[AddDate] [datetime] NULL,
	[Modifyby] [int] NULL,
	[ModifyDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[PhoneOffice] [varchar](20) NULL,
	[PhonePersonal] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[EmpId] [int] NULL,
	[PresentAddress] [varchar](200) NULL,
	[ParmanentAddress] [varchar](200) NULL,
	[RoleId] [int] NULL,
	[BranchId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[AddBy] [int] NULL,
	[AddDate] [datetime] NULL,
	[Modifyby] [int] NULL,
	[ModifyDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoleDetail]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleDetail](
	[UserRoleDetailId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[PageId] [int] NOT NULL,
	[IsAccess] [bit] NULL,
	[IsRead] [bit] NULL,
	[IsWrite] [bit] NULL,
	[IsEdit] [bit] NULL,
	[AccessArea] [int] NULL,
	[AddBy] [int] NULL,
	[AddDate] [datetime] NULL,
	[Modifyby] [int] NULL,
	[ModifyDate] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRoleDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoleMaster]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleMaster](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[AddBy] [int] NULL,
	[AddDate] [datetime] NULL,
	[Modifyby] [int] NULL,
	[ModifyDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VersionControl]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionControl](
	[ProjectTitle] [varchar](50) NULL,
	[VersionTitle] [varchar](50) NULL,
	[VersionNo] [int] NULL,
	[SubVersionNo] [int] NULL,
	[TaskNo] [int] IDENTITY(1,1) NOT NULL,
	[ReleaseDate] [date] NULL,
	[Description] [varchar](300) NULL,
	[IsActive] [bit] NULL,
	[AddBy] [int] NULL,
	[AddDate] [datetime] NULL,
	[ModifyBy] [int] NULL,
	[ModifyDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccessArea] ON 

INSERT [dbo].[AccessArea] ([AccessAreaId], [AceessArea], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1, N'Every Where', N'Every Where', 1, 1, CAST(N'2019-02-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[AccessArea] ([AccessAreaId], [AceessArea], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (2, N'Dhaka', N'Only Dhaka', 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AccessArea] OFF
SET IDENTITY_INSERT [dbo].[ImagePath] ON 

INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (1, N'', N'Image/')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (2, N'31asdhj75458956.jpg', N'~/Image/31asdhj75458956.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (3, N'download.png', N'~/Image/download.png')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (4, N'accept.png', N'~/Image/accept.png')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (5, N'listview.JPG', N'~/Image/listview.JPG')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (6, N'images (3).jpg', N'~/Image/images (3).jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (7, N'40akram75458956.jpg', N'~/Image/40akram75458956.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (8, N'tweezed-eyebrows-embed-v.jpg', N'~/Image/tweezed-eyebrows-embed-v.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (9, N'tweezed-eyebrows-embed-v.jpg', N'~/Image/tweezed-eyebrows-embed-v.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (10, N'tweezed-eyebrows-embed-v.jpg', N'~/Image/tweezed-eyebrows-embed-v.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (11, N'tweezed-eyebrows-embed-v.jpg', N'~/Image/tweezed-eyebrows-embed-v.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (12, N'tweezed-eyebrows-embed-v.jpg', N'~/Image/tweezed-eyebrows-embed-v.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (13, N'tweezed-eyebrows-embed-v.jpg', N'~/Image/tweezed-eyebrows-embed-v.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (14, N'tweezed-eyebrows-embed-v.jpg', N'~/Image/tweezed-eyebrows-embed-v.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (15, N'tweezed-eyebrows-embed-v.jpg', N'~/Image/tweezed-eyebrows-embed-v.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (19, N'images (3).jpg', N'~/Image/images (3).jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (21, N'Farhan75458956', N'~/Image/Farhan75458956')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (22, N'Farhan75458956', N'~/Image/Farhan75458956')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (23, N'Priom01715842039.jpg', N'~/Image/Priom01715842039.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (24, N'Priom01715842039.jpg', N'~/Image/Priom01715842039.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (25, N'Priom01715842039.jpg', N'~/Image/Priom01715842039.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (26, N'Priom01715842039.jpg', N'~/Image/Priom01715842039.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (27, N'Priom01715842039.jpg', N'~/Image/Priom01715842039.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (28, N'Priom01715842039.jpg', N'~/Image/Priom01715842039.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (29, N'Priom01715842039.png', N'~/Image/Priom01715842039.png')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (30, N'Priom01715842039', N'~/Image/Priom01715842039')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (31, N'Priom01715842039.png', N'~/Image/Priom01715842039.png')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (32, N'Farhan75458956.png', N'~/Image/Farhan75458956.png')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (1027, N'Priom01715842039.jpg', N'~/Image/Priom01715842039.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (2027, N'10erwe01715842039.jpg', N'~/Image/10erwe01715842039.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (2028, N'27erwe01715842039.jpg', N'~/Image/27erwe01715842039.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (2029, N'08akram75458956.jpg', N'~/Image/08akram75458956.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (2030, N'13akram75458956.jpg', N'~/Image/13akram75458956.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (2031, N'13akram75458956.jpg', N'~/Image/13akram75458956.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (2032, N'48akram75458956.jpg', N'~/Image/48akram75458956.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (2033, N'41asdhj75458956.jpg', N'~/Image/41asdhj75458956.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (2034, N'48Ferdous75458956.jpg', N'~/Image/48Ferdous75458956.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (2035, N'16Bidhan33333333333.jpg', N'~/Image/16Bidhan33333333333.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (2036, N'38Bidhan34234.jpg', N'~/Image/38Bidhan34234.jpg')
INSERT [dbo].[ImagePath] ([Id], [ImageName], [ImagePath]) VALUES (2037, N'28asdhj75458956.jpg', N'~/Image/28asdhj75458956.jpg')
SET IDENTITY_INSERT [dbo].[ImagePath] OFF
SET IDENTITY_INSERT [dbo].[ModuleInfo] ON 

INSERT [dbo].[ModuleInfo] ([ModuleId], [ModuleName], [ModuleIcon], [HostInfo], [URL], [ParentModuleID], [Priority], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1, N'Home', N'fa fa-home', NULL, N'../../UI/Dashboard.aspx', NULL, 1, 1, 1, CAST(N'2019-01-02T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ModuleInfo] ([ModuleId], [ModuleName], [ModuleIcon], [HostInfo], [URL], [ParentModuleID], [Priority], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (2, N'User Management', N'fa fa-user', NULL, N'#', NULL, 2, 1, 1, CAST(N'2018-02-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ModuleInfo] ([ModuleId], [ModuleName], [ModuleIcon], [HostInfo], [URL], [ParentModuleID], [Priority], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (6, N'Role Management', N'fa fa-edit', NULL, N'#', NULL, 3, 1, 1, CAST(N'2014-02-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ModuleInfo] ([ModuleId], [ModuleName], [ModuleIcon], [HostInfo], [URL], [ParentModuleID], [Priority], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (7, N'Accounts', N'fa fa-balance-scale', NULL, N'#', 0, 4, 1, 0, CAST(N'2019-05-06T10:58:35.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ModuleInfo] ([ModuleId], [ModuleName], [ModuleIcon], [HostInfo], [URL], [ParentModuleID], [Priority], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1007, N'Admission', N'fa fa-university', NULL, N'#', 0, 8, 1, 0, CAST(N'2019-05-25T10:55:23.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ModuleInfo] ([ModuleId], [ModuleName], [ModuleIcon], [HostInfo], [URL], [ParentModuleID], [Priority], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (2007, N'General Settings', N'fa fa-cogs custom', NULL, N'#', 0, 11, 1, 0, CAST(N'2019-07-10T10:13:43.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ModuleInfo] ([ModuleId], [ModuleName], [ModuleIcon], [HostInfo], [URL], [ParentModuleID], [Priority], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (2008, N'Exam', N'fa fa-puzzle-piece custom', NULL, N'#', 0, 15, 1, 0, CAST(N'2019-07-10T10:20:24.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ModuleInfo] OFF
SET IDENTITY_INSERT [dbo].[PageInfo] ON 

INSERT [dbo].[PageInfo] ([PageId], [PageName], [URL], [Description], [ModuleId], [Rank], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1, N'Home', N'../../UI/Dashboard.aspx', N'Dashboard', 1, 1, 0, 1, CAST(N'2018-01-02T00:00:00.000' AS DateTime), 5, CAST(N'2019-05-06T12:26:10.000' AS DateTime))
INSERT [dbo].[PageInfo] ([PageId], [PageName], [URL], [Description], [ModuleId], [Rank], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (2, N'User Management', N'#', N'User Management', 2, 2, 0, 1, CAST(N'2018-02-04T00:00:00.000' AS DateTime), 5, CAST(N'2019-05-04T17:13:11.000' AS DateTime))
INSERT [dbo].[PageInfo] ([PageId], [PageName], [URL], [Description], [ModuleId], [Rank], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (3, N'User Registration', N'../../UI/UserManagement/Registration.aspx', N'User Registration', 2, 2, 1, 1, CAST(N'2018-02-02T00:00:00.000' AS DateTime), 5, CAST(N'2019-05-16T10:10:03.000' AS DateTime))
INSERT [dbo].[PageInfo] ([PageId], [PageName], [URL], [Description], [ModuleId], [Rank], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (4, N'Change Password', N'../../UI/UserManagement/ChangePassWord.aspx', N'Change Password', 2, 2, 1, 1, CAST(N'2018-02-20T00:00:00.000' AS DateTime), 5, CAST(N'2019-05-16T10:09:21.000' AS DateTime))
INSERT [dbo].[PageInfo] ([PageId], [PageName], [URL], [Description], [ModuleId], [Rank], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (5, N'Create Page', N'../../UI/Security/CreatePage.aspx', N'Page Creation will be handle From Here', 6, 6, 1, 1, CAST(N'2018-02-04T00:00:00.000' AS DateTime), 5, CAST(N'2019-05-04T17:13:03.000' AS DateTime))
INSERT [dbo].[PageInfo] ([PageId], [PageName], [URL], [Description], [ModuleId], [Rank], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (6, N'Configure Role', N'../../UI/Security/ConfigureRole.aspx', N'Role Will Be Configured From Here', 6, 6, 1, 1, CAST(N'2014-02-01T00:00:00.000' AS DateTime), 5, CAST(N'2019-05-04T17:13:00.000' AS DateTime))
INSERT [dbo].[PageInfo] ([PageId], [PageName], [URL], [Description], [ModuleId], [Rank], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (16, N'Create Role', N'../../UI/Security/CreateRole.aspx', N'Role will be Created From Here', 6, 6, 1, 1, CAST(N'2014-02-04T00:00:00.000' AS DateTime), 5, CAST(N'2019-05-04T17:12:57.000' AS DateTime))
INSERT [dbo].[PageInfo] ([PageId], [PageName], [URL], [Description], [ModuleId], [Rank], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (17, N'Version Control', N'../../UI/Security/VersionControl.aspx', N'Version Controling Will Be Done From Here', 6, 6, 1, 1, CAST(N'2014-02-04T00:00:00.000' AS DateTime), 5, CAST(N'2019-05-04T17:12:53.000' AS DateTime))
INSERT [dbo].[PageInfo] ([PageId], [PageName], [URL], [Description], [ModuleId], [Rank], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (66, N'Create Module', N'../../UI/Security/CreateModule.aspx', N'Module will be Created From Here.', 6, NULL, 1, 5, CAST(N'2019-05-04T13:08:43.000' AS DateTime), 5, CAST(N'2019-05-04T17:12:50.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[PageInfo] OFF
SET IDENTITY_INSERT [dbo].[SchoolBranch] ON 

INSERT [dbo].[SchoolBranch] ([BranchId], [BranchName], [Code], [BranchAddress], [SchoolId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (4, N'sfs', N'dff', N'sdasd', 3, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[SchoolBranch] ([BranchId], [BranchName], [Code], [BranchAddress], [SchoolId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (6, N'sdsd', N'dff', N'sdsd', 4, 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SchoolBranch] OFF
SET IDENTITY_INSERT [dbo].[SchoolMaster] ON 

INSERT [dbo].[SchoolMaster] ([SchoolId], [SchoolName], [SchoolCode], [SchoolAddress], [City], [Country], [Phone], [Fax], [Email], [Website], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (3, N'sdd', N'qwe', N'ewe', N'www', N'sdd', N'234', N'232', N'232dd', N'wd', 1, 1, CAST(N'2014-02-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SchoolMaster] ([SchoolId], [SchoolName], [SchoolCode], [SchoolAddress], [City], [Country], [Phone], [Fax], [Email], [Website], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (4, N'asa', N'asa', N'asa', N'asas', N'sasa', NULL, NULL, NULL, NULL, 1, 1, CAST(N'2018-02-04T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[SchoolMaster] OFF
SET IDENTITY_INSERT [dbo].[UserMaster] ON 

INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (5, N'Priom', N'Sarkar', N'Priom', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', N'01743229629', N'017425632789', N'p@gmail.com', 1, N'nikunja 2 - Khilkhet', N'Tangail Sadar', 1, 4, 1, 1, CAST(N'2014-10-02T00:00:00.000' AS DateTime), 1013, CAST(N'2019-10-19T16:54:39.000' AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (8, N'admin', N'ad', N'min', N'A94A8FE5CCB19BA61C4C0873D391E987982FBBD3', N'120', N'014785236', N'ad@gmail.com', 2, N'Gulshan', N'Upashar Rajshahi', 1012, 6, 1, 1, CAST(N'2014-02-02T00:00:00.000' AS DateTime), 8, CAST(N'2019-05-22T11:22:21.000' AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (9, N'Priom', N'Sarkar', N'Shentu', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', N'0752856277', N'01743229629', N'Shentu@gmail.com', 3, N'18/d Tallabag, Dhaka-1207', N'Tarash, Sirajganj', 1, 6, 1, 5, CAST(N'2019-05-16T15:11:43.000' AS DateTime), 5, CAST(N'2019-05-22T10:58:22.000' AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (10, N'New User', N'User Last Name', N'Admin(Teacher)', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', N'01752856277', N'1743229629', N'Shent@gmail.co', 2, N'Banani, Dhaka-1215', N'Tarash, Sirajganj', 1007, 4, 1, 5, CAST(N'2019-05-16T15:14:11.000' AS DateTime), 5, CAST(N'2019-05-22T10:58:51.000' AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (11, N'asd', N'adsad', N'sadads', N'wew', N'023', N'01', N'ads', 3, N'adsadas', N'adsadasda', 1010, 6, 1, 5, CAST(N'2019-05-20T14:18:17.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (12, N'sas', N'asa', N'sas', N'asa', N'125', N'01743229629', N'sasa', 452, N'ere', N'rere', 2, 4, 1, 5, CAST(N'2019-05-20T14:28:12.000' AS DateTime), 5, CAST(N'2019-05-20T14:35:19.000' AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (13, N'khkhkh', N'Sarkar', N'sdsd', N'123', N'0752856277', N'01743229629', N'asdsd', 3, N'dssd', N'e343rer', 1007, 4, 1, 5, CAST(N'2019-05-20T14:34:16.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (14, N'Priom', N'Sarkar', N'Shentu1425', N'DA39A3EE5E6B4B0D3255BFEF95601890AFD80709', N'0752856277', N'01743229629', N'asdsd', 3, N'sdad', N'sdasd', 1, 6, 1, 5, CAST(N'2019-05-20T14:43:46.000' AS DateTime), 5, CAST(N'2019-05-22T10:13:20.000' AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1009, N'New ', N'Hash', N'New ', N'F7C3BC1D808E04732ADF679965CCC34CA7AE3441', N'0752856277', N'01743229629', N'fsds', 3, N'dfsdf', N'sdfsf', 2, 4, 1, 5, CAST(N'2019-05-22T09:56:36.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1010, N'New', N'asa', N'Priom2469', N'F7C3BC1D808E04732ADF679965CCC34CA7AE3441', N'123456', N'12345', N'asdsd', 3, N'dff', N'dfdf', 1007, 6, 1, 5, CAST(N'2019-05-22T09:59:44.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1011, N'Admin', N'Admin', N'Admin', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', N'0154885', N'054844', N'Admin@gmail.Com', 1, N'sdasds', N'sdsds', 1, 4, 1, 5, CAST(N'2019-05-22T10:09:12.000' AS DateTime), 5, CAST(N'2019-05-22T11:37:07.000' AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1012, N'Bashar', N'sir', N'Mr.Bashar', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', N'0752856277', N'01743229629', N'basar@gmail.com', 1, N'Banani,Dhaka', N'Naogan', 1, 6, 1, 5, CAST(N'2019-05-22T11:15:01.000' AS DateTime), 1012, CAST(N'2019-05-22T11:17:24.000' AS DateTime))
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [UserName], [Password], [PhoneOffice], [PhonePersonal], [Email], [EmpId], [PresentAddress], [ParmanentAddress], [RoleId], [BranchId], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1013, N'Priom', N'Sarkar', N'PS', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', N'05147', N'152436', N'ps@gmail.com', 101, N'asdadad', N'asdasda', 1, 4, 1, 5, CAST(N'2019-10-19T13:30:37.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
SET IDENTITY_INSERT [dbo].[UserRoleDetail] ON 

INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (2, 1, 1, 1, 1, 1, 1, 1, 1, CAST(N'2018-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (4, 1, 2, 1, 1, 1, 1, 1, 1, CAST(N'2019-10-02T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (5, 1, 3, 1, 1, 1, 1, 2, 1, CAST(N'2019-02-04T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (6, 1, 4, 1, 1, 1, 1, 2, 1, CAST(N'2014-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (8, 2, 4, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-05T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (9, 1, 5, 1, 1, 1, 1, 2, 1, CAST(N'2019-02-04T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (10, 1, 6, 1, 1, 1, 1, 1, 1, CAST(N'2019-04-02T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (11, 1, 16, 1, 1, 1, 1, 1, 1, CAST(N'2019-02-04T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (12, 1, 17, 1, 1, 1, 1, 2, 1, CAST(N'2014-02-02T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (13, 2, 6, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (14, 2, 1, 1, 1, 1, 1, 2, 1, CAST(N'2018-02-04T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (53, 1, 66, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-04T13:08:43.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1056, 2, 2, 0, 0, 0, 0, 1, 5, NULL, NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1057, 2, 3, 1, 1, 1, 1, 1, 5, NULL, NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1058, 2, 5, 0, 0, 0, 0, 1, 5, NULL, NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1059, 2, 16, 0, 0, 0, 0, 1, 5, NULL, NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1060, 2, 17, 0, 0, 0, 0, 1, 5, NULL, NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1061, 2, 66, 0, 0, 0, 0, 1, 5, NULL, NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1073, 1007, 1, 0, 0, 0, 0, 2, 5, CAST(N'2019-05-09T13:20:05.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1074, 1007, 2, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:20:05.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1075, 1007, 3, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:20:05.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1076, 1007, 4, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:20:05.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1077, 1007, 5, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:20:05.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1078, 1007, 6, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:20:05.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1079, 1007, 16, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:20:05.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1080, 1007, 17, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:20:05.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1081, 1007, 66, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:20:05.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1083, 1008, 1, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:07.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1084, 1008, 2, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:07.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1085, 1008, 3, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:07.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1086, 1008, 4, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:07.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1087, 1008, 5, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:07.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1088, 1008, 6, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:07.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1089, 1008, 16, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:07.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1090, 1008, 17, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:07.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1091, 1008, 66, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:07.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1093, 1009, 1, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1094, 1009, 2, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1095, 1009, 3, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1096, 1009, 4, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1097, 1009, 5, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1098, 1009, 6, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1099, 1009, 16, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1100, 1009, 17, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1101, 1009, 66, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:25:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1103, 1010, 1, 1, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:28:39.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1104, 1010, 2, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:28:39.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1105, 1010, 3, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:28:39.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1106, 1010, 4, 1, 0, 0, 1, 1, 5, CAST(N'2019-05-09T13:28:39.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1107, 1010, 5, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:28:39.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1108, 1010, 6, 1, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:28:39.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1109, 1010, 16, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:28:39.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1110, 1010, 17, 1, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:28:39.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1111, 1010, 66, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:28:39.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1113, 1011, 1, 1, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:29:26.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1114, 1011, 2, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:29:26.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1115, 1011, 3, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:29:26.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1116, 1011, 4, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:29:26.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1117, 1011, 5, 1, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:29:26.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1118, 1011, 6, 1, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:29:26.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1119, 1011, 16, 1, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:29:26.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1120, 1011, 17, 0, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:29:26.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1121, 1011, 66, 1, 0, 0, 0, 1, 5, CAST(N'2019-05-09T13:29:26.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1123, 1012, 1, 0, 0, 0, 0, 1, 1012, CAST(N'2019-05-22T11:18:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1124, 1012, 2, 0, 0, 0, 0, 1, 1012, CAST(N'2019-05-22T11:18:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1125, 1012, 3, 0, 0, 0, 0, 1, 1012, CAST(N'2019-05-22T11:18:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1126, 1012, 4, 1, 1, 1, 1, 2, 1012, CAST(N'2019-05-22T11:18:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1127, 1012, 5, 0, 0, 0, 0, 1, 1012, CAST(N'2019-05-22T11:18:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1128, 1012, 6, 0, 0, 0, 0, 1, 1012, CAST(N'2019-05-22T11:18:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1129, 1012, 16, 0, 0, 0, 0, 1, 1012, CAST(N'2019-05-22T11:18:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1130, 1012, 17, 0, 0, 0, 0, 1, 1012, CAST(N'2019-05-22T11:18:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[UserRoleDetail] ([UserRoleDetailId], [RoleId], [PageId], [IsAccess], [IsRead], [IsWrite], [IsEdit], [AccessArea], [AddBy], [AddDate], [Modifyby], [ModifyDate], [IsActive]) VALUES (1131, 1012, 66, 0, 0, 0, 0, 1, 1012, CAST(N'2019-05-22T11:18:53.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[UserRoleDetail] OFF
SET IDENTITY_INSERT [dbo].[UserRoleMaster] ON 

INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1, N'Admin', N'Admin Have full Control To The System', 1, 1, NULL, 5, CAST(N'2019-05-06T17:03:53.000' AS DateTime))
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (2, N'Student', N'Student Have Result Section', 1, 1, NULL, 5, CAST(N'2019-05-06T17:04:33.000' AS DateTime))
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (3, N'Teacher', N'Lecture Will be Controlled From Here', 0, 5, CAST(N'2019-05-06T16:28:54.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (4, N'Accountant', N'Accounts will be controlled by Accountant', 0, 5, CAST(N'2019-05-06T16:46:54.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (5, N'43243432hkasgdagudagfyuf', N'Username', 0, 5, CAST(N'2019-05-06T17:04:53.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (6, N'Create Role', N'Dashboard', 0, 5, CAST(N'2019-05-06T17:05:11.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (7, N'Create Module', N'Username', 0, 5, CAST(N'2019-05-06T17:08:04.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1003, N'Software', N'Software Section Will Be Handled By This', 0, 5, CAST(N'2019-05-09T13:05:51.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1004, N'New Role', N'New Role For Check', 0, 5, CAST(N'2019-05-09T13:07:40.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1005, N'Finance', N'Finance section will be handled here', 0, 5, CAST(N'2019-05-09T13:12:47.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1006, N'Finance', N'Finance section will be handled here', 0, 5, CAST(N'2019-05-09T13:18:38.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1007, N'Finance', N'Finance section will be handled here', 1, 5, CAST(N'2019-05-09T13:20:05.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1008, N'Accountant', N'Accounts Will be Handled Here', 0, 5, CAST(N'2019-05-09T13:25:07.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1009, N'Software', N'Software Will Be Handled Here ', 0, 5, CAST(N'2019-05-09T13:25:53.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1010, N'Accountant', N'Accounts Will Be Handle Here', 1, 5, CAST(N'2019-05-09T13:28:39.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1011, N'Teacher', N'Teacher Manages There Lecture From Here', 1, 5, CAST(N'2019-05-09T13:29:26.000' AS DateTime), NULL, NULL)
INSERT [dbo].[UserRoleMaster] ([RoleId], [RoleName], [Description], [IsActive], [AddBy], [AddDate], [Modifyby], [ModifyDate]) VALUES (1012, N'Test Role', N'Testing purpose', 1, 1012, CAST(N'2019-05-22T11:18:53.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserRoleMaster] OFF
SET IDENTITY_INSERT [dbo].[VersionControl] ON 

INSERT [dbo].[VersionControl] ([ProjectTitle], [VersionTitle], [VersionNo], [SubVersionNo], [TaskNo], [ReleaseDate], [Description], [IsActive], [AddBy], [AddDate], [ModifyBy], [ModifyDate]) VALUES (N'RUPM', N'Modification', 1, 0, 1, CAST(N'2019-07-05' AS Date), N'proEMS Modifications', 1, 5, CAST(N'2019-05-15T12:14:10.000' AS DateTime), 5, CAST(N'2019-05-15T15:18:46.000' AS DateTime))
INSERT [dbo].[VersionControl] ([ProjectTitle], [VersionTitle], [VersionNo], [SubVersionNo], [TaskNo], [ReleaseDate], [Description], [IsActive], [AddBy], [AddDate], [ModifyBy], [ModifyDate]) VALUES (N'RUPM', N'Modification', 1, 0, 2, CAST(N'2019-07-05' AS Date), N'Checking 2ndTime', 0, 5, CAST(N'2019-05-15T12:15:19.000' AS DateTime), 5, CAST(N'2019-05-15T15:24:48.000' AS DateTime))
INSERT [dbo].[VersionControl] ([ProjectTitle], [VersionTitle], [VersionNo], [SubVersionNo], [TaskNo], [ReleaseDate], [Description], [IsActive], [AddBy], [AddDate], [ModifyBy], [ModifyDate]) VALUES (N'RUPM', N'Modification', 1, 0, 3, CAST(N'2019-07-05' AS Date), N'Checking 2ndTime', 0, 5, CAST(N'2019-05-15T12:15:38.000' AS DateTime), NULL, NULL)
INSERT [dbo].[VersionControl] ([ProjectTitle], [VersionTitle], [VersionNo], [SubVersionNo], [TaskNo], [ReleaseDate], [Description], [IsActive], [AddBy], [AddDate], [ModifyBy], [ModifyDate]) VALUES (N'RUPM', N'Modification', 1, 0, 4, CAST(N'2019-07-05' AS Date), N'This is a new version', 1, 5, CAST(N'2019-05-15T12:15:44.000' AS DateTime), 5, CAST(N'2019-05-15T15:16:20.000' AS DateTime))
INSERT [dbo].[VersionControl] ([ProjectTitle], [VersionTitle], [VersionNo], [SubVersionNo], [TaskNo], [ReleaseDate], [Description], [IsActive], [AddBy], [AddDate], [ModifyBy], [ModifyDate]) VALUES (N'RUPM', N'Addition', 1, 0, 5, CAST(N'2019-05-25' AS Date), N'Simple Modification', 1, 5, CAST(N'2019-05-15T14:09:33.000' AS DateTime), NULL, NULL)
INSERT [dbo].[VersionControl] ([ProjectTitle], [VersionTitle], [VersionNo], [SubVersionNo], [TaskNo], [ReleaseDate], [Description], [IsActive], [AddBy], [AddDate], [ModifyBy], [ModifyDate]) VALUES (N'RUPM', N'Addition', 1, 0, 6, CAST(N'2025-12-31' AS Date), N'Checking Final Time', 1, 5, CAST(N'2019-05-15T14:11:30.000' AS DateTime), NULL, NULL)
INSERT [dbo].[VersionControl] ([ProjectTitle], [VersionTitle], [VersionNo], [SubVersionNo], [TaskNo], [ReleaseDate], [Description], [IsActive], [AddBy], [AddDate], [ModifyBy], [ModifyDate]) VALUES (N'RUPM', N'Addition', 1, 0, 7, CAST(N'2023-07-19' AS Date), N'Checking  Update', 0, 5, CAST(N'2019-05-15T14:31:22.000' AS DateTime), 5, CAST(N'2019-05-15T15:15:21.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[VersionControl] OFF
ALTER TABLE [dbo].[PageInfo]  WITH NOCHECK ADD FOREIGN KEY([ModuleId])
REFERENCES [dbo].[ModuleInfo] ([ModuleId])
GO
ALTER TABLE [dbo].[SchoolBranch]  WITH CHECK ADD FOREIGN KEY([SchoolId])
REFERENCES [dbo].[SchoolMaster] ([SchoolId])
GO
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD FOREIGN KEY([BranchId])
REFERENCES [dbo].[SchoolBranch] ([BranchId])
GO
ALTER TABLE [dbo].[UserMaster]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRoleMaster] ([RoleId])
GO
ALTER TABLE [dbo].[UserRoleDetail]  WITH CHECK ADD FOREIGN KEY([AccessArea])
REFERENCES [dbo].[AccessArea] ([AccessAreaId])
GO
ALTER TABLE [dbo].[UserRoleDetail]  WITH CHECK ADD FOREIGN KEY([PageId])
REFERENCES [dbo].[PageInfo] ([PageId])
GO
ALTER TABLE [dbo].[UserRoleDetail]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRoleMaster] ([RoleId])
GO
/****** Object:  StoredProcedure [dbo].[Get_User_Accessibility]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_User_Accessibility]
@RID int,
@URL varchar(50)
AS
BEGIN
	-- EXEC Get_User_Accessibility 1,'frmContainerSetup.aspx'
	
	SET NOCOUNT ON;

	SELECT 
		URD.IsWrite,
		URD.IsEdit,
		URD.IsRead,
		URD.IsAccess 
	FROM 
		UserRoleDetail URD INNER JOIN 
		PageInfo PI ON URD.PageID=PI.PageID 
	WHERE 
		URD.RoleID=@RID AND 
		PI.URL=@URL AND 		
		PI.IsActive='True'



END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ModuleinfoInsert]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Sp_ModuleinfoInsert] 
(   

--Exec [Sp_ModuleinfoInsert]  @mname,@micon,@mUrl,@PMID,@Priority,@IsActive,@Add,@AddDate,'Insert'
@mname VARCHAR(100), 
@micon varchar(100), 
@mUrl VARCHAR(200),  
@PMID int,  
@Priority  int,
@IsActive bit,
@Add int,
@AddDate datetime,  
@StatementType nvarchar(20) = ''  
)  
AS  
BEGIN  
IF @StatementType = 'Insert'  
BEGIN  
insert into ModuleInfo (ModuleName,ModuleIcon,URL,ParentModuleID,[Priority],IsActive,AddBy,AddDate) values( @mname, @micon, @mUrl , @PMID,@Priority, @IsActive,@Add,@AddDate) 
SELECT CAST(scope_identity() AS int) 
END 
end
GO
/****** Object:  StoredProcedure [dbo].[Sp_PageInfoInsertUpdateDelete]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Select * from PageInfo
--------- EXEC Sp_PageInfoInsertUpdateDelete @Pid,@Pname,@PUrl,@PDesc,@ModulID,@IsActive,@Add,@AddDate,@StatementType
-- EXEC Sp_PageInfoInsertUpdateDelete '19','Priom','Priom','Priom',6,1,1,'2014-10-02 00:00:00.000', 'Update' 
-- EXEC Sp_PageInfoInsertUpdateDelete '','Priom','Priom','Priom',6,1,1,'2014-10-02 00:00:00.000', 'Insert' 
--EXEC Sp_PageInfoInsertUpdateDelete '','','','','','','','', 'Select'

CREATE PROCEDURE [dbo].[Sp_PageInfoInsertUpdateDelete] 
(  
@Pid int,  
@Pname VARCHAR(100),  
@PUrl VARCHAR(200),  
@PDesc Varchar(200),  
@ModulID  int,
@IsActive bit,
@Add int,
@AddDate datetime,  
@StatementType nvarchar(20) = ''  
)  
AS  
BEGIN  
IF @StatementType = 'Insert'  
BEGIN  
insert into PageInfo (PageName,URL,[Description],ModuleId,IsActive,AddBy,AddDate) values( @Pname, @PUrl, @PDesc, @ModulID, @IsActive,@Add,@AddDate) 
SELECT CAST(scope_identity() AS int) 
END  
IF @StatementType = 'Update'  
BEGIN  
UPDATE PageInfo SET  
PageName = @Pname, URL = @PUrl, [Description] = @PDesc, ModuleId= @ModulID,Modifyby=@Add, ModifyDate=@AddDate
  
WHERE PageId = @Pid  
END  
else IF @StatementType = 'Delete'  
BEGIN  
UPDATE PageInfo SET IsActive=0 WHERE PageId = @Pid   
END  

else IF @StatementType = 'Select'  
BEGIN 
Select [PageId],[PageName],p.[URL],[Description],p.[ModuleId],m.ModuleName, p.IsActive from PageInfo p join ModuleInfo m on p.ModuleId = m.ModuleId Order by [PageId] DESC
END
end  
GO
/****** Object:  StoredProcedure [dbo].[Sp_RegistrationInsertUpdateDelete]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Select * from UserRoleMaster
--------- EXEC [Sp_RegistrationInsertUpdateDelete]'',@RFName,@RLName,@RUName,@Password,@PhoneOffi,@PhonePersonal,@Email,@EmpId,@PreAddress,@PermAddress,@RoleId,@BranchId,@Add,@AddDate,'Insert'
--------- EXEC [Sp_RegistrationInsertUpdateDelete] @Rid,@RFName,@RLName,@RUName,@Password,@PhoneOffi,@PhonePersonal,@Email,@EmpId,@PreAddress,@PermAddress,@RoleId,@BranchId,@Add,@AddDate,'Update'
--------- EXEC [Sp_RegistrationInsertUpdateDelete] @Rid,'','','','','','','','','','','','','','','Delete'
--------- EXEC [Sp_RegistrationInsertUpdateDelete] @Rid,'','','','','','','','','','','','','','','Select'


CREATE PROCEDURE [dbo].[Sp_RegistrationInsertUpdateDelete] 
(  
@Rid int,  
@RFName VARCHAR(50),   
@RLName Varchar(50),
@RUName varchar(50),
@Password varchar(200),
@PhoneOffi Varchar(20),
@PhonePersonal varchar(20),
@Email varchar(20),
@EmpId int,
@PreAddress varchar(200),
@PermAddress varchar(200),
@RoleId int,
@BranchId int,  
@Add int,
@AddDate datetime,  
@StatementType nvarchar(20) = ''  
)  
AS  
BEGIN  
IF @StatementType = 'Insert'  
BEGIN  
insert into UserMaster (FirstName,LastName,UserName,[Password],PhoneOffice,PhonePersonal,Email,EmpId,PresentAddress,ParmanentAddress,RoleId,BranchId,
IsActive,AddBy,AddDate) values( @RFName,@RLName,@RUName,@Password,@PhoneOffi,@PhonePersonal,@Email,@EmpId,@PreAddress,@PermAddress,@RoleId
,@BranchId,1,@Add,@AddDate) 
END  
IF @StatementType = 'Update'  
BEGIN  
UPDATE UserMaster SET  
FirstName = @RFName, LastName = @RLName,UserName=@RUName,PhoneOffice=@PhoneOffi,PhonePersonal=@PhonePersonal,Email=@Email,
EmpId=@EmpId,PresentAddress=@PreAddress,ParmanentAddress=@PermAddress,RoleId=@RoleId,BranchId=@BranchId,Modifyby=@Add, ModifyDate=@AddDate
  
WHERE UserId = @Rid  
END  
else IF @StatementType = 'Delete'  
BEGIN  
UPDATE UserMaster SET IsActive=0 WHERE UserId = @Rid   
END  

else IF @StatementType = 'Select'  
BEGIN 
Select UM.UserId,UM.FirstName,UM.LastName,UM.UserName,UM.[Password],UM.PhoneOffice,UM.PhonePersonal,UM.Email,
UM.EmpId,UM.PresentAddress,UM.ParmanentAddress,UM.RoleId,URM.RoleName,UM.BranchId,SB.BranchName from UserMaster UM 
JOIN UserRoleMaster URM ON UM.RoleId=URM.RoleId 
JOIN SchoolBranch SB ON UM.BranchId = SB.BranchId  WHERE UM.IsActive=1 ORDER BY UM.UserName ASC 
END
end  
GO
/****** Object:  StoredProcedure [dbo].[Sp_RoleInfoInsertUpdateDelete]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Select * from UserRoleMaster
--------- EXEC [Sp_RoleInfoInsertUpdateDelete] '',@Rname,@RDesc,@Add,@AddDate,'Insert'
--------- EXEC [Sp_RoleInfoInsertUpdateDelete] @Rid,@Rname,@RDesc,@Add,@AddDate,'Update'
--------- EXEC [Sp_RoleInfoInsertUpdateDelete] @Rid,'','','','','Delete'
--------- EXEC [Sp_RoleInfoInsertUpdateDelete] '','','','','','Select'


CREATE PROCEDURE [dbo].[Sp_RoleInfoInsertUpdateDelete] 
(  
@Rid int,  
@Rname VARCHAR(50),   
@RDesc Varchar(100),  
@Add int,
@AddDate datetime,  
@StatementType nvarchar(20) = ''  
)  
AS  
BEGIN  
IF @StatementType = 'Insert'  
BEGIN  
insert into UserRoleMaster (RoleName,[Description],IsActive,AddBy,AddDate) values( @Rname, @RDesc,1,@Add,@AddDate) 
SELECT CAST(scope_identity() AS int) 
END  
IF @StatementType = 'Update'  
BEGIN  
UPDATE UserRoleMaster SET  
RoleName = @Rname, [Description] = @RDesc,Modifyby=@Add, ModifyDate=@AddDate
  
WHERE RoleId = @Rid  
END  
else IF @StatementType = 'Delete'  
BEGIN  
UPDATE UserRoleMaster SET IsActive=0 WHERE RoleId = @Rid   
END  

else IF @StatementType = 'Select'  
BEGIN 
Select RoleId,RoleName,[Description] from UserRoleMaster WHERE IsActive=1 ORDER BY RoleId ASC 
END
end  
GO
/****** Object:  StoredProcedure [dbo].[Sp_SelectUserAccessability]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_SelectUserAccessability]
@MName varchar(100), @Role int 
AS
BEGIN
	-- EXEC Sp_SelectUserAccessability 'Role Management', 1
	
	SET NOCOUNT ON;

	SELECT 
		URD.UserRoleDetailId,
		M.ModuleId,
		P.PageId,
		AA.AccessAreaId,
		P.PageName,
		URD.IsAccess, 
		URD.IsWrite,
		URD.IsEdit,
		URD.IsRead,
		AA.AceessArea
	FROM 
		ModuleInfo M INNER JOIN 
		PageInfo P ON M.ModuleId=P.ModuleId 
		INNER JOIN UserRoleDetail URD ON URD.PageId =P.PageId
		INNER JOIN AccessArea AA ON AA.AccessAreaId = URD.AccessArea 
	WHERE 
		URD.IsActive= 1 AND M.ModuleName = @MName  AND URD.RoleId = @Role AND P.URL != '#'
		Order by P.PageName
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_StoringRegisteredInfoToGridview ]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC [Sp_StoringRegisteredInfoToGridview ] null,null
CREATE PROCEDURE [dbo].[Sp_StoringRegisteredInfoToGridview ]  
(  
 @class varchar(20) = null,@text varchar(40) = null
)
AS  
BEGIN --CONCAT(SI.FirstName, SI.LastName) as fullname

if(@class is null)
      Select SI.StdntID,
	  SI.FirstName,
	  SI.LastName,(SI.FirstName + ' ' +SI.LastName) as FullName, 
	  SI.[FatherName],
	  SI.[FatherOccupation],
	  SI.[MotherName],
	  SI.[MotherOccupation],
	  SI.[PresentAddress],
	  SI.PresentPoliceStation,
	  SI.PresentDistrict,
	  SI.PermanentAddress,
	  SI.PermPoliceStation,
	  SI.PermDistrict,
	  SI.LocalGurdian,
	  SI.LocalGurdianAddress,
	  SI.RelationWithLocGurdian,
	  SI.RegistrationNo,
	  CONVERT(VARCHAR,SI.RegistrationDate,105) AS RegistrationDate,
	  SI.StudentContactNumber,
	  SI.FatherContactNumber,
	  SI.MotherContactNumber,
	  SI.GuardianContactNumber,
	  SI.GuardianOccupation,
	  SI.imageId as imgresult,
	  SCI.ClassName,
	  SCI.ClassRollNo,
	  SCI.EndingMonth,
	  SCI.NoOfCourse,
	  SCI.Section,
	  SCI.[Session],
	  SCI.ShiftName,
	  SCI.StartingMonth,
	  SCI.StdntClassID,
	  SCI.StdntOfficialID,
	  SCI.[Year]
	  --CCI.ClassCourseID,
	  --CCI.CourseTitle,
	  --CCI.FullMarks,
	  --CCI.CourseType 
  from [StudentInfo] SI JOIN StudentClassInfo SCI on SI.StdntID = SCI.StdntID
  --JOIN  ImagePath IP on SI.imageId = IP.Id
  --JOIN ClassCourseInfo CCI on SCI.StdntClassID = CCI.StdntClassID
    Where SI.IsActive=1 AND SCI.IsActive=1 
  ORDER BY FullName

  else if( @class='Class')
        Select SI.StdntID,
	  SI.FirstName,
	  SI.LastName,(SI.FirstName + ' ' +SI.LastName) as FullName, 
	  SI.[FatherName],
	  SI.[FatherOccupation],
	  SI.[MotherName],
	  SI.[MotherOccupation],
	  SI.[PresentAddress],
	  SI.PresentPoliceStation,
	  SI.PresentDistrict,
	  SI.PermanentAddress,
	  SI.PermPoliceStation,
	  SI.PermDistrict,
	  SI.LocalGurdian,
	  SI.LocalGurdianAddress,
	  SI.RelationWithLocGurdian,
	  SI.RegistrationNo,
	  CONVERT(VARCHAR,SI.RegistrationDate,105) AS RegistrationDate,
	  SI.StudentContactNumber,
	  SI.FatherContactNumber,
	  SI.MotherContactNumber,
	  SI.GuardianContactNumber,
	  SI.GuardianOccupation,
	  SCI.ClassName,
	  SCI.ClassRollNo,
	  SCI.EndingMonth,
	  SCI.NoOfCourse,
	  SCI.Section,
	  SCI.[Session],
	  SCI.ShiftName,
	  SCI.StartingMonth,
	  SCI.StdntClassID,
	  SCI.StdntOfficialID, SI.imageId as imgresult,
	  SCI.[Year]

	  --CCI.ClassCourseID,
	  --CCI.CourseTitle,
	  --CCI.FullMarks,
	  --CCI.CourseType 
  from [StudentInfo] SI JOIN StudentClassInfo SCI on SI.StdntID = SCI.StdntID
  --JOIN  ImagePath IP on SI.imageId = IP.Id
  --JOIN ClassCourseInfo CCI on SCI.StdntClassID = CCI.StdntClassID 
   Where SI.IsActive=1 AND SCI.IsActive=1 AND SCI.ClassName=@text
  ORDER BY FullName

    else if( @class='Session')
	   Select SI.StdntID,
	  SI.FirstName,
	  SI.LastName,(SI.FirstName + ' ' +SI.LastName) as FullName, 
	  SI.[FatherName],
	  SI.[FatherOccupation],
	  SI.[MotherName],
	  SI.[MotherOccupation],
	  SI.[PresentAddress],
	  SI.PresentPoliceStation,
	  SI.PresentDistrict,
	  SI.PermanentAddress,
	  SI.PermPoliceStation,
	  SI.PermDistrict,
	  SI.LocalGurdian,
	  SI.LocalGurdianAddress,
	  SI.RelationWithLocGurdian,
	  SI.RegistrationNo,
	  CONVERT(VARCHAR,SI.RegistrationDate,105) AS RegistrationDate,
	  SI.StudentContactNumber,
	  SI.FatherContactNumber,
	  SI.MotherContactNumber, SI.imageId as imgresult,
	  SI.GuardianContactNumber,
	  SI.GuardianOccupation,
	  SCI.ClassName,
	  SCI.ClassRollNo,
	  SCI.EndingMonth,
	  SCI.NoOfCourse,
	  SCI.Section,
	  SCI.[Session],
	  SCI.ShiftName,
	  SCI.StartingMonth,
	  SCI.StdntClassID,
	  SCI.StdntOfficialID,
	  SCI.[Year]
	  --CCI.ClassCourseID,
	  --CCI.CourseTitle,
	  --CCI.FullMarks,
	  --CCI.CourseType 
  from [StudentInfo] SI JOIN StudentClassInfo SCI on SI.StdntID = SCI.StdntID
  --JOIN  ImagePath IP on SI.imageId = IP.Id
  --JOIN ClassCourseInfo CCI on SCI.StdntClassID = CCI.StdntClassID 
   Where SI.IsActive=1 AND SCI.IsActive=1 AND SCI.Session=@text
  ORDER BY FullName
  else if( @class='Search')
   Select SI.StdntID,
	  SI.FirstName,
	  SI.LastName,(SI.FirstName + ' ' +SI.LastName) as FullName, 
	  SI.[FatherName],
	  SI.[FatherOccupation],
	  SI.[MotherName],
	  SI.[MotherOccupation],
	  SI.[PresentAddress],
	  SI.PresentPoliceStation,
	  SI.PresentDistrict,
	  SI.PermanentAddress,
	  SI.PermPoliceStation,
	  SI.PermDistrict, SI.imageId as imgresult,
	  SI.LocalGurdian,
	  SI.LocalGurdianAddress,
	  SI.RelationWithLocGurdian,
	  SI.RegistrationNo,
	  CONVERT(VARCHAR,SI.RegistrationDate,105) AS RegistrationDate,
	  SI.StudentContactNumber,
	  SI.FatherContactNumber,
	  SI.MotherContactNumber,
	  SI.GuardianContactNumber,
	  SI.GuardianOccupation,
	  SCI.ClassName,
	  SCI.ClassRollNo,
	  SCI.EndingMonth,
	  SCI.NoOfCourse,
	  SCI.Section,
	  SCI.[Session],
	  SCI.ShiftName,
	  SCI.StartingMonth,
	  SCI.StdntClassID,
	  SCI.StdntOfficialID,
	  SCI.[Year]
	  --CCI.ClassCourseID,
	  --CCI.CourseTitle,
	  --CCI.FullMarks,
	  --CCI.CourseType 
  from [StudentInfo] SI JOIN StudentClassInfo SCI on SI.StdntID = SCI.StdntID
  --JOIN  ImagePath IP on SI.imageId = IP.Id
  --JOIN ClassCourseInfo CCI on SCI.StdntClassID = CCI.StdntClassID 
   Where SI.IsActive=1 AND SCI.IsActive=1 AND SI.FirstName LIKE ''+ @text +'%'
  OR SI.StudentContactNumber LIKE '' + @text + '%' OR SI.LocalGurdian Like '' + @text + '%' OR SI.GuardianContactNumber Like '' + @text + '%' OR
  SCI.StdntOfficialID LIKE '' + @text + '%' OR SI.RegistrationNo LIKE '' + @text + '%' 
END
 
GO
/****** Object:  StoredProcedure [dbo].[Sp_StoringRegisteredInfoToListView ]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC [Sp_StoringRegisteredInfoToListView ] 33
CREATE PROCEDURE [dbo].[Sp_StoringRegisteredInfoToListView ] 
(@Rid int)  
AS  
BEGIN --CONCAT(SI.FirstName, SI.LastName) as fullname
      Select SI.StdntID,
	  SI.FirstName,
	  SI.LastName,(SI.FirstName + ' ' +SI.LastName) as FullName, 
	  SI.[FatherName],
	  SI.[FatherOccupation],
	  SI.[MotherName],
	  SI.[MotherOccupation],
	  SI.[PresentAddress],
	  SI.PresentPoliceStation,
	  SI.PresentDistrict,
	  SI.PermanentAddress,
	  SI.PermPoliceStation,
	  SI.PermDistrict,
	  SI.LocalGurdian,
	  SI.LocalGurdianAddress,
	  SI.RelationWithLocGurdian,
	  SI.RegistrationNo,
	  CONVERT(VARCHAR,SI.RegistrationDate,105) AS RegistrationDate,
	  SI.StudentContactNumber,
	  SI.FatherContactNumber,
	  SI.MotherContactNumber,
	  SI.GuardianContactNumber,
	  SCI.ClassName,
	  SCI.ClassRollNo,
	  SCI.EndingMonth,
	  SCI.NoOfCourse,
	  SCI.Section,
	  SCI.[Session],
	  SCI.ShiftName,
	  SCI.StartingMonth,
	  SCI.StdntClassID,
	  SCI.StdntOfficialID,
	  SCI.[Year] 
  from [StudentInfo] SI JOIN StudentClassInfo SCI on SI.StdntID = SCI.StdntID Where SI.IsActive=1 AND SCI.IsActive=1 AND SI.StdntID =@Rid
END
 
GO
/****** Object:  StoredProcedure [dbo].[Sp_VersionControlInsertUpdateDelete]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Select * from PageInfo
--------- EXEC [Sp_VersionControlInsertUpdateDelete] @Tid,@PTitle,@VTitle,@VNo,@RDate,@Description,@IsActive,@Add,@AddDate,'Insert'
-- EXEC [Sp_VersionControlInsertUpdateDelete] '19','Priom','Priom','Priom',2014-10-02,'Description',1,1,'2014-10-02 00:00:00.000', 'Update' 
-- EXEC [Sp_VersionControlInsertUpdateDelete] '1','','','Priom',6,1,1,'2014-10-02 00:00:00.000', 'Insert' 
--EXEC [Sp_VersionControlInsertUpdateDelete] '','','','','','','','','', 'Select'
--EXEC [Sp_VersionControlInsertUpdateDelete] '19','','','','','','','','', 'Delete'
CREATE PROCEDURE [dbo].[Sp_VersionControlInsertUpdateDelete] 
(  
@Tid int,  
@PTitle VARCHAR(50),  
@VTitle VARCHAR(50),  
@VNo int,  
@RDate  date,
@Description varchar(300),
@IsActive bit,
@Add int,
@AddDate datetime,  
@StatementType nvarchar(20) = ''  
)  
AS  
BEGIN  
IF @StatementType = 'Insert'  
BEGIN  
insert into VersionControl (ProjectTitle,VersionTitle,VersionNo,SubVersionNo,ReleaseDate,[Description],IsActive,AddBy,AddDate)
 values( @PTitle, @VTitle, @VNo, 0 , @RDate,@Description, @IsActive,@Add,@AddDate) 
 SELECT CAST(scope_identity() AS int) 
END  
IF @StatementType = 'Update'  
BEGIN  
UPDATE VersionControl SET  
ProjectTitle = @PTitle, VersionTitle = @VTitle, ReleaseDate = @RDate, [Description]= @Description,Modifyby=@Add, ModifyDate=@AddDate
  
WHERE TaskNo = @Tid  
END  
else IF @StatementType = 'Delete'  
BEGIN  
UPDATE VersionControl SET IsActive=0 WHERE TaskNo = @Tid    
END  

else IF @StatementType = 'Select'  
BEGIN 
Select TaskNo,VersionTitle, ProjectTitle+' V'+CAST(VersionNo AS VARCHAR)+'.'+CAST(SubVersionNo AS VARCHAR)+'.'+RIGHT('00'+CAST(TaskNo AS VARCHAR),2) AS VersionNo, CONVERT(VARCHAR,ReleaseDate,105) AS ReleaseDate,[Description],ProjectTitle from VersionControl where IsActive=1  Order By ReleaseDate DESC
END
end  

GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 10/19/2019 9:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserLogin]
@UN varchar(50),
@Pass varchar(200)
AS
BEGIN
	-- EXEC UserLogin "Priom", "123"
	
	SET NOCOUNT ON;

	SELECT 
		[UserName], [Password]
	FROM 
		UserMaster 
	WHERE 
		[UserName] = @UN AND 
		[Password]= @Pass AND 
		[IsActive] = 1



END
GO
USE [master]
GO
ALTER DATABASE [Role_N_User_N_Page_Management] SET  READ_WRITE 
GO
