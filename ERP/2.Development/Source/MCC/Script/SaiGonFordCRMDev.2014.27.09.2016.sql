USE [master]
GO
/****** Object:  Database [SaiGonFordCRMDev]    Script Date: 09/27/2016 9:36:59 PM ******/
CREATE DATABASE [SaiGonFordCRMDev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaiGonFord', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SaiGonFordCRMDev.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SaiGonFord_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SaiGonFordCRMDev_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SaiGonFordCRMDev] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaiGonFordCRMDev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaiGonFordCRMDev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET  MULTI_USER 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaiGonFordCRMDev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SaiGonFordCRMDev] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SaiGonFordCRMDev', N'ON'
GO
USE [SaiGonFordCRMDev]
GO
/****** Object:  Schema [HangFire]    Script Date: 09/27/2016 9:36:59 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[AccessDetail]    Script Date: 09/27/2016 9:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessDetail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[groupId] [bigint] NOT NULL,
	[controllerName] [nvarchar](255) NULL,
	[access] [nvarchar](4000) NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
 CONSTRAINT [PK__AccessDe__3213E83F16B6A501] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccessRight]    Script Date: 09/27/2016 9:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessRight](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[controllerName] [nvarchar](255) NULL,
	[access] [ntext] NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
 CONSTRAINT [PK__AccessRi__3213E83F6DCB3408] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[API_Params]    Script Date: 09/27/2016 9:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_Params](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParamID] [nvarchar](20) NULL,
	[Value] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 09/27/2016 9:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 09/27/2016 9:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Code_Master]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Code_Master](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[name_Vi] [nvarchar](255) NULL,
	[order_Num] [int] NULL,
	[Value] [nvarchar](255) NULL,
	[IsDefault] [bit] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK__Code_Mas__3214EC07317C843B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parameter]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parameter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ParameterName] [varchar](50) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[UserID] [varchar](32) NOT NULL,
	[RowCreatedTime] [datetime] NULL,
	[RowCreatedUser] [nvarchar](100) NULL,
	[RowLastUpdatedTime] [datetime] NULL,
	[RowLastUpdatedUser] [nvarchar](100) NULL,
 CONSTRAINT [PK_Parameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Territory]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Territory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Level] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[ParentId] [bigint] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK__Territor__3214EC07B33F542B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_Article]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_Article](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](100) NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](1000) NULL,
	[content] [ntext] NULL,
	[imagesPublicId] [nvarchar](255) NULL,
	[imagesSize] [nvarchar](4000) NULL,
	[active] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
	[allUser] [bit] NULL,
	[isDefault] [bit] NULL,
	[showroomId] [int] NULL,
 CONSTRAINT [PK__tw_Artic__3213E83F1DC70943] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_BusinessGroup]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_BusinessGroup](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[groupCode] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[leader] [bigint] NOT NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[showroomId] [bigint] NOT NULL,
	[imagesPublicId] [nvarchar](255) NULL,
	[imagesSize] [nvarchar](4000) NULL,
	[active] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_BusinessRole]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_BusinessRole](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[groupId] [bigint] NOT NULL,
	[showroomId] [bigint] NOT NULL,
	[userId] [bigint] NOT NULL,
	[isManager] [bit] NOT NULL,
	[managerRoles] [nvarchar](4000) NULL,
	[isLeader] [bit] NOT NULL,
	[leaderRoles] [nvarchar](4000) NULL,
	[isConsultant] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_Car]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_Car](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[typeId] [bigint] NOT NULL,
	[serialId] [bigint] NOT NULL,
	[colorId] [bigint] NOT NULL,
	[productionYear] [nvarchar](4000) NULL,
	[carCode] [nvarchar](255) NULL,
	[carColor] [nvarchar](255) NULL,
	[descriptionCode] [nvarchar](4000) NULL,
	[descriptionColor] [nvarchar](4000) NULL,
	[domestic] [bit] NOT NULL,
	[active] [bit] NOT NULL,
	[unavailable] [bit] NOT NULL,
	[imagesPublicId] [nvarchar](4000) NULL,
	[imagesSize] [nvarchar](4000) NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_CarDefinition]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_CarDefinition](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[typeId] [bigint] NOT NULL,
	[carId] [bigint] NOT NULL,
	[carName] [nvarchar](255) NULL,
	[priceFrom] [float] NOT NULL,
	[priceTo] [float] NOT NULL,
	[inventoryType] [nvarchar](4000) NULL,
	[inventoryValue] [bigint] NOT NULL,
	[inventoryNote] [nvarchar](4000) NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_CarSerial]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_CarSerial](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[serialCode] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[typeCode] [nvarchar](255) NULL,
	[description] [nvarchar](4000) NULL,
	[active] [bit] NOT NULL,
	[imagesPublicId] [nvarchar](4000) NULL,
	[imagesSize] [nvarchar](4000) NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_CarSerialColor]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_CarSerialColor](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[serialId] [nvarchar](255) NULL,
	[description] [nvarchar](4000) NULL,
	[active] [bit] NOT NULL,
	[imagesPublicId] [nvarchar](4000) NULL,
	[imagesSize] [nvarchar](4000) NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_CarType]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_CarType](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[typeCode] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](4000) NULL,
	[branch] [nvarchar](255) NULL,
	[active] [bit] NOT NULL,
	[imagesPublicId] [nvarchar](4000) NULL,
	[imagesSize] [nvarchar](4000) NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_Contract]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_Contract](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](100) NULL,
	[phone] [nvarchar](30) NULL,
	[email] [nvarchar](100) NULL,
	[identity] [int] NOT NULL,
	[identitydate] [datetime] NOT NULL,
	[identityaddress] [nvarchar](250) NULL,
	[customertype] [nvarchar](100) NULL,
	[company] [nvarchar](250) NULL,
	[taxcode] [nvarchar](100) NULL,
	[represent] [nvarchar](100) NULL,
	[position] [nvarchar](250) NULL,
	[fax] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[address] [nvarchar](300) NULL,
	[active] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_GlobalLanguage]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_GlobalLanguage](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](4000) NULL,
	[imagesPublicId] [nvarchar](255) NULL,
	[imagesSize] [nvarchar](4000) NULL,
	[isDefault] [bit] NOT NULL,
	[active] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
 CONSTRAINT [PK__tw_Globa__3213E83FE9FDCE04] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_PO]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_PO](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[carId] [bigint] NOT NULL,
	[status] [nvarchar](4000) NULL,
	[orderDate] [datetime] NOT NULL,
	[shippingDate] [datetime] NOT NULL,
	[invoice] [nvarchar](4000) NULL,
	[paymentDate] [datetime] NOT NULL,
	[VIN] [nvarchar](4000) NULL,
	[engineNo] [nvarchar](4000) NULL,
	[contractNo] [nvarchar](4000) NULL,
	[prodOfMonth] [datetime] NOT NULL,
	[dealer] [nvarchar](4000) NULL,
	[goalsOrderNo] [nvarchar](4000) NULL,
	[vehLocation] [nvarchar](4000) NULL,
	[carInternal] [bit] NOT NULL,
	[carOld] [bit] NOT NULL,
	[paymentDeadline] [datetime] NOT NULL,
	[estDeliveryDate] [datetime] NOT NULL,
	[commitment] [bit] NOT NULL,
	[timing] [nvarchar](4000) NULL,
	[lot] [nvarchar](4000) NULL,
	[QAOfflineSchedule] [datetime] NOT NULL,
	[OK2SOriginal] [datetime] NOT NULL,
	[OK2SUpdate] [datetime] NOT NULL,
	[OK2SActual] [datetime] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_ShowroomBranch]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_ShowroomBranch](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[shortlyName] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[representative] [bigint] NOT NULL,
	[title] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[parentType] [nvarchar](4000) NULL,
	[showroomParent] [bigint] NULL,
	[imagesPublicId] [nvarchar](255) NULL,
	[imagesSize] [nvarchar](4000) NULL,
	[active] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_User]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_User](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[fullName] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[birthday] [datetime] NULL,
	[address] [nvarchar](1000) NULL,
	[country] [bigint] NULL,
	[city] [bigint] NULL,
	[district] [bigint] NULL,
	[imagesPublicId] [nvarchar](255) NULL,
	[imagesSize] [nvarchar](max) NULL,
	[registerAt] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
	[activatedAt] [datetime] NULL,
	[lastLoginTime] [datetime] NULL,
	[lastLoginIP] [nvarchar](255) NULL,
	[vendorAuth] [nvarchar](255) NULL,
	[userKey] [nvarchar](128) NULL,
	[extension] [nvarchar](50) NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
	[homePage] [nvarchar](255) NULL,
 CONSTRAINT [PK__tw_User__3213E83F65AC5D80] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_UserGroup]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_UserGroup](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[active] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
 CONSTRAINT [PK__tw_UserG__3213E83FF765D873] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_UserInGroup]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_UserInGroup](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[groupId] [bigint] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
 CONSTRAINT [PK__tw_UserI__3213E83F2E7CCA23] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tw_UserInShowroom]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tw_UserInShowroom](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[showroomId] [bigint] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[createdBy] [nvarchar](255) NULL,
	[updatedAt] [datetime] NULL,
	[updatedBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [smallint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Job]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[List]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Server]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](100) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[Set]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [HangFire].[State]    Script Date: 09/27/2016 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AccessDetail] ON 

INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (1, 1, N'Home', N'{all:True}', CAST(N'2016-06-17 11:02:58.433' AS DateTime), N'vuongnd1', CAST(N'2016-09-27 21:35:06.833' AS DateTime), N'administrator')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (2, 1, N'GroupManagement', N'{all:True,view:False,update:False,create:False,delete:False,export:False,grant access:False}', CAST(N'2016-06-17 11:46:36.183' AS DateTime), N'vuongnd1', CAST(N'2016-06-17 22:31:07.223' AS DateTime), N'vuongnd1')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (4, 1, N'LanguageManagement', N'{all:True,view:False,update:False,create:False,delete:False}', CAST(N'2016-06-17 14:17:05.000' AS DateTime), N'vuongnd1', CAST(N'2016-06-17 22:31:07.463' AS DateTime), N'vuongnd1')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (9, 5, N'Home', N'{all:True,view:False,export:False}', CAST(N'2016-06-17 21:06:24.207' AS DateTime), N'vuongnd1', CAST(N'2016-07-07 14:19:52.907' AS DateTime), N'tiennd')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10, 5, N'GroupManagement', N'{all:False,view:False,update:False,create:False,delete:False,export:False,grant access:False}', CAST(N'2016-06-17 21:06:24.320' AS DateTime), N'vuongnd1', CAST(N'2016-07-07 14:19:52.910' AS DateTime), N'tiennd')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (12, 5, N'LanguageManagement', N'{all:False,view:False,update:False,create:False,delete:False}', CAST(N'2016-06-17 21:06:24.493' AS DateTime), N'vuongnd1', CAST(N'2016-07-07 14:19:52.917' AS DateTime), N'tiennd')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (27, 6, N'Home', N'{all:True,view:False,export:False}', CAST(N'2016-06-29 11:04:34.987' AS DateTime), N'tiennd', CAST(N'2016-07-08 14:17:24.857' AS DateTime), N'tiennd')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (28, 6, N'GroupManagement', N'{all:False,view:False,update:False,create:False,delete:False,export:False,grant access:False}', CAST(N'2016-06-29 11:04:35.027' AS DateTime), N'tiennd', CAST(N'2016-07-08 14:17:24.890' AS DateTime), N'tiennd')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30, 6, N'LanguageManagement', N'{all:False,view:False,update:False,create:False,delete:False}', CAST(N'2016-06-29 11:04:35.027' AS DateTime), N'tiennd', CAST(N'2016-07-08 14:17:24.900' AS DateTime), N'tiennd')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40, 7, N'Home', N'{all:True,view:False,export:False}', CAST(N'2016-06-30 17:38:16.640' AS DateTime), N'tiennd', CAST(N'2016-06-30 17:39:03.977' AS DateTime), N'tiennd')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (41, 7, N'GroupManagement', N'{all:False,view:False,update:False,create:False,delete:False,export:False,grant access:False}', CAST(N'2016-06-30 17:38:16.647' AS DateTime), N'tiennd', CAST(N'2016-06-30 17:39:03.980' AS DateTime), N'tiennd')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (43, 7, N'LanguageManagement', N'{all:False,view:False,update:False,create:False,delete:False}', CAST(N'2016-06-30 17:38:16.650' AS DateTime), N'tiennd', CAST(N'2016-06-30 17:39:03.987' AS DateTime), N'tiennd')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (53, 8, N'Home', N'{all:False,view:False,export:False}', CAST(N'2016-06-30 22:13:44.753' AS DateTime), N'tiennd', CAST(N'2016-06-30 22:43:59.243' AS DateTime), N'tiennd')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (54, 8, N'GroupManagement', N'{all:False,view:False,update:False,create:False,delete:False,export:False,grant access:False}', CAST(N'2016-06-30 22:13:44.783' AS DateTime), N'tiennd', CAST(N'2016-06-30 22:43:59.250' AS DateTime), N'tiennd')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (56, 8, N'LanguageManagement', N'{all:False,view:False,update:False,create:False,delete:False}', CAST(N'2016-06-30 22:13:44.787' AS DateTime), N'tiennd', CAST(N'2016-06-30 22:43:59.260' AS DateTime), N'tiennd')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (66, 9, N'Home', N'{all:True,view:True,export:False}', CAST(N'2016-06-30 22:44:51.127' AS DateTime), N'tiennd', CAST(N'2016-07-04 10:40:34.670' AS DateTime), N'Vang_Thao')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (67, 9, N'GroupManagement', N'{all:True,view:False,update:False,create:False,delete:False,export:False,grant access:False}', CAST(N'2016-06-30 22:44:51.127' AS DateTime), N'tiennd', CAST(N'2016-07-04 10:40:34.697' AS DateTime), N'Vang_Thao')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (69, 9, N'LanguageManagement', N'{all:False,view:False,update:False,create:False,delete:False}', CAST(N'2016-06-30 22:44:51.130' AS DateTime), N'tiennd', CAST(N'2016-07-04 10:40:34.713' AS DateTime), N'Vang_Thao')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10092, 10, N'Home', N'{all:True,view:False,export:False}', CAST(N'2016-08-10 13:20:43.060' AS DateTime), N'Liemnmfb', CAST(N'2016-08-10 16:03:16.773' AS DateTime), N'Liemnmfb')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10093, 10, N'GroupManagement', N'{all:False,view:False,update:False,create:False,delete:False,export:False,grant access:False}', CAST(N'2016-08-10 13:20:43.083' AS DateTime), N'Liemnmfb', CAST(N'2016-08-10 16:03:16.777' AS DateTime), N'Liemnmfb')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10095, 10, N'LanguageManagement', N'{all:False,view:False,update:False,create:False,delete:False}', CAST(N'2016-08-10 13:20:43.087' AS DateTime), N'Liemnmfb', CAST(N'2016-08-10 16:03:16.787' AS DateTime), N'Liemnmfb')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10117, 11, N'Home', N'{all:True,view:False,export:False}', CAST(N'2016-08-10 13:51:18.873' AS DateTime), N'Liemnmfb', CAST(N'2016-08-10 22:46:40.707' AS DateTime), N'Liemnmfb')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10118, 11, N'GroupManagement', N'{all:False,view:False,update:False,create:False,delete:False,export:False,grant access:False}', CAST(N'2016-08-10 13:51:18.877' AS DateTime), N'Liemnmfb', CAST(N'2016-08-10 22:46:40.707' AS DateTime), N'Liemnmfb')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10120, 11, N'LanguageManagement', N'{all:False,view:False,update:False,create:False,delete:False}', CAST(N'2016-08-10 13:51:18.880' AS DateTime), N'Liemnmfb', CAST(N'2016-08-10 22:46:40.713' AS DateTime), N'Liemnmfb')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10142, 12, N'Home', N'{all:False,view:False,export:False}', CAST(N'2016-08-10 16:23:01.937' AS DateTime), N'Liemnmfb', CAST(N'2016-08-12 13:29:30.213' AS DateTime), N'Liemnmfb')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10143, 12, N'GroupManagement', N'{all:False,view:False,update:False,create:False,delete:False,export:False,grant access:False}', CAST(N'2016-08-10 16:23:01.940' AS DateTime), N'Liemnmfb', CAST(N'2016-08-12 13:29:30.217' AS DateTime), N'Liemnmfb')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10145, 12, N'LanguageManagement', N'{all:False,view:False,update:False,create:False,delete:False}', CAST(N'2016-08-10 16:23:01.943' AS DateTime), N'Liemnmfb', CAST(N'2016-08-12 13:29:30.223' AS DateTime), N'Liemnmfb')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10167, 13, N'Home', N'{all:False,view:False,export:False}', CAST(N'2016-08-10 16:24:54.313' AS DateTime), N'Liemnmfb', CAST(N'2016-08-12 13:25:47.047' AS DateTime), N'Liemnmfb')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10168, 13, N'GroupManagement', N'{all:False,view:False,update:False,create:False,delete:False,export:False,grant access:False}', CAST(N'2016-08-10 16:24:54.313' AS DateTime), N'Liemnmfb', CAST(N'2016-08-12 13:25:47.050' AS DateTime), N'Liemnmfb')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10170, 13, N'LanguageManagement', N'{all:False,view:False,update:False,create:False,delete:False}', CAST(N'2016-08-10 16:24:54.317' AS DateTime), N'Liemnmfb', CAST(N'2016-08-12 13:25:47.060' AS DateTime), N'Liemnmfb')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10192, 14, N'Home', N'{all:False,view:True,export:False}', CAST(N'2016-08-17 16:19:59.930' AS DateTime), N'vuongnd1', CAST(N'2016-08-30 10:42:29.417' AS DateTime), N'vuongnd1')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10193, 14, N'GroupManagement', N'{all:False,view:False,update:False,create:False,delete:False,export:False,grant access:False}', CAST(N'2016-08-17 16:19:59.933' AS DateTime), N'vuongnd1', CAST(N'2016-08-30 10:42:29.417' AS DateTime), N'vuongnd1')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10195, 14, N'LanguageManagement', N'{all:False,view:False,update:False,create:False,delete:False}', CAST(N'2016-08-17 16:19:59.937' AS DateTime), N'vuongnd1', CAST(N'2016-08-30 10:42:29.420' AS DateTime), N'vuongnd1')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10222, 1, N'CodeMasterManagement', N'{all:True,view:False,update:False,create:False,delete:False}', CAST(N'2016-09-14 15:19:17.850' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10223, 1, N'UserManagement', N'{all:True,view:False,update:False,create:False,delete:False,export:False,reset password:False,update voip:False}', CAST(N'2016-09-14 15:25:51.977' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10224, 1, N'UserProfile', N'{all:True,view:False,update:False}', CAST(N'2016-09-14 15:48:02.800' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10225, 1, N'ShowroomBranch', N'{all:True,view:False,update:False,create:False,delete:False,export:False}', CAST(N'2016-09-14 18:13:01.180' AS DateTime), N'administrator', CAST(N'2016-09-27 21:34:54.243' AS DateTime), N'administrator')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10226, 1, N'BusinessGroup', N'{all:True,view:False,update:False,create:False,delete:False,export:False}', CAST(N'2016-09-15 10:40:23.833' AS DateTime), N'administrator', CAST(N'2016-09-27 17:47:35.757' AS DateTime), N'administrator')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10227, 1, N'CarManagement', N'{all:True,view:False,update:False,create:False,delete:False,export:False}', CAST(N'2016-09-15 11:36:21.757' AS DateTime), N'administrator', CAST(N'2016-09-27 19:46:40.257' AS DateTime), N'administrator')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10228, 1, N'CarTypeManagement', N'{all:True,view:False,update:False,create:False,delete:False,export:False}', CAST(N'2016-09-15 14:16:04.113' AS DateTime), N'administrator', CAST(N'2016-09-27 19:46:59.427' AS DateTime), N'administrator')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10229, 1, N'CarSerialManagement', N'{all:True,view:False,update:False,create:False,delete:False,export:False}', CAST(N'2016-09-15 16:16:23.360' AS DateTime), N'administrator', CAST(N'2016-09-27 19:49:17.473' AS DateTime), N'administrator')
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10230, 1, N'Article', N'{all:True,view:False,update:False,create:False,delete:False}', CAST(N'2016-09-17 10:39:12.360' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10231, 1, N'BusinessRoleManagement', N'{all:True,view:False,update:False,create:False,delete:False,export:False}', CAST(N'2016-09-20 11:11:08.387' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10232, 1, N'CarDefinition', N'{all:True,view:False,update:False,create:False,delete:False,export:False}', CAST(N'2016-09-21 12:12:44.640' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (20232, 1, N'POManagement', N'{all:True,view:False,update:False,create:False,delete:False,export:False}', CAST(N'2016-09-24 14:33:13.867' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessDetail] ([id], [groupId], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30232, 1, N'Contract', N'{all:True,view:False,update:False,create:False,delete:False,export:False,reset password:False,update voip:False}', CAST(N'2016-09-27 11:21:32.427' AS DateTime), N'administrator', NULL, NULL)
SET IDENTITY_INSERT [dbo].[AccessDetail] OFF
SET IDENTITY_INSERT [dbo].[AccessRight] ON 

INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (1, N'Home', N'[all,view,export]', CAST(N'2016-06-15 03:23:36.317' AS DateTime), N'administrator', CAST(N'2016-08-10 16:55:48.110' AS DateTime), N'administrator')
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (2, N'GroupManagement', N'[all,view,update,create,delete,export,grant access]', CAST(N'2016-06-17 11:45:58.333' AS DateTime), N'administrator', CAST(N'2016-08-10 19:29:38.077' AS DateTime), N'administrator')
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (4, N'LanguageManagement', N'[all,view,update,create,delete]', CAST(N'2016-06-17 14:05:57.270' AS DateTime), N'administrator', CAST(N'2016-07-04 14:22:19.247' AS DateTime), N'administrator')
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10047, N'CodeMasterManagement', N'[all,view,update,create,delete]', CAST(N'2016-09-14 15:19:17.850' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10048, N'UserManagement', N'[all,view,update,create,delete,export,reset password,update voip]', CAST(N'2016-09-14 15:25:51.953' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10049, N'UserProfile', N'[all,view,update]', CAST(N'2016-09-14 15:48:02.787' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10050, N'ShowroomBranch', N'[all,view,update,create,delete,export,activation,grant access]', CAST(N'2016-09-14 18:13:01.073' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10051, N'BusinessGroup', N'[all,view,update,create,delete,export,activation,grant access]', CAST(N'2016-09-15 10:40:23.587' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10052, N'CarManagement', N'[all,view,update,create,delete,export,activation,grant access]', CAST(N'2016-09-15 11:36:21.677' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10053, N'CarTypeManagement', N'[all,view,update,create,delete,export,activation,grant access]', CAST(N'2016-09-15 14:16:04.043' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10054, N'CarSerialManagement', N'[all,view,update,create,delete,export,activation,grant access]', CAST(N'2016-09-15 16:16:23.010' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10055, N'Article', N'[all,view,update,create,delete]', CAST(N'2016-09-17 10:39:12.343' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10056, N'BusinessRoleManagement', N'[all,view,update,create,delete,export]', CAST(N'2016-09-20 11:11:08.350' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10057, N'CarDefinition', N'[all,view,update,create,delete,export]', CAST(N'2016-09-21 12:12:44.597' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (20057, N'POManagement', N'[all,view,update,create,delete,export]', CAST(N'2016-09-24 14:33:13.800' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[AccessRight] ([id], [controllerName], [access], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30057, N'Contract', N'[all,view,update,create,delete,export,reset password,update voip]', CAST(N'2016-09-27 11:21:32.407' AS DateTime), N'administrator', NULL, NULL)
SET IDENTITY_INSERT [dbo].[AccessRight] OFF
SET IDENTITY_INSERT [dbo].[API_Params] ON 

INSERT [dbo].[API_Params] ([Id], [ParamID], [Value], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, N'CDRMaxDate', N'2016-08-23 12:46:14', CAST(N'2016-03-23 14:20:39.000' AS DateTime), N'administrator', CAST(N'2016-08-23 13:00:02.480' AS DateTime), N'cronSystem')
INSERT [dbo].[API_Params] ([Id], [ParamID], [Value], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, N'CDRAgentMaxDate', N'2016-08-23 13:48:17', CAST(N'2016-03-23 14:20:39.000' AS DateTime), N'administrator', CAST(N'2016-08-23 13:50:04.157' AS DateTime), N'cronSystem')
INSERT [dbo].[API_Params] ([Id], [ParamID], [Value], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, N'CDRAllMaxDate', N'2016-08-23 13:48:17', CAST(N'2016-08-18 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-08-23 13:50:05.577' AS DateTime), N'cronSystem')
SET IDENTITY_INSERT [dbo].[API_Params] OFF
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'024ea762-c4ea-42ee-8698-5ce7aee055b4', N'tunth@twin.vn', 0, N'AOJ19M//CtIZH8ubgjK5oxk47PQgL/jkqZI4I0J/wMz4EHRTAwVETc4yN0fuOqmjGQ==', N'87a269b8-f905-40ba-a364-06b84ee51dc5', N'01', 0, 0, NULL, 0, 0, N'minhnn')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4fa2af19-6722-402c-b8fd-9934b12575d7', N'vuongnd@twin.vn', 0, N'AA7lBUMy2cjvUuBwLxxCNS8RYyAYyiKAXzgdl1j8NxEUTj5ioLJotqNkgzRbk5AOeQ==', N'432ae7da-4d43-42a6-b196-d3677de22458', N'01238699419', 0, 0, NULL, 0, 0, N'administrator')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9c504168-47a7-4214-845d-6a7d681161d5', N'nvtrai@saigonford.com.vn', 0, N'AGK1dH1cdlUXqVre3ZqMTyNcMT+0lm71VvxBuLd/1EIJHAzbbVYnaAzvUQj2r0Ra4w==', N'80c0825f-4536-4693-854a-963dfe86a5de', N'0938783139', 0, 0, NULL, 0, 0, N'nvtrai')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ae2dba2d-4eb2-44da-869a-e2c542142c37', N'tunha@twin.vn', 0, N'AP1o5bJy4nf5LiLNNe1DLIG2Lones0ZQ/TLwodfu32J4qmBOE/yj/qF33fTTrGu17w==', N'f300545d-7409-4284-be47-910cf11e44c9', N'01263103363', 0, 0, NULL, 0, 0, N'tunhat')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b998edce-0ab2-4158-9deb-38c09e818b92', N'ttnchinh@saigonford.com.vn', 0, N'ADWjUTQ1u+hnCkz+k39EqRTfbHh8bqliTaxNGvXamM4qG2kGMD8vvCug4yV7BCv/gA==', N'1c7d9741-5e66-4afa-9ff3-6983c2111684', N'0838442947', 0, 0, NULL, 0, 0, N'ttnchinh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cdc11b89-d54f-4c63-bd30-13aa3f5c8e8f', N'tunh@twin.vn', 0, N'APn59/GzZRhqImPih18H/7hgiG+7338Nm1OBgggyILdtiN3IR7eT0O4H//pNJfigcQ==', N'611d5e6a-2bd5-43b5-9d25-ef42ef1314a6', N'01263103363', 0, 0, NULL, 0, 0, N'tunha')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd71959c2-4dc5-4d43-879e-0d4bdb05e29f', N'pdclong@saigonford.com.vn', 0, N'AJvBfZNxt3uN920aNxZpxX7I7B5jR4imCEdbCT5AzONdIj2w3yLJ9MCyLsEmMeFoJw==', N'be91d63a-c634-4b04-a4cf-456803dc10e4', N'0903648748', 0, 0, NULL, 0, 0, N'pdclong')
SET IDENTITY_INSERT [dbo].[Code_Master] ON 

INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, N'CRMPhone', N'Mobile', N'Di động', 1, N'CRMPhone0001', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, N'CRMPhone', N'Home', N'Nhà riêng', 2, N'CRMPhone0002', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, N'CRMPhone', N'Office', N'Văn phòng', 3, N'CRMPhone0003', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (4, N'CRMPhone', N'Fax', N'Số Fax', 4, N'CRMPhone0004', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (5, N'CRMEmail', N'Private', N'Riêng tư', 1, N'CRMEmail0001', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (6, N'CRMEmail', N'Working', N'Công việc', 2, N'CRMEmail0002', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (7, N'CRMAddress', N'Home', N'Nhà riêng', 3, N'CRMAddress0001', 0, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-05-09 22:57:30.347' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (8, N'CRMAddress', N'Office', N'Văn phòng', 4, N'CRMAddress0002', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (9, N'CRMEvents', N'Birthday', N'Ngày sinh', 1, N'CRMEvents0001', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (10, N'CRMEvents', N'Anniversary', N'Ngày kỷ niệm', 2, N'CRMEvents0002', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (11, N'CRMEvents', N'Others', N'Khác', 3, N'CRMEvents0003', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (12, N'CRMSocial', N'Facebook', N'Facebook', 1, N'CRMSocial0001', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (13, N'CRMSocial', N'Google', N'Google', 2, N'CRMSocial0002', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (14, N'CRMSocial', N'Twitter', N'Twitter', 3, N'CRMSocial0003', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (15, N'CRMSocial', N'Zalo', N'Zalo', 4, N'CRMSocial0004', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (16, N'CRMSocial', N'Viber', N'Viber', 5, N'CRMSocial0005', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (17, N'CRMSocial', N'Others', N'Khác', 6, N'CRMSocial0006', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (18, N'CRMRelational', N'Friends', N'Bạn bè', 1, N'CRMRelational0001', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (19, N'CRMRelational', N'Relatives / Family', N'Người thân / Gia đình', 2, N'CRMRelational0002', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (20, N'CRMRelational', N'Client / Partner', N'Khách hàng / đối tác', 3, N'CRMRelational0003', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (21, N'CRMRelational', N'Schoolmate', N'Bạn học', 4, N'CRMRelational0004', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (22, N'CRMRelational', N'Colleague', N'Đồng nghiệp', 5, N'CRMRelational0005', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (23, N'CRMRelational', N'Boss', N'Ông chủ', 6, N'CRMRelational0006', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (24, N'CRMRelational', N'Father', N'Cha', 7, N'CRMRelational0007', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (25, N'CRMRelational', N'Mother', N'Mẹ', 8, N'CRMRelational0008', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (26, N'CRMRelational', N'Brother', N'Anh/Em trai', 9, N'CRMRelational0009', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (27, N'CRMRelational', N'Sister', N'Chị/Em gái', 10, N'CRMRelational0010', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (28, N'CRMRelational', N'Others', N'Khác', 11, N'CRMRelational0011', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (29, N'CRMCustomerStatus', N'New', N'Mới', 1, N'CRMCustomerStatus0001', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-08-26 14:53:47.877' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (30, N'CRMCustomerStatus', N'Dialed but not available', N'Không liên lạc được', 2, N'CRMCustomerStatus0002', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-05-14 15:28:25.333' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (31, N'CRMCustomerStatus', N'Didn''t pick-up the phone', N'Không nghe máy', 3, N'CRMCustomerStatus0003', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-05-14 15:28:25.347' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (32, N'CRMCustomerStatus', N'Interested', N'Quan tâm', 6, N'CRMCustomerStatus0004', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-08-31 12:00:01.057' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (33, N'CRMCustomerStatus', N'Potential customer', N'Khách hàng tiềm năng', 7, N'CRMCustomerStatus0005', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-05-14 15:28:25.397' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (34, N'CRMCustomerStatus', N'With meeting schedules', N'Có lịch hẹn', 8, N'CRMCustomerStatus0006', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-08-31 12:00:01.090' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (35, N'CRMCustomerStatus', N'Meet up', N'Đã gặp mặt', 9, N'CRMCustomerStatus0007', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-08-31 12:00:01.120' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (36, N'CRMCustomerStatus', N'A date to visit project', N'Hẹn tham quan dự án', 10, N'CRMCustomerStatus0008', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-05-14 15:28:25.427' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (37, N'CRMCustomerStatus', N'Visited project', N'Đã tham quan dự án', 11, N'CRMCustomerStatus0009', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-08-31 12:00:01.187' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (38, N'CRMCustomerStatus', N'Do not interested', N'Khách hàng không quan tâm', 12, N'CRMCustomerStatus0010', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-08-31 12:00:01.227' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (39, N'CRMCustomerStatus', N'Booked', N'Đặt chổ', 13, N'CRMCustomerStatus0011', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-05-14 15:28:25.457' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (40, N'CRMCustomerStatus', N'Diposit', N'Đặt cọc', 14, N'CRMCustomerStatus0012', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-05-14 15:28:25.473' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (41, N'CRMCustomerStatus', N'Signed the contract', N'Ký HĐ mua nhà', 15, N'CRMCustomerStatus0013', 1, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-05-14 15:28:25.490' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (44, N'CRMTitle', N'Mr.', N'Ông', 1, N'CRMTitle0001', NULL, CAST(N'2016-05-01 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (45, N'CRMTitle', N'Ms.', N'Cô', 2, N'CRMTitle0002', NULL, CAST(N'2016-05-01 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (47, N'CRMTitle', N'Mrs.', N'Bà', 3, N'CRMTitle0003', NULL, CAST(N'2016-05-01 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (50, N'CRMTitle', N'Sister', N'Chị', 4, N'CRMTitle0004', NULL, CAST(N'2016-05-01 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (51, N'CRMTitle', N'Brother', N'Anh', 5, N'CRMTitle0005', NULL, CAST(N'2016-05-01 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (54, N'CRMTitle', N'Other', N'Khác', 6, N'CRMTitle0006', NULL, CAST(N'2016-05-01 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (56, N'CRMSource', N'Facebook', N'Facebook', 4, N'CRMSource0001', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (57, N'CRMSource', N'Landing page', N'Website', 3, N'CRMSource0002', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (58, N'CRMSource', N'Contact center', N'Tổng đài', 2, N'CRMSource0003', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (59, N'CRMSource', N'Digital', N'Digital', 1, N'CRMSource0004', 0, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-05-11 22:20:56.777' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (60, N'CRMSource', N'Offline Event', N'Sự kiện Offline', 5, N'CRMSource0005', 0, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-05-10 17:19:36.897' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (61, N'CRMSource', N'Manual input', N'Nhập tay', 8, N'CRMSource0006', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (62, N'CRMSource', N'Workshop', N'Hội thảo', 6, N'CRMSource0007', 0, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-05-11 22:20:56.807' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (63, N'CRMVendor', N'A', N'A', 1, N'CRMVendor0001', NULL, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (64, N'CRMVendor', N'www.twin.vn', N'TWIN', 2, N'CRMVendor0002', 0, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-08-12 14:03:41.160' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (66, N'CRMVendor', N'Other', N'Khác', 5, N'CRMVendor0004', 0, CAST(N'2016-05-04 00:00:00.000' AS DateTime), NULL, CAST(N'2016-08-21 02:24:53.827' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (67, N'CRMSource', N'Other', N'Khác', 10, N'CRMSource0008', 0, CAST(N'2016-05-10 17:19:36.000' AS DateTime), N'administrator', CAST(N'2016-08-21 02:27:35.407' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (70, N'CRMActivityType', N'Remind', N'Nhắc nhớ', 2, N'CRMActivityType0002', 1, CAST(N'2016-05-15 01:37:11.000' AS DateTime), N'administrator', CAST(N'2016-05-15 23:19:41.867' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (71, N'CRMActivityType', N'Appointment', N'Lịch hẹn', 1, N'CRMActivityType0001', 1, CAST(N'2016-05-15 01:37:11.000' AS DateTime), N'administrator', CAST(N'2016-05-15 23:19:41.880' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (72, N'CRMActivityType', N'Send mail', N'Gửi mail', 4, N'CRMActivityType0004', 1, CAST(N'2016-05-15 01:37:11.000' AS DateTime), N'administrator', CAST(N'2016-05-15 23:19:41.897' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (73, N'CRMActivityType', N'Call', N'Gọi điện', 3, N'CRMActivityType0003', 1, CAST(N'2016-05-15 01:37:11.000' AS DateTime), N'administrator', CAST(N'2016-05-15 23:19:41.913' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (74, N'CRMActivityType', N'Note', N'Ghi chú', 5, N'CRMActivityType0005', 1, CAST(N'2016-05-15 23:17:52.000' AS DateTime), N'administrator', CAST(N'2016-05-15 23:19:41.927' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (75, N'CRMActivityType', N'Other', N'Khác', 6, N'CRMActivityType0006', 1, CAST(N'2016-05-15 23:19:41.000' AS DateTime), N'administrator', CAST(N'2016-05-16 00:29:32.530' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (76, N'CRMSource', N'Offline', N'Offline', 7, N'CRMSource0009', 1, CAST(N'2016-05-18 16:51:35.213' AS DateTime), N'administrator', CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (77, N'CRMVendor', N'Manual input', N'Nhập thủ công', 3, N'CRMVendor0005', 1, CAST(N'2016-05-18 16:52:46.000' AS DateTime), N'administrator', CAST(N'2016-05-23 12:16:24.153' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (78, N'CRMCustomerStatus', N'Sent eDM', N'Đã gửi eDM', 16, N'CRMCustomerStatus0016', 1, CAST(N'2016-05-21 21:58:33.487' AS DateTime), N'administrator', CAST(N'2016-08-18 14:44:37.397' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (79, N'AgencySize', N'01 - 05 employees', N'01 - 05 nhân viên', 1, N'AgencySize0001', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (80, N'AgencySize', N'05 - 20 employees', N'05 - 20 nhân viên', 2, N'AgencySize0002', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (81, N'AgencySize', N'20 - 50 employees', N'20 - 50 nhân viên', 3, N'AgencySize0003', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (82, N'AgencySize', N'50 - 250 employees', N'50 - 250 nhân viên', 4, N'AgencySize0004', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (83, N'AgencySize', N'250+ employees', N'Trên 250 nhân viên', 5, N'AgencySize0005', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (88, N'ProjectSegment', N'VIP', N'Cao cấp', 1, N'ProjectSegment0001', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (89, N'ProjectSegment', N'Intermediate', N'Trung cấp', 2, N'ProjectSegment0002', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (90, N'ApartmentFurniture', N'Air Conditioning', N'Máy lạnh', 1, N'ApartmentFurniture0001', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (91, N'ApartmentFurniture', N'Bookshelf', N'Kệ sách', 2, N'ApartmentFurniture0002', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (92, N'ApartmentFurniture', N'Dining table', N'Bàn ăn', 3, N'ApartmentFurniture0003', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (93, N'ApartmentFurniture', N'Fan', N'Quạt máy', 4, N'ApartmentFurniture0004', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (94, N'ApartmentFurniture', N'Fireplace', N'Lò sưởi', 5, N'ApartmentFurniture0005', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (95, N'ApartmentFurniture', N'Fridge', N'Tủ lạnh', 6, N'ApartmentFurniture0006', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (96, N'ApartmentFurniture', N'Sofa', N'Ghế sofa', 7, N'ApartmentFurniture0007', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (97, N'ApartmentFurniture', N'Tivi', N'Tivi', 8, N'ApartmentFurniture0008', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (98, N'ApartmentFurniture', N'Wardrobe', N'Tủ quần áo', 9, N'ApartmentFurniture0009', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (99, N'ApartmentFurniture', N'Washer', N'Máy giặt', 10, N'ApartmentFurniture0010', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (100, N'CRMBuyFor', N'Living', N'Để ở', 1, N'CRMBuyFor0001', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (101, N'CRMBuyFor', N'For rent', N'Cho thuê', 2, N'CRMBuyFor0002', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (102, N'CRMBuyFor', N'Invest', N'Đầu tư', 3, N'CRMBuyFor0003', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (103, N'CRMBuyFor', N'Other', N'Khác', 4, N'CRMBuyFor0004', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (104, N'CRMPriceRange', N'500-800 Million', N'500-800 Triệu', 2, N'CRMPriceRange0001', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (105, N'CRMPriceRange', N'800 Million -1 Billion', N'800 Triệu -1 Tỷ', 3, N'CRMPriceRange0002', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (106, N'CRMPriceRange', N'1-2 Billion', N'1-2 Tỷ', 4, N'CRMPriceRange0003', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (107, N'CRMPriceRange', N'2-3 Billion', N'2-3 Tỷ', 5, N'CRMPriceRange0004', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (108, N'CRMInternalFacility', N'Restaurant', N'Nhà hàng', 5, N'CRMInternalFacility0005', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (109, N'CRMInternalFacility', N'Pool', N'Hồ bơi', 1, N'CRMInternalFacility0001', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (110, N'CRMInternalFacility', N'Mini mart', N'Siêu thị tiện lợi', 2, N'CRMInternalFacility0002', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (111, N'CRMInternalFacility', N'Fitness Center', N'Phòng tập thể hình', 3, N'CRMInternalFacility0003', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (112, N'CRMInternalFacility', N'Children''s Clinic', N'Phòng khám nhi', 4, N'CRMInternalFacility0004', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (113, N'CRMBedroom', N'1 room', N'1 phòng', 1, N'CRMBedroom0001', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (114, N'CRMBedroom', N'2 rooms', N'2 phòng', 2, N'CRMBedroom0002', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
GO
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (115, N'CRMBedroom', N'3 rooms', N'3 phòng', 3, N'CRMBedroom0003', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (116, N'CRMBedroom', N'4 rooms', N'4 phòng', 4, N'CRMBedroom0004', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (117, N'CRMBedroom', N'5 rooms', N'5 phòng', 5, N'CRMBedroom0005', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (118, N'CRMDirection', N'North', N'Bắc', 4, N'CRMDirection0001', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (119, N'CRMDirection', N'Northeast', N'Đông  Bắc', 5, N'CRMDirection0002', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (120, N'CRMDirection', N'East', N'Đông', 1, N'CRMDirection0003', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (121, N'CRMDirection', N'Southeast', N'Đông Nam', 7, N'CRMDirection0004', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (122, N'CRMDirection', N'South', N'Nam', 3, N'CRMDirection0005', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (123, N'CRMDirection', N'Southwest', N'Tây Nam', 8, N'CRMDirection0006', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (124, N'CRMDirection', N'West', N'Tây', 2, N'CRMDirection0007', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (125, N'CRMDirection', N'Northwest', N'Tây Bắc', 6, N'CRMDirection0008', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (126, N'CRMRestroom', N'1 room', N'1 phòng', 1, N'CRMRestroom0001', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (127, N'CRMRestroom', N'2 rooms', N'2 phòng', 2, N'CRMRestroom0002', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (128, N'CRMRestroom', N'>= 3 rooms', N'> 3 phòng', 3, N'CRMRestroom0003', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (129, N'CRMExternalFacility', N'Supermarket', N'Siêu thị', 1, N'CRMExternalFacility0001', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (130, N'CRMExternalFacility', N'Hospital', N'Bệnh viện', 2, N'CRMExternalFacility0002', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (131, N'CRMExternalFacility', N'International School', N'Trường học quốc tế', 3, N'CRMExternalFacility0003', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (132, N'CRMExternalFacility', N'Airport', N'Sân bay', 4, N'CRMExternalFacility0004', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (133, N'CRMExternalFacility', N'Bus station', N'Trạm xe buýt', 5, N'CRMExternalFacility0005', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (134, N'CRMCustomerRating', N'Rating 1', N'Tiềm năng 1', 1, N'CRMCustomerRating0001', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (135, N'CRMCustomerRating', N'Rating 2', N'Tiềm năng 2', 2, N'CRMCustomerRating0002', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (136, N'CRMCustomerRating', N'Rating 3', N'Tiềm năng 3', 3, N'CRMCustomerRating0003', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (137, N'CRMAreaRange', N'<= 30m2', N'<= 30m2', 1, N'CRMAreaRange0001', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (138, N'CRMAreaRange', N'30 - 50 m2', N'30 - 50 m2', 2, N'CRMAreaRange0002', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (139, N'CRMAreaRange', N'50 - 80 m2', N'50 - 80 m2', 3, N'CRMAreaRange0003', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (140, N'CRMAreaRange', N'80 - 100 m2', N'80 - 100 m2', 4, N'CRMAreaRange0004', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (141, N'CRMAreaRange', N'100 - 150 m2', N'100 - 150 m2', 5, N'CRMAreaRange0005', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (142, N'CRMAreaRange', N'150 - 200 m2', N'150 - 200 m2', 6, N'CRMAreaRange0006', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (143, N'CRMAreaRange', N'200 - 250 m2', N'200 - 250 m2', 7, N'CRMAreaRange0007', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (144, N'CRMAreaRange', N'250 - 300 m2', N'250 - 300 m2', 8, N'CRMAreaRange0008', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (145, N'CRMAreaRange', N'300 - 500 m2', N'300 - 500 m2', 9, N'CRMAreaRange0009', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (146, N'CRMAreaRange', N'>= 500m2', N'>= 500m2', 10, N'CRMAreaRange0010', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (147, N'CRMCustomerRating', N'Rating 4', N'Tiềm năng 4', 4, N'CRMCustomerRating0004', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (148, N'CRMCustomerRating', N'Rating 5', N'Tiềm năng 5', 5, N'CRMCustomerRating0005', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (149, N'CRMPriceRange', N'3-5 Billion', N'3-5 Tỷ', 6, N'CRMPriceRange0005', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (150, N'CRMPriceRange', N'5-7 Billion', N'5-7 Tỷ', 7, N'CRMPriceRange0006', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (151, N'CRMPriceRange', N'7-10 Billion', N'7-10 Tỷ', 8, N'CRMPriceRange0007', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (152, N'CRMPriceRange', N'10-20 Billion', N'10-20 Tỷ', 9, N'CRMPriceRange0008', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (155, N'CRMPriceRange', N'20-30 Billion', N'20-30 Tỷ', 10, N'CRMPriceRange0009', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (156, N'CRMPriceRange', N'Over 30 Billion', N'Trên 30 Tỷ', 11, N'CRMPriceRange0010', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (157, N'CRMPriceRange', N'Under 500 Million', N'Dưới 500 Triệu', 1, N'CRMPriceRange0000', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (158, N'CRMBedroom', N'Over 5 rooms', N'Trên 5 phòng', 6, N'CRMBedroom0006', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (159, N'ProjectSegment', N'Cheap', N'Giá rẻ', 3, N'ProjectSegment0003', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (161, N'Worklog', N'Create', N'Tạo mới', NULL, N'wlog1', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (162, N'Worklog', N'Modified overview info', N'Cập nhật thông tin chung', NULL, N'wlog2', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (163, N'Worklog', N'Modified more info', N'Cập nhật thông tin mở rộng', NULL, N'wlog3', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (164, N'Worklog', N'Delete', N'Xóa', NULL, N'wlog4', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (165, N'Worklog', N'Modified Real Estate interesting', N'Cập nhật thông tin khách quan tâm BĐS', NULL, N'wlog5', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (166, N'Worklog', N'Modified Car&Truck interesting', N'Cập nhật thông tin khách quan tâm xe hơi, xe tải', NULL, N'wlog6', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (167, N'Worklog', N'Modified Credit interesting', N'Cập nhật thông tin khách quan tâm tín dụng', NULL, N'wlog7', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (168, N'Worklog', N'Add new task', N'Thêm công việc mới', NULL, N'wlog8', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (169, N'Worklog', N'Modifed task', N'Cập nhật công việc', NULL, N'wlog9', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (170, N'Worklog', N'Add new Appointment', N'Thêm mới cuộc hẹn', NULL, N'wlog10', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (171, N'Worklog', N'Modified Appointment', N'Cập nhật lịch hẹn', NULL, N'wlog11', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (172, N'Worklog', N'Send SMS', N'Gửi tin nhắn', NULL, N'wlog12', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (173, N'Worklog', N'Call', N'Gọi điện', NULL, N'wlog13', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (174, N'Worklog', N'Send mail', N'Gửi email', NULL, N'wlog14', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (175, N'Worklog', N'Clone', N'Nhân bản', NULL, N'wlog15', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (176, N'Worklog', N'Assigned', N'Phân bổ', NULL, N'wlog16', 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (177, N'CCRule', N'Call duration at least', N'Thời lượng nghe ít nhất', 2, N'CCRule0002', 0, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-07-20 18:36:29.030' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (178, N'CCRule', N'Call number at least', N'Số cuộc gọi nhận ít nhất', 3, N'CCRule0003', 0, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-07-20 18:36:29.040' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (179, N'CCRule', N'Random assign', N'Phân bổ ngẫu nhiên', 4, N'CCRule0004', 0, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-07-20 18:36:29.050' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (184, N'CCRule', N'Priority ascending', N'Ưu tiên tăng dần', 1, N'CCRule0001', 1, CAST(N'2016-07-20 18:36:29.027' AS DateTime), N'Liemnmfb', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (185, N'CRMCustomerStatus', N'Salesman return', N'NVBH trả lại khách', 17, N'CRMCustomerStatus0017', 1, CAST(N'2016-08-10 20:23:53.237' AS DateTime), N'Liemnmfb', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (186, N'MarriageStatus', N'Married', N'Kết hôn', 0, N'MarriageStatus0002', 0, CAST(N'2016-08-12 10:20:32.530' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (187, N'MarriageStatus', N'Single', N'Độc thân', 0, N'MarriageStatus0001', 0, CAST(N'2016-08-12 10:20:32.537' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (188, N'CRMVendor', N'Broker', N'Môi giới', 4, N'CRMVendor0006', 0, CAST(N'2016-08-21 02:24:53.823' AS DateTime), N'Liemnmfb', CAST(N'2016-08-21 02:25:53.557' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (189, N'CRMSource', N'Mobile app', N'Ứng dụng', 9, N'CRMSource0010', 0, CAST(N'2016-08-21 02:27:35.393' AS DateTime), N'Liemnmfb', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (190, N'CRMCustomerStatus', N'Requested', N'Đã có yêu cầu', 1, N'CRMCustomerStatus0018', 0, CAST(N'2016-08-30 10:27:20.117' AS DateTime), N'Liemnmfb', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (191, N'CRMCustomerStatus', N'Meeting schedule / Meet up', N'Đã hẹn meeting / Gặp mặt', 2, N'CRMCustomerStatus0019', 0, CAST(N'2016-08-30 10:27:20.163' AS DateTime), N'Liemnmfb', CAST(N'2016-08-31 12:00:01.253' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (192, N'CRMCustomerStatus', N'Looked projects', N'Đã xem dự án', 3, N'CRMCustomerStatus0020', 0, CAST(N'2016-08-30 10:27:20.187' AS DateTime), N'Liemnmfb', CAST(N'2016-09-06 18:14:21.867' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (193, N'CRMCustomerStatus', N'Selected project', N'Đã chọn lựa dự án', 4, N'CRMCustomerStatus0021', 0, CAST(N'2016-08-30 10:27:20.207' AS DateTime), N'Liemnmfb', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (194, N'CRMCustomerStatus', N'Successful transaction', N'Giao dịch thành công', 5, N'CRMCustomerStatus0022', 0, CAST(N'2016-08-30 10:27:20.227' AS DateTime), N'Liemnmfb', CAST(N'2016-09-06 18:15:35.627' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (195, N'CRMHandover', N'Full', N'Tất cả', 2, N'CRMHandover0002', 0, CAST(N'2016-09-01 16:45:28.397' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (196, N'CRMHandover', N'Normal', N'Cơ bản', 1, N'CRMHandover0001', 0, CAST(N'2016-09-01 16:45:28.420' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (197, N'CRMServiceType', N'New', N'Mở mới', 1, N'CRMServiceType0001', 0, CAST(N'2016-09-01 16:46:41.320' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (198, N'CRMServiceType', N'Expansion', N'Mở rộng', 2, N'CRMServiceType0002', 0, CAST(N'2016-09-01 16:46:41.347' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (199, N'CRMServiceType', N'Moving', N'Di dời', 3, N'CRMServiceType0003', 0, CAST(N'2016-09-01 16:46:41.367' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (200, N'CRMServiceType', N'Extend contract', N'Gia hạn HĐ', 4, N'CRMServiceType0004', 0, CAST(N'2016-09-01 16:46:41.383' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (203, N'CRMCarInterested', N'Audi', N'Audi', 1, N'CRMCarIterested001', 1, CAST(N'2016-09-07 13:09:57.130' AS DateTime), N'administrator', CAST(N'2016-09-07 13:10:48.000' AS DateTime), N'Liemnmfb')
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (204, N'CRMCarInterested', N'---- Audi A1', N'---- Audi A1', 2, N'CRMCarIterested002', 0, CAST(N'2016-09-07 13:09:57.130' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (205, N'CRMCarInterested', N'---- Audi A3', N'---- Audi A3', 3, N'CRMCarIterested003', 0, CAST(N'2016-09-07 13:09:57.133' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (206, N'CRMCarInterested', N'---- Audi A4', N'---- Audi A4', 4, N'CRMCarIterested004', 0, CAST(N'2016-09-07 13:09:57.133' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (207, N'CRMCarInterested', N'---- Audi A5', N'---- Audi A5', 5, N'CRMCarIterested005', 0, CAST(N'2016-09-07 13:09:57.133' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (208, N'CRMCarInterested', N'---- Audi A6', N'---- Audi A6', 6, N'CRMCarIterested006', 0, CAST(N'2016-09-07 13:09:57.133' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (209, N'CRMCarInterested', N'---- Audi A7', N'---- Audi A7', 7, N'CRMCarIterested007', 0, CAST(N'2016-09-07 13:09:57.133' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (210, N'CRMCarInterested', N'---- Audi A8', N'---- Audi A8', 8, N'CRMCarIterested008', 0, CAST(N'2016-09-07 13:09:57.133' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (211, N'CRMCarInterested', N'---- Audi Q3', N'---- Audi Q3', 9, N'CRMCarIterested009', 0, CAST(N'2016-09-07 13:09:57.133' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (212, N'CRMCarInterested', N'---- Audi Q5', N'---- Audi Q5', 10, N'CRMCarIterested010', 0, CAST(N'2016-09-07 13:09:57.137' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (213, N'CRMCarInterested', N'---- Audi Q7', N'---- Audi Q7', 11, N'CRMCarIterested011', 0, CAST(N'2016-09-07 13:09:57.137' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (214, N'CRMCarInterested', N'---- Audi TT', N'---- Audi TT', 12, N'CRMCarIterested012', 0, CAST(N'2016-09-07 13:09:57.137' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (215, N'CRMCarInterested', N'BMW', N'BMW', 13, N'CRMCarIterested013', 0, CAST(N'2016-09-07 13:09:57.137' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (216, N'CRMCarInterested', N'---- BMW M3', N'---- BMW M3', 14, N'CRMCarIterested014', 0, CAST(N'2016-09-07 13:09:57.137' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (217, N'CRMCarInterested', N'---- BMW M4', N'---- BMW M4', 15, N'CRMCarIterested015', 0, CAST(N'2016-09-07 13:09:57.137' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (218, N'CRMCarInterested', N'---- BMW M6', N'---- BMW M6', 16, N'CRMCarIterested016', 0, CAST(N'2016-09-07 13:09:57.137' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (219, N'CRMCarInterested', N'---- BMW Series 1', N'---- BMW Series 1', 17, N'CRMCarIterested017', 0, CAST(N'2016-09-07 13:09:57.137' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (220, N'CRMCarInterested', N'---- BMW Series 2', N'---- BMW Series 2', 18, N'CRMCarIterested018', 0, CAST(N'2016-09-07 13:09:57.140' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (221, N'CRMCarInterested', N'---- BMW Series 3', N'---- BMW Series 3', 19, N'CRMCarIterested019', 0, CAST(N'2016-09-07 13:09:57.140' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (222, N'CRMCarInterested', N'---- BMW Series 4', N'---- BMW Series 4', 20, N'CRMCarIterested020', 0, CAST(N'2016-09-07 13:09:57.140' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (223, N'CRMCarInterested', N'---- BMW Series 5', N'---- BMW Series 5', 21, N'CRMCarIterested021', 0, CAST(N'2016-09-07 13:09:57.140' AS DateTime), N'administrator', NULL, NULL)
GO
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (224, N'CRMCarInterested', N'---- BMW Series 6', N'---- BMW Series 6', 22, N'CRMCarIterested022', 0, CAST(N'2016-09-07 13:09:57.140' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (225, N'CRMCarInterested', N'---- BMW Series 7', N'---- BMW Series 7', 23, N'CRMCarIterested023', 0, CAST(N'2016-09-07 13:09:57.140' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (226, N'CRMCarInterested', N'---- BMW X1', N'---- BMW X1', 24, N'CRMCarIterested024', 0, CAST(N'2016-09-07 13:09:57.140' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (227, N'CRMCarInterested', N'---- BMW X3', N'---- BMW X3', 25, N'CRMCarIterested025', 0, CAST(N'2016-09-07 13:09:57.140' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (228, N'CRMCarInterested', N'---- BMW X4', N'---- BMW X4', 26, N'CRMCarIterested026', 0, CAST(N'2016-09-07 13:09:57.140' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (229, N'CRMCarInterested', N'---- BMW X5', N'---- BMW X5', 27, N'CRMCarIterested027', 0, CAST(N'2016-09-07 13:09:57.140' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (230, N'CRMCarInterested', N'---- BMW X6', N'---- BMW X6', 28, N'CRMCarIterested028', 0, CAST(N'2016-09-07 13:09:57.143' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (231, N'CRMCarInterested', N'---- BMW Z4', N'---- BMW Z4', 29, N'CRMCarIterested029', 0, CAST(N'2016-09-07 13:09:57.143' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (232, N'CRMCarInterested', N'Changan', N'Changan', 30, N'CRMCarIterested030', 0, CAST(N'2016-09-07 13:09:57.143' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (233, N'CRMCarInterested', N'---- Changan CX 20', N'---- Changan CX 20', 31, N'CRMCarIterested031', 0, CAST(N'2016-09-07 13:09:57.143' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (234, N'CRMCarInterested', N'---- Changan EADO', N'---- Changan EADO', 32, N'CRMCarIterested032', 0, CAST(N'2016-09-07 13:09:57.143' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (235, N'CRMCarInterested', N'---- Changan HONOR', N'---- Changan HONOR', 33, N'CRMCarIterested033', 0, CAST(N'2016-09-07 13:09:57.143' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (236, N'CRMCarInterested', N'Chevrolet', N'Chevrolet', 34, N'CRMCarIterested034', 0, CAST(N'2016-09-07 13:09:57.143' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (237, N'CRMCarInterested', N'---- Chevrolet Aveo / Gentra', N'---- Chevrolet Aveo / Gentra', 35, N'CRMCarIterested035', 0, CAST(N'2016-09-07 13:09:57.147' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (238, N'CRMCarInterested', N'---- Chevrolet Captiva', N'---- Chevrolet Captiva', 36, N'CRMCarIterested036', 0, CAST(N'2016-09-07 13:09:57.147' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (239, N'CRMCarInterested', N'---- Chevrolet Colorado', N'---- Chevrolet Colorado', 37, N'CRMCarIterested037', 0, CAST(N'2016-09-07 13:09:57.147' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (240, N'CRMCarInterested', N'---- Chevrolet Cruze / Lacetti', N'---- Chevrolet Cruze / Lacetti', 38, N'CRMCarIterested038', 0, CAST(N'2016-09-07 13:09:57.147' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (241, N'CRMCarInterested', N'---- Chevrolet Matiz', N'---- Chevrolet Matiz', 39, N'CRMCarIterested039', 0, CAST(N'2016-09-07 13:09:57.147' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (242, N'CRMCarInterested', N'---- Chevrolet Orlando', N'---- Chevrolet Orlando', 40, N'CRMCarIterested040', 0, CAST(N'2016-09-07 13:09:57.147' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (243, N'CRMCarInterested', N'---- Chevrolet Spark / Matiz', N'---- Chevrolet Spark / Matiz', 41, N'CRMCarIterested041', 0, CAST(N'2016-09-07 13:09:57.147' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (244, N'CRMCarInterested', N'Fiat', N'Fiat', 42, N'CRMCarIterested042', 0, CAST(N'2016-09-07 13:09:57.147' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (245, N'CRMCarInterested', N'---- Fiat 500', N'---- Fiat 500', 43, N'CRMCarIterested043', 0, CAST(N'2016-09-07 13:09:57.150' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (246, N'CRMCarInterested', N'---- Fiat Bravo', N'---- Fiat Bravo', 44, N'CRMCarIterested044', 0, CAST(N'2016-09-07 13:09:57.150' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (247, N'CRMCarInterested', N'---- Fiat Punto', N'---- Fiat Punto', 45, N'CRMCarIterested045', 0, CAST(N'2016-09-07 13:09:57.150' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (248, N'CRMCarInterested', N'Ford', N'Ford', 46, N'CRMCarIterested046', 0, CAST(N'2016-09-07 13:09:57.150' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (249, N'CRMCarInterested', N'---- Ford EcoSport', N'---- Ford EcoSport', 47, N'CRMCarIterested047', 0, CAST(N'2016-09-07 13:09:57.150' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (250, N'CRMCarInterested', N'---- Ford Escape', N'---- Ford Escape', 48, N'CRMCarIterested048', 0, CAST(N'2016-09-07 13:09:57.150' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (251, N'CRMCarInterested', N'---- Ford Everest', N'---- Ford Everest', 49, N'CRMCarIterested049', 0, CAST(N'2016-09-07 13:09:57.150' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (252, N'CRMCarInterested', N'---- Ford Fiesta', N'---- Ford Fiesta', 50, N'CRMCarIterested050', 0, CAST(N'2016-09-07 13:09:57.150' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (253, N'CRMCarInterested', N'---- Ford Focus', N'---- Ford Focus', 51, N'CRMCarIterested051', 0, CAST(N'2016-09-07 13:09:57.150' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (254, N'CRMCarInterested', N'---- Ford Mondeo', N'---- Ford Mondeo', 52, N'CRMCarIterested052', 0, CAST(N'2016-09-07 13:09:57.153' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (255, N'CRMCarInterested', N'---- Ford Ranger', N'---- Ford Ranger', 53, N'CRMCarIterested053', 0, CAST(N'2016-09-07 13:09:57.153' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (256, N'CRMCarInterested', N'---- Ford Transit', N'---- Ford Transit', 54, N'CRMCarIterested054', 0, CAST(N'2016-09-07 13:09:57.153' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (257, N'CRMCarInterested', N'Honda', N'Honda', 55, N'CRMCarIterested055', 0, CAST(N'2016-09-07 13:09:57.153' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (258, N'CRMCarInterested', N'---- Honda Accord', N'---- Honda Accord', 56, N'CRMCarIterested056', 0, CAST(N'2016-09-07 13:09:57.153' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (259, N'CRMCarInterested', N'---- Honda City', N'---- Honda City', 57, N'CRMCarIterested057', 0, CAST(N'2016-09-07 13:09:57.153' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (260, N'CRMCarInterested', N'---- Honda Civic', N'---- Honda Civic', 58, N'CRMCarIterested058', 0, CAST(N'2016-09-07 13:09:57.153' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (261, N'CRMCarInterested', N'---- Honda CR-V', N'---- Honda CR-V', 59, N'CRMCarIterested059', 0, CAST(N'2016-09-07 13:09:57.153' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (262, N'CRMCarInterested', N'---- Honda Odyssey', N'---- Honda Odyssey', 60, N'CRMCarIterested060', 0, CAST(N'2016-09-07 13:09:57.157' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (263, N'CRMCarInterested', N'Hyundai', N'Hyundai', 61, N'CRMCarIterested061', 0, CAST(N'2016-09-07 13:09:57.157' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (264, N'CRMCarInterested', N'---- Hyundai Accent', N'---- Hyundai Accent', 62, N'CRMCarIterested062', 0, CAST(N'2016-09-07 13:09:57.157' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (265, N'CRMCarInterested', N'---- Hyundai Avante', N'---- Hyundai Avante', 63, N'CRMCarIterested063', 0, CAST(N'2016-09-07 13:09:57.157' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (266, N'CRMCarInterested', N'---- Hyundai Creta', N'---- Hyundai Creta', 64, N'CRMCarIterested064', 0, CAST(N'2016-09-07 13:09:57.157' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (267, N'CRMCarInterested', N'---- Hyundai Elantra', N'---- Hyundai Elantra', 65, N'CRMCarIterested065', 0, CAST(N'2016-09-07 13:09:57.157' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (268, N'CRMCarInterested', N'---- Hyundai EON', N'---- Hyundai EON', 66, N'CRMCarIterested066', 0, CAST(N'2016-09-07 13:09:57.157' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (269, N'CRMCarInterested', N'---- Hyundai Equus', N'---- Hyundai Equus', 67, N'CRMCarIterested067', 0, CAST(N'2016-09-07 13:09:57.157' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (270, N'CRMCarInterested', N'---- Hyundai Genesis', N'---- Hyundai Genesis', 68, N'CRMCarIterested068', 0, CAST(N'2016-09-07 13:09:57.160' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (271, N'CRMCarInterested', N'---- Hyundai Getz', N'---- Hyundai Getz', 69, N'CRMCarIterested069', 0, CAST(N'2016-09-07 13:09:57.160' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (272, N'CRMCarInterested', N'---- Hyundai i10', N'---- Hyundai i10', 70, N'CRMCarIterested070', 0, CAST(N'2016-09-07 13:09:57.160' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (273, N'CRMCarInterested', N'---- Hyundai i20', N'---- Hyundai i20', 71, N'CRMCarIterested071', 0, CAST(N'2016-09-07 13:09:57.160' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (274, N'CRMCarInterested', N'---- Hyundai i20 Active', N'---- Hyundai i20 Active', 72, N'CRMCarIterested072', 0, CAST(N'2016-09-07 13:09:57.160' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (275, N'CRMCarInterested', N'---- Hyundai i30', N'---- Hyundai i30', 73, N'CRMCarIterested073', 0, CAST(N'2016-09-07 13:09:57.160' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (276, N'CRMCarInterested', N'---- Hyundai Santafe', N'---- Hyundai Santafe', 74, N'CRMCarIterested074', 0, CAST(N'2016-09-07 13:09:57.160' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (277, N'CRMCarInterested', N'---- Hyundai Sonata', N'---- Hyundai Sonata', 75, N'CRMCarIterested075', 0, CAST(N'2016-09-07 13:09:57.163' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (278, N'CRMCarInterested', N'---- Hyundai Tucson', N'---- Hyundai Tucson', 76, N'CRMCarIterested076', 0, CAST(N'2016-09-07 13:09:57.163' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (279, N'CRMCarInterested', N'---- Hyundai Veloster', N'---- Hyundai Veloster', 77, N'CRMCarIterested077', 0, CAST(N'2016-09-07 13:09:57.163' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (280, N'CRMCarInterested', N'Infiniti', N'Infiniti', 78, N'CRMCarIterested078', 0, CAST(N'2016-09-07 13:09:57.163' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (281, N'CRMCarInterested', N'---- Infiniti Q50', N'---- Infiniti Q50', 79, N'CRMCarIterested079', 0, CAST(N'2016-09-07 13:09:57.163' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (282, N'CRMCarInterested', N'---- Infiniti QX60', N'---- Infiniti QX60', 80, N'CRMCarIterested080', 0, CAST(N'2016-09-07 13:09:57.163' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (283, N'CRMCarInterested', N'---- Infiniti QX70', N'---- Infiniti QX70', 81, N'CRMCarIterested081', 0, CAST(N'2016-09-07 13:09:57.163' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (284, N'CRMCarInterested', N'---- Infiniti QX80', N'---- Infiniti QX80', 82, N'CRMCarIterested082', 0, CAST(N'2016-09-07 13:09:57.167' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (285, N'CRMCarInterested', N'Isuzu', N'Isuzu', 83, N'CRMCarIterested083', 0, CAST(N'2016-09-07 13:09:57.167' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (286, N'CRMCarInterested', N'---- Isuzu D-Max', N'---- Isuzu D-Max', 84, N'CRMCarIterested084', 0, CAST(N'2016-09-07 13:09:57.167' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (287, N'CRMCarInterested', N'---- Isuzu Hilander', N'---- Isuzu Hilander', 85, N'CRMCarIterested085', 0, CAST(N'2016-09-07 13:09:57.167' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (288, N'CRMCarInterested', N'---- Isuzu mu-X', N'---- Isuzu mu-X', 86, N'CRMCarIterested086', 0, CAST(N'2016-09-07 13:09:57.167' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (289, N'CRMCarInterested', N'Jaguar', N'Jaguar', 87, N'CRMCarIterested087', 0, CAST(N'2016-09-07 13:09:57.167' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (290, N'CRMCarInterested', N'---- Jaguar F-TYPE', N'---- Jaguar F-TYPE', 88, N'CRMCarIterested088', 0, CAST(N'2016-09-07 13:09:57.167' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (291, N'CRMCarInterested', N'---- Jaguar XE', N'---- Jaguar XE', 89, N'CRMCarIterested089', 0, CAST(N'2016-09-07 13:09:57.170' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (292, N'CRMCarInterested', N'---- Jaguar XF', N'---- Jaguar XF', 90, N'CRMCarIterested090', 0, CAST(N'2016-09-07 13:09:57.170' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (293, N'CRMCarInterested', N'---- Jaguar XJ', N'---- Jaguar XJ', 91, N'CRMCarIterested091', 0, CAST(N'2016-09-07 13:09:57.170' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (294, N'CRMCarInterested', N'KIA', N'KIA', 92, N'CRMCarIterested092', 0, CAST(N'2016-09-07 13:09:57.170' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (295, N'CRMCarInterested', N'---- KIA Cadenza', N'---- KIA Cadenza', 93, N'CRMCarIterested093', 0, CAST(N'2016-09-07 13:09:57.170' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (296, N'CRMCarInterested', N'---- KIA Carens', N'---- KIA Carens', 94, N'CRMCarIterested094', 0, CAST(N'2016-09-07 13:09:57.170' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (297, N'CRMCarInterested', N'---- KIA Carnival', N'---- KIA Carnival', 95, N'CRMCarIterested095', 0, CAST(N'2016-09-07 13:09:57.170' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (298, N'CRMCarInterested', N'---- KIA Forte / Cerato', N'---- KIA Forte / Cerato', 96, N'CRMCarIterested096', 0, CAST(N'2016-09-07 13:09:57.170' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (299, N'CRMCarInterested', N'---- KIA K3', N'---- KIA K3', 97, N'CRMCarIterested097', 0, CAST(N'2016-09-07 13:09:57.170' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (300, N'CRMCarInterested', N'---- KIA Koup', N'---- KIA Koup', 98, N'CRMCarIterested098', 0, CAST(N'2016-09-07 13:09:57.170' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (301, N'CRMCarInterested', N'---- KIA Morning / Picanto', N'---- KIA Morning / Picanto', 99, N'CRMCarIterested099', 0, CAST(N'2016-09-07 13:09:57.170' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (302, N'CRMCarInterested', N'---- KIA Optima', N'---- KIA Optima', 100, N'CRMCarIterested100', 0, CAST(N'2016-09-07 13:09:57.173' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (303, N'CRMCarInterested', N'---- KIA Rio', N'---- KIA Rio', 101, N'CRMCarIterested101', 0, CAST(N'2016-09-07 13:09:57.173' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (304, N'CRMCarInterested', N'---- KIA Rondo', N'---- KIA Rondo', 102, N'CRMCarIterested102', 0, CAST(N'2016-09-07 13:09:57.173' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (305, N'CRMCarInterested', N'---- KIA Sedona', N'---- KIA Sedona', 103, N'CRMCarIterested103', 0, CAST(N'2016-09-07 13:09:57.173' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (306, N'CRMCarInterested', N'---- KIA Sorento', N'---- KIA Sorento', 104, N'CRMCarIterested104', 0, CAST(N'2016-09-07 13:09:57.173' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (307, N'CRMCarInterested', N'---- KIA Soul', N'---- KIA Soul', 105, N'CRMCarIterested105', 0, CAST(N'2016-09-07 13:09:57.173' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (308, N'CRMCarInterested', N'---- KIA Sportage', N'---- KIA Sportage', 106, N'CRMCarIterested106', 0, CAST(N'2016-09-07 13:09:57.173' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (309, N'CRMCarInterested', N'Land Rover', N'Land Rover', 107, N'CRMCarIterested107', 0, CAST(N'2016-09-07 13:09:57.177' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (310, N'CRMCarInterested', N'---- Land Rover All New Range Rover', N'---- Land Rover All New Range Rover', 108, N'CRMCarIterested108', 0, CAST(N'2016-09-07 13:09:57.177' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (311, N'CRMCarInterested', N'---- Land Rover All New Range Rover Sport', N'---- Land Rover All New Range Rover Sport', 109, N'CRMCarIterested109', 0, CAST(N'2016-09-07 13:09:57.177' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (312, N'CRMCarInterested', N'---- Land Rover Discovery', N'---- Land Rover Discovery', 110, N'CRMCarIterested110', 0, CAST(N'2016-09-07 13:09:57.177' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (313, N'CRMCarInterested', N'---- Land Rover Discovery Sport', N'---- Land Rover Discovery Sport', 111, N'CRMCarIterested111', 0, CAST(N'2016-09-07 13:09:57.177' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (314, N'CRMCarInterested', N'---- Land Rover Freelander', N'---- Land Rover Freelander', 112, N'CRMCarIterested112', 0, CAST(N'2016-09-07 13:09:57.177' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (315, N'CRMCarInterested', N'---- Land Rover Range Rover Evoque', N'---- Land Rover Range Rover Evoque', 113, N'CRMCarIterested113', 0, CAST(N'2016-09-07 13:09:57.177' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (316, N'CRMCarInterested', N'Lexus', N'Lexus', 114, N'CRMCarIterested114', 0, CAST(N'2016-09-07 13:09:57.177' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (317, N'CRMCarInterested', N'---- Lexus ES', N'---- Lexus ES', 115, N'CRMCarIterested115', 0, CAST(N'2016-09-07 13:09:57.180' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (318, N'CRMCarInterested', N'---- Lexus GS', N'---- Lexus GS', 116, N'CRMCarIterested116', 0, CAST(N'2016-09-07 13:09:57.180' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (319, N'CRMCarInterested', N'---- Lexus GX', N'---- Lexus GX', 117, N'CRMCarIterested117', 0, CAST(N'2016-09-07 13:09:57.180' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (320, N'CRMCarInterested', N'---- Lexus IS', N'---- Lexus IS', 118, N'CRMCarIterested118', 0, CAST(N'2016-09-07 13:09:57.180' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (321, N'CRMCarInterested', N'---- Lexus LS', N'---- Lexus LS', 119, N'CRMCarIterested119', 0, CAST(N'2016-09-07 13:09:57.180' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (322, N'CRMCarInterested', N'---- Lexus LX', N'---- Lexus LX', 120, N'CRMCarIterested120', 0, CAST(N'2016-09-07 13:09:57.180' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (323, N'CRMCarInterested', N'---- Lexus NX', N'---- Lexus NX', 121, N'CRMCarIterested121', 0, CAST(N'2016-09-07 13:09:57.180' AS DateTime), N'administrator', NULL, NULL)
GO
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (324, N'CRMCarInterested', N'---- Lexus RX', N'---- Lexus RX', 122, N'CRMCarIterested122', 0, CAST(N'2016-09-07 13:09:57.180' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (325, N'CRMCarInterested', N'Luxgen', N'Luxgen', 123, N'CRMCarIterested123', 0, CAST(N'2016-09-07 13:09:57.183' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (326, N'CRMCarInterested', N'---- Luxgen Luxgen5', N'---- Luxgen Luxgen5', 124, N'CRMCarIterested124', 0, CAST(N'2016-09-07 13:09:57.183' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (327, N'CRMCarInterested', N'---- Luxgen Luxgen7', N'---- Luxgen Luxgen7', 125, N'CRMCarIterested125', 0, CAST(N'2016-09-07 13:09:57.183' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (328, N'CRMCarInterested', N'Mazda', N'Mazda', 126, N'CRMCarIterested126', 0, CAST(N'2016-09-07 13:09:57.183' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (329, N'CRMCarInterested', N'---- Mazda 2', N'---- Mazda 2', 127, N'CRMCarIterested127', 0, CAST(N'2016-09-07 13:09:57.183' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (330, N'CRMCarInterested', N'---- Mazda 3', N'---- Mazda 3', 128, N'CRMCarIterested128', 0, CAST(N'2016-09-07 13:09:57.183' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (331, N'CRMCarInterested', N'---- Mazda 6', N'---- Mazda 6', 129, N'CRMCarIterested129', 0, CAST(N'2016-09-07 13:09:57.183' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (332, N'CRMCarInterested', N'---- Mazda BT-50', N'---- Mazda BT-50', 130, N'CRMCarIterested130', 0, CAST(N'2016-09-07 13:09:57.187' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (333, N'CRMCarInterested', N'---- Mazda CX-5', N'---- Mazda CX-5', 131, N'CRMCarIterested131', 0, CAST(N'2016-09-07 13:09:57.187' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (334, N'CRMCarInterested', N'---- Mazda CX-9', N'---- Mazda CX-9', 132, N'CRMCarIterested132', 0, CAST(N'2016-09-07 13:09:57.187' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (335, N'CRMCarInterested', N'---- Mazda Miata MX-5', N'---- Mazda Miata MX-5', 133, N'CRMCarIterested133', 0, CAST(N'2016-09-07 13:09:57.187' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (336, N'CRMCarInterested', N'---- Mazda Premacy', N'---- Mazda Premacy', 134, N'CRMCarIterested134', 0, CAST(N'2016-09-07 13:09:57.187' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (337, N'CRMCarInterested', N'Mercedes-Benz', N'Mercedes-Benz', 135, N'CRMCarIterested135', 0, CAST(N'2016-09-07 13:09:57.187' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (338, N'CRMCarInterested', N'---- Mercedes-Benz A-Class', N'---- Mercedes-Benz A-Class', 136, N'CRMCarIterested136', 0, CAST(N'2016-09-07 13:09:57.187' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (339, N'CRMCarInterested', N'---- Mercedes-Benz C-class', N'---- Mercedes-Benz C-class', 137, N'CRMCarIterested137', 0, CAST(N'2016-09-07 13:09:57.187' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (340, N'CRMCarInterested', N'---- Mercedes-Benz CL-class', N'---- Mercedes-Benz CL-class', 138, N'CRMCarIterested138', 0, CAST(N'2016-09-07 13:09:57.190' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (341, N'CRMCarInterested', N'---- Mercedes-Benz CLA Class', N'---- Mercedes-Benz CLA Class', 139, N'CRMCarIterested139', 0, CAST(N'2016-09-07 13:09:57.190' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (342, N'CRMCarInterested', N'---- Mercedes-Benz CLS-class', N'---- Mercedes-Benz CLS-class', 140, N'CRMCarIterested140', 0, CAST(N'2016-09-07 13:09:57.190' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (343, N'CRMCarInterested', N'---- Mercedes-Benz E-class', N'---- Mercedes-Benz E-class', 141, N'CRMCarIterested141', 0, CAST(N'2016-09-07 13:09:57.190' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (344, N'CRMCarInterested', N'---- Mercedes-Benz G-Class', N'---- Mercedes-Benz G-Class', 142, N'CRMCarIterested142', 0, CAST(N'2016-09-07 13:09:57.190' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (345, N'CRMCarInterested', N'---- Mercedes-Benz GL-class', N'---- Mercedes-Benz GL-class', 143, N'CRMCarIterested143', 0, CAST(N'2016-09-07 13:09:57.190' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (346, N'CRMCarInterested', N'---- Mercedes-Benz GLA-Class', N'---- Mercedes-Benz GLA-Class', 144, N'CRMCarIterested144', 0, CAST(N'2016-09-07 13:09:57.190' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (347, N'CRMCarInterested', N'---- Mercedes-Benz GLC-Class', N'---- Mercedes-Benz GLC-Class', 145, N'CRMCarIterested145', 0, CAST(N'2016-09-07 13:09:57.190' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (348, N'CRMCarInterested', N'---- Mercedes-Benz GLE-Class', N'---- Mercedes-Benz GLE-Class', 146, N'CRMCarIterested146', 0, CAST(N'2016-09-07 13:09:57.190' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (349, N'CRMCarInterested', N'---- Mercedes-Benz GLK-class', N'---- Mercedes-Benz GLK-class', 147, N'CRMCarIterested147', 0, CAST(N'2016-09-07 13:09:57.190' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (350, N'CRMCarInterested', N'---- Mercedes-Benz R-class', N'---- Mercedes-Benz R-class', 148, N'CRMCarIterested148', 0, CAST(N'2016-09-07 13:09:57.190' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (351, N'CRMCarInterested', N'---- Mercedes-Benz S-class', N'---- Mercedes-Benz S-class', 149, N'CRMCarIterested149', 0, CAST(N'2016-09-07 13:09:57.193' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (352, N'CRMCarInterested', N'---- Mercedes-Benz SLK-class', N'---- Mercedes-Benz SLK-class', 150, N'CRMCarIterested150', 0, CAST(N'2016-09-07 13:09:57.193' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (353, N'CRMCarInterested', N'---- Mercedes-Benz Sprinter', N'---- Mercedes-Benz Sprinter', 151, N'CRMCarIterested151', 0, CAST(N'2016-09-07 13:09:57.193' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (354, N'CRMCarInterested', N'---- Mercedes-Benz V-class', N'---- Mercedes-Benz V-class', 152, N'CRMCarIterested152', 0, CAST(N'2016-09-07 13:09:57.193' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (355, N'CRMCarInterested', N'MINI', N'MINI', 153, N'CRMCarIterested153', 0, CAST(N'2016-09-07 13:09:57.193' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (356, N'CRMCarInterested', N'---- MINI 5-Door', N'---- MINI 5-Door', 154, N'CRMCarIterested154', 0, CAST(N'2016-09-07 13:09:57.193' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (357, N'CRMCarInterested', N'---- MINI Clubman', N'---- MINI Clubman', 155, N'CRMCarIterested155', 0, CAST(N'2016-09-07 13:09:57.193' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (358, N'CRMCarInterested', N'---- MINI Cooper', N'---- MINI Cooper', 156, N'CRMCarIterested156', 0, CAST(N'2016-09-07 13:09:57.193' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (359, N'CRMCarInterested', N'---- MINI Countryman', N'---- MINI Countryman', 157, N'CRMCarIterested157', 0, CAST(N'2016-09-07 13:09:57.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (360, N'CRMCarInterested', N'Mitsubishi', N'Mitsubishi', 158, N'CRMCarIterested158', 0, CAST(N'2016-09-07 13:09:57.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (361, N'CRMCarInterested', N'---- Mitsubishi Attrage', N'---- Mitsubishi Attrage', 159, N'CRMCarIterested159', 0, CAST(N'2016-09-07 13:09:57.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (362, N'CRMCarInterested', N'---- Mitsubishi Grandis', N'---- Mitsubishi Grandis', 160, N'CRMCarIterested160', 0, CAST(N'2016-09-07 13:09:57.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (363, N'CRMCarInterested', N'---- Mitsubishi Mirage', N'---- Mitsubishi Mirage', 161, N'CRMCarIterested161', 0, CAST(N'2016-09-07 13:09:57.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (364, N'CRMCarInterested', N'---- Mitsubishi Outlander', N'---- Mitsubishi Outlander', 162, N'CRMCarIterested162', 0, CAST(N'2016-09-07 13:09:57.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (365, N'CRMCarInterested', N'---- Mitsubishi Outlander Sport', N'---- Mitsubishi Outlander Sport', 163, N'CRMCarIterested163', 0, CAST(N'2016-09-07 13:09:57.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (366, N'CRMCarInterested', N'---- Mitsubishi Pajero', N'---- Mitsubishi Pajero', 164, N'CRMCarIterested164', 0, CAST(N'2016-09-07 13:09:57.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (367, N'CRMCarInterested', N'---- Mitsubishi Pajero Sport', N'---- Mitsubishi Pajero Sport', 165, N'CRMCarIterested165', 0, CAST(N'2016-09-07 13:09:57.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (368, N'CRMCarInterested', N'---- Mitsubishi Triton', N'---- Mitsubishi Triton', 166, N'CRMCarIterested166', 0, CAST(N'2016-09-07 13:09:57.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (369, N'CRMCarInterested', N'---- Mitsubishi Zinger', N'---- Mitsubishi Zinger', 167, N'CRMCarIterested167', 0, CAST(N'2016-09-07 13:09:57.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (370, N'CRMCarInterested', N'Nissan', N'Nissan', 168, N'CRMCarIterested168', 0, CAST(N'2016-09-07 13:09:57.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (371, N'CRMCarInterested', N'---- Nissan 370Z', N'---- Nissan 370Z', 169, N'CRMCarIterested169', 0, CAST(N'2016-09-07 13:09:57.200' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (372, N'CRMCarInterested', N'---- Nissan Grand Livina', N'---- Nissan Grand Livina', 170, N'CRMCarIterested170', 0, CAST(N'2016-09-07 13:09:57.200' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (373, N'CRMCarInterested', N'---- Nissan Juke', N'---- Nissan Juke', 171, N'CRMCarIterested171', 0, CAST(N'2016-09-07 13:09:57.200' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (374, N'CRMCarInterested', N'---- Nissan Murano', N'---- Nissan Murano', 172, N'CRMCarIterested172', 0, CAST(N'2016-09-07 13:09:57.200' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (375, N'CRMCarInterested', N'---- Nissan Navara', N'---- Nissan Navara', 173, N'CRMCarIterested173', 0, CAST(N'2016-09-07 13:09:57.200' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (376, N'CRMCarInterested', N'---- Nissan Sunny', N'---- Nissan Sunny', 174, N'CRMCarIterested174', 0, CAST(N'2016-09-07 13:09:57.200' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (377, N'CRMCarInterested', N'---- Nissan Teana', N'---- Nissan Teana', 175, N'CRMCarIterested175', 0, CAST(N'2016-09-07 13:09:57.200' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (378, N'CRMCarInterested', N'---- Nissan Tiida', N'---- Nissan Tiida', 176, N'CRMCarIterested176', 0, CAST(N'2016-09-07 13:09:57.200' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (379, N'CRMCarInterested', N'---- Nissan X-Trail', N'---- Nissan X-Trail', 177, N'CRMCarIterested177', 0, CAST(N'2016-09-07 13:09:57.200' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (380, N'CRMCarInterested', N'Peugeot', N'Peugeot', 178, N'CRMCarIterested178', 0, CAST(N'2016-09-07 13:09:57.200' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (381, N'CRMCarInterested', N'---- Peugeot 208', N'---- Peugeot 208', 179, N'CRMCarIterested179', 0, CAST(N'2016-09-07 13:09:57.200' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (382, N'CRMCarInterested', N'---- Peugeot 3008', N'---- Peugeot 3008', 180, N'CRMCarIterested180', 0, CAST(N'2016-09-07 13:09:57.203' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (383, N'CRMCarInterested', N'---- Peugeot 308', N'---- Peugeot 308', 181, N'CRMCarIterested181', 0, CAST(N'2016-09-07 13:09:57.203' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (384, N'CRMCarInterested', N'---- Peugeot 408', N'---- Peugeot 408', 182, N'CRMCarIterested182', 0, CAST(N'2016-09-07 13:09:57.203' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (385, N'CRMCarInterested', N'---- Peugeot 508', N'---- Peugeot 508', 183, N'CRMCarIterested183', 0, CAST(N'2016-09-07 13:09:57.203' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (386, N'CRMCarInterested', N'---- Peugeot RCZ', N'---- Peugeot RCZ', 184, N'CRMCarIterested184', 0, CAST(N'2016-09-07 13:09:57.203' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (387, N'CRMCarInterested', N'Porsche', N'Porsche', 185, N'CRMCarIterested185', 0, CAST(N'2016-09-07 13:09:57.203' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (388, N'CRMCarInterested', N'---- Porsche 911', N'---- Porsche 911', 186, N'CRMCarIterested186', 0, CAST(N'2016-09-07 13:09:57.203' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (389, N'CRMCarInterested', N'---- Porsche Boxster', N'---- Porsche Boxster', 187, N'CRMCarIterested187', 0, CAST(N'2016-09-07 13:09:57.203' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (390, N'CRMCarInterested', N'---- Porsche Cayenne', N'---- Porsche Cayenne', 188, N'CRMCarIterested188', 0, CAST(N'2016-09-07 13:09:57.207' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (391, N'CRMCarInterested', N'---- Porsche Cayman', N'---- Porsche Cayman', 189, N'CRMCarIterested189', 0, CAST(N'2016-09-07 13:09:57.207' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (392, N'CRMCarInterested', N'---- Porsche Macan', N'---- Porsche Macan', 190, N'CRMCarIterested190', 0, CAST(N'2016-09-07 13:09:57.207' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (393, N'CRMCarInterested', N'---- Porsche Panamera', N'---- Porsche Panamera', 191, N'CRMCarIterested191', 0, CAST(N'2016-09-07 13:09:57.207' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (394, N'CRMCarInterested', N'Renault', N'Renault', 192, N'CRMCarIterested192', 0, CAST(N'2016-09-07 13:09:57.207' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (395, N'CRMCarInterested', N'---- Renault Clio RS', N'---- Renault Clio RS', 193, N'CRMCarIterested193', 0, CAST(N'2016-09-07 13:09:57.207' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (396, N'CRMCarInterested', N'---- Renault Duster', N'---- Renault Duster', 194, N'CRMCarIterested194', 0, CAST(N'2016-09-07 13:09:57.207' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (397, N'CRMCarInterested', N'---- Renault Koleos', N'---- Renault Koleos', 195, N'CRMCarIterested195', 0, CAST(N'2016-09-07 13:09:57.207' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (398, N'CRMCarInterested', N'---- Renault Latitude', N'---- Renault Latitude', 196, N'CRMCarIterested196', 0, CAST(N'2016-09-07 13:09:57.207' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (399, N'CRMCarInterested', N'---- Renault Logan', N'---- Renault Logan', 197, N'CRMCarIterested197', 0, CAST(N'2016-09-07 13:09:57.210' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (400, N'CRMCarInterested', N'---- Renault Megane', N'---- Renault Megane', 198, N'CRMCarIterested198', 0, CAST(N'2016-09-07 13:09:57.210' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (401, N'CRMCarInterested', N'---- Renault Sandero', N'---- Renault Sandero', 199, N'CRMCarIterested199', 0, CAST(N'2016-09-07 13:09:57.210' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (402, N'CRMCarInterested', N'Renault Samsung', N'Renault Samsung', 200, N'CRMCarIterested200', 0, CAST(N'2016-09-07 13:09:57.210' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (403, N'CRMCarInterested', N'---- Renault Samsung QM5', N'---- Renault Samsung QM5', 201, N'CRMCarIterested201', 0, CAST(N'2016-09-07 13:09:57.210' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (404, N'CRMCarInterested', N'---- Renault Samsung SM3', N'---- Renault Samsung SM3', 202, N'CRMCarIterested202', 0, CAST(N'2016-09-07 13:09:57.210' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (405, N'CRMCarInterested', N'---- Renault Samsung SM5', N'---- Renault Samsung SM5', 203, N'CRMCarIterested203', 0, CAST(N'2016-09-07 13:09:57.210' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (406, N'CRMCarInterested', N'Subaru', N'Subaru', 204, N'CRMCarIterested204', 0, CAST(N'2016-09-07 13:09:57.210' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (407, N'CRMCarInterested', N'---- Subaru BRZ', N'---- Subaru BRZ', 205, N'CRMCarIterested205', 0, CAST(N'2016-09-07 13:09:57.210' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (408, N'CRMCarInterested', N'---- Subaru Forester', N'---- Subaru Forester', 206, N'CRMCarIterested206', 0, CAST(N'2016-09-07 13:09:57.210' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (409, N'CRMCarInterested', N'---- Subaru Legacy', N'---- Subaru Legacy', 207, N'CRMCarIterested207', 0, CAST(N'2016-09-07 13:09:57.210' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (410, N'CRMCarInterested', N'---- Subaru Levorg', N'---- Subaru Levorg', 208, N'CRMCarIterested208', 0, CAST(N'2016-09-07 13:09:57.213' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (411, N'CRMCarInterested', N'---- Subaru Outback', N'---- Subaru Outback', 209, N'CRMCarIterested209', 0, CAST(N'2016-09-07 13:09:57.213' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (412, N'CRMCarInterested', N'---- Subaru Tribeca', N'---- Subaru Tribeca', 210, N'CRMCarIterested210', 0, CAST(N'2016-09-07 13:09:57.213' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (413, N'CRMCarInterested', N'---- Subaru WRX', N'---- Subaru WRX', 211, N'CRMCarIterested211', 0, CAST(N'2016-09-07 13:09:57.213' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (414, N'CRMCarInterested', N'---- Subaru XV', N'---- Subaru XV', 212, N'CRMCarIterested212', 0, CAST(N'2016-09-07 13:09:57.213' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (415, N'CRMCarInterested', N'Suzuki', N'Suzuki', 213, N'CRMCarIterested213', 0, CAST(N'2016-09-07 13:09:57.213' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (416, N'CRMCarInterested', N'---- Suzuki APV', N'---- Suzuki APV', 214, N'CRMCarIterested214', 0, CAST(N'2016-09-07 13:09:57.213' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (417, N'CRMCarInterested', N'---- Suzuki Ertiga', N'---- Suzuki Ertiga', 215, N'CRMCarIterested215', 0, CAST(N'2016-09-07 13:09:57.213' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (418, N'CRMCarInterested', N'---- Suzuki Grand Vitara', N'---- Suzuki Grand Vitara', 216, N'CRMCarIterested216', 0, CAST(N'2016-09-07 13:09:57.213' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (419, N'CRMCarInterested', N'---- Suzuki Swift', N'---- Suzuki Swift', 217, N'CRMCarIterested217', 0, CAST(N'2016-09-07 13:09:57.217' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (420, N'CRMCarInterested', N'---- Suzuki Vitara', N'---- Suzuki Vitara', 218, N'CRMCarIterested218', 0, CAST(N'2016-09-07 13:09:57.217' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (421, N'CRMCarInterested', N'Toyota', N'Toyota', 219, N'CRMCarIterested219', 0, CAST(N'2016-09-07 13:09:57.217' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (422, N'CRMCarInterested', N'---- Toyota Altis', N'---- Toyota Altis', 220, N'CRMCarIterested220', 0, CAST(N'2016-09-07 13:09:57.217' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (423, N'CRMCarInterested', N'---- Toyota Camry', N'---- Toyota Camry', 221, N'CRMCarIterested221', 0, CAST(N'2016-09-07 13:09:57.217' AS DateTime), N'administrator', NULL, NULL)
GO
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (424, N'CRMCarInterested', N'---- Toyota Fortuner', N'---- Toyota Fortuner', 222, N'CRMCarIterested222', 0, CAST(N'2016-09-07 13:09:57.217' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (425, N'CRMCarInterested', N'---- Toyota FT-86', N'---- Toyota FT-86', 223, N'CRMCarIterested223', 0, CAST(N'2016-09-07 13:09:57.217' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (426, N'CRMCarInterested', N'---- Toyota Hiace', N'---- Toyota Hiace', 224, N'CRMCarIterested224', 0, CAST(N'2016-09-07 13:09:57.217' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (427, N'CRMCarInterested', N'---- Toyota Hilux', N'---- Toyota Hilux', 225, N'CRMCarIterested225', 0, CAST(N'2016-09-07 13:09:57.220' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (428, N'CRMCarInterested', N'---- Toyota Innova', N'---- Toyota Innova', 226, N'CRMCarIterested226', 0, CAST(N'2016-09-07 13:09:57.220' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (429, N'CRMCarInterested', N'---- Toyota Land Cruiser', N'---- Toyota Land Cruiser', 227, N'CRMCarIterested227', 0, CAST(N'2016-09-07 13:09:57.220' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (430, N'CRMCarInterested', N'---- Toyota Land Cruiser Prado', N'---- Toyota Land Cruiser Prado', 228, N'CRMCarIterested228', 0, CAST(N'2016-09-07 13:09:57.220' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (431, N'CRMCarInterested', N'---- Toyota Sienna', N'---- Toyota Sienna', 229, N'CRMCarIterested229', 0, CAST(N'2016-09-07 13:09:57.220' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (432, N'CRMCarInterested', N'---- Toyota Vios', N'---- Toyota Vios', 230, N'CRMCarIterested230', 0, CAST(N'2016-09-07 13:09:57.220' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (433, N'CRMCarInterested', N'---- Toyota Yaris', N'---- Toyota Yaris', 231, N'CRMCarIterested231', 0, CAST(N'2016-09-07 13:09:57.220' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (434, N'CRMCarInterested', N'Volkswagen', N'Volkswagen', 232, N'CRMCarIterested232', 0, CAST(N'2016-09-07 13:09:57.220' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (435, N'CRMCarInterested', N'---- Volkswagen Beetle', N'---- Volkswagen Beetle', 233, N'CRMCarIterested233', 0, CAST(N'2016-09-07 13:09:57.220' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (436, N'CRMCarInterested', N'---- Volkswagen Passat', N'---- Volkswagen Passat', 234, N'CRMCarIterested234', 0, CAST(N'2016-09-07 13:09:57.220' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (437, N'CRMCarInterested', N'---- Volkswagen Polo', N'---- Volkswagen Polo', 235, N'CRMCarIterested235', 0, CAST(N'2016-09-07 13:09:57.220' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (438, N'CRMCarInterested', N'---- Volkswagen Scirocco', N'---- Volkswagen Scirocco', 236, N'CRMCarIterested236', 0, CAST(N'2016-09-07 13:09:57.223' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (439, N'CRMCarInterested', N'---- Volkswagen Tiguan', N'---- Volkswagen Tiguan', 237, N'CRMCarIterested237', 0, CAST(N'2016-09-07 13:09:57.223' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (440, N'CRMCarInterested', N'---- Volkswagen Touareg', N'---- Volkswagen Touareg', 238, N'CRMCarIterested238', 0, CAST(N'2016-09-07 13:09:57.223' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (441, N'CRMCarInterested', N'Others', N'Others', 239, N'CRMCarIterested239', 0, CAST(N'2016-09-07 13:09:57.223' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (442, N'CRMCarving', N'High chassis 7 seats', N'Gầm cao 7 chỗ', 2, N'CRMCarving0002', 0, CAST(N'2016-09-08 16:06:50.303' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (443, N'CRMCarving', N'Sport', N'Thể thao', 3, N'CRMCarving0003', 0, CAST(N'2016-09-08 16:06:50.420' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (444, N'CRMCarving', N'Sedan', N'Sedan', 4, N'CRMCarving0004', 0, CAST(N'2016-09-08 16:06:50.433' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (445, N'CRMCarving', N'Hatblack', N'Hatblack', 5, N'CRMCarving0005', 0, CAST(N'2016-09-08 16:06:50.443' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (446, N'CRMCarving', N'Versatile 7 seats', N'Đa dụng 7 chỗ', 6, N'CRMCarving0006', 0, CAST(N'2016-09-08 16:06:50.453' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (447, N'CRMCarving', N'Pickup truck', N'Bán tải', 7, N'CRMCarving0007', 0, CAST(N'2016-09-08 16:06:50.487' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (448, N'CRMCarving', N'Other', N'Khác', 8, N'CRMCarving0008', 0, CAST(N'2016-09-08 16:06:50.497' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (449, N'CRMCarving', N'5 seats chassis', N'Gầm cao 5 chỗ', 1, N'CRMCarving0001', 0, CAST(N'2016-09-08 16:06:50.513' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (450, N'CRMCarPrice', N'200 - 500 millions', N'200 - 500 triệu', 1, N'CRMCarPrice0001', 0, CAST(N'2016-09-08 16:15:28.807' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (451, N'CRMCarPrice', N'500 - 800 millions', N'500 - 800 triệu', 2, N'CRMCarPrice0002', 0, CAST(N'2016-09-08 16:15:28.837' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (452, N'CRMCarPrice', N'800 millions - 1 billion', N'800 triệu - 1 tỷ', 3, N'CRMCarPrice0003', 0, CAST(N'2016-09-08 16:15:28.857' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (453, N'CRMCarPrice', N'1 - 1.2 billions', N'1 - 1.2 tỷ', 4, N'CRMCarPrice0004', 0, CAST(N'2016-09-08 16:15:28.863' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (454, N'CRMCarPrice', N'1.2 - 1.5 billions', N'1.2 - 1.5 tỷ', 5, N'CRMCarPrice0005', 0, CAST(N'2016-09-08 16:15:28.887' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (455, N'CRMCarPrice', N'1.5 - 2 billion', N'1.5 - 2 tỷ', 6, N'CRMCarPrice0006', 0, CAST(N'2016-09-08 16:15:28.897' AS DateTime), N'vuongnd1', NULL, NULL)
INSERT [dbo].[Code_Master] ([Id], [Type], [Name], [name_Vi], [order_Num], [Value], [IsDefault], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (456, N'CRMCarPrice', N'Over 2 billion', N'Trên 2 tỷ', 7, N'CRMCarPrice0007', 0, CAST(N'2016-09-08 16:15:28.907' AS DateTime), N'vuongnd1', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Code_Master] OFF
SET IDENTITY_INSERT [dbo].[Parameter] ON 

INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (1, N'MailAdmin', N'vuongnd@twin.vn;liemnm@twin.vn;tiennd@twin.vn', N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (2, N'Ants_LoginUrl', N'https://insight.ants.vn/api/login?email=twin@ants.vn&password=12345678@X', N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (3, N'AntsToken', N'TTdsb1RQKzluZlRWeW5CVjBqckMyUmNZVG9lcTBTUFNrd1g5dmp1SWJwcz06YW50cw==', N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (4, N'VMGUser', N'twinvn', N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-06-01 10:56:42.437' AS DateTime), N'administrator')
INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (5, N'VMGPassword', N'F0reverDM$', N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-06-01 10:58:58.857' AS DateTime), N'administrator')
INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (6, N'smsFreetextLenghPerMessage', N'158', N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (7, N'smsNumOfMesPerBatch', N'500', N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (8, N'ESMSUser', N'66059A241E106569E1ADD0DA3D616A', N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (9, N'ESMSPassword', N'2B92785645178AF9463E1CEFBFFB62', N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (10, N'SMSApiSecret', N'SMSGatewayAPI', N'adminstrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (11, N'VMGBrandName', N'TWIN.VN', N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-05-31 17:32:58.017' AS DateTime), N'administrator')
INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (12, N'smsToAssignee-Assignment', N'1', N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-05-26 16:24:19.060' AS DateTime), N'administrator')
INSERT [dbo].[Parameter] ([Id], [ParameterName], [Value], [UserID], [RowCreatedTime], [RowCreatedUser], [RowLastUpdatedTime], [RowLastUpdatedUser]) VALUES (13, N'smsMessageToAssignee-Assignment', N'Ban vua duoc phan bo khach hang moi [*.*]. Xem chi tiet tu email. Cam on', N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator', CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'administrator')
SET IDENTITY_INSERT [dbo].[Parameter] OFF
SET IDENTITY_INSERT [dbo].[Territory] ON 

INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (242, N'country', N'VIET NAM', 0, CAST(N'2016-05-22 17:49:17.003' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (243, N'country', N'AFGHANISTAN', 0, CAST(N'2016-05-22 17:49:17.013' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (244, N'country', N'ÅLAND ISLANDS', 0, CAST(N'2016-05-22 17:49:17.020' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (245, N'country', N'ALBANIA', 0, CAST(N'2016-05-22 17:49:17.043' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (246, N'country', N'ALGERIA', 0, CAST(N'2016-05-22 17:49:17.050' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (247, N'country', N'AMERICAN SAMOA', 0, CAST(N'2016-05-22 17:49:17.053' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (248, N'country', N'ANDORRA', 0, CAST(N'2016-05-22 17:49:17.060' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (249, N'country', N'ANGOLA', 0, CAST(N'2016-05-22 17:49:17.080' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (250, N'country', N'ANGUILLA', 0, CAST(N'2016-05-22 17:49:17.097' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (251, N'country', N'ANTARCTICA', 0, CAST(N'2016-05-22 17:49:17.103' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (252, N'country', N'ANTIGUA AND BARBUDA', 0, CAST(N'2016-05-22 17:49:17.110' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (253, N'country', N'ARGENTINA', 0, CAST(N'2016-05-22 17:49:17.127' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (254, N'country', N'ARMENIA', 0, CAST(N'2016-05-22 17:49:17.143' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (255, N'country', N'ARUBA', 0, CAST(N'2016-05-22 17:49:17.150' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (256, N'country', N'AUSTRALIA', 0, CAST(N'2016-05-22 17:49:17.157' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (257, N'country', N'AUSTRIA', 0, CAST(N'2016-05-22 17:49:17.173' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (258, N'country', N'AZERBAIJAN', 0, CAST(N'2016-05-22 17:49:17.193' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (259, N'country', N'BAHAMAS', 0, CAST(N'2016-05-22 17:49:17.200' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (260, N'country', N'BAHRAIN', 0, CAST(N'2016-05-22 17:49:17.217' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (261, N'country', N'BANGLADESH', 0, CAST(N'2016-05-22 17:49:17.223' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (262, N'country', N'BARBADOS', 0, CAST(N'2016-05-22 17:49:17.240' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (263, N'country', N'BELARUS', 0, CAST(N'2016-05-22 17:49:17.253' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (264, N'country', N'BELGIUM', 0, CAST(N'2016-05-22 17:49:17.263' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (265, N'country', N'BELIZE', 0, CAST(N'2016-05-22 17:49:17.277' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (266, N'country', N'BENIN', 0, CAST(N'2016-05-22 17:49:17.290' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (267, N'country', N'BERMUDA', 0, CAST(N'2016-05-22 17:49:17.307' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (268, N'country', N'BHUTAN', 0, CAST(N'2016-05-22 17:49:17.313' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (269, N'country', N'BOLIVIA', 0, CAST(N'2016-05-22 17:49:17.330' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (270, N'country', N'BOSNIA AND HERZEGOVINA', 0, CAST(N'2016-05-22 17:49:17.350' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (271, N'country', N'BOTSWANA', 0, CAST(N'2016-05-22 17:49:17.353' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (272, N'country', N'BOUVET ISLAND', 0, CAST(N'2016-05-22 17:49:17.360' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (273, N'country', N'BRAZIL', 0, CAST(N'2016-05-22 17:49:17.380' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (274, N'country', N'BRITISH INDIAN OCEAN TERRITORY', 0, CAST(N'2016-05-22 17:49:17.397' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (275, N'country', N'BRUNEI DARUSSALAM', 0, CAST(N'2016-05-22 17:49:17.413' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (276, N'country', N'BULGARIA', 0, CAST(N'2016-05-22 17:49:17.433' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (277, N'country', N'BURKINA FASO', 0, CAST(N'2016-05-22 17:49:17.440' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (278, N'country', N'BURUNDI', 0, CAST(N'2016-05-22 17:49:17.443' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (279, N'country', N'CAMBODIA', 0, CAST(N'2016-05-22 17:49:17.450' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (280, N'country', N'CAMEROON', 0, CAST(N'2016-05-22 17:49:17.453' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (281, N'country', N'CANADA', 0, CAST(N'2016-05-22 17:49:17.460' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (282, N'country', N'CAPE VERDE', 0, CAST(N'2016-05-22 17:49:17.467' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (283, N'country', N'CAYMAN ISLANDS', 0, CAST(N'2016-05-22 17:49:17.483' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (284, N'country', N'CENTRAL AFRICAN REPUBLIC', 0, CAST(N'2016-05-22 17:49:17.500' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (285, N'country', N'CHAD', 0, CAST(N'2016-05-22 17:49:17.507' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (286, N'country', N'CHILE', 0, CAST(N'2016-05-22 17:49:17.513' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (287, N'country', N'CHINA', 0, CAST(N'2016-05-22 17:49:17.530' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (288, N'country', N'CHRISTMAS ISLAND', 0, CAST(N'2016-05-22 17:49:17.547' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (289, N'country', N'COCOS (KEELING) ISLANDS', 0, CAST(N'2016-05-22 17:49:17.553' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (290, N'country', N'COLOMBIA', 0, CAST(N'2016-05-22 17:49:17.560' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (291, N'country', N'COMOROS', 0, CAST(N'2016-05-22 17:49:17.577' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (292, N'country', N'CONGO', 0, CAST(N'2016-05-22 17:49:17.597' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (293, N'country', N'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 0, CAST(N'2016-05-22 17:49:17.600' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (294, N'country', N'COOK ISLANDS', 0, CAST(N'2016-05-22 17:49:17.607' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (295, N'country', N'COSTA RICA', 0, CAST(N'2016-05-22 17:49:17.627' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (296, N'country', N'CÔTE D''IVOIRE', 0, CAST(N'2016-05-22 17:49:17.643' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (297, N'country', N'CROATIA', 0, CAST(N'2016-05-22 17:49:17.650' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (298, N'country', N'CUBA', 0, CAST(N'2016-05-22 17:49:17.657' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (299, N'country', N'CYPRUS', 0, CAST(N'2016-05-22 17:49:17.673' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (300, N'country', N'CZECH REPUBLIC', 0, CAST(N'2016-05-22 17:49:17.690' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (301, N'country', N'DENMARK', 0, CAST(N'2016-05-22 17:49:17.697' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (302, N'country', N'DJIBOUTI', 0, CAST(N'2016-05-22 17:49:17.717' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (303, N'country', N'DOMINICA', 0, CAST(N'2016-05-22 17:49:17.733' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (304, N'country', N'DOMINICAN REPUBLIC', 0, CAST(N'2016-05-22 17:49:17.740' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (305, N'country', N'ECUADOR', 0, CAST(N'2016-05-22 17:49:17.747' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (306, N'country', N'EGYPT', 0, CAST(N'2016-05-22 17:49:17.763' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (307, N'country', N'EL SALVADOR', 0, CAST(N'2016-05-22 17:49:17.780' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (308, N'country', N'EQUATORIAL GUINEA', 0, CAST(N'2016-05-22 17:49:17.787' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (309, N'country', N'ERITREA', 0, CAST(N'2016-05-22 17:49:17.793' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (310, N'country', N'ESTONIA', 0, CAST(N'2016-05-22 17:49:17.810' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (311, N'country', N'ETHIOPIA', 0, CAST(N'2016-05-22 17:49:17.830' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (312, N'country', N'FALKLAND ISLANDS (MALVINAS)', 0, CAST(N'2016-05-22 17:49:17.837' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (313, N'country', N'FAROE ISLANDS', 0, CAST(N'2016-05-22 17:49:17.840' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (314, N'country', N'FIJI', 0, CAST(N'2016-05-22 17:49:17.860' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (315, N'country', N'FINLAND', 0, CAST(N'2016-05-22 17:49:17.880' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (316, N'country', N'FRANCE', 0, CAST(N'2016-05-22 17:49:17.887' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (317, N'country', N'FRENCH GUIANA', 0, CAST(N'2016-05-22 17:49:17.903' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (318, N'country', N'FRENCH POLYNESIA', 0, CAST(N'2016-05-22 17:49:17.920' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (319, N'country', N'FRENCH SOUTHERN TERRITORIES', 0, CAST(N'2016-05-22 17:49:17.927' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (320, N'country', N'GABON', 0, CAST(N'2016-05-22 17:49:17.933' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (321, N'country', N'GAMBIA', 0, CAST(N'2016-05-22 17:49:17.950' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (322, N'country', N'GEORGIA', 0, CAST(N'2016-05-22 17:49:17.970' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (323, N'country', N'GERMANY', 0, CAST(N'2016-05-22 17:49:17.977' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (324, N'country', N'GHANA', 0, CAST(N'2016-05-22 17:49:17.993' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (325, N'country', N'GIBRALTAR', 0, CAST(N'2016-05-22 17:49:18.000' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (326, N'country', N'GREECE', 0, CAST(N'2016-05-22 17:49:18.007' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (327, N'country', N'GREENLAND', 0, CAST(N'2016-05-22 17:49:18.023' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (328, N'country', N'GRENADA', 0, CAST(N'2016-05-22 17:49:18.040' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (329, N'country', N'GUADELOUPE', 0, CAST(N'2016-05-22 17:49:18.047' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (330, N'country', N'GUAM', 0, CAST(N'2016-05-22 17:49:18.053' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (331, N'country', N'GUATEMALA', 0, CAST(N'2016-05-22 17:49:18.073' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (332, N'country', N'GUINEA', 0, CAST(N'2016-05-22 17:49:18.090' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (333, N'country', N'GUINEA-BISSAU', 0, CAST(N'2016-05-22 17:49:18.097' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (334, N'country', N'GUYANA', 0, CAST(N'2016-05-22 17:49:18.100' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (335, N'country', N'HAITI', 0, CAST(N'2016-05-22 17:49:18.120' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (336, N'country', N'HEARD ISLAND AND MCDONALD ISLANDS', 0, CAST(N'2016-05-22 17:49:18.157' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (337, N'country', N'HOLY SEE (VATICAN CITY STATE)', 0, CAST(N'2016-05-22 17:49:18.180' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (338, N'country', N'HONDURAS', 0, CAST(N'2016-05-22 17:49:18.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (339, N'country', N'HONG KONG', 0, CAST(N'2016-05-22 17:49:18.203' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (340, N'country', N'HUNGARY', 0, CAST(N'2016-05-22 17:49:18.210' AS DateTime), N'administrator', NULL, NULL)
GO
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (341, N'country', N'ICELAND', 0, CAST(N'2016-05-22 17:49:18.237' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (342, N'country', N'INDIA', 0, CAST(N'2016-05-22 17:49:18.253' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (343, N'country', N'INDONESIA', 0, CAST(N'2016-05-22 17:49:18.273' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (344, N'country', N'IRAN, ISLAMIC REPUBLIC OF', 0, CAST(N'2016-05-22 17:49:18.290' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (345, N'country', N'IRAQ', 0, CAST(N'2016-05-22 17:49:18.310' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (346, N'country', N'IRELAND', 0, CAST(N'2016-05-22 17:49:18.327' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (347, N'country', N'ISRAEL', 0, CAST(N'2016-05-22 17:49:18.343' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (348, N'country', N'ITALY', 0, CAST(N'2016-05-22 17:49:18.363' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (349, N'country', N'JAMAICA', 0, CAST(N'2016-05-22 17:49:18.380' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (350, N'country', N'JAPAN', 0, CAST(N'2016-05-22 17:49:18.387' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (351, N'country', N'JORDAN', 0, CAST(N'2016-05-22 17:49:18.403' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (352, N'country', N'KAZAKHSTAN', 0, CAST(N'2016-05-22 17:49:18.423' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (353, N'country', N'KENYA', 0, CAST(N'2016-05-22 17:49:18.430' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (354, N'country', N'KIRIBATI', 0, CAST(N'2016-05-22 17:49:18.433' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (355, N'country', N'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 0, CAST(N'2016-05-22 17:49:18.453' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (356, N'country', N'KOREA, REPUBLIC OF', 0, CAST(N'2016-05-22 17:49:18.477' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (357, N'country', N'KUWAIT', 0, CAST(N'2016-05-22 17:49:18.483' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (358, N'country', N'KYRGYZSTAN', 0, CAST(N'2016-05-22 17:49:18.490' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (359, N'country', N'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 0, CAST(N'2016-05-22 17:49:18.507' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (360, N'country', N'LATVIA', 0, CAST(N'2016-05-22 17:49:18.523' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (361, N'country', N'LEBANON', 0, CAST(N'2016-05-22 17:49:18.530' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (362, N'country', N'LESOTHO', 0, CAST(N'2016-05-22 17:49:18.537' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (363, N'country', N'LIBERIA', 0, CAST(N'2016-05-22 17:49:18.543' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (364, N'country', N'LIBYAN ARAB JAMAHIRIYA', 0, CAST(N'2016-05-22 17:49:18.550' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (365, N'country', N'LIECHTENSTEIN', 0, CAST(N'2016-05-22 17:49:18.553' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (366, N'country', N'LITHUANIA', 0, CAST(N'2016-05-22 17:49:18.560' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (367, N'country', N'LUXEMBOURG', 0, CAST(N'2016-05-22 17:49:18.567' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (368, N'country', N'MACAO', 0, CAST(N'2016-05-22 17:49:18.573' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (369, N'country', N'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 0, CAST(N'2016-05-22 17:49:18.580' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (370, N'country', N'MADAGASCAR', 0, CAST(N'2016-05-22 17:49:18.583' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (371, N'country', N'MALAWI', 0, CAST(N'2016-05-22 17:49:18.590' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (372, N'country', N'MALAYSIA', 0, CAST(N'2016-05-22 17:49:18.597' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (373, N'country', N'MALDIVES', 0, CAST(N'2016-05-22 17:49:18.603' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (374, N'country', N'MALI', 0, CAST(N'2016-05-22 17:49:18.610' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (375, N'country', N'MALTA', 0, CAST(N'2016-05-22 17:49:18.613' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (376, N'country', N'MARSHALL ISLANDS', 0, CAST(N'2016-05-22 17:49:18.620' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (377, N'country', N'MARTINIQUE', 0, CAST(N'2016-05-22 17:49:18.627' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (378, N'country', N'MAURITANIA', 0, CAST(N'2016-05-22 17:49:18.633' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (379, N'country', N'MAURITIUS', 0, CAST(N'2016-05-22 17:49:18.650' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (380, N'country', N'MAYOTTE', 0, CAST(N'2016-05-22 17:49:18.660' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (381, N'country', N'MEXICO', 0, CAST(N'2016-05-22 17:49:18.663' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (382, N'country', N'MICRONESIA, FEDERATED STATES OF', 0, CAST(N'2016-05-22 17:49:18.670' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (383, N'country', N'MOLDOVA, REPUBLIC OF', 0, CAST(N'2016-05-22 17:49:18.677' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (384, N'country', N'MONACO', 0, CAST(N'2016-05-22 17:49:18.683' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (385, N'country', N'MONGOLIA', 0, CAST(N'2016-05-22 17:49:18.690' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (386, N'country', N'MONTSERRAT', 0, CAST(N'2016-05-22 17:49:18.693' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (387, N'country', N'MOROCCO', 0, CAST(N'2016-05-22 17:49:18.700' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (388, N'country', N'MOZAMBIQUE', 0, CAST(N'2016-05-22 17:49:18.707' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (389, N'country', N'MYANMAR', 0, CAST(N'2016-05-22 17:49:18.713' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (390, N'country', N'NAMIBIA', 0, CAST(N'2016-05-22 17:49:18.720' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (391, N'country', N'NAURU', 0, CAST(N'2016-05-22 17:49:18.723' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (392, N'country', N'NEPAL', 0, CAST(N'2016-05-22 17:49:18.730' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (393, N'country', N'NETHERLANDS', 0, CAST(N'2016-05-22 17:49:18.737' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (394, N'country', N'NETHERLANDS ANTILLES', 0, CAST(N'2016-05-22 17:49:18.743' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (395, N'country', N'NEW CALEDONIA', 0, CAST(N'2016-05-22 17:49:18.750' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (396, N'country', N'NEW ZEALAND', 0, CAST(N'2016-05-22 17:49:18.757' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (397, N'country', N'NICARAGUA', 0, CAST(N'2016-05-22 17:49:18.763' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (398, N'country', N'NIGER', 0, CAST(N'2016-05-22 17:49:18.770' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (399, N'country', N'NIGERIA', 0, CAST(N'2016-05-22 17:49:18.773' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (400, N'country', N'NIUE', 0, CAST(N'2016-05-22 17:49:18.780' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (401, N'country', N'NORFOLK ISLAND', 0, CAST(N'2016-05-22 17:49:18.787' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (402, N'country', N'NORTHERN MARIANA ISLANDS', 0, CAST(N'2016-05-22 17:49:18.793' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (403, N'country', N'NORWAY', 0, CAST(N'2016-05-22 17:49:18.800' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (404, N'country', N'OMAN', 0, CAST(N'2016-05-22 17:49:18.803' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (405, N'country', N'PAKISTAN', 0, CAST(N'2016-05-22 17:49:18.810' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (406, N'country', N'PALAU', 0, CAST(N'2016-05-22 17:49:18.817' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (407, N'country', N'PALESTINIAN TERRITORY, OCCUPIED', 0, CAST(N'2016-05-22 17:49:18.823' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (408, N'country', N'PANAMA', 0, CAST(N'2016-05-22 17:49:18.830' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (409, N'country', N'PAPUA NEW GUINEA', 0, CAST(N'2016-05-22 17:49:18.847' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (410, N'country', N'PARAGUAY', 0, CAST(N'2016-05-22 17:49:18.857' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (411, N'country', N'PERU', 0, CAST(N'2016-05-22 17:49:18.870' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (412, N'country', N'PHILIPPINES', 0, CAST(N'2016-05-22 17:49:18.877' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (413, N'country', N'PITCAIRN', 0, CAST(N'2016-05-22 17:49:18.900' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (414, N'country', N'POLAND', 0, CAST(N'2016-05-22 17:49:18.910' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (415, N'country', N'PORTUGAL', 0, CAST(N'2016-05-22 17:49:18.917' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (416, N'country', N'PUERTO RICO', 0, CAST(N'2016-05-22 17:49:18.920' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (417, N'country', N'QATAR', 0, CAST(N'2016-05-22 17:49:18.940' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (418, N'country', N'RÉUNION', 0, CAST(N'2016-05-22 17:49:18.950' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (419, N'country', N'ROMANIA', 0, CAST(N'2016-05-22 17:49:18.963' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (420, N'country', N'RUSSIAN FEDERATION', 0, CAST(N'2016-05-22 17:49:18.970' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (421, N'country', N'RWANDA', 0, CAST(N'2016-05-22 17:49:18.993' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (422, N'country', N'SAINT HELENA', 0, CAST(N'2016-05-22 17:49:19.003' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (423, N'country', N'SAINT KITTS AND NEVIS', 0, CAST(N'2016-05-22 17:49:19.017' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (424, N'country', N'SAINT LUCIA', 0, CAST(N'2016-05-22 17:49:19.033' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (425, N'country', N'SAINT PIERRE AND MIQUELON', 0, CAST(N'2016-05-22 17:49:19.040' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (426, N'country', N'SAINT VINCENT AND THE GRENADINES', 0, CAST(N'2016-05-22 17:49:19.047' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (427, N'country', N'SAMOA', 0, CAST(N'2016-05-22 17:49:19.070' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (428, N'country', N'SAN MARINO', 0, CAST(N'2016-05-22 17:49:19.077' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (429, N'country', N'SAO TOME AND PRINCIPE', 0, CAST(N'2016-05-22 17:49:19.093' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (430, N'country', N'SAUDI ARABIA', 0, CAST(N'2016-05-22 17:49:19.107' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (431, N'country', N'SENEGAL', 0, CAST(N'2016-05-22 17:49:19.117' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (432, N'country', N'SERBIA AND MONTENEGRO', 0, CAST(N'2016-05-22 17:49:19.123' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (433, N'country', N'SEYCHELLES', 0, CAST(N'2016-05-22 17:49:19.130' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (434, N'country', N'SIERRA LEONE', 0, CAST(N'2016-05-22 17:49:19.153' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (435, N'country', N'SINGAPORE', 0, CAST(N'2016-05-22 17:49:19.160' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (436, N'country', N'SLOVAKIA', 0, CAST(N'2016-05-22 17:49:19.167' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (437, N'country', N'SLOVENIA', 0, CAST(N'2016-05-22 17:49:19.173' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (438, N'country', N'SOLOMON ISLANDS', 0, CAST(N'2016-05-22 17:49:19.190' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (439, N'country', N'SOMALIA', 0, CAST(N'2016-05-22 17:49:19.207' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (440, N'country', N'SOUTH AFRICA', 0, CAST(N'2016-05-22 17:49:19.213' AS DateTime), N'administrator', NULL, NULL)
GO
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (441, N'country', N'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 0, CAST(N'2016-05-22 17:49:19.220' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (442, N'country', N'SPAIN', 0, CAST(N'2016-05-22 17:49:19.223' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (443, N'country', N'SRI LANKA', 0, CAST(N'2016-05-22 17:49:19.250' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (444, N'country', N'SUDAN', 0, CAST(N'2016-05-22 17:49:19.253' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (445, N'country', N'SURINAME', 0, CAST(N'2016-05-22 17:49:19.280' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (446, N'country', N'SVALBARD AND JAN MAYEN', 0, CAST(N'2016-05-22 17:49:19.283' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (447, N'country', N'SWAZILAND', 0, CAST(N'2016-05-22 17:49:19.310' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (448, N'country', N'SWEDEN', 0, CAST(N'2016-05-22 17:49:19.313' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (449, N'country', N'SWITZERLAND', 0, CAST(N'2016-05-22 17:49:19.333' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (450, N'country', N'SYRIAN ARAB REPUBLIC', 0, CAST(N'2016-05-22 17:49:19.340' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (451, N'country', N'TAIWAN, PROVINCE OF CHINA', 0, CAST(N'2016-05-22 17:49:19.343' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (452, N'country', N'TAJIKISTAN', 0, CAST(N'2016-05-22 17:49:19.363' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (453, N'country', N'TANZANIA, UNITED REPUBLIC OF', 0, CAST(N'2016-05-22 17:49:19.370' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (454, N'country', N'THAILAND', 0, CAST(N'2016-05-22 17:49:19.373' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (455, N'country', N'TIMOR-LESTE', 0, CAST(N'2016-05-22 17:49:19.380' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (456, N'country', N'TOGO', 0, CAST(N'2016-05-22 17:49:19.400' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (457, N'country', N'TOKELAU', 0, CAST(N'2016-05-22 17:49:19.403' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (458, N'country', N'TONGA', 0, CAST(N'2016-05-22 17:49:19.410' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (459, N'country', N'TRINIDAD AND TOBAGO', 0, CAST(N'2016-05-22 17:49:19.430' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (460, N'country', N'TUNISIA', 0, CAST(N'2016-05-22 17:49:19.433' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (461, N'country', N'TURKEY', 0, CAST(N'2016-05-22 17:49:19.440' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (462, N'country', N'TURKMENISTAN', 0, CAST(N'2016-05-22 17:49:19.460' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (463, N'country', N'TURKS AND CAICOS ISLANDS', 0, CAST(N'2016-05-22 17:49:19.463' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (464, N'country', N'TUVALU', 0, CAST(N'2016-05-22 17:49:19.470' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (465, N'country', N'UGANDA', 0, CAST(N'2016-05-22 17:49:19.490' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (466, N'country', N'UKRAINE', 0, CAST(N'2016-05-22 17:49:19.497' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (467, N'country', N'UNITED ARAB EMIRATES', 0, CAST(N'2016-05-22 17:49:19.500' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (468, N'country', N'UNITED KINGDOM', 0, CAST(N'2016-05-22 17:49:19.520' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (469, N'country', N'UNITED STATES', 0, CAST(N'2016-05-22 17:49:19.527' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (470, N'country', N'UNITED STATES MINOR OUTLYING ISLANDS', 0, CAST(N'2016-05-22 17:49:19.530' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (471, N'country', N'URUGUAY', 0, CAST(N'2016-05-22 17:49:19.537' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (472, N'country', N'UZBEKISTAN', 0, CAST(N'2016-05-22 17:49:19.560' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (473, N'country', N'VANUATU', 0, CAST(N'2016-05-22 17:49:19.567' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (474, N'country', N'Vatican City State see HOLY SEEVA', 0, CAST(N'2016-05-22 17:49:19.587' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (475, N'country', N'VENEZUELA', 0, CAST(N'2016-05-22 17:49:19.590' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (476, N'country', N'VIRGIN ISLANDS, BRITISH', 0, CAST(N'2016-05-22 17:49:19.597' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (477, N'country', N'VIRGIN ISLANDS, U.S.', 0, CAST(N'2016-05-22 17:49:19.610' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (478, N'country', N'WALLIS AND FUTUNA', 0, CAST(N'2016-05-22 17:49:19.620' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (479, N'country', N'WESTERN SAHARA', 0, CAST(N'2016-05-22 17:49:19.627' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (480, N'country', N'YEMEN', 0, CAST(N'2016-05-22 17:49:19.647' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (481, N'country', N'ZAMBIA', 0, CAST(N'2016-05-22 17:49:19.650' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (482, N'country', N'ZIMBABWE', 0, CAST(N'2016-05-22 17:49:19.657' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (483, N'province', N'Tp. Hồ Chí Minh', 242, CAST(N'2016-05-22 17:53:12.447' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (484, N'province', N'Hà Nội', 242, CAST(N'2016-05-22 17:53:12.457' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (485, N'province', N'Đà Nẵng', 242, CAST(N'2016-05-22 17:53:12.463' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (486, N'province', N'Hải Phòng', 242, CAST(N'2016-05-22 17:53:12.483' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (487, N'province', N'Cần Thơ', 242, CAST(N'2016-05-22 17:53:12.500' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (488, N'province', N'An Giang', 242, CAST(N'2016-05-22 17:53:12.510' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (489, N'province', N'Bà Rịa - Vũng Tàu', 242, CAST(N'2016-05-22 17:53:12.517' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (490, N'province', N'Bắc Giang', 242, CAST(N'2016-05-22 17:53:12.523' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (491, N'province', N'Bắc Kạn', 242, CAST(N'2016-05-22 17:53:12.540' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (492, N'province', N'Bạc Liêu', 242, CAST(N'2016-05-22 17:53:12.547' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (493, N'province', N'Bắc Ninh', 242, CAST(N'2016-05-22 17:53:12.553' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (494, N'province', N'Bến Tre', 242, CAST(N'2016-05-22 17:53:12.570' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (495, N'province', N'Bình Định', 242, CAST(N'2016-05-22 17:53:12.583' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (496, N'province', N'Bình Dương', 242, CAST(N'2016-05-22 17:53:12.590' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (497, N'province', N'Bình Phước', 242, CAST(N'2016-05-22 17:53:12.600' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (498, N'province', N'Bình Thuận', 242, CAST(N'2016-05-22 17:53:12.610' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (499, N'province', N'Cà Mau', 242, CAST(N'2016-05-22 17:53:12.620' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (500, N'province', N'Cao Bằng', 242, CAST(N'2016-05-22 17:53:12.627' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (501, N'province', N'Đắk Lắk', 242, CAST(N'2016-05-22 17:53:12.630' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (502, N'province', N'Đắk Nông', 242, CAST(N'2016-05-22 17:53:12.637' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (503, N'province', N'Điện Biên', 242, CAST(N'2016-05-22 17:53:12.653' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (504, N'province', N'Đồng Nai', 242, CAST(N'2016-05-22 17:53:12.670' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (505, N'province', N'Đồng Tháp', 242, CAST(N'2016-05-22 17:53:12.677' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (506, N'province', N'Gia Lai', 242, CAST(N'2016-05-22 17:53:12.683' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (507, N'province', N'Hà Giang', 242, CAST(N'2016-05-22 17:53:12.700' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (508, N'province', N'Hà Nam', 242, CAST(N'2016-05-22 17:53:12.720' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (509, N'province', N'Hà Tĩnh', 242, CAST(N'2016-05-22 17:53:12.723' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (510, N'province', N'Hải Dương', 242, CAST(N'2016-05-22 17:53:12.730' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (511, N'province', N'Hậu Giang', 242, CAST(N'2016-05-22 17:53:12.750' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (512, N'province', N'Hòa Bình', 242, CAST(N'2016-05-22 17:53:12.767' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (513, N'province', N'Hưng Yên', 242, CAST(N'2016-05-22 17:53:12.773' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (514, N'province', N'Khánh Hòa', 242, CAST(N'2016-05-22 17:53:12.780' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (515, N'province', N'Kiên Giang', 242, CAST(N'2016-05-22 17:53:12.797' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (516, N'province', N'Kon Tum', 242, CAST(N'2016-05-22 17:53:12.813' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (517, N'province', N'Lai Châu', 242, CAST(N'2016-05-22 17:53:12.820' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (518, N'province', N'Lâm Đồng', 242, CAST(N'2016-05-22 17:53:12.840' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (519, N'province', N'Lạng Sơn', 242, CAST(N'2016-05-22 17:53:12.857' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (520, N'province', N'Lào Cai', 242, CAST(N'2016-05-22 17:53:12.863' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (521, N'province', N'Long An', 242, CAST(N'2016-05-22 17:53:12.867' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (522, N'province', N'Nam Định', 242, CAST(N'2016-05-22 17:53:12.887' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (523, N'province', N'Nghệ An', 242, CAST(N'2016-05-22 17:53:12.900' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (524, N'province', N'Ninh Bình', 242, CAST(N'2016-05-22 17:53:12.903' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (525, N'province', N'Ninh Thuận', 242, CAST(N'2016-05-22 17:53:12.910' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (526, N'province', N'Phú Thọ', 242, CAST(N'2016-05-22 17:53:12.930' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (527, N'province', N'Quảng Bình', 242, CAST(N'2016-05-22 17:53:12.947' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (528, N'province', N'Quảng Nam', 242, CAST(N'2016-05-22 17:53:12.953' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (529, N'province', N'Quảng Ngãi', 242, CAST(N'2016-05-22 17:53:12.960' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (530, N'province', N'Quảng Ninh', 242, CAST(N'2016-05-22 17:53:12.977' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (531, N'province', N'Quảng Trị', 242, CAST(N'2016-05-22 17:53:12.990' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (532, N'province', N'Sóc Trăng', 242, CAST(N'2016-05-22 17:53:13.007' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (533, N'province', N'Sơn La', 242, CAST(N'2016-05-22 17:53:13.013' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (534, N'province', N'Tây Ninh', 242, CAST(N'2016-05-22 17:53:13.020' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (535, N'province', N'Thái Bình', 242, CAST(N'2016-05-22 17:53:13.033' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (536, N'province', N'Thái Nguyên', 242, CAST(N'2016-05-22 17:53:13.040' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (537, N'province', N'Thanh Hóa', 242, CAST(N'2016-05-22 17:53:13.050' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (538, N'province', N'Thừa Thiên Huế', 242, CAST(N'2016-05-22 17:53:13.057' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (539, N'province', N'Tiền Giang', 242, CAST(N'2016-05-22 17:53:13.063' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (540, N'province', N'Trà Vinh', 242, CAST(N'2016-05-22 17:53:13.070' AS DateTime), N'administrator', NULL, NULL)
GO
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (541, N'province', N'Tuyên Quang', 242, CAST(N'2016-05-22 17:53:13.080' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (542, N'province', N'Vĩnh Long', 242, CAST(N'2016-05-22 17:53:13.087' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (543, N'province', N'Vĩnh Phúc', 242, CAST(N'2016-05-22 17:53:13.093' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (544, N'province', N'Yên Bái', 242, CAST(N'2016-05-22 17:53:13.100' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (545, N'province', N'Phú Yên', 242, CAST(N'2016-05-22 17:53:13.110' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (546, N'district', N'Quận 1', 483, CAST(N'2016-05-22 18:00:48.430' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (547, N'district', N'Quận 2', 483, CAST(N'2016-05-22 18:00:48.450' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (548, N'district', N'Quận 3', 483, CAST(N'2016-05-22 18:00:48.457' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (549, N'district', N'Quận 4', 483, CAST(N'2016-05-22 18:00:48.460' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (550, N'district', N'Quận 5', 483, CAST(N'2016-05-22 18:00:48.467' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (551, N'district', N'Quận 6', 483, CAST(N'2016-05-22 18:00:48.473' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (552, N'district', N'Quận 7', 483, CAST(N'2016-05-22 18:00:48.480' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (553, N'district', N'Quận 8', 483, CAST(N'2016-05-22 18:00:48.487' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (554, N'district', N'Quận 9', 483, CAST(N'2016-05-22 18:00:48.490' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (555, N'district', N'Quận 10', 483, CAST(N'2016-05-22 18:00:48.497' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (556, N'district', N'Quận 11', 483, CAST(N'2016-05-22 18:00:48.503' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (557, N'district', N'Quận 12', 483, CAST(N'2016-05-22 18:00:48.510' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (558, N'district', N'Quận Bình Thạnh', 483, CAST(N'2016-05-22 18:00:48.517' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (559, N'district', N'Quận Bình Tân', 483, CAST(N'2016-05-22 18:00:48.520' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (560, N'district', N'Quận Gò Vấp', 483, CAST(N'2016-05-22 18:00:48.523' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (561, N'district', N'Quận Phú Nhuận', 483, CAST(N'2016-05-22 18:00:48.530' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (562, N'district', N'Quận Tân Bình', 483, CAST(N'2016-05-22 18:00:48.537' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (563, N'district', N'Quận Tân Phú', 483, CAST(N'2016-05-22 18:00:48.543' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (564, N'district', N'Quận Thủ Đức', 483, CAST(N'2016-05-22 18:00:48.550' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (565, N'district', N'Huyện Củ Chi', 483, CAST(N'2016-05-22 18:00:48.553' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (566, N'district', N'Huyện Bình Chánh', 483, CAST(N'2016-05-22 18:00:48.573' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (567, N'district', N'Huyện Cần Giờ', 483, CAST(N'2016-05-22 18:00:48.580' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (568, N'district', N'Huyện Nhà Bè', 483, CAST(N'2016-05-22 18:00:48.583' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (569, N'district', N'Huyện Hóc Môn', 483, CAST(N'2016-05-22 18:00:48.603' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (570, N'district', N'Quận Ba Đình', 484, CAST(N'2016-05-22 18:00:48.610' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (571, N'district', N'Quận Hoàn Kiếm', 484, CAST(N'2016-05-22 18:00:48.613' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (572, N'district', N'Quận Hai Bà Trưng', 484, CAST(N'2016-05-22 18:00:48.640' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (573, N'district', N'Quận Đống Đa', 484, CAST(N'2016-05-22 18:00:48.657' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (574, N'district', N'Quận Tây Hồ', 484, CAST(N'2016-05-22 18:00:48.663' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (575, N'district', N'Quận Cầu Giấy', 484, CAST(N'2016-05-22 18:00:48.680' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (576, N'district', N'Quận Thanh Xuân', 484, CAST(N'2016-05-22 18:00:48.700' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (577, N'district', N'Quận Hoàng Mai', 484, CAST(N'2016-05-22 18:00:48.703' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (578, N'district', N'Quận Long Biên', 484, CAST(N'2016-05-22 18:00:48.717' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (579, N'district', N'Huyện Từ Liêm', 484, CAST(N'2016-05-22 18:00:48.727' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (580, N'district', N'Huyện Thanh Trì', 484, CAST(N'2016-05-22 18:00:48.733' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (581, N'district', N'Huyện Gia Lâm', 484, CAST(N'2016-05-22 18:00:48.750' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (582, N'district', N'Huyện Đông Anh', 484, CAST(N'2016-05-22 18:00:48.770' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (583, N'district', N'Huyện Sóc Sơn', 484, CAST(N'2016-05-22 18:00:48.783' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (584, N'district', N'Quận Hà Đông', 484, CAST(N'2016-05-22 18:00:48.793' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (585, N'district', N'Thị xã Sơn Tây', 484, CAST(N'2016-05-22 18:00:48.807' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (586, N'district', N'Huyện Ba Vì', 484, CAST(N'2016-05-22 18:00:48.823' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (587, N'district', N'Huyện Phúc Thọ', 484, CAST(N'2016-05-22 18:00:48.837' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (588, N'district', N'Huyện Thạch Thất', 484, CAST(N'2016-05-22 18:00:48.840' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (589, N'district', N'Huyện Quốc Oai', 484, CAST(N'2016-05-22 18:00:48.847' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (590, N'district', N'Huyện Chương Mỹ', 484, CAST(N'2016-05-22 18:00:48.867' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (591, N'district', N'Huyện Đan Phượng', 484, CAST(N'2016-05-22 18:00:48.873' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (592, N'district', N'Huyện Hoài Đức', 484, CAST(N'2016-05-22 18:00:48.890' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (593, N'district', N'Huyện Thanh Oai', 484, CAST(N'2016-05-22 18:00:48.897' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (594, N'district', N'Huyện Mỹ Đức', 484, CAST(N'2016-05-22 18:00:48.900' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (595, N'district', N'Huyện Ứng Hoà', 484, CAST(N'2016-05-22 18:00:48.907' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (596, N'district', N'Huyện Thường Tín', 484, CAST(N'2016-05-22 18:00:48.920' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (597, N'district', N'Huyện Phú Xuyên', 484, CAST(N'2016-05-22 18:00:48.930' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (598, N'district', N'Huyện Mê Linh', 484, CAST(N'2016-05-22 18:00:48.937' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (599, N'district', N'Quận Hải Châu', 485, CAST(N'2016-05-22 18:00:48.943' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (600, N'district', N'Quận Thanh Khê', 485, CAST(N'2016-05-22 18:00:48.950' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (601, N'district', N'Quận Sơn Trà', 485, CAST(N'2016-05-22 18:00:48.960' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (602, N'district', N'Quận Ngũ Hành Sơn', 485, CAST(N'2016-05-22 18:00:48.973' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (603, N'district', N'Quận Liên Chiểu', 485, CAST(N'2016-05-22 18:00:48.980' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (604, N'district', N'Huyện Hoà Vang', 485, CAST(N'2016-05-22 18:00:48.987' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (605, N'district', N'Quận Cẩm Lệ', 485, CAST(N'2016-05-22 18:00:48.990' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (606, N'district', N'Quận Hồng Bàng', 486, CAST(N'2016-05-22 18:00:49.003' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (607, N'district', N'Quận Lê Chân', 486, CAST(N'2016-05-22 18:00:49.017' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (608, N'district', N'Quận Ngô Quyền', 486, CAST(N'2016-05-22 18:00:49.020' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (609, N'district', N'Quận Kiến An', 486, CAST(N'2016-05-22 18:00:49.027' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (610, N'district', N'Quận Hải An', 486, CAST(N'2016-05-22 18:00:49.040' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (611, N'district', N'Quận Đồ Sơn', 486, CAST(N'2016-05-22 18:00:49.050' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (612, N'district', N'Huyện An Lão', 486, CAST(N'2016-05-22 18:00:49.057' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (613, N'district', N'Huyện Kiến Thuỵ', 486, CAST(N'2016-05-22 18:00:49.063' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (614, N'district', N'Huyện Thủy Nguyên', 486, CAST(N'2016-05-22 18:00:49.070' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (615, N'district', N'Huyện An Dương', 486, CAST(N'2016-05-22 18:00:49.080' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (616, N'district', N'Huyện Tiên Lãng', 486, CAST(N'2016-05-22 18:00:49.093' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (617, N'district', N'Huyện Vĩnh Bảo', 486, CAST(N'2016-05-22 18:00:49.100' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (618, N'district', N'Huyện Cát Hải', 486, CAST(N'2016-05-22 18:00:49.110' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (619, N'district', N'Huyện Bạch Long Vĩ', 486, CAST(N'2016-05-22 18:00:49.123' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (620, N'district', N'Quận Dương Kinh', 486, CAST(N'2016-05-22 18:00:49.130' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (621, N'district', N'Quận Ninh Kiều', 487, CAST(N'2016-05-22 18:00:49.137' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (622, N'district', N'Quận Bình Thuỷ', 487, CAST(N'2016-05-22 18:00:49.147' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (623, N'district', N'Quận Cái Răng', 487, CAST(N'2016-05-22 18:00:49.160' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (624, N'district', N'Quận Ô Môn', 487, CAST(N'2016-05-22 18:00:49.167' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (625, N'district', N'Huyện Phong Điền', 487, CAST(N'2016-05-22 18:00:49.183' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (626, N'district', N'Huyện Cờ Đỏ', 487, CAST(N'2016-05-22 18:00:49.197' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (627, N'district', N'Huyện Vĩnh Thạnh', 487, CAST(N'2016-05-22 18:00:49.207' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[Territory] ([Id], [Level], [Name], [ParentId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (628, N'district', N'Huyện Thốt Nốt', 487, CAST(N'2016-05-22 18:00:49.213' AS DateTime), N'administrator', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Territory] OFF
SET IDENTITY_INSERT [dbo].[tw_Article] ON 

INSERT [dbo].[tw_Article] ([id], [type], [name], [description], [content], [imagesPublicId], [imagesSize], [active], [createdAt], [createdBy], [updatedAt], [updatedBy], [allUser], [isDefault], [showroomId]) VALUES (8, N'news', N'Giới thiệu công ty', N'Giới thiệu công ty', N'<p>T&iacute;nh từ năm 2000 đến nay SAIGON FORD đ&atilde; khẳng định một thương hiệu vững chắc lu&ocirc;n đi ti&ecirc;n phong về phong c&aacute;ch phục vụ b&aacute;n h&agrave;ng v&agrave; tư vấn cho kh&aacute;ch h&agrave;ng đồng thời lu&ocirc;n khẳng định vị tr&iacute; số 1 về c&aacute;c loại h&igrave;nh dịch vụ.</p><p><br /><img alt="" src="http://project.redsun.vn/saigonford/upload/userfiles/images/i2_1.jpg" style="display:block;margin-left:auto;margin-right:auto;" width="80%" /></p><p>Theo ti&ecirc;u chuẩn mới 2015 của Ford to&agrave;n cầu<br />Trong suốt 15 năm hoạt động v&agrave; ph&aacute;t triển SAIGON FORD lu&ocirc;n nỗ lực v&agrave; ph&aacute;t triển s&aacute;ng tạo kh&ocirc;ng ngừng về 2 loại h&igrave;nh hoạt động ch&iacute;nh l&agrave;: Dịch vụ v&agrave; B&aacute;n h&agrave;ng &ndash; Lu&ocirc;n l&agrave; người bạn đồng h&agrave;nh tr&ecirc;n mọi chặng đường của kh&aacute;ch h&agrave;ng.</p><p><img alt="" src="http://saigonford.com.vn/upload/userfiles/images/saigonford-hinh.jpg" style="display:block;margin-left:auto;margin-right:auto;" width="80%" /></p><p>SAIGON FORD (61A Cao Thang, P.3, Q.3, Tp.HCM) Ch&uacute;ng t&ocirc;i lu&ocirc;n đi ti&ecirc;n phong trong việc mở rộng thị trường mở rộng chi nh&aacute;nh mạng lưới chăm s&oacute;c kh&aacute;ch h&agrave;ng tiếp cận kh&aacute;ch h&agrave;ng cung cấp cho kh&aacute;ch h&agrave;ng sự tin tưởng nhất h&agrave;i l&ograve;ng nhất v&agrave; nhanh ch&oacute;ng nhất. 15 năm qua SAIGON FORD ch&uacute;ng t&ocirc;i đ&atilde; tạo được niềm tin v&agrave; phong c&aacute;ch ri&ecirc;ng biệt của m&igrave;nh đ&oacute; l&agrave; phong c&aacute;ch: chuy&ecirc;n nghiệp. Ch&uacute;ng t&ocirc;i lu&ocirc;n coi sự h&agrave;i l&ograve;ng của kh&aacute;ch h&agrave;ng l&agrave; mục ti&ecirc;u số 1 để n&acirc;ng cao chất lượng phục vụ tạo phong c&aacute;ch chuy&ecirc;n nghiệp trong từng bước đi.</p><p><img alt="" src="http://project.redsun.vn/saigonford/upload/userfiles/images/i381_1.jpg" style="display:block;margin-left:auto;margin-right:auto;" width="80%" /></p><p>Ch&uacute;ng t&ocirc;i tự h&agrave;o mang đến cho bạn chất lượng &ldquo;dịch vụ V&agrave;ng &ndash; Golden Services&rdquo; .Chất lượng dịch vụ V&agrave;ng &ndash; Golden Services của SAIGON FORD ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; sự am hiểu r&otilde; nhất d&ograve;ng sản phẩm xe FORD danh tiếng của Mỹ.<br />Với nhiều xưởng dịch vụ v&agrave; hiện đại s&aacute;nh với ti&ecirc;u chuẩn đại l&yacute; Brand@Retail của FORD to&agrave;n cầu kết hợp với sự t&acirc;m huyết tận t&acirc;m nhiệt t&igrave;nh v&agrave; phong c&aacute;ch l&agrave;m việc năng động v&agrave; chuy&ecirc;n nghiệp. Chất lượng dịch vụ V&agrave;ng &ndash; Golden Services của ch&uacute;ng t&ocirc;i lu&ocirc;n lu&ocirc;n đặt mối quan t&acirc;m v&agrave; mong muốn của kh&aacute;ch h&agrave;ng l&ecirc;n h&agrave;ng đầu.</p><p><img alt="" src="http://saigonford.com.vn/upload/userfiles/images/saigonford-sale.JPG" style="display:block;margin-left:auto;margin-right:auto;" width="80%" /></p><p>Đến với ch&uacute;ng t&ocirc;i người bạn đồng h&agrave;nh của bạn &ndash; những chiếc xe FORD danh tiếng sẽ được chăm s&oacute;c tốt nhất bằng những dịch vụ h&agrave;ng đầu với c&aacute;c m&aacute;y m&oacute;c thiết bị ti&ecirc;n tiến v&agrave; hiện đại nhất.&nbsp;<br />Ch&uacute;ng t&ocirc;i tin rằng với nhiều chi nh&aacute;nh trải rộng v&agrave; quy m&ocirc; với trang thiết bị hiện đại cộng với sự chăm s&oacute;c nhiệt t&igrave;nh của đội ngũ nh&acirc;n vi&ecirc;n kỹ thuật vi&ecirc;n chuy&ecirc;n nghiệp kh&aacute;ch h&agrave;ng sẽ lu&ocirc;n h&agrave;i l&ograve;ng với chất lượng phục vụ V&agrave;ng &ndash; Golden Services của ch&uacute;ng t&ocirc;i.&nbsp;</p><p style="text-align:center;"><img alt="" src="http://saigonford.com.vn/upload/userfiles/images/saigonford-kythuat.jpg" width="80%" /></p><p>Với dịch vụ đa dạng bao gồm: Sửa chữa cung cấp phụ t&ugrave;ng ch&iacute;nh h&atilde;ng bảo dưỡng đồng sơn beauty salon tư vấn thay thế c&aacute;c đồ chơi xe hơi hiện đại bằng c&aacute;c m&aacute;y m&oacute;c hiện đại nhất như hệ thống cầu n&acirc;ng hiện đại thiết bị chuẩn đo&aacute;n động cơ điện tử hệ thống chỉnh g&oacute;c l&aacute;i bằng tia hồng ngoại chuẩn đo&aacute;n chuy&ecirc;n d&ugrave;ng WDS PDS&hellip; hệ thống nắn k&eacute;o khung xe m&aacute;y sạc ga thay nhớt hộp số tự động hệ thống mạng với phần mềm chuy&ecirc;n d&ugrave;ng tra cứu phụ t&ugrave;ng Motocraft hệ thống ph&ograve;ng sơn hấp sử dụng c&ocirc;ng nghệ sơn vi t&iacute;nh cộng với cơ sở vật chất hiện đại phong c&aacute;ch phục vụ tận t&igrave;nh chuy&ecirc;n nghiệp&hellip; Với những dịch vụ chuy&ecirc;n nghiệp tr&ecirc;n kh&aacute;ch h&agrave;ng sẽ lu&ocirc;n cảm thấy h&agrave;i l&ograve;ng khi sử dụng dịch vụ V&agrave;ng &ndash; Golden Services của ch&uacute;ng t&ocirc;i.&nbsp;<br /><br />Ph&ograve;ng trưng b&agrave;y đạt chuẩn brand details II năm 2015 của Ford to&agrave;n cầu<br />Ngo&agrave;i ra ch&uacute;ng t&ocirc;i lu&ocirc;n n&acirc;ng cao chất lượng đội ngũ kỹ thuật vi&ecirc;n bằng c&aacute;c kh&oacute;a đ&agrave;o tạo tay nghề ngắn hạn v&agrave; d&agrave;i hạn lu&ocirc;n lu&ocirc;n đổi mới tiếp thu c&aacute;c kỹ thuật mới nhất nhằm đem lại chất lượng phục vụ tốt nhất cho kh&aacute;ch h&agrave;ng. Với phương ch&acirc;m mỗi một kỹ thuật vi&ecirc;n l&agrave; một chuy&ecirc;n gia am tường v&agrave; hiểu biết về c&aacute;c d&ograve;ng sản phẩm xe FORD v&agrave; c&aacute;c bộ phận linh kiện của xe FORD danh tiếng.<br />Sự nhanh nhạy th&acirc;n thiện từ nụ cười ch&agrave;o đ&oacute;n đầu ti&ecirc;n đến c&aacute;ch giải quyết c&ocirc;ng việc chuy&ecirc;n nghiệp l&agrave; dấu ấn kh&ocirc;ng thể qu&ecirc;n khi đến với dịch vụ V&agrave;ng &ndash; Golden services của SAIGON FORD.&nbsp;</p><p><img alt="" src="http://project.redsun.vn/saigonford/upload/userfiles/images/i767_1.jpg" style="display:block;margin-left:auto;margin-right:auto;" width="80%" /></p><p>Th&ecirc;m nữa để cảm ơn những qu&yacute; kh&aacute;ch lu&ocirc;n tin tưởng v&agrave; hợp t&aacute;c c&aacute;c sản phẩm v&agrave; dịch vụ SAIGON FORD ch&uacute;ng t&ocirc;i lu&ocirc;n lu&ocirc;n đặt lợi &iacute;ch của kh&aacute;ch h&agrave;ng l&ecirc;n h&agrave;ng đầu bằng c&aacute;ch lu&ocirc;n c&oacute; c&aacute;c chương tr&igrave;nh hậu m&atilde;i v&agrave; chăm s&oacute;c kh&aacute;ch h&agrave;ng th&acirc;n thiết. H&atilde;y lu&ocirc;n l&agrave; kh&aacute;ch h&agrave;ng th&acirc;n thiết của SAIGON FORD để tận hưởng những ưu đ&atilde;i bất ngờ từ của ch&uacute;ng t&ocirc;i.<br /><br />Để lu&ocirc;n đảm bảo đam m&ecirc; v&agrave; hứng khởi tr&ecirc;n mọi chặng đường của bạn ch&uacute;ng t&ocirc;i lu&ocirc;n c&oacute; mặt hỗ trợ kịp thời khi người bạn đồng h&agrave;nh &ndash; chiếc xe Ford của bạn gặp sự cố kỹ thuật hay hỏng h&oacute;c tr&ecirc;n đường. Với dịch vụ hỗ trợ kh&aacute;ch h&agrave;ng tr&ecirc;n mọi nẻo đường tr&ecirc;n từng c&acirc;y số ( sự cố kẹt xe tai nạn&hellip;) h&atilde;y gọi cho ch&uacute;ng t&ocirc;i bằng c&aacute;c hotline ( đường d&acirc;y n&oacute;ng) ch&uacute;ng t&ocirc;i sẽ nhanh ch&oacute;ng hỗ trợ khẩn trương trong những t&igrave;nh huống khẩn cấp nhất.<br />Ngo&agrave;i ra ch&uacute;ng t&ocirc;i cũng mạnh dạn mở rộng dịch vụ với kh&aacute;ch h&agrave;ng đ&oacute; l&agrave; dịch vụ giao nhận xe tận nơi khi qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; nhu cầu bảo dưỡng v&agrave; sửa chữa xe. Một điều v&ocirc; c&ugrave;ng mới mẻ nữa l&agrave; ch&uacute;ng t&ocirc;i sẽ hỗ trợ nh&acirc;n vi&ecirc;n l&aacute;i xe cho qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; nhu cầu đặc biệt n&agrave;y. Với phương ch&acirc;m chăm s&oacute;c kh&aacute;ch h&agrave;ng chuy&ecirc;n nghiệp bằng &ldquo;dịch vụ V&agrave;ng &ndash; Golden services&rdquo; chắc chắn qu&yacute; kh&aacute;ch h&agrave;ng lu&ocirc;n cảm thấy h&agrave;i l&ograve;ng khi đến với SAIGON FORD.</p><p><img alt="" src="http://project.redsun.vn/saigonford/upload/userfiles/images/i383_1.jpg" style="display:block;margin-left:auto;margin-right:auto;" width="80%" /></p><p>Ngo&agrave;i đội ngũ nh&acirc;n vi&ecirc;n chuy&ecirc;n nghiệp với phong c&aacute;ch b&aacute;n h&agrave;ng chuy&ecirc;n nghiệp kỹ thuật vi&ecirc;n l&agrave;nh nghề am tường sản phẩm biết r&otilde; kh&aacute;ch h&agrave;ng cần g&igrave; mong mỏi điều g&igrave; ch&uacute;ng t&ocirc;i c&ograve;n c&oacute; c&aacute;ch dịch vụ hỗ trợ t&agrave;i ch&iacute;nh từ c&aacute;c ng&acirc;n h&agrave;ng nổi tiếng h&agrave;ng đầu trong nước v&agrave; quốc tế như HSBC&hellip;mọi kh&oacute; khăn trong vấn đề t&agrave;i ch&iacute;nh của c&aacute; nh&acirc;n hoặc tổ chức trong việc mua c&aacute;c d&ograve;ng sản phẩm xe FORD danh tiếng sẽ được tư vấn v&agrave; giải quyết nhanh ch&oacute;ng hiệu quả với c&aacute;c loại h&igrave;nh hỗ trợ phong ph&uacute; như tư vấn t&agrave;i ch&iacute;nh c&aacute; nh&acirc;n tư vấn bảo hiểm li&ecirc;n kết cho vay mượn trả g&oacute;p tại c&aacute;c ng&acirc;n h&agrave;ng uy t&iacute;n với thủ tục nhanh gọn đơn giản v&agrave; hiệu quả.<br />Lu&ocirc;n cố gắng thay đổi v&agrave; ph&aacute;t triển 13 năm hoạt động v&agrave; mở rộng SAIGON FORD ch&uacute;ng t&ocirc;i đ&atilde; c&oacute; những bước ph&aacute;t triển vượt bậc về mọi mặt. Trong đ&oacute; việc tư vấn v&agrave; sử dụng xe theo nhu cầu của kh&aacute;ch h&agrave;ng để đạt hiệu quả cao nhất với d&ograve;ng xe FORD danh tiếng tr&aacute;nh hỏng h&oacute;c tiết kiệm tiền bạc v&agrave; hiệu quả sử dụng tối đa l&agrave; một trong những phương thức b&aacute;n h&agrave;ng chuy&ecirc;n nghiệp của c&ocirc;ng ty ch&uacute;ng t&ocirc;i. \</p><p><img alt="" src="http://project.redsun.vn/saigonford/upload/userfiles/images/i385_1.jpg" style="display:block;margin-left:auto;margin-right:auto;" width="80%" /></p><p>Một dịch vụ rất mới mẻ m&agrave; ch&uacute;ng t&ocirc;i đ&atilde; v&agrave; đang ph&aacute;t triển mạnh đ&oacute; l&agrave; dịch vụ đổi xe cũ lấy xe mới v&agrave; dịch vụ kinh doanh xe cũ k&egrave;m theo tư vấn cụ thể chi tiết c&aacute;c sản phẩm xe cũ c&oacute; bảo h&agrave;ng ch&iacute;nh h&atilde;ng thay thế c&aacute;c phụ t&ugrave;ng ch&iacute;nh h&atilde;ng với gi&aacute; v&ocirc; c&ugrave;ng hấp dẫn v&agrave; ưu đ&atilde;i. Với khả năng t&agrave;i ch&iacute;nh hạn chế nhưng vẫn mong muốn được sử dụng sản phẩm xe Ford danh tiếng kh&aacute;ch h&agrave;ng sẽ kh&ocirc;ng phải băn khoăn nhiều khi sử dụng dịch vụ tr&ecirc;n của ch&uacute;ng t&ocirc;i. Ch&uacute;ng t&ocirc;i cam kết đảm bảo chất lượng v&agrave; quyền lợi bảo h&agrave;nh được sử dụng d&ograve;ng xe FORD danh tiếng với phụ t&ugrave;ng ch&iacute;nh h&atilde;ng dịch vụ xứng đ&aacute;ng cho kh&aacute;ch h&agrave;ng sử dụng dịch vụ n&agrave;y.13 năm ph&aacute;t triển &ndash; 13 năm một chặng đường SAIGON FORD lu&ocirc;n l&agrave; một địa chỉ tin cậy v&agrave; khẳng định sự chuy&ecirc;n nghiệp h&agrave;ng đầu của hệ thống FORD tại VIỆT NAM</p>', N'SaiGonFord/Article/20160917_105024_3639596', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/SaiGonFord/Article/20160917_105024_3639596.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/SaiGonFord/Article/20160917_105024_3639596.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/SaiGonFord/Article/20160917_105024_3639596.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/SaiGonFord/Article/20160917_105024_3639596.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/SaiGonFord/Article/20160917_105024_3639596.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/SaiGonFord/Article/20160917_105024_3639596.jpg"}', 1, CAST(N'2016-09-17 10:48:59.457' AS DateTime), N'administrator', CAST(N'2016-09-17 22:56:00.360' AS DateTime), N'administrator', 1, 0, 0)
INSERT [dbo].[tw_Article] ([id], [type], [name], [description], [content], [imagesPublicId], [imagesSize], [active], [createdAt], [createdBy], [updatedAt], [updatedBy], [allUser], [isDefault], [showroomId]) VALUES (9, N'news', N'Chương trình bán hàng đặc biệt duy nhất giờ vàng', N'Chương trình giờ vàng duy nhất từ 14h đến 19h ngày 30/8/2016 tại Saigon Ford Phổ Quang (104 Phổ Quang Phường 2 Q. Tân Bình). ', N'<div class="detail" style="box-sizing:border-box;text-align:justify;position:relative;"><p style="box-sizing:border-box;margin-bottom:2px;color:#222222;font-size:13px;line-height:22px;">Chương tr&igrave;nh đặc biệt với c&aacute;c khuyến m&atilde;i khủng chưa từng c&oacute; tại hệ thống S&agrave;i&nbsp;G&ograve;n Ford</p><p style="box-sizing:border-box;margin-bottom:2px;color:#222222;font-size:13px;line-height:22px;">Li&ecirc;n hệ 093 878 3139 để biết th&ecirc;m th&ocirc;ng tin</p><p style="box-sizing:border-box;margin-bottom:2px;color:#222222;font-size:13px;line-height:22px;"><a href="www.saigonford.com.vn">www.saigonford.com.vn</a></p><p style="box-sizing:border-box;margin-bottom:2px;color:#222222;font-size:13px;line-height:22px;text-align:center;"><img alt="saigonford khuyến mãi giá khủng" height="346" src="http://saigonford.com.vn/upload/userfiles/images/ii.png" style="box-sizing:border-box;border:0px;vertical-align:middle;max-width:100%;" width="650" /></p></div><div class="social_prod" style="box-sizing:border-box;padding:13px 0px;clear:both;"><div class=" fb_reset" id="fb-root" style="box-sizing:border-box;background-image:none;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;border:0px;border-spacing:0px;cursor:auto;direction:ltr;font-family:''lucida grande'', tahoma, verdana, arial, sans-serif;font-size:11px;line-height:1;margin:0px;overflow:visible;padding:0px;text-shadow:none;visibility:visible;word-spacing:normal;"><div style="box-sizing:border-box;overflow:hidden;background-color:#ffffff;position:absolute;top:-10000px;height:0px;width:0px;"><div style="box-sizing:border-box;"></div></div><div style="box-sizing:border-box;overflow:hidden;background-color:#ffffff;position:absolute;top:-10000px;height:0px;width:0px;"></div></div></div>', N'SaiGonFord/Article/20160919_023920_ii', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/SaiGonFord/Article/20160919_023920_ii.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/SaiGonFord/Article/20160919_023920_ii.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/SaiGonFord/Article/20160919_023920_ii.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/SaiGonFord/Article/20160919_023920_ii.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/SaiGonFord/Article/20160919_023920_ii.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/SaiGonFord/Article/20160919_023920_ii.jpg"}', 1, CAST(N'2016-09-19 02:39:20.003' AS DateTime), N'administrator', CAST(N'2016-09-19 02:39:54.987' AS DateTime), N'administrator', 1, 0, 0)
INSERT [dbo].[tw_Article] ([id], [type], [name], [description], [content], [imagesPublicId], [imagesSize], [active], [createdAt], [createdBy], [updatedAt], [updatedBy], [allUser], [isDefault], [showroomId]) VALUES (10, N'news', N'Lái và cảm nhận và giờ vàng trong tuần', N' Chương trình hỗ trợ giờ vàng duy nhất từ 08h đến 12h ngày 10/09/2016 tại Saigon Ford Cao Thắng (61A Cao Thắng,P 3 Q. 3, HCM).', N'<p>Chương tr&igrave;nh đặc biệt với c&aacute;c khuyến m&atilde;i khủng chưa từng c&oacute; tại hệ thống S&agrave;i G&ograve;n Ford.<br />Li&ecirc;n hệ <strong>093.878.3139</strong> để biết th&ecirc;m th&ocirc;ng tin</p><p style="text-align:center;"><img src="http://saigonford.com.vn/upload/userfiles/images/14207681_1597300697231296_6976832267159333492_o.jpg" style="width:100%;" /></p><p><a href="www.saigonford.com.vn">www.saigonford.com.vn</a></p>', N'SaiGonFord/Article/20160919_024046_14207681_1597300697231296_6976832267159333492_o', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/SaiGonFord/Article/20160919_024046_14207681_1597300697231296_6976832267159333492_o.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/SaiGonFord/Article/20160919_024046_14207681_1597300697231296_6976832267159333492_o.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/SaiGonFord/Article/20160919_024046_14207681_1597300697231296_6976832267159333492_o.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/SaiGonFord/Article/20160919_024046_14207681_1597300697231296_6976832267159333492_o.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/SaiGonFord/Article/20160919_024046_14207681_1597300697231296_6976832267159333492_o.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/SaiGonFord/Article/20160919_024046_14207681_1597300697231296_6976832267159333492_o.jpg"}', 1, CAST(N'2016-09-19 02:40:46.253' AS DateTime), N'administrator', CAST(N'2016-09-19 03:51:32.447' AS DateTime), N'pdclong', 1, 0, 0)
INSERT [dbo].[tw_Article] ([id], [type], [name], [description], [content], [imagesPublicId], [imagesSize], [active], [createdAt], [createdBy], [updatedAt], [updatedBy], [allUser], [isDefault], [showroomId]) VALUES (11, N'news', N'Chương trình bán hàng đặc biệt trong tháng 7', N'Chương trình bán hàng đặc biệt đồng loạt tổ chức tại hệ thống Saigon Ford.
Rất nhiều chương trình, quà tặng,.. hấp dẫn', N'<p>Li&ecirc;n hệ ngay h&ocirc;m nay để nhận ưu đ&atilde;i từ ch&uacute;ng t&ocirc;i. </p><p>Đặc biệt Qu&yacute; kh&aacute;c sẽ được chụp ảnh lưu niệm tại ng&ocirc;i biệt thự nổi tiếng của xứ sở Kangaru.</p><p style="text-align:center;"><img src="http://saigonford.com.vn/upload/userfiles/images/kmt8.jpg" style="width:100%;" /></p><p><a href="http://www.saigonford.com.vn/" target="_blank">www.saigonford.com.vn</a></p>', N'SaiGonFord/Article/20160919_024214_kmt8', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/SaiGonFord/Article/20160919_024214_kmt8.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/SaiGonFord/Article/20160919_024214_kmt8.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/SaiGonFord/Article/20160919_024214_kmt8.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/SaiGonFord/Article/20160919_024214_kmt8.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/SaiGonFord/Article/20160919_024214_kmt8.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/SaiGonFord/Article/20160919_024214_kmt8.jpg"}', 1, CAST(N'2016-09-19 02:42:14.050' AS DateTime), N'administrator', CAST(N'2016-09-19 03:44:53.477' AS DateTime), N'pdclong', 1, 0, 0)
INSERT [dbo].[tw_Article] ([id], [type], [name], [description], [content], [imagesPublicId], [imagesSize], [active], [createdAt], [createdBy], [updatedAt], [updatedBy], [allUser], [isDefault], [showroomId]) VALUES (12, N'news', N'All New Everest 2016 road test at Thailand.', N'Ford Group Philippines recently conducted a test drive event in Thailand with their all-new Everest.', N'<p>The rutted, potholed backroads of Thailand are the perfect venue to test Ford&rsquo;s brand-new Everest SUV, which goes on sale in Australia next month as the Blue Oval&rsquo;s Prado-fighting seven-seat off-roader. </p><div style="text-align:center;"><iframe allowfullscreen="true" allowtransparency="true" frameborder="0" height="430" scrolling="no" src="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Fphanduongcuu.long%2Fvideos%2F1342630169088495%2F&amp;show_text=0&amp;width=560" style="border:none;overflow:hidden;" width="95%"></iframe></div>Ford bills it as being both rugged and refined, &ldquo;tough, but not rough&rdquo;. If it can handle the cracked concrete of regional Thailand without spilling our iced tea, that claim will be validated. <p>And it delivers. After a day driving the imposing Everest Titanium along the highways, back streets and muddy tracks that criss-cross the countryside around Chiang Rai in the country&rsquo;s north, the Everest not only kept us out of the weeds, but in good comfort the entire time. </p><p>And so it should have. Though engineered in Melbourne it&rsquo;s been designed with countries like Thailand in mind. Australian conditions should be a cakewalk.</p>', N'SaiGonFord/Article/20160919_041557_2016-09-19_4-15-38', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/SaiGonFord/Article/20160919_041557_2016-09-19_4-15-38.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/SaiGonFord/Article/20160919_041557_2016-09-19_4-15-38.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/SaiGonFord/Article/20160919_041557_2016-09-19_4-15-38.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/SaiGonFord/Article/20160919_041557_2016-09-19_4-15-38.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/SaiGonFord/Article/20160919_041557_2016-09-19_4-15-38.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/SaiGonFord/Article/20160919_041557_2016-09-19_4-15-38.jpg"}', 1, CAST(N'2016-09-19 03:54:40.980' AS DateTime), N'pdclong', CAST(N'2016-09-19 23:39:08.110' AS DateTime), N'pdclong', 1, 1, 0)
INSERT [dbo].[tw_Article] ([id], [type], [name], [description], [content], [imagesPublicId], [imagesSize], [active], [createdAt], [createdBy], [updatedAt], [updatedBy], [allUser], [isDefault], [showroomId]) VALUES (13, N'news', N'Ford Ranger khung gầm chắc chắn - tải trọng vượt trội', N'Saigon Ford Trần Hưng Đạo added a new video: Ford Ranger Tai Trọng Vượt Trội.', N'<p>Ford Ranger 2016... khẳng định đẳng cấp B&aacute;n Tải.</p><div style="text-align:center;"><iframe allowfullscreen="true" allowtransparency="true" frameborder="0" height="430" scrolling="no" src="https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2Fsaigonford6atranhungdao%2Fvideos%2F1409035812731251%2F&amp;show_text=0&amp;width=560" style="border:none;overflow:hidden;" width="100%"></iframe></div>', N'SaiGonFord/Article/20160919_042043_2016-09-19_4-20-26', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/SaiGonFord/Article/20160919_042043_2016-09-19_4-20-26.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/SaiGonFord/Article/20160919_042043_2016-09-19_4-20-26.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/SaiGonFord/Article/20160919_042043_2016-09-19_4-20-26.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/SaiGonFord/Article/20160919_042043_2016-09-19_4-20-26.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/SaiGonFord/Article/20160919_042043_2016-09-19_4-20-26.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/SaiGonFord/Article/20160919_042043_2016-09-19_4-20-26.jpg"}', 1, CAST(N'2016-09-19 04:20:43.390' AS DateTime), N'pdclong', CAST(N'2016-09-19 15:32:55.017' AS DateTime), N'administrator', 1, 0, 0)
SET IDENTITY_INSERT [dbo].[tw_Article] OFF
SET IDENTITY_INSERT [dbo].[tw_BusinessGroup] ON 

INSERT [dbo].[tw_BusinessGroup] ([id], [groupCode], [name], [leader], [email], [phone], [showroomId], [imagesPublicId], [imagesSize], [active], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (1, N'NH001', N'Nhóm anh Vượng', 1, N'vuongnd@twin.vn', N'01238699419', 6, NULL, NULL, 1, CAST(N'2016-09-19 00:00:00.000' AS DateTime), NULL, CAST(N'2016-09-27 12:04:14.473' AS DateTime), N'administrator')
SET IDENTITY_INSERT [dbo].[tw_BusinessGroup] OFF
SET IDENTITY_INSERT [dbo].[tw_BusinessRole] ON 

INSERT [dbo].[tw_BusinessRole] ([id], [groupId], [showroomId], [userId], [isManager], [managerRoles], [isLeader], [leaderRoles], [isConsultant], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10003, 1, 6, 1, 0, N'[]', 0, N'[]', 1, CAST(N'2016-09-27 13:31:26.267' AS DateTime), N'administrator', CAST(N'2016-09-27 13:32:03.717' AS DateTime), N'administrator')
INSERT [dbo].[tw_BusinessRole] ([id], [groupId], [showroomId], [userId], [isManager], [managerRoles], [isLeader], [leaderRoles], [isConsultant], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10004, 2, 4, 2, 1, N'[3]', 0, N'[]', 0, CAST(N'2016-09-27 13:32:51.173' AS DateTime), N'administrator', CAST(N'2016-09-27 13:33:00.797' AS DateTime), N'administrator')
INSERT [dbo].[tw_BusinessRole] ([id], [groupId], [showroomId], [userId], [isManager], [managerRoles], [isLeader], [leaderRoles], [isConsultant], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10005, 2, 4, 3, 0, N'[]', 1, NULL, 0, CAST(N'2016-09-27 13:33:16.163' AS DateTime), N'administrator', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tw_BusinessRole] OFF
SET IDENTITY_INSERT [dbo].[tw_Car] ON 

INSERT [dbo].[tw_Car] ([id], [name], [typeId], [serialId], [colorId], [productionYear], [carCode], [carColor], [descriptionCode], [descriptionColor], [domestic], [active], [unavailable], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (1, N'Ford Everest 2016 3.2 Titanium 4x4 ', 3, 3, 10003, N'2016', N'FORDEVE', N'FORDRED', N'Khách hàng Việt có lẽ sẽ không phải chờ đợi lâu hơn nữa khi hình ảnh và giá công bố được đánh giá là tương xứng hoàn toàn với sự hài lòng của người tiêu dùng.', N'Màu đỏ', 0, 1, 0, N'Ford/Agency/20160919_021357_Ecoport-3', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160919_021357_Ecoport-3.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160919_021357_Ecoport-3.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160919_021357_Ecoport-3.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160919_021357_Ecoport-3.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160919_021357_Ecoport-3.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160919_021357_Ecoport-3.jpg"}', CAST(N'2016-09-17 11:21:35.350' AS DateTime), N'administrator', CAST(N'2016-09-19 02:13:57.157' AS DateTime), N'administrator')
INSERT [dbo].[tw_Car] ([id], [name], [typeId], [serialId], [colorId], [productionYear], [carCode], [carColor], [descriptionCode], [descriptionColor], [domestic], [active], [unavailable], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (2, N'Ford Everest Titanium 4x4', 3, 3, 10004, N'2015', N'FORDEVE2', N'FORDBLUE', N'Khách hàng Việt có lẽ sẽ không phải chờ đợi lâu hơn nữa khi hình ảnh và giá công bố được đánh giá là tương xứng hoàn toàn với sự hài lòng của người tiêu dùng.', N'Màu xanh dương', 1, 1, 1, N'Ford/Agency/20160919_021344_Ecoport-11', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160919_021344_Ecoport-11.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160919_021344_Ecoport-11.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160919_021344_Ecoport-11.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160919_021344_Ecoport-11.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160919_021344_Ecoport-11.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160919_021344_Ecoport-11.jpg"}', CAST(N'2016-09-17 11:56:39.587' AS DateTime), N'administrator', CAST(N'2016-09-19 13:01:17.350' AS DateTime), N'administrator')
INSERT [dbo].[tw_Car] ([id], [name], [typeId], [serialId], [colorId], [productionYear], [carCode], [carColor], [descriptionCode], [descriptionColor], [domestic], [active], [unavailable], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (5, N'Ford Fiesta Sport 1.5AT', 6, 10007, 20013, N'2016', N'FORDFIESPORT', N'FORDBLUE', N'Ford Fiesta Sport', N'Màu xanh dương', 0, 1, 0, N'Ford/Agency/20160922_173647_F1', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160922_173647_F1.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160922_173647_F1.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160922_173647_F1.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160922_173647_F1.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160922_173647_F1.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160922_173647_F1.jpg"}', CAST(N'2016-09-22 17:36:47.717' AS DateTime), N'administrator', CAST(N'2016-09-22 17:37:38.887' AS DateTime), N'administrator')
INSERT [dbo].[tw_Car] ([id], [name], [typeId], [serialId], [colorId], [productionYear], [carCode], [carColor], [descriptionCode], [descriptionColor], [domestic], [active], [unavailable], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (6, N'Ford Fiesta Trend 1.5AT', 6, 10008, 20017, N'2016', N'FORDFIETREND', N'FORDGRAY', N'Ford Fiesta Trend', N'Màu xám', 0, 1, 0, N'Ford/Agency/20160922_173852_11', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160922_173852_11.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160922_173852_11.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160922_173852_11.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160922_173852_11.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160922_173852_11.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160922_173852_11.jpg"}', CAST(N'2016-09-22 17:38:52.137' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_Car] ([id], [name], [typeId], [serialId], [colorId], [productionYear], [carCode], [carColor], [descriptionCode], [descriptionColor], [domestic], [active], [unavailable], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10005, N'Ford Ranger XLS 2.2L 4X2 AT', 1, 20007, 30014, N'2016', N'FORDRAN2', N'FORDWHITE', NULL, NULL, 1, 1, 0, N'Ford/Agency/20160923_133318_3', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160923_133318_3.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160923_133318_3.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160923_133318_3.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160923_133318_3.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160923_133318_3.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160923_133318_3.jpg"}', CAST(N'2016-09-23 13:33:18.570' AS DateTime), N'administrator', CAST(N'2016-09-23 13:34:13.883' AS DateTime), N'administrator')
SET IDENTITY_INSERT [dbo].[tw_Car] OFF
SET IDENTITY_INSERT [dbo].[tw_CarSerial] ON 

INSERT [dbo].[tw_CarSerial] ([id], [serialCode], [name], [typeCode], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (1, N'RW', N'RANGER WILDTRAK 2.2L AT 4X2', N'1', N'Phong cách thiết kế Kinetic mang đến cho chiếc xe Ford Ranger rắn rỏi với những đường nét khí động học hoàn hảo và tinh tế, giúp xe vận hành an toàn và tiết kiệm nguyên liệu vượt trội.', 1, N'Ford/Agency/20160919_020957_rang', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160919_020957_rang.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160919_020957_rang.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160919_020957_rang.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160919_020957_rang.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160919_020957_rang.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160919_020957_rang.jpg"}', CAST(N'2016-09-15 17:50:48.130' AS DateTime), N'administrator', CAST(N'2016-09-27 15:40:28.320' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarSerial] ([id], [serialCode], [name], [typeCode], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (20007, N'RH', N'RANGER XLS 2.2L 4X2 MT ', N'1', N'Phong cách thiết kế Kinetic mang đến cho chiếc xe Ford Ranger rắn rỏi với những đường nét khí động học hoàn hảo và tinh tế, giúp xe vận hành an toàn và tiết kiệm nguyên liệu vượt trội. Ngoài ra Ranger mới còn lớn hơn rất nhiều so với các thế hệ trước nhờ thùng xe lớn hơn 19%, chiều dài cơ sở dài hơn 7%.', 1, N'Ford/Agency/20160923_132456_3', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160923_132456_3.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160923_132456_3.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160923_132456_3.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160923_132456_3.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160923_132456_3.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160923_132456_3.jpg"}', CAST(N'2016-09-23 13:24:56.507' AS DateTime), N'administrator', CAST(N'2016-09-27 15:55:37.887' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarSerial] ([id], [serialCode], [name], [typeCode], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (20008, N'RW2', N'RANGER WILDTRAK 3.2L AT 4X4 ', N'1', N'Ford đã đạt được những bước tiến dài trong việc đảm bảo Ranger không chỉ vận hành tốt, thiết kế bắt mắt mà còn là một chiếc xe an toàn vượt trội. Ford Ranger được trang bị 6 túi khí, hệ thống cân bằng điện tử ESP với 7 chế độ kiểm soát như: kiểm soát chống trượt xe, kiểm soát chống lắc rơ-moóc, hỗ trợ khởi hành ngang dốc, kiểm soát giảm thiểu lật xe, hệ thống chống bó cứng phanh ABS và hỗ trợ phanh khẩn cấp. Ranger không chỉ đa năng mà còn an toàn.', 1, N'Ford/Agency/20160923_132607_3', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160923_132607_3.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160923_132607_3.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160923_132607_3.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160923_132607_3.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160923_132607_3.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160923_132607_3.jpg"}', CAST(N'2016-09-23 13:26:07.677' AS DateTime), N'administrator', CAST(N'2016-09-27 15:46:54.213' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarSerial] ([id], [serialCode], [name], [typeCode], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30007, N'RS', N'RANGER XLS 2.2L 4X2 AT', N'1', NULL, 1, NULL, NULL, CAST(N'2016-09-27 15:43:12.087' AS DateTime), N'ttnchinh', CAST(N'2016-09-27 15:58:30.087' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarSerial] ([id], [serialCode], [name], [typeCode], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30008, N'RXL', N'RANGER XL 2.2L 4X4 MT', N'1', NULL, 1, NULL, NULL, CAST(N'2016-09-27 15:44:35.447' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerial] ([id], [serialCode], [name], [typeCode], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30009, N'RT', N'RANGER XLT 2.2L 4X4 MT', N'1', NULL, 1, NULL, NULL, CAST(N'2016-09-27 15:45:07.023' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerial] ([id], [serialCode], [name], [typeCode], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30010, N'TD.LX', N'TRANSIT MEDIUM LX', N'7', NULL, 1, NULL, NULL, CAST(N'2016-09-27 16:09:02.527' AS DateTime), N'ttnchinh', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tw_CarSerial] OFF
SET IDENTITY_INSERT [dbo].[tw_CarSerialColor] ON 

INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (1, N'Red', N'4', N'Màu đỏ', 1, N'RealEstate/Agency/20160916_151130_saigonford-everest3', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/RealEstate/Agency/20160916_151130_saigonford-everest3.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/RealEstate/Agency/20160916_151130_saigonford-everest3.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/RealEstate/Agency/20160916_151130_saigonford-everest3.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/RealEstate/Agency/20160916_151130_saigonford-everest3.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/RealEstate/Agency/20160916_151130_saigonford-everest3.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/RealEstate/Agency/20160916_151130_saigonford-everest3.jpg"}', CAST(N'2016-09-16 00:00:00.000' AS DateTime), NULL, CAST(N'2016-09-16 15:11:30.120' AS DateTime), N'administrator')
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (2, N'Blue', N'4', N'Xanh dương', 1, NULL, NULL, CAST(N'2016-09-16 15:09:32.830' AS DateTime), N'administrator', CAST(N'2016-09-16 15:11:58.190' AS DateTime), N'administrator')
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (4, N'VC', N'1', N'MÀU ĐEN', 1, N'RealEstate/Agency/20160919_021208_Ecoport-3', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/RealEstate/Agency/20160919_021208_Ecoport-3.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/RealEstate/Agency/20160919_021208_Ecoport-3.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/RealEstate/Agency/20160919_021208_Ecoport-3.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/RealEstate/Agency/20160919_021208_Ecoport-3.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/RealEstate/Agency/20160919_021208_Ecoport-3.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/RealEstate/Agency/20160919_021208_Ecoport-3.jpg"}', CAST(N'2016-09-17 16:36:40.983' AS DateTime), N'administrator', CAST(N'2016-09-27 15:48:45.213' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (5, N'Orange', N'3', N'Màu cam', 1, N'RealEstate/Agency/20160919_020247_11', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/RealEstate/Agency/20160919_020247_11.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/RealEstate/Agency/20160919_020247_11.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/RealEstate/Agency/20160919_020247_11.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/RealEstate/Agency/20160919_020247_11.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/RealEstate/Agency/20160919_020247_11.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/RealEstate/Agency/20160919_020247_11.jpg"}', CAST(N'2016-09-17 16:37:04.530' AS DateTime), N'administrator', CAST(N'2016-09-19 10:43:03.230' AS DateTime), N'administrator')
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10003, N'Black', N'3', N'Màu đen', 1, N'RealEstate/Agency/20160919_020454_Ecoport-3', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/RealEstate/Agency/20160919_020454_Ecoport-3.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/RealEstate/Agency/20160919_020454_Ecoport-3.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/RealEstate/Agency/20160919_020454_Ecoport-3.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/RealEstate/Agency/20160919_020454_Ecoport-3.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/RealEstate/Agency/20160919_020454_Ecoport-3.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/RealEstate/Agency/20160919_020454_Ecoport-3.jpg"}', CAST(N'2016-09-19 02:04:54.343' AS DateTime), N'administrator', CAST(N'2016-09-19 02:05:01.890' AS DateTime), N'administrator')
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10004, N'Blue', N'3', N'Màu xanh', 1, N'RealEstate/Agency/20160919_020552_Ecoport-11', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/RealEstate/Agency/20160919_020552_Ecoport-11.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/RealEstate/Agency/20160919_020552_Ecoport-11.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/RealEstate/Agency/20160919_020552_Ecoport-11.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/RealEstate/Agency/20160919_020552_Ecoport-11.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/RealEstate/Agency/20160919_020552_Ecoport-11.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/RealEstate/Agency/20160919_020552_Ecoport-11.jpg"}', CAST(N'2016-09-19 02:05:52.280' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10005, N' Orange', N'6', N'Màu cam', 1, N'RealEstate/Agency/20160919_021235_Ecoport-2', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/RealEstate/Agency/20160919_021235_Ecoport-2.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/RealEstate/Agency/20160919_021235_Ecoport-2.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/RealEstate/Agency/20160919_021235_Ecoport-2.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/RealEstate/Agency/20160919_021235_Ecoport-2.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/RealEstate/Agency/20160919_021235_Ecoport-2.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/RealEstate/Agency/20160919_021235_Ecoport-2.jpg"}', CAST(N'2016-09-19 02:12:35.593' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (20013, N'Blue', N'10007', N'Màu xanh dương', 1, NULL, NULL, CAST(N'2016-09-22 17:32:33.557' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (20014, N'Red', N'10007', N'Màu đỏ', 1, NULL, NULL, CAST(N'2016-09-22 17:32:49.557' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (20015, N'Yellow', N'10007', N'Màu vàng', 1, NULL, NULL, CAST(N'2016-09-22 17:32:59.760' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (20016, N'Green', N'10008', N'Màu xanh lá', 1, NULL, NULL, CAST(N'2016-09-22 17:33:18.667' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (20017, N'Gray', N'10008', N'Màu xám', 1, NULL, NULL, CAST(N'2016-09-22 17:33:28.403' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30013, N'VF', N'20007', N'MÀU XÁM', 1, NULL, NULL, CAST(N'2016-09-23 13:27:17.367' AS DateTime), N'administrator', CAST(N'2016-09-27 15:50:49.120' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30015, N'VC', N'20008', N'MÀU ĐEN', 1, NULL, NULL, CAST(N'2016-09-23 13:27:44.350' AS DateTime), N'administrator', CAST(N'2016-09-27 15:45:54.900' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30016, N'V3', N'20008', N'MÀU CAM', 1, NULL, NULL, CAST(N'2016-09-23 13:27:53.490' AS DateTime), N'administrator', CAST(N'2016-09-27 15:46:12.777' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30017, N'Blue', N'20009', N'Màu xanh dương', 1, NULL, NULL, CAST(N'2016-09-23 13:30:53.897' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30018, N'Gray', N'20009', N'Màu xám', 1, NULL, NULL, CAST(N'2016-09-23 13:31:05.117' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30019, N'Blue', N'20010', N'Màu xanh dương', 1, NULL, NULL, CAST(N'2016-09-23 13:31:19.177' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (30020, N'Green', N'20010', N'Màu xanh lá cây', 1, NULL, NULL, CAST(N'2016-09-23 13:31:33.943' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40013, N'VF', N'20008', N'MÀU XÁM', 1, NULL, NULL, CAST(N'2016-09-27 15:46:21.383' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40014, N'V2', N'20008', N'MÀU BẠC', 1, NULL, NULL, CAST(N'2016-09-27 15:46:30.977' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40015, N'VF', N'1', N'MÀU XÁM', 1, NULL, NULL, CAST(N'2016-09-27 15:48:57.527' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40016, N'V3', N'1', N'MÀU CAM', 1, NULL, NULL, CAST(N'2016-09-27 15:49:09.510' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40017, N'V2', N'1', N'MÀU BẠC', 1, NULL, NULL, CAST(N'2016-09-27 15:49:31.883' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40018, N'V2', N'20007', N'MÀU BẠC', 1, NULL, NULL, CAST(N'2016-09-27 15:50:34.977' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40019, N'V1', N'20007', N'MÀU XANH THIÊN THANH', 1, NULL, NULL, CAST(N'2016-09-27 15:53:24.103' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40020, N'VC', N'20007', N'MÀU ĐEN', 1, NULL, NULL, CAST(N'2016-09-27 15:53:40.213' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40021, N'VH', N'20007', N'MÀU ĐỎ TƯƠI', 1, NULL, NULL, CAST(N'2016-09-27 15:54:07.933' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40022, N'VD', N'20007', N'MÀU XANH AURORA', 1, NULL, NULL, CAST(N'2016-09-27 15:54:20.743' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40023, N'VA', N'20007', N'MÀU TRẮNG', 1, NULL, NULL, CAST(N'2016-09-27 15:54:32.167' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40024, N'VJ', N'20007', N'MÀU VÀNG SPARKLING', 1, NULL, NULL, CAST(N'2016-09-27 15:55:00.400' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40025, N'VA', N'20008', N'MÀU TRẮNG', 1, NULL, NULL, CAST(N'2016-09-27 15:55:58.197' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40026, N'VA', N'1', N'MÀU TRẮNG', 1, NULL, NULL, CAST(N'2016-09-27 15:56:19.493' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40027, N'VF', N'30007', N'MÀU XÁM', 1, NULL, NULL, CAST(N'2016-09-27 15:56:45.463' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40028, N'VC', N'30007', N'MÀU ĐEN', 1, NULL, NULL, CAST(N'2016-09-27 15:56:55.087' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40029, N'VD', N'30007', N'MÀU XANH AURORA', 1, NULL, NULL, CAST(N'2016-09-27 15:57:05.167' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40030, N'VJ', N'30007', N'MÀU VÀNG', 1, NULL, NULL, CAST(N'2016-09-27 15:57:15.667' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40031, N'VH', N'30007', N'MÀU ĐỎ TƯƠI', 1, NULL, NULL, CAST(N'2016-09-27 15:57:33.353' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40032, N'VA', N'30007', N'MÀU TRẮNG', 1, NULL, NULL, CAST(N'2016-09-27 15:57:43.933' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40034, N'V2', N'30007', N'MÀU BẠC', 1, NULL, NULL, CAST(N'2016-09-27 15:57:59.137' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40035, N'V1', N'30007', N'MÀU XANH THIÊN THANH', 1, NULL, NULL, CAST(N'2016-09-27 15:58:15.510' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40036, N'VC', N'30008', N'MÀU ĐEN', 1, NULL, NULL, CAST(N'2016-09-27 15:58:58.900' AS DateTime), N'ttnchinh', CAST(N'2016-09-27 16:00:13.183' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40037, N'VF', N'30008', N'MÀU XÁM', 1, NULL, NULL, CAST(N'2016-09-27 15:59:53.760' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40038, N'VD', N'30008', N'MÀU XANH AURORA', 1, NULL, NULL, CAST(N'2016-09-27 16:00:30.807' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40039, N'VJ', N'30008', N'MÀU VÀNG', 1, NULL, NULL, CAST(N'2016-09-27 16:00:45.823' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40040, N'VH', N'30008', N'MÀU ĐỎ TƯƠI', 1, NULL, NULL, CAST(N'2016-09-27 16:01:03.353' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40041, N'VA', N'30008', N'MÀU TRẮNG', 1, NULL, NULL, CAST(N'2016-09-27 16:01:12.323' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40042, N'V2', N'30008', N'MÀU BẠC', 1, NULL, NULL, CAST(N'2016-09-27 16:01:31.400' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40043, N'V1', N'30008', N'MÀU XANH THIÊN THANH', 1, NULL, NULL, CAST(N'2016-09-27 16:01:39.353' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40044, N'VF', N'30009', N'MÀU XÁM', 1, NULL, NULL, CAST(N'2016-09-27 16:04:49.620' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40045, N'VC', N'30009', N'MÀU ĐEN', 1, NULL, NULL, CAST(N'2016-09-27 16:04:55.683' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40046, N'VD', N'30009', N'MÀU XANH AURORA', 1, NULL, NULL, CAST(N'2016-09-27 16:05:24.027' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40047, N'VJ', N'30009', N'MÀU VÀNG', 1, NULL, NULL, CAST(N'2016-09-27 16:05:34.527' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40048, N'VH', N'30009', N'MÀU ĐỎ TƯƠI', 1, NULL, NULL, CAST(N'2016-09-27 16:05:42.417' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40049, N'VA', N'30009', N'MÀU TRẮNG', 1, NULL, NULL, CAST(N'2016-09-27 16:05:53.730' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40050, N'V2', N'30009', N'MÀU BẠC', 1, NULL, NULL, CAST(N'2016-09-27 16:06:07.010' AS DateTime), N'ttnchinh', NULL, NULL)
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40051, N'V1', N'30009', N'MÀU XANH THIÊN THANH', 1, NULL, NULL, CAST(N'2016-09-27 16:06:17.010' AS DateTime), N'ttnchinh', CAST(N'2016-09-27 16:07:05.293' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40052, N'HM', N'30010', N'MÀU VÀNG', 1, NULL, NULL, CAST(N'2016-09-27 16:10:31.417' AS DateTime), N'ttnchinh', CAST(N'2016-09-27 16:11:53.263' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarSerialColor] ([id], [name], [serialId], [description], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (40053, N'IG', N'30010', N'MÀU BẠC', 1, NULL, NULL, CAST(N'2016-09-27 16:10:42.137' AS DateTime), N'ttnchinh', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tw_CarSerialColor] OFF
SET IDENTITY_INSERT [dbo].[tw_CarType] ON 

INSERT [dbo].[tw_CarType] ([id], [typeCode], [name], [description], [branch], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (1, N'RANGER ', N'Ford Ranger', N'Ford Ranger - cuộc cách mạng về thiết kế và công nghệ.', N'Ford', 1, N'Ford/Agency/20160919_022234_ford-ranger-4x2-xls-mt-new', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160919_022234_ford-ranger-4x2-xls-mt-new.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160919_022234_ford-ranger-4x2-xls-mt-new.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160919_022234_ford-ranger-4x2-xls-mt-new.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160919_022234_ford-ranger-4x2-xls-mt-new.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160919_022234_ford-ranger-4x2-xls-mt-new.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160919_022234_ford-ranger-4x2-xls-mt-new.jpg"}', CAST(N'2016-09-15 15:35:17.533' AS DateTime), N'administrator', CAST(N'2016-09-27 15:38:46.930' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarType] ([id], [typeCode], [name], [description], [branch], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (3, N'FORD EVEREST ', N'Ford Everest ', N'Trong khi “làn sóng” của Ford Ranger mới vào tháng 8 còn đang lớn mạnh, Ford lại tiếp tục chuyển động khi chuẩn bị “trình làng” mẫu xe Ford Everest mới.', N'Ford', 1, N'Ford/Agency/20160919_021756_2015_ford_everest_01', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160919_021756_2015_ford_everest_01.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160919_021756_2015_ford_everest_01.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160919_021756_2015_ford_everest_01.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160919_021756_2015_ford_everest_01.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160919_021756_2015_ford_everest_01.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160919_021756_2015_ford_everest_01.jpg"}', CAST(N'2016-09-15 15:54:28.297' AS DateTime), N'administrator', CAST(N'2016-09-27 15:38:23.383' AS DateTime), N'ttnchinh')
INSERT [dbo].[tw_CarType] ([id], [typeCode], [name], [description], [branch], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (6, N'FIESTA', N'Ford Fiesta', N'Ford Fiesta là một sản phẩm toàn cầu trong chiến lược One Ford nổi bật với ngoại hình hiện đại, trẻ trung, mạnh mẽ nhưng vẫn thể hiện phong cách sang trọng và lịch lãm của triết lý thiết kế động lực học “Kinetic Design”.', N'Ford', 1, N'Ford/Agency/20160919_021724_3', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160919_021724_3.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160919_021724_3.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160919_021724_3.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160919_021724_3.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160919_021724_3.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160919_021724_3.jpg"}', CAST(N'2016-09-17 16:40:00.487' AS DateTime), N'administrator', CAST(N'2016-09-19 02:17:24.093' AS DateTime), N'administrator')
INSERT [dbo].[tw_CarType] ([id], [typeCode], [name], [description], [branch], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (7, N'TRANSIT', N'Ford Transit', N'Là con của dòng xe mẹ Ford, vì thế xe Ford Transit ra đời hội đủ các điều kiện tiêu chuẩn của Ford đặt ra, luôn khẳng định tiêu chí bất di bất dịch về Chất lượng  – An toàn -  Thông minh và Tiện nghi.', N'Ford', 1, N'Ford/Agency/20160919_022043_transit', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160919_022043_transit.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160919_022043_transit.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160919_022043_transit.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160919_022043_transit.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160919_022043_transit.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160919_022043_transit.jpg"}', CAST(N'2016-09-17 16:41:31.520' AS DateTime), N'administrator', CAST(N'2016-09-19 02:20:43.843' AS DateTime), N'administrator')
INSERT [dbo].[tw_CarType] ([id], [typeCode], [name], [description], [branch], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (8, N'NEW FOCUS', N'Ford New Focus', N'Tinh tế hơn từ trong ra ngoài, Focus 2016 là sự kết hợp hoàn hảo giữa vẻ ngoài đẳng cấp của một chiếc xe sang – với không gian rộng rãi và tính linh hoạt cần có của một chiếc xe gia đình.', N'Ford', 1, N'Ford/Agency/20160917_164257_6', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160917_164257_6.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160917_164257_6.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160917_164257_6.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160917_164257_6.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160917_164257_6.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160917_164257_6.jpg"}', CAST(N'2016-09-17 16:42:57.253' AS DateTime), N'administrator', CAST(N'2016-09-17 16:43:04.597' AS DateTime), N'administrator')
INSERT [dbo].[tw_CarType] ([id], [typeCode], [name], [description], [branch], [active], [imagesPublicId], [imagesSize], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (9, N'ECOSPORT', N'Ford EcoSport', N'Mỗi khi ra phố, có rất nhiều vấn đề về đường xá không phải lúc nào cũng thuận tiện, có khi là đường gập ghềnh, có khi là ổ gà, ống nước vỡ, …hoặc đơn giản bạn sống tại thành phố nhưng muốn sở hữu một chiếc xe SUV. Ford Ecosport sẽ là lựa chọn hoàn hảo nhất, kích thước xe hợp lý giúp bạn dễ dàng dừng đỗ hoặc di chuyển qua các con phố chật hẹp.', N'Ford', 1, N'Ford/Agency/20160917_164408_11', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160917_164408_11.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160917_164408_11.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160917_164408_11.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160917_164408_11.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160917_164408_11.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160917_164408_11.jpg"}', CAST(N'2016-09-17 16:44:08.457' AS DateTime), N'administrator', CAST(N'2016-09-27 15:30:51.710' AS DateTime), N'ttnchinh')
SET IDENTITY_INSERT [dbo].[tw_CarType] OFF
SET IDENTITY_INSERT [dbo].[tw_Contract] ON 

INSERT [dbo].[tw_Contract] ([id], [fullname], [phone], [email], [identity], [identitydate], [identityaddress], [customertype], [company], [taxcode], [represent], [position], [fax], [city], [district], [address], [active], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (1, N'Lâm Văn Cảnh', N'0902673722', N'canhvanlam@gmail.com', 37, CAST(N'2000-01-10 00:00:00.000' AS DateTime), NULL, NULL, N'Cá nhân', NULL, NULL, NULL, NULL, N'483', N'547', N'Lạc Long Quân', 1, CAST(N'2016-09-27 16:21:26.147' AS DateTime), N'administrator', CAST(N'2016-09-27 17:42:34.290' AS DateTime), N'administrator')
INSERT [dbo].[tw_Contract] ([id], [fullname], [phone], [email], [identity], [identitydate], [identityaddress], [customertype], [company], [taxcode], [represent], [position], [fax], [city], [district], [address], [active], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (3, N'Lam Van Canh 2', N'0902673722', NULL, 0, CAST(N'2000-10-10 00:00:00.000' AS DateTime), NULL, N'Cá nhân', NULL, NULL, NULL, NULL, NULL, N'483', N'564', N'Lạc Long Quân', 1, CAST(N'2016-09-27 17:04:40.197' AS DateTime), N'administrator', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tw_Contract] OFF
SET IDENTITY_INSERT [dbo].[tw_PO] ON 

INSERT [dbo].[tw_PO] ([id], [carId], [status], [orderDate], [shippingDate], [invoice], [paymentDate], [VIN], [engineNo], [contractNo], [prodOfMonth], [dealer], [goalsOrderNo], [vehLocation], [carInternal], [carOld], [paymentDeadline], [estDeliveryDate], [commitment], [timing], [lot], [QAOfflineSchedule], [OK2SOriginal], [OK2SUpdate], [OK2SActual], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (4, 1, N'New', CAST(N'2016-09-24 00:00:00.000' AS DateTime), CAST(N'2016-09-30 00:00:00.000' AS DateTime), N'IN;160925', CAST(N'2016-10-08 00:00:00.000' AS DateTime), N'MNCLMFF20GW610363', N'P4AT2236025', NULL, CAST(N'2016-10-08 00:00:00.000' AS DateTime), N'VD3002', N'7130907', N'SGP', 1, 1, CAST(N'2016-10-20 00:00:00.000' AS DateTime), CAST(N'2016-10-10 00:00:00.000' AS DateTime), 1, N'W1', N'YAC-7C', CAST(N'2016-09-25 00:00:00.000' AS DateTime), CAST(N'2016-09-25 00:00:00.000' AS DateTime), CAST(N'2016-09-25 00:00:00.000' AS DateTime), CAST(N'2016-09-25 00:00:00.000' AS DateTime), CAST(N'2016-09-24 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tw_PO] ([id], [carId], [status], [orderDate], [shippingDate], [invoice], [paymentDate], [VIN], [engineNo], [contractNo], [prodOfMonth], [dealer], [goalsOrderNo], [vehLocation], [carInternal], [carOld], [paymentDeadline], [estDeliveryDate], [commitment], [timing], [lot], [QAOfflineSchedule], [OK2SOriginal], [OK2SUpdate], [OK2SActual], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (7, 1, N'New', CAST(N'2016-09-24 00:00:00.000' AS DateTime), CAST(N'2016-09-30 00:00:00.000' AS DateTime), N'IN;160925', CAST(N'2016-10-08 00:00:00.000' AS DateTime), N'MNCLMFF20GW610329', N'P4AT2239795', NULL, CAST(N'2016-10-08 00:00:00.000' AS DateTime), N'VD3002', N'7130907', N'SGP', 1, 1, CAST(N'2016-10-20 00:00:00.000' AS DateTime), CAST(N'2016-10-10 00:00:00.000' AS DateTime), 1, N'W1', N'YAC-7C', CAST(N'2016-09-25 00:00:00.000' AS DateTime), CAST(N'2016-09-25 00:00:00.000' AS DateTime), CAST(N'2016-09-25 00:00:00.000' AS DateTime), CAST(N'2016-09-25 00:00:00.000' AS DateTime), CAST(N'2016-09-24 00:00:00.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tw_PO] OFF
SET IDENTITY_INSERT [dbo].[tw_ShowroomBranch] ON 

INSERT [dbo].[tw_ShowroomBranch] ([id], [shortlyName], [name], [representative], [title], [phone], [email], [address], [parentType], [showroomParent], [imagesPublicId], [imagesSize], [active], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (4, N'FORDCT', N'SAIGON FORD CAO THẮNG', 3, N'CRMTitle0001', N'0838181458', N'pdclong@saigonford.com.vn', N'61A Cao Thắng, Q.3, HCM', N'Branch', 0, N'RealEstate/Agency/20160915_133503_fkzXsoN_', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/RealEstate/Agency/20160915_133503_fkzXsoN_.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/RealEstate/Agency/20160915_133503_fkzXsoN_.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/RealEstate/Agency/20160915_133503_fkzXsoN_.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/RealEstate/Agency/20160915_133503_fkzXsoN_.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/RealEstate/Agency/20160915_133503_fkzXsoN_.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/RealEstate/Agency/20160915_133503_fkzXsoN_.jpg"}', 1, CAST(N'2016-09-15 10:04:51.393' AS DateTime), N'administrator', CAST(N'2016-09-19 02:35:18.767' AS DateTime), N'administrator')
INSERT [dbo].[tw_ShowroomBranch] ([id], [shortlyName], [name], [representative], [title], [phone], [email], [address], [parentType], [showroomParent], [imagesPublicId], [imagesSize], [active], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (6, N'FORDTHD', N'SAIGON FORD TRẦN HƯNG ĐẠO', 3, N'CRMTitle0005', N'0839153244', N'nvtrai@saigonford.com.vn', N'6 Trần Hưng Đạo, Quận 1, Hồ Chí Minh', N'Branch', 0, N'Ford/Agency/20160919_023149_tranhungdao', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160919_023149_tranhungdao.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160919_023149_tranhungdao.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160919_023149_tranhungdao.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160919_023149_tranhungdao.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160919_023149_tranhungdao.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160919_023149_tranhungdao.jpg"}', 1, CAST(N'2016-09-15 10:07:07.230' AS DateTime), N'administrator', CAST(N'2016-09-19 02:33:59.253' AS DateTime), N'administrator')
INSERT [dbo].[tw_ShowroomBranch] ([id], [shortlyName], [name], [representative], [title], [phone], [email], [address], [parentType], [showroomParent], [imagesPublicId], [imagesSize], [active], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (9, N'FORDPQ', N'SAIGON FORD PHỔ QUANG', 3, N'CRMTitle0001', N'0839153244', N'nvtrai@saigonford.com.vn', N'104 Phổ Quang, Phường 2, Quận Tân Bình, Hồ Chí Minh', N'Showroom', 4, N'Ford/Agency/20160919_023105_phoquang', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160919_023105_phoquang.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160919_023105_phoquang.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160919_023105_phoquang.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160919_023105_phoquang.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160919_023105_phoquang.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160919_023105_phoquang.jpg"}', 1, CAST(N'2016-09-17 16:30:54.793' AS DateTime), N'administrator', CAST(N'2016-09-19 02:34:26.080' AS DateTime), N'administrator')
INSERT [dbo].[tw_ShowroomBranch] ([id], [shortlyName], [name], [representative], [title], [phone], [email], [address], [parentType], [showroomParent], [imagesPublicId], [imagesSize], [active], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10009, N'FORDASSURED', N'SAIGON FORD ASSURED', 3, N'CRMTitle0001', N'0838442947', N'pdclong@saigonford.com.vn', N'104 Phổ Quang, Phường 2, Quận Tân Bình, Hồ Chí Minh', N'Showroom', 4, N'Ford/Agency/20160919_023631_SAIGON FORD ASSURED', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/Ford/Agency/20160919_023631_SAIGON%20FORD%20ASSURED.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/Ford/Agency/20160919_023631_SAIGON%20FORD%20ASSURED.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/Ford/Agency/20160919_023631_SAIGON%20FORD%20ASSURED.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/Ford/Agency/20160919_023631_SAIGON%20FORD%20ASSURED.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/Ford/Agency/20160919_023631_SAIGON%20FORD%20ASSURED.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/Ford/Agency/20160919_023631_SAIGON%20FORD%20ASSURED.jpg"}', 1, CAST(N'2016-09-19 02:36:17.893' AS DateTime), N'administrator', CAST(N'2016-09-19 02:36:31.487' AS DateTime), N'administrator')
SET IDENTITY_INSERT [dbo].[tw_ShowroomBranch] OFF
SET IDENTITY_INSERT [dbo].[tw_User] ON 

INSERT [dbo].[tw_User] ([id], [name], [fullName], [email], [phone], [gender], [birthday], [address], [country], [city], [district], [imagesPublicId], [imagesSize], [registerAt], [active], [activatedAt], [lastLoginTime], [lastLoginIP], [vendorAuth], [userKey], [extension], [createdAt], [createdBy], [updatedAt], [updatedBy], [homePage]) VALUES (1, N'administrator', N'Nguyen Do Vuong', N'vuongnd@twin.vn', N'01238699419', N'male', NULL, NULL, 242, 0, 0, NULL, NULL, CAST(N'2016-09-14 15:23:14.570' AS DateTime), 1, NULL, NULL, NULL, N'', N'4fa2af19-6722-402c-b8fd-9934b12575d7', NULL, CAST(N'2016-09-14 15:23:14.570' AS DateTime), N'administrator', CAST(N'2016-09-27 11:58:20.717' AS DateTime), N'administrator', N'Home')
INSERT [dbo].[tw_User] ([id], [name], [fullName], [email], [phone], [gender], [birthday], [address], [country], [city], [district], [imagesPublicId], [imagesSize], [registerAt], [active], [activatedAt], [lastLoginTime], [lastLoginIP], [vendorAuth], [userKey], [extension], [createdAt], [createdBy], [updatedAt], [updatedBy], [homePage]) VALUES (2, N'tunha', N'Nguyễn Hoàng Anh Tú', N'tunh@twin.vn', N'01263103363', N'male', NULL, NULL, 242, 483, 548, NULL, NULL, CAST(N'2016-09-14 18:11:40.287' AS DateTime), 1, NULL, NULL, NULL, N'', N'cdc11b89-d54f-4c63-bd30-13aa3f5c8e8f', NULL, CAST(N'2016-09-14 18:11:40.287' AS DateTime), N'administrator', CAST(N'2016-09-27 11:44:34.293' AS DateTime), N'administrator', N'Home')
INSERT [dbo].[tw_User] ([id], [name], [fullName], [email], [phone], [gender], [birthday], [address], [country], [city], [district], [imagesPublicId], [imagesSize], [registerAt], [active], [activatedAt], [lastLoginTime], [lastLoginIP], [vendorAuth], [userKey], [extension], [createdAt], [createdBy], [updatedAt], [updatedBy], [homePage]) VALUES (3, N'pdclong', N'Phan Dương Cửu Long', N'pdclong@saigonford.com.vn', N'0903648748', N'male', NULL, N'61A Cao Thắng', 242, 0, 0, N'CRM/User/20160919_014309_pclong', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/CRM/User/20160919_014309_pclong.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/CRM/User/20160919_014309_pclong.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/CRM/User/20160919_014309_pclong.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/CRM/User/20160919_014309_pclong.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/CRM/User/20160919_014309_pclong.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/CRM/User/20160919_014309_pclong.jpg"}', CAST(N'2016-09-19 01:43:09.573' AS DateTime), 1, NULL, NULL, NULL, NULL, N'd71959c2-4dc5-4d43-879e-0d4bdb05e29f', NULL, CAST(N'2016-09-19 01:43:09.573' AS DateTime), N'administrator', CAST(N'2016-09-27 11:44:44.357' AS DateTime), N'administrator', N'Home')
INSERT [dbo].[tw_User] ([id], [name], [fullName], [email], [phone], [gender], [birthday], [address], [country], [city], [district], [imagesPublicId], [imagesSize], [registerAt], [active], [activatedAt], [lastLoginTime], [lastLoginIP], [vendorAuth], [userKey], [extension], [createdAt], [createdBy], [updatedAt], [updatedBy], [homePage]) VALUES (4, N'nvtrai', N'Nguyễn Văn Trãi', N'nvtrai@saigonford.com.vn', N'0938783139', N'male', NULL, N'61A Cao Thắng', 242, 0, 0, N'CRM/User/20160919_014946_12189729_775426222586076_9133560963108667735_n', N'{thumb:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_150/v1/CRM/User/20160919_014946_12189729_775426222586076_9133560963108667735_n.jpg",small:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_480/v1/CRM/User/20160919_014946_12189729_775426222586076_9133560963108667735_n.jpg",medium:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_760/v1/CRM/User/20160919_014946_12189729_775426222586076_9133560963108667735_n.jpg",large:"http://res.cloudinary.com/twinsoft/image/upload/c_fill,w_1024/v1/CRM/User/20160919_014946_12189729_775426222586076_9133560963108667735_n.jpg",original:"http://res.cloudinary.com/twinsoft/image/upload/v1/CRM/User/20160919_014946_12189729_775426222586076_9133560963108667735_n.jpg",face:"http://res.cloudinary.com/twinsoft/image/upload/c_thumb,g_face,h_150,w_150/v1/CRM/User/20160919_014946_12189729_775426222586076_9133560963108667735_n.jpg"}', CAST(N'2016-09-19 01:49:46.387' AS DateTime), 1, NULL, NULL, NULL, NULL, N'9c504168-47a7-4214-845d-6a7d681161d5', NULL, CAST(N'2016-09-19 01:49:46.387' AS DateTime), N'administrator', CAST(N'2016-09-27 11:44:51.700' AS DateTime), N'administrator', N'Home')
INSERT [dbo].[tw_User] ([id], [name], [fullName], [email], [phone], [gender], [birthday], [address], [country], [city], [district], [imagesPublicId], [imagesSize], [registerAt], [active], [activatedAt], [lastLoginTime], [lastLoginIP], [vendorAuth], [userKey], [extension], [createdAt], [createdBy], [updatedAt], [updatedBy], [homePage]) VALUES (5, N'ttnchinh', N'Trần Thị Ngọc Chính', N'ttnchinh@saigonford.com.vn', N'0838442947', N'female', NULL, N'61A Cao Thắng', 242, 0, 0, NULL, NULL, CAST(N'2016-09-19 01:55:56.937' AS DateTime), 1, NULL, NULL, NULL, NULL, N'b998edce-0ab2-4158-9deb-38c09e818b92', NULL, CAST(N'2016-09-19 01:55:56.937' AS DateTime), N'administrator', CAST(N'2016-09-27 11:44:57.607' AS DateTime), N'administrator', N'Home')
SET IDENTITY_INSERT [dbo].[tw_User] OFF
SET IDENTITY_INSERT [dbo].[tw_UserGroup] ON 

INSERT [dbo].[tw_UserGroup] ([id], [name], [description], [active], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (1, N'administrator', N'Administrator', 1, CAST(N'2016-09-14 00:00:00.000' AS DateTime), NULL, CAST(N'2016-09-14 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tw_UserGroup] ([id], [name], [description], [active], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (2, N'guest', N'Guest', 1, CAST(N'2016-09-14 15:40:26.773' AS DateTime), N'administrator', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tw_UserGroup] OFF
SET IDENTITY_INSERT [dbo].[tw_UserInGroup] ON 

INSERT [dbo].[tw_UserInGroup] ([id], [userId], [groupId], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (188, 1, 1, CAST(N'2016-09-14 00:00:00.000' AS DateTime), NULL, CAST(N'2016-09-14 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tw_UserInGroup] ([id], [userId], [groupId], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (189, 2, 2, CAST(N'2016-09-14 18:11:40.417' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_UserInGroup] ([id], [userId], [groupId], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (190, 3, 1, CAST(N'2016-09-19 01:44:15.807' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_UserInGroup] ([id], [userId], [groupId], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (191, 4, 1, CAST(N'2016-09-19 01:49:54.560' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_UserInGroup] ([id], [userId], [groupId], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (192, 5, 1, CAST(N'2016-09-19 01:56:03.670' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_UserInGroup] ([id], [userId], [groupId], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (194, 2, 1, CAST(N'2016-09-19 14:12:48.510' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_UserInGroup] ([id], [userId], [groupId], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (195, 1, 2, CAST(N'2016-09-19 14:36:19.233' AS DateTime), N'administrator', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tw_UserInGroup] OFF
SET IDENTITY_INSERT [dbo].[tw_UserInShowroom] ON 

INSERT [dbo].[tw_UserInShowroom] ([id], [userId], [showroomId], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10002, 1, 6, CAST(N'2016-09-20 13:39:57.827' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_UserInShowroom] ([id], [userId], [showroomId], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10003, 2, 4, CAST(N'2016-09-20 13:40:11.320' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_UserInShowroom] ([id], [userId], [showroomId], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10006, 3, 4, CAST(N'2016-09-27 11:44:45.357' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_UserInShowroom] ([id], [userId], [showroomId], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10007, 4, 9, CAST(N'2016-09-27 11:44:53.137' AS DateTime), N'administrator', NULL, NULL)
INSERT [dbo].[tw_UserInShowroom] ([id], [userId], [showroomId], [createdAt], [createdBy], [updatedAt], [updatedBy]) VALUES (10008, 5, 10009, CAST(N'2016-09-27 11:44:57.607' AS DateTime), N'administrator', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tw_UserInShowroom] OFF
SET IDENTITY_INSERT [HangFire].[AggregatedCounter] ON 

INSERT [HangFire].[AggregatedCounter] ([Id], [Key], [Value], [ExpireAt]) VALUES (1, N'stats:failed:2016-09-15', 1, CAST(N'2016-10-15 06:45:06.803' AS DateTime))
SET IDENTITY_INSERT [HangFire].[AggregatedCounter] OFF
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (1, 43, N'Failed', N'{"Type":"CRM.Helpers.SendMail, CRM, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Send","ParameterTypes":"[\"System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089\",\"System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089\"]","Arguments":"[\"\\\"TwinCRM: New Register\\\"\",\"\\\"<html xmlns=\\\\\\\"http://www.w3.org/1999/xhtml\\\\\\\">\\\\r\\\\n<head>\\\\r\\\\n    <title></title>\\\\r\\\\n</head>\\\\r\\\\n<body style=\\\\\\\"margin: 0; padding: 0;font-family: arial;font-size: 12px;\\\\\\\">\\\\r\\\\n    Hello <b>TRE Admin</b>, <br />\\\\r\\\\n    <br />\\\\r\\\\n    You have new register from <a href=\\\\\\\"http://realestate.twin.vn:3000/\\\\\\\">\\\\r\\\\n        realestate.twin.vn\\\\r\\\\n    </a>\\\\r\\\\n    <br /><br />\\\\r\\\\n    &nbsp;User info <br />\\\\r\\\\n    &nbsp;&nbsp;+ Username: tunha <br />\\\\r\\\\n    &nbsp;&nbsp;+ Fullname: Nguyễn Hoàng Anh Tú <br />\\\\r\\\\n    &nbsp;&nbsp;+ Phone: 01263103363 <br />\\\\r\\\\n    &nbsp;&nbsp;+ Email: tunh@twin.vn <br /><br />\\\\r\\\\n    <a href=\\\\\\\"http://realestate.twin.vn:3000/UserManagement\\\\\\\">\\\\r\\\\n        Login system\\\\r\\\\n    </a> to verify and grant accessrights for new user.\\\\r\\\\n    <br />\\\\r\\\\n    <p>\\\\r\\\\n        <strong>Best regards,</strong><br />\\\\r\\\\n        <b>Twin Real Estate</b><br />\\\\r\\\\n        E: realestate@twin.vn<br />\\\\r\\\\n        M: 0986.858.724\\\\r\\\\n    </p>\\\\r\\\\n</body>\\\\r\\\\n</html> \\\"\"]"}', N'["\"TwinCRM: New Register\"","\"<html xmlns=\\\"http://www.w3.org/1999/xhtml\\\">\\r\\n<head>\\r\\n    <title></title>\\r\\n</head>\\r\\n<body style=\\\"margin: 0; padding: 0;font-family: arial;font-size: 12px;\\\">\\r\\n    Hello <b>TRE Admin</b>, <br />\\r\\n    <br />\\r\\n    You have new register from <a href=\\\"http://realestate.twin.vn:3000/\\\">\\r\\n        realestate.twin.vn\\r\\n    </a>\\r\\n    <br /><br />\\r\\n    &nbsp;User info <br />\\r\\n    &nbsp;&nbsp;+ Username: tunha <br />\\r\\n    &nbsp;&nbsp;+ Fullname: Nguyễn Hoàng Anh Tú <br />\\r\\n    &nbsp;&nbsp;+ Phone: 01263103363 <br />\\r\\n    &nbsp;&nbsp;+ Email: tunh@twin.vn <br /><br />\\r\\n    <a href=\\\"http://realestate.twin.vn:3000/UserManagement\\\">\\r\\n        Login system\\r\\n    </a> to verify and grant accessrights for new user.\\r\\n    <br />\\r\\n    <p>\\r\\n        <strong>Best regards,</strong><br />\\r\\n        <b>Twin Real Estate</b><br />\\r\\n        E: realestate@twin.vn<br />\\r\\n        M: 0986.858.724\\r\\n    </p>\\r\\n</body>\\r\\n</html> \""]', CAST(N'2016-09-14 11:11:40.607' AS DateTime), NULL)
SET IDENTITY_INSERT [HangFire].[Job] OFF
SET IDENTITY_INSERT [HangFire].[JobParameter] ON 

INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (1, 1, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (2, 1, N'CurrentUICulture', N'"vi"')
INSERT [HangFire].[JobParameter] ([Id], [JobId], [Name], [Value]) VALUES (3, 1, N'RetryCount', N'10')
SET IDENTITY_INSERT [HangFire].[JobParameter] OFF
INSERT [HangFire].[Schema] ([Version]) VALUES (5)
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'mrbao:8576:b3e0a8b0-434c-445c-8371-a3350ba1a226', N'{"WorkerCount":20,"Queues":["critital","default"],"StartedAt":"2016-09-27T14:34:51.882438Z"}', CAST(N'2016-09-27 14:36:52.703' AS DateTime))
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (1, 1, N'Enqueued', NULL, CAST(N'2016-09-14 11:11:40.847' AS DateTime), N'{"EnqueuedAt":"2016-09-14T11:11:40.5056232Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (2, 1, N'Processing', NULL, CAST(N'2016-09-14 11:11:41.223' AS DateTime), N'{"StartedAt":"2016-09-14T11:11:41.0174741Z","ServerId":"desktop-j47vufj:4532:193c3da6-7afc-4b3a-b1e4-510032d8a54f","WorkerId":"6c660e06-f07e-4ad9-b10c-3b36f22db362"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (3, 1, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2016-09-14 11:11:56.357' AS DateTime), N'{"FailedAt":"2016-09-14T11:11:56.1287086Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Invalid object name ''tw_SMTP_Configuration''.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tw_SMTP_Configuration''.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.ExecReader(IDbCommand dbCmd, String sql)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.FirstOrDefault[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.First[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.<>c__DisplayClass18`1.<Single>b__17(IDbCommand dbCmd)\r\n   at ServiceStack.OrmLite.ReadConnectionExtensions.Exec[T](IDbConnection dbConn, Func`2 filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.Single[T](IDbConnection dbConn, String filter)\r\n   at CRM.Helpers.SendMail.Send(String subject, String content) in f:\\SaiGonFord\\SaiGonFord\\CRM\\CRM\\Helpers\\SendMail.cs:line 73\r\nClientConnectionId:98225bca-5518-4f83-861d-611352a49a42\r\nError Number:208,State:1,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (4, 1, N'Scheduled', N'Retry attempt 1 of 10: Invalid object name ''tw_SMTP_Configuration''.', CAST(N'2016-09-14 11:11:59.580' AS DateTime), N'{"EnqueueAt":"2016-09-14T11:12:37.3297823Z","ScheduledAt":"2016-09-14T11:11:56.3297823Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (5, 1, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2016-09-14 11:13:00.840' AS DateTime), N'{"EnqueuedAt":"2016-09-14T11:13:00.5969841Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (6, 1, N'Processing', NULL, CAST(N'2016-09-14 11:13:00.923' AS DateTime), N'{"StartedAt":"2016-09-14T11:13:00.9079832Z","ServerId":"desktop-j47vufj:5820:aa7f6d54-e0d9-4804-b1c1-331f90a5e886","WorkerId":"764a3670-2774-4c63-839e-427923033fbd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (7, 1, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2016-09-14 11:13:01.070' AS DateTime), N'{"FailedAt":"2016-09-14T11:13:00.9929821Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Invalid object name ''tw_SMTP_Configuration''.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tw_SMTP_Configuration''.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.ExecReader(IDbCommand dbCmd, String sql)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.FirstOrDefault[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.First[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.<>c__DisplayClass18`1.<Single>b__17(IDbCommand dbCmd)\r\n   at ServiceStack.OrmLite.ReadConnectionExtensions.Exec[T](IDbConnection dbConn, Func`2 filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.Single[T](IDbConnection dbConn, String filter)\r\n   at CRM.Helpers.SendMail.Send(String subject, String content) in f:\\SaiGonFord\\SaiGonFord\\CRM\\CRM\\Helpers\\SendMail.cs:line 73\r\nClientConnectionId:7c7ca4ff-e289-417a-8652-72374ce0a26f\r\nError Number:208,State:1,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (8, 1, N'Scheduled', N'Retry attempt 2 of 10: Invalid object name ''tw_SMTP_Configuration''.', CAST(N'2016-09-14 11:13:01.103' AS DateTime), N'{"EnqueueAt":"2016-09-14T11:13:49.0609827Z","ScheduledAt":"2016-09-14T11:13:01.0609827Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (9, 1, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2016-09-14 11:14:00.960' AS DateTime), N'{"EnqueuedAt":"2016-09-14T11:14:00.9455774Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10, 1, N'Processing', NULL, CAST(N'2016-09-14 11:14:00.980' AS DateTime), N'{"StartedAt":"2016-09-14T11:14:00.9668405Z","ServerId":"desktop-j47vufj:5820:aa7f6d54-e0d9-4804-b1c1-331f90a5e886","WorkerId":"764a3670-2774-4c63-839e-427923033fbd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (11, 1, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2016-09-14 11:14:01.140' AS DateTime), N'{"FailedAt":"2016-09-14T11:14:01.1177982Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Invalid object name ''tw_SMTP_Configuration''.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tw_SMTP_Configuration''.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.ExecReader(IDbCommand dbCmd, String sql)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.FirstOrDefault[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.First[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.<>c__DisplayClass18`1.<Single>b__17(IDbCommand dbCmd)\r\n   at ServiceStack.OrmLite.ReadConnectionExtensions.Exec[T](IDbConnection dbConn, Func`2 filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.Single[T](IDbConnection dbConn, String filter)\r\n   at CRM.Helpers.SendMail.Send(String subject, String content) in f:\\SaiGonFord\\SaiGonFord\\CRM\\CRM\\Helpers\\SendMail.cs:line 73\r\nClientConnectionId:4be04bb3-fe14-4c95-a4a8-d596050639f8\r\nError Number:208,State:1,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (12, 1, N'Scheduled', N'Retry attempt 3 of 10: Invalid object name ''tw_SMTP_Configuration''.', CAST(N'2016-09-14 11:14:01.140' AS DateTime), N'{"EnqueueAt":"2016-09-14T11:15:44.1343374Z","ScheduledAt":"2016-09-14T11:14:01.1343374Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (13, 1, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2016-09-14 11:15:46.060' AS DateTime), N'{"EnqueuedAt":"2016-09-14T11:15:46.0442748Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (14, 1, N'Processing', NULL, CAST(N'2016-09-14 11:15:46.090' AS DateTime), N'{"StartedAt":"2016-09-14T11:15:46.0765384Z","ServerId":"desktop-j47vufj:5820:aa7f6d54-e0d9-4804-b1c1-331f90a5e886","WorkerId":"764a3670-2774-4c63-839e-427923033fbd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (15, 1, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2016-09-14 11:15:46.143' AS DateTime), N'{"FailedAt":"2016-09-14T11:15:46.1165889Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Invalid object name ''tw_SMTP_Configuration''.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tw_SMTP_Configuration''.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.ExecReader(IDbCommand dbCmd, String sql)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.FirstOrDefault[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.First[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.<>c__DisplayClass18`1.<Single>b__17(IDbCommand dbCmd)\r\n   at ServiceStack.OrmLite.ReadConnectionExtensions.Exec[T](IDbConnection dbConn, Func`2 filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.Single[T](IDbConnection dbConn, String filter)\r\n   at CRM.Helpers.SendMail.Send(String subject, String content) in f:\\SaiGonFord\\SaiGonFord\\CRM\\CRM\\Helpers\\SendMail.cs:line 73\r\nClientConnectionId:24f5ca77-0f4a-448e-9071-d37583b012f9\r\nError Number:208,State:1,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (16, 1, N'Scheduled', N'Retry attempt 4 of 10: Invalid object name ''tw_SMTP_Configuration''.', CAST(N'2016-09-14 11:15:46.157' AS DateTime), N'{"EnqueueAt":"2016-09-14T11:18:18.1409726Z","ScheduledAt":"2016-09-14T11:15:46.1409726Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (17, 1, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2016-09-15 02:09:59.867' AS DateTime), N'{"EnqueuedAt":"2016-09-15T02:09:57.9251728Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (18, 1, N'Processing', NULL, CAST(N'2016-09-15 02:09:59.987' AS DateTime), N'{"StartedAt":"2016-09-15T02:09:59.9739881Z","ServerId":"desktop-j47vufj:6472:19c338e7-6a59-4020-9683-2207f0e911fe","WorkerId":"bc1db957-c3da-4f41-8f3f-4a92b522974e"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (19, 1, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2016-09-15 02:10:02.123' AS DateTime), N'{"FailedAt":"2016-09-15T02:10:02.0547448Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Invalid object name ''tw_SMTP_Configuration''.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tw_SMTP_Configuration''.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.ExecReader(IDbCommand dbCmd, String sql)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.FirstOrDefault[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.First[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.<>c__DisplayClass18`1.<Single>b__17(IDbCommand dbCmd)\r\n   at ServiceStack.OrmLite.ReadConnectionExtensions.Exec[T](IDbConnection dbConn, Func`2 filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.Single[T](IDbConnection dbConn, String filter)\r\n   at CRM.Helpers.SendMail.Send(String subject, String content) in f:\\SaiGonFord\\SaiGonFord\\CRM\\CRM\\Helpers\\SendMail.cs:line 73\r\nClientConnectionId:1be9414e-1cc1-47e8-9947-73eef802d4f2\r\nError Number:208,State:1,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (20, 1, N'Scheduled', N'Retry attempt 5 of 10: Invalid object name ''tw_SMTP_Configuration''.', CAST(N'2016-09-15 02:10:03.873' AS DateTime), N'{"EnqueueAt":"2016-09-15T02:15:18.1167969Z","ScheduledAt":"2016-09-15T02:10:02.1167969Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (21, 1, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2016-09-15 02:18:17.717' AS DateTime), N'{"EnqueuedAt":"2016-09-15T02:18:17.4787870Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (22, 1, N'Processing', NULL, CAST(N'2016-09-15 02:18:17.777' AS DateTime), N'{"StartedAt":"2016-09-15T02:18:17.7627892Z","ServerId":"desktop-j47vufj:6472:9c10e82d-a960-487b-a5ba-45b4b15a9417","WorkerId":"cf6feb86-0c10-4202-9e8e-ce49b0157bd7"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23, 1, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2016-09-15 02:18:18.017' AS DateTime), N'{"FailedAt":"2016-09-15T02:18:17.9397882Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Invalid object name ''tw_SMTP_Configuration''.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tw_SMTP_Configuration''.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.ExecReader(IDbCommand dbCmd, String sql)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.FirstOrDefault[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.First[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.<>c__DisplayClass18`1.<Single>b__17(IDbCommand dbCmd)\r\n   at ServiceStack.OrmLite.ReadConnectionExtensions.Exec[T](IDbConnection dbConn, Func`2 filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.Single[T](IDbConnection dbConn, String filter)\r\n   at CRM.Helpers.SendMail.Send(String subject, String content)\r\nClientConnectionId:50d990d6-69fa-4f0e-9b41-fce2b143cfd0\r\nError Number:208,State:1,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24, 1, N'Scheduled', N'Retry attempt 6 of 10: Invalid object name ''tw_SMTP_Configuration''.', CAST(N'2016-09-15 02:18:18.043' AS DateTime), N'{"EnqueueAt":"2016-09-15T02:31:46.0047892Z","ScheduledAt":"2016-09-15T02:18:18.0047892Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (25, 1, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2016-09-15 02:33:28.713' AS DateTime), N'{"EnqueuedAt":"2016-09-15T02:33:28.4719642Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (26, 1, N'Processing', NULL, CAST(N'2016-09-15 02:33:28.923' AS DateTime), N'{"StartedAt":"2016-09-15T02:33:28.9123945Z","ServerId":"desktop-j47vufj:6472:166a446f-e8ea-4731-8402-8e5aaabaaff8","WorkerId":"8df7a702-4598-4301-8981-2f48bde5b39a"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (27, 1, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2016-09-15 02:33:29.067' AS DateTime), N'{"FailedAt":"2016-09-15T02:33:29.0154008Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Invalid object name ''tw_SMTP_Configuration''.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tw_SMTP_Configuration''.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.ExecReader(IDbCommand dbCmd, String sql)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.FirstOrDefault[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.First[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.<>c__DisplayClass18`1.<Single>b__17(IDbCommand dbCmd)\r\n   at ServiceStack.OrmLite.ReadConnectionExtensions.Exec[T](IDbConnection dbConn, Func`2 filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.Single[T](IDbConnection dbConn, String filter)\r\n   at CRM.Helpers.SendMail.Send(String subject, String content) in f:\\SaiGonFord\\SaiGonFord\\CRM\\CRM\\Helpers\\SendMail.cs:line 73\r\nClientConnectionId:313cb6e1-7529-41e4-9655-180cf017783a\r\nError Number:208,State:1,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (28, 1, N'Scheduled', N'Retry attempt 7 of 10: Invalid object name ''tw_SMTP_Configuration''.', CAST(N'2016-09-15 02:33:29.090' AS DateTime), N'{"EnqueueAt":"2016-09-15T02:58:08.0584248Z","ScheduledAt":"2016-09-15T02:33:29.0584248Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (29, 1, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2016-09-15 02:58:29.553' AS DateTime), N'{"EnqueuedAt":"2016-09-15T02:58:29.3273782Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (30, 1, N'Processing', NULL, CAST(N'2016-09-15 02:58:30.343' AS DateTime), N'{"StartedAt":"2016-09-15T02:58:30.3258456Z","ServerId":"desktop-j47vufj:6472:cf2de9aa-e643-414e-a4e7-d8a8dff61eb9","WorkerId":"7b5e08bd-70be-4173-9046-00d7e1136faf"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (31, 1, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2016-09-15 02:58:30.743' AS DateTime), N'{"FailedAt":"2016-09-15T02:58:30.6358417Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Invalid object name ''tw_SMTP_Configuration''.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tw_SMTP_Configuration''.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.ExecReader(IDbCommand dbCmd, String sql)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.FirstOrDefault[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.First[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.<>c__DisplayClass18`1.<Single>b__17(IDbCommand dbCmd)\r\n   at ServiceStack.OrmLite.ReadConnectionExtensions.Exec[T](IDbConnection dbConn, Func`2 filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.Single[T](IDbConnection dbConn, String filter)\r\n   at CRM.Helpers.SendMail.Send(String subject, String content) in f:\\SaiGonFord\\SaiGonFord\\CRM\\CRM\\Helpers\\SendMail.cs:line 73\r\nClientConnectionId:a5a6d645-8a61-48a3-8bdf-01298b0b6d6e\r\nError Number:208,State:1,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (32, 1, N'Scheduled', N'Retry attempt 8 of 10: Invalid object name ''tw_SMTP_Configuration''.', CAST(N'2016-09-15 02:58:30.777' AS DateTime), N'{"EnqueueAt":"2016-09-15T03:39:50.7328440Z","ScheduledAt":"2016-09-15T02:58:30.7328440Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33, 1, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2016-09-15 03:39:59.013' AS DateTime), N'{"EnqueuedAt":"2016-09-15T03:39:58.7348396Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (34, 1, N'Processing', NULL, CAST(N'2016-09-15 03:39:59.127' AS DateTime), N'{"StartedAt":"2016-09-15T03:39:59.1118397Z","ServerId":"desktop-j47vufj:6472:9d824926-d66e-47ff-854f-b098b5459c87","WorkerId":"6bd4b672-0a72-4a9a-bfc6-7d45dc5dd85b"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (35, 1, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2016-09-15 03:39:59.307' AS DateTime), N'{"FailedAt":"2016-09-15T03:39:59.1818372Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Invalid object name ''tw_SMTP_Configuration''.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tw_SMTP_Configuration''.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.ExecReader(IDbCommand dbCmd, String sql)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.FirstOrDefault[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.First[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.<>c__DisplayClass18`1.<Single>b__17(IDbCommand dbCmd)\r\n   at ServiceStack.OrmLite.ReadConnectionExtensions.Exec[T](IDbConnection dbConn, Func`2 filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.Single[T](IDbConnection dbConn, String filter)\r\n   at CRM.Helpers.SendMail.Send(String subject, String content) in f:\\SaiGonFord\\SaiGonFord\\CRM\\CRM\\Helpers\\SendMail.cs:line 73\r\nClientConnectionId:d9dc6fa3-9d33-4979-855b-bfc1a3806b02\r\nError Number:208,State:1,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (36, 1, N'Scheduled', N'Retry attempt 9 of 10: Invalid object name ''tw_SMTP_Configuration''.', CAST(N'2016-09-15 03:39:59.343' AS DateTime), N'{"EnqueueAt":"2016-09-15T04:51:03.2978367Z","ScheduledAt":"2016-09-15T03:39:59.2978367Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (37, 1, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2016-09-15 04:51:03.930' AS DateTime), N'{"EnqueuedAt":"2016-09-15T04:51:03.5852064Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (38, 1, N'Processing', NULL, CAST(N'2016-09-15 04:51:04.000' AS DateTime), N'{"StartedAt":"2016-09-15T04:51:03.9854156Z","ServerId":"desktop-j47vufj:6472:14950c17-ef0e-4b75-946c-51d14a629adb","WorkerId":"0b3cf354-4d82-4453-b51e-b1e46afa26ba"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (39, 1, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2016-09-15 04:51:04.167' AS DateTime), N'{"FailedAt":"2016-09-15T04:51:04.1044194Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Invalid object name ''tw_SMTP_Configuration''.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tw_SMTP_Configuration''.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.ExecReader(IDbCommand dbCmd, String sql)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.FirstOrDefault[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.First[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.<>c__DisplayClass18`1.<Single>b__17(IDbCommand dbCmd)\r\n   at ServiceStack.OrmLite.ReadConnectionExtensions.Exec[T](IDbConnection dbConn, Func`2 filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.Single[T](IDbConnection dbConn, String filter)\r\n   at CRM.Helpers.SendMail.Send(String subject, String content) in f:\\SaiGonFord\\SaiGonFord\\CRM\\CRM\\Helpers\\SendMail.cs:line 73\r\nClientConnectionId:9651ccbe-9e59-48df-a637-fa3bbc72614d\r\nError Number:208,State:1,Class:16"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (40, 1, N'Scheduled', N'Retry attempt 10 of 10: Invalid object name ''tw_SMTP_Configuration''.', CAST(N'2016-09-15 04:51:04.253' AS DateTime), N'{"EnqueueAt":"2016-09-15T06:45:00.1554128Z","ScheduledAt":"2016-09-15T04:51:04.1554128Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (41, 1, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2016-09-15 06:45:06.320' AS DateTime), N'{"EnqueuedAt":"2016-09-15T06:45:05.9135642Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (42, 1, N'Processing', NULL, CAST(N'2016-09-15 06:45:06.467' AS DateTime), N'{"StartedAt":"2016-09-15T06:45:06.4215641Z","ServerId":"desktop-j47vufj:6472:7ff39632-fe23-4520-9789-19d96acbf24e","WorkerId":"bc1a28ee-aaa8-45f4-88a4-e23555c9db99"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (43, 1, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2016-09-15 06:45:06.820' AS DateTime), N'{"FailedAt":"2016-09-15T06:45:06.7655617Z","ExceptionType":"System.Data.SqlClient.SqlException","ExceptionMessage":"Invalid object name ''tw_SMTP_Configuration''.","ExceptionDetails":"System.Data.SqlClient.SqlException (0x80131904): Invalid object name ''tw_SMTP_Configuration''.\r\n   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)\r\n   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)\r\n   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)\r\n   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()\r\n   at System.Data.SqlClient.SqlDataReader.get_MetaData()\r\n   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)\r\n   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)\r\n   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)\r\n   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.ExecReader(IDbCommand dbCmd, String sql)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.FirstOrDefault[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadExtensions.First[T](IDbCommand dbCmd, String filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.<>c__DisplayClass18`1.<Single>b__17(IDbCommand dbCmd)\r\n   at ServiceStack.OrmLite.ReadConnectionExtensions.Exec[T](IDbConnection dbConn, Func`2 filter)\r\n   at ServiceStack.OrmLite.OrmLiteReadConnectionExtensions.Single[T](IDbConnection dbConn, String filter)\r\n   at CRM.Helpers.SendMail.Send(String subject, String content) in f:\\SaiGonFord\\SaiGonFord\\CRM\\CRM\\Helpers\\SendMail.cs:line 73\r\nClientConnectionId:07d5fb96-7c8d-49b7-bb8d-9e7033ea8d42\r\nError Number:208,State:1,Class:16"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [uidx_tw_businessgroup_groupcode]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [uidx_tw_businessgroup_groupcode] ON [dbo].[tw_BusinessGroup]
(
	[groupCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uidx_tw_carserial_name]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [uidx_tw_carserial_name] ON [dbo].[tw_CarSerial]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uidx_tw_carserial_serialcode]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [uidx_tw_carserial_serialcode] ON [dbo].[tw_CarSerial]
(
	[serialCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uidx_tw_cartype_typecode]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [uidx_tw_cartype_typecode] ON [dbo].[tw_CarType]
(
	[typeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_HangFire_CounterAggregated_Key]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_CounterAggregated_Key] ON [HangFire].[AggregatedCounter]
(
	[Key] ASC
)
INCLUDE ( 	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Counter_Key]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Counter_Key] ON [HangFire].[Counter]
(
	[Key] ASC
)
INCLUDE ( 	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Hash_Key]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_Key] ON [HangFire].[Hash]
(
	[Key] ASC
)
INCLUDE ( 	[ExpireAt]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_HangFire_Hash_Key_Field]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_Hash_Key_Field] ON [HangFire].[Hash]
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_JobParameter_JobIdAndName]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_JobParameter_JobIdAndName] ON [HangFire].[JobParameter]
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_JobQueue_QueueAndFetchedAt]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_JobQueue_QueueAndFetchedAt] ON [HangFire].[JobQueue]
(
	[Queue] ASC,
	[FetchedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_List_Key]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_Key] ON [HangFire].[List]
(
	[Key] ASC
)
INCLUDE ( 	[ExpireAt],
	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HangFire_Set_Key]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Key] ON [HangFire].[Set]
(
	[Key] ASC
)
INCLUDE ( 	[ExpireAt],
	[Value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_HangFire_Set_KeyAndValue]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_HangFire_Set_KeyAndValue] ON [HangFire].[Set]
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_State_JobId]    Script Date: 09/27/2016 9:37:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_State_JobId] ON [HangFire].[State]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
USE [master]
GO
ALTER DATABASE [SaiGonFordCRMDev] SET  READ_WRITE 
GO
