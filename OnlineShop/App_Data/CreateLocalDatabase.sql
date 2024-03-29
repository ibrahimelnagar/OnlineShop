USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 2015-05-10 18:20:28 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'OnlineShop')
BEGIN
CREATE DATABASE [OnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\OnlineShop.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\OnlineShop_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [OnlineShop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [OnlineShop]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2015-05-10 18:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Album]    Script Date: 2015-05-10 18:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Album]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Album](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GenreId] [int] NOT NULL,
	[ArtistId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[AlbumArtUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 2015-05-10 18:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Artist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Artist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2015-05-10 18:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2015-05-10 18:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2015-05-10 18:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2015-05-10 18:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2015-05-10 18:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 2015-05-10 18:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cart]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [nvarchar](max) NOT NULL,
	[AlbumId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 2015-05-10 18:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genre]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Genre](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2015-05-10 18:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Total] [decimal](19, 4) NULL,
	[OrderDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2015-05-10 18:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[AlbumId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201505072233490_InitialCreate', N'OnlineShop.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D5F60FF41D05376E1B47CD919CC1AED044EDBCE1A3BBE60DA13E46DC096D86D62244A9128C7C6225F96877C527E618B1275E345976EB9BB1D0C30B0C8E2A962B148168BC5FEF3F73FA6DF3F07BEF584E38484F4CC3E9A1CDA16A66EE811BA3AB353B6FCF683FDFD777FFFDBF4D20B9EAD9F0ABA134E072D6972663F32169D3A4EE23EE200259380B87198844B3671C3C0415EE81C1F1EFEDB393A723040D8806559D34F296524C0D9077CCE42EAE288A5C8BF093DEC27A21C6AE619AA758B029C44C8C567F61DF509C5F3C7309AE4C4B675EE130482CCB1BFB42D4469C81003314F3F2778CEE290AEE6111420FFE125C240B7447E8285F8A71579DF9E1C1EF39E3855C302CA4D13160603018F4E846A1CB9F95A0AB64BD581F22E41C9EC85F73A53E0997DEDE1ACE853E883026486A7333FE6C467F64DC9E23C896E319B140D2739E4550C70BF86F1D7491DF1C0EADDEEA034A5E3C921FF7760CD529FA5313EA3386531F20FACFB74E113F7BFF8E521FC8AE9D9C9D16279F2E1DD7BE49DBCFF173E7957EF29F415E81A0550741F87118E4136BC2CFB6F5B4EB39D23372C9BD5DAE45A015B8259615B37E8F923A62BF608F3E5F8836D5D9167EC1525C2B83E530293081AB13885CFDBD4F7D1C2C765BDD3CA93FFDFC2F5F8DDFB51B8DEA227B2CA865EE20F13278679F509FB596DF248A27C7A35C6FB8B20BB8AC3807F37ED2BAFFD320FD3D8E59D098D240F285E61D6946EEA54C6DBCBA439D4F8665DA0EEBF69734955F3D692F20EAD33130A16DB9E0D85BCAFCBB7B7C59D47110C5E665A5C236D06A7EC5513A9F1815591548673D4D7702874E8AFBC0E5E0688F8232C843DB8800BB2247180CB5EFE1082D9213A58E67B9424B00E78FF41C9638BE8F0E708A2CFB19BC6609E738682E8D5B9DD3F8614DFA6C1825BFDF6788D36340FBF8657C865617C4979AB8DF13E86EED7306597D4BB400C7F666E01C83F1F48D01F601471CE5D1727C9151833F6662178D805E0356527C783E1F8FAB46B4764E62312E83D116925FD529056DE889E42F1480C643AAFA44DD48FE18AD07EA216A46651738A4E5105D9505139583F4905A559D08CA053CE9C6A343F2F1BA1F11DBD0C76FF3DBDCD366FD35A5053E31C5648FC23A6388665CCBB478CE1985623D067DDD885B3900D1F67FAEA7B53C6E927E4A763B35A6B36648BC0F8B32183DDFFD9908909C54FC4E35E498FE34F410CF0BDE8F527ABEE392749B6EDE9D0E8E6B6996F670D304D97F324095D92CD024DE04B842D9AF2830F6775C730F2DEC87110E818183AE15B1E9440DF6CD9A8EEE805F631C3D6B99B070667287191A7AA113AE40D10ACD851358255F190A670FF547882A5E3983742FC1094C04C2594A9D382509744C8EFD492D4B2E716C6FB5EF2906B2E70842967D8A9893ECCF5E10F2E40C9471A942E0D4D9D9AC5B51BA2C16B358D79970B5B8DBB1295D88A4D76F8CE06BB14FEDBAB1866BBC6B6609CED2AE923803194B70B03156795BE06201F5CF6CD40A51393C140854BB515036D6A6C0706DA54C99B33D0FC88DA77FCA5F3EABE9967F3A0BCFD6DBD555D3BB0CD863EF6CC3473DF13DA30688163D53C2F16BC123F33CDE10CE414E7B344B8BAB28970F03966CD904DE5EF6AFD50A71D4436A236C0CAD03A40C525A002A44CA801C215B1BC56E984173100B688BBB5C28AB55F82ADD9808A5DBF0CAD119AAF4C65E3EC75FA287B565A8362E4BD0E0B351C8D41C88B57B3E33D94628ACBAA8AE9E30B0FF1866B1D1383D1A2A00ECFD5A0A4A233A36BA930CD6E2DE91CB2212ED9465A92DC2783968ACE8CAE2561A3DD4AD2380503DC828D54D4DCC2479A6C45A4A3DC6DCABAA993A7488982A963C8A59ADEA028227455CBAD1225D63C4FAC9A7D3B1F9E7214E4188E9B68328F4A694B4E2C8CD10A4BB5C01A24BD2271C22E10430BC4E33C332F50C8B47BAB61F92F58D6B74F75108B7DA0A0E67FE72DD4ABFBC656ABFA2202E20A3A187087268BA26B865FDFDCE2A96EC847B126703F0BFD34A066FFCADC3ABFBEABB7CF4B5484A923C9AFF84F8AB2142FB7A9F95EE3A2CE8971C6A8F45ED61F27338449DB85EF59D7B7C91F35A314E1A93A8A2964B5B37133B93143C64A7610870F5527C2EBCC2A91955207104503316A890D0A58ADAE3F6A33F7A48ED9ACE98F282598D421A5AA0152D6D3481A42D62BD6C23368544FD19F839A385247576BFB236B5248EAD09AEA35B03532CB75FD5135592675604D757FEC2AE5445E43F778DF321E5BD6DDB8F283ED663B9701E37516C47136BEDAFD7D1DA8563C104BDCD02B60A27C2F8DC978BA5BD798F270C666C664C030AF3B8D8BEFE6B2D37A5B6FC66CDC663796F6B6DB7C33DE30937D55C350CE763249C9BD3CE34967B9A93857753F9E510E5A39896D156A846DFD256138987082C9FC177FE613CC17F182E00651B2C409CB3338ECE3C3A363E901CEFE3C867192C4F335E752D38B98E6986D21198B3EA1D87D44B19A1AB1C183910A54893A5F530F3F9FD9FFCB5A9D66010CFE57567C605D279F29F925858A8738C5D66F6AAAE73809F4ED27AC3D7DEED05FABD73F7FC99B1E587731CC9853EB50D2E53A23DC7C0431489ABCE906D2ACFD34E2ED4EA8C6CB032DAA3421D67F68B0206C9447068594DF04E8F91F4345D33E24D80851F358602CBC5154687A0CB00E96F12180079F2C7B0830ACB3FA8701EB88667C1440E87030F94940FF65A868B9C3AD467324DAC69294E9B933A57AA3FCCA5DEF4D4AE6F546135DCDAE1E00B74106F51A96F1C6928F47DB1D35B9C5A361EFD2B45F3DA1785F7288ABEC8EDDA60E6F335BB8E54EE82F9524BC07696D9A349DDDA7026FDBD64C61DC3DCFA71C96F0BB67C62692B7769FD6BB6D63338579F7DCD80625EFEE99ADED6AFFDCB1A5F5DE42779E8AAB661519AE6374B1E0AE54DB3C700E27FC450846907B94F90B497D6E575B5E6A07C38AC4CCD49C54263356268EC257A168673BACAF62C36FEDACA069676B48C56CE32DD6FF56DE82A69DB721C1711749C2DA14435DE276C73AD69601F59692821B3DE9C841EFF2595BEFD6DF520EF0284A69CC1EC31DF1DB49F91D4525634E9D0129BEEA752FEC9DB55F5484FD3B21AB0A82FFBE22C56E63D72C69AEE9322C366F49A282448AD0DC60863CD852CF634696C86550CD63CCD913EF2C6EC76F3A16D8BBA677298B52065DC6C1C26F04BCB813D0C63FCB636ECA3CBD8BB25F2B19A30B2026E1B1F93BFA434A7CAF94FB4A1313324070EF424474F958321ED95DBD9448B721ED0924D4573A450F38887C004BEEE81C3DE1756403F3FB8857C87DA922802690EE8168AA7D7A41D02A46412230AAF6F00936EC05CFDFFD1FC029A6A958540000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (1, 1, 1, N'For Those About To Rock We Salute You', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (2, 1, 1, N'Let There Be Rock', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (3, 1, 100, N'Greatest Hits', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (4, 1, 102, N'Misplaced Childhood', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (5, 1, 105, N'The Best Of Men At Work', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (6, 1, 110, N'Nevermind', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (7, 1, 111, N'Compositores', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (8, 1, 114, N'Bark at the Moon (Remastered)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (9, 1, 114, N'Blizzard of Ozz', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (10, 1, 114, N'Diary of a Madman (Remastered)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (11, 1, 114, N'No More Tears (Remastered)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (12, 1, 114, N'Speak of the Devil', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (13, 1, 115, N'Walking Into Clarksdale', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (14, 1, 117, N'The Beast Live', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (15, 1, 118, N'Live On Two Legs [Live]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (16, 1, 118, N'Riot Act', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (17, 1, 118, N'Ten', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (18, 1, 118, N'Vs.', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (19, 1, 120, N'Dark Side Of The Moon', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (20, 1, 124, N'New Adventures In Hi-Fi', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (21, 1, 126, N'Raul Seixas', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (22, 1, 127, N'By The Way', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (23, 1, 127, N'Californication', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (24, 1, 128, N'Retrospective I (1974-1980)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (25, 1, 130, N'Maquinarama', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (26, 1, 130, N'O Samba Poconé', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (27, 1, 132, N'A-Sides', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (28, 1, 134, N'Core', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (29, 1, 136, N'[1997] Black Light Syndrome', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (30, 1, 139, N'Beyond Good And Evil', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (31, 1, 140, N'The Doors', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (32, 1, 141, N'The Police Greatest Hits', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (33, 1, 142, N'Hot Rocks, 1964-1971 (Disc 1)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (34, 1, 142, N'No Security', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (35, 1, 142, N'Voodoo Lounge', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (36, 1, 144, N'My Generation - The Very Best Of The Who', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (37, 1, 150, N'Achtung Baby', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (38, 1, 150, N'B-Sides 1980-1990', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (39, 1, 150, N'How To Dismantle An Atomic Bomb', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (40, 1, 150, N'Pop', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (41, 1, 150, N'Rattle And Hum', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (42, 1, 150, N'The Best Of 1980-1990', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (43, 1, 150, N'War', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (44, 1, 150, N'Zooropa', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (45, 1, 152, N'Diver Down', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (46, 1, 152, N'The Best Of Van Halen, Vol. I', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (47, 1, 152, N'Van Halen III', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (48, 1, 152, N'Van Halen', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (49, 1, 153, N'Contraband', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (50, 1, 157, N'Un-Led-Ed', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (51, 1, 2, N'Balls to the Wall', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (52, 1, 2, N'Restless and Wild', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (53, 1, 200, N'Every Kind of Light', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (54, 1, 22, N'BBC Sessions [Disc 1] [Live]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (55, 1, 22, N'BBC Sessions [Disc 2] [Live]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (56, 1, 22, N'Coda', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (57, 1, 22, N'Houses Of The Holy', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (58, 1, 22, N'In Through The Out Door', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (59, 1, 22, N'IV', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (60, 1, 22, N'Led Zeppelin I', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (61, 1, 22, N'Led Zeppelin II', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (62, 1, 22, N'Led Zeppelin III', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (63, 1, 22, N'Physical Graffiti [Disc 1]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (64, 1, 22, N'Physical Graffiti [Disc 2]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (65, 1, 22, N'Presence', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (66, 1, 22, N'The Song Remains The Same (Disc 1)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (67, 1, 22, N'The Song Remains The Same (Disc 2)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (68, 1, 23, N'Bongo Fury', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (69, 1, 3, N'Big Ones', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (70, 1, 4, N'Jagged Little Pill', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (71, 1, 5, N'Facelift', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (72, 1, 51, N'Greatest Hits I', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (73, 1, 51, N'Greatest Hits II', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (74, 1, 51, N'News Of The World', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (75, 1, 52, N'Greatest Kiss', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (76, 1, 52, N'Unplugged [Live]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (77, 1, 55, N'Into The Light', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (78, 1, 58, N'Come Taste The Band', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (79, 1, 58, N'Deep Purple In Rock', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (80, 1, 58, N'Fireball', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (81, 1, 58, N'Machine Head', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (82, 1, 58, N'MK III The Final Concerts [Disc 1]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (83, 1, 58, N'Purpendicular', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (84, 1, 58, N'Slaves And Masters', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (85, 1, 58, N'Stormbringer', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (86, 1, 58, N'The Battle Rages On', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (87, 1, 58, N'The Final Concerts (Disc 2)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (88, 1, 59, N'Santana - As Years Go By', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (89, 1, 59, N'Santana Live', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (90, 1, 59, N'Supernatural', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (91, 1, 76, N'Chronicle, Vol. 1', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (92, 1, 76, N'Chronicle, Vol. 2', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (93, 1, 8, N'Audioslave', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (94, 1, 82, N'King For A Day Fool For A Lifetime', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (95, 1, 84, N'In Your Honor [Disc 1]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (96, 1, 84, N'In Your Honor [Disc 2]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (97, 1, 84, N'The Colour And The Shape', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (98, 1, 88, N'Appetite for Destruction', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (99, 1, 88, N'Use Your Illusion I', 8.9900, N'/Content/Images/placeholder.gif')
GO
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (100, 1, 90, N'A Matter of Life and Death', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (101, 1, 90, N'Brave New World', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (102, 1, 90, N'Fear Of The Dark', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (103, 1, 90, N'Live At Donington 1992 (Disc 1)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (104, 1, 90, N'Live At Donington 1992 (Disc 2)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (105, 1, 90, N'Rock In Rio [CD2]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (106, 1, 90, N'The Number of The Beast', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (107, 1, 90, N'The X Factor', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (108, 1, 90, N'Virtual XI', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (109, 1, 92, N'Emergency On Planet Earth', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (110, 1, 94, N'Are You Experienced?', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (111, 1, 95, N'Surfing with the Alien (Remastered)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (112, 10, 203, N'The Best of Beethoven', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (113, 10, 208, N'Pachelbel: Canon & Gigue', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (114, 10, 211, N'Bach: Goldberg Variations', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (115, 10, 212, N'Bach: The Cello Suites', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (116, 10, 213, N'Handel: The Messiah (Highlights)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (117, 10, 217, N'Haydn: Symphonies 99 - 104', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (118, 10, 219, N'A Soprano Inspired', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (119, 10, 221, N'Wagner: Favourite Overtures', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (120, 10, 223, N'Tchaikovsky: The Nutcracker', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (121, 10, 224, N'The Last Night of the Proms', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (122, 10, 226, N'Respighi:Pines of Rome', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (123, 10, 226, N'Strauss: Waltzes', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (124, 10, 229, N'Carmina Burana', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (125, 10, 230, N'A Copland Celebration, Vol. I', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (126, 10, 231, N'Bach: Toccata & Fugue in D Minor', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (127, 10, 232, N'Prokofiev: Symphony No.1', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (128, 10, 233, N'Scheherazade', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (129, 10, 234, N'Bach: The Brandenburg Concertos', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (130, 10, 236, N'Mascagni: Cavalleria Rusticana', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (131, 10, 237, N'Sibelius: Finlandia', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (132, 10, 242, N'Adams, John: The Chairman Dances', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (133, 10, 245, N'Berlioz: Symphonie Fantastique', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (134, 10, 245, N'Prokofiev: Romeo & Juliet', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (135, 10, 247, N'English Renaissance', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (136, 10, 248, N'Mozart: Symphonies Nos. 40 & 41', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (137, 10, 250, N'SCRIABIN: Vers la flamme', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (138, 10, 255, N'Bartok: Violin & Viola Concertos', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (139, 10, 259, N'South American Getaway', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (140, 10, 260, N'Górecki: Symphony No. 3', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (141, 10, 261, N'Purcell: The Fairy Queen', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (142, 10, 264, N'Weill: The Seven Deadly Sins', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (143, 10, 266, N'Szymanowski: Piano Works, Vol. 1', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (144, 10, 267, N'Nielsen: The Six Symphonies', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (145, 10, 274, N'Mozart: Chamber Music', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (146, 2, 10, N'The Best Of Billy Cobham', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (147, 2, 197, N'Quiet Songs', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (148, 2, 202, N'Worlds', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (149, 2, 27, N'Quanta Gente Veio ver--Bônus De Carnaval', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (150, 2, 53, N'Heart of the Night', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (151, 2, 53, N'Morning Dance', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (152, 2, 6, N'Warner 25 Anos', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (153, 2, 68, N'Miles Ahead', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (154, 2, 68, N'The Essential Miles Davis [Disc 1]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (155, 2, 68, N'The Essential Miles Davis [Disc 2]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (156, 2, 79, N'Outbreak', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (157, 2, 89, N'Blue Moods', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (158, 3, 100, N'Greatest Hits', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (159, 3, 106, N'Ace Of Spades', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (160, 3, 109, N'Motley Crue Greatest Hits', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (161, 3, 11, N'Alcohol Fueled Brewtality Live! [Disc 1]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (162, 3, 11, N'Alcohol Fueled Brewtality Live! [Disc 2]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (163, 3, 114, N'Tribute', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (164, 3, 12, N'Black Sabbath Vol. 4 (Remaster)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (165, 3, 12, N'Black Sabbath', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (166, 3, 135, N'Mezmerize', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (167, 3, 14, N'Chemical Wedding', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (168, 3, 50, N'...And Justice For All', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (169, 3, 50, N'Black Album', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (170, 3, 50, N'Garage Inc. (Disc 1)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (171, 3, 50, N'Garage Inc. (Disc 2)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (172, 3, 50, N'Load', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (173, 3, 50, N'Master Of Puppets', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (174, 3, 50, N'ReLoad', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (175, 3, 50, N'Ride The Lightning', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (176, 3, 50, N'St. Anger', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (177, 3, 7, N'Plays Metallica By Four Cellos', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (178, 3, 87, N'Faceless', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (179, 3, 88, N'Use Your Illusion II', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (180, 3, 90, N'A Real Dead One', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (181, 3, 90, N'A Real Live One', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (182, 3, 90, N'Live After Death', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (183, 3, 90, N'No Prayer For The Dying', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (184, 3, 90, N'Piece Of Mind', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (185, 3, 90, N'Powerslave', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (186, 3, 90, N'Rock In Rio [CD1]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (187, 3, 90, N'Rock In Rio [CD2]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (188, 3, 90, N'Seventh Son of a Seventh Son', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (189, 3, 90, N'Somewhere in Time', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (190, 3, 90, N'The Number of The Beast', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (191, 3, 98, N'Living After Midnight', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (192, 4, 196, N'Cake: B-Sides and Rarities', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (193, 4, 204, N'Temple of the Dog', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (194, 4, 205, N'Carry On', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (195, 4, 253, N'Carried to Dust (Bonus Track Version)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (196, 4, 8, N'Revelations', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (197, 6, 133, N'In Step', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (198, 6, 137, N'Live [Disc 1]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (199, 6, 137, N'Live [Disc 2]', 8.9900, N'/Content/Images/placeholder.gif')
GO
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (200, 6, 81, N'The Cream Of Clapton', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (201, 6, 81, N'Unplugged', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (202, 6, 90, N'Iron Maiden', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (203, 7, 103, N'Barulhinho Bom', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (204, 7, 112, N'Olodum', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (205, 7, 113, N'Acústico MTV', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (206, 7, 113, N'Arquivo II', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (207, 7, 113, N'Arquivo Os Paralamas Do Sucesso', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (208, 7, 145, N'Serie Sem Limite (Disc 1)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (209, 7, 145, N'Serie Sem Limite (Disc 2)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (210, 7, 155, N'Ao Vivo [IMPORT]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (211, 7, 16, N'Prenda Minha', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (212, 7, 16, N'Sozinho Remix Ao Vivo', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (213, 7, 17, N'Minha Historia', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (214, 7, 18, N'Afrociberdelia', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (215, 7, 18, N'Da Lama Ao Caos', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (216, 7, 20, N'Na Pista', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (217, 7, 201, N'Duos II', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (218, 7, 21, N'Sambas De Enredo 2001', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (219, 7, 21, N'Vozes do MPB', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (220, 7, 24, N'Chill: Brazil (Disc 1)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (221, 7, 27, N'Quanta Gente Veio Ver (Live)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (222, 7, 37, N'The Best of Ed Motta', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (223, 7, 41, N'Elis Regina-Minha História', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (224, 7, 42, N'Milton Nascimento Ao Vivo', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (225, 7, 42, N'Minas', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (226, 7, 46, N'Jorge Ben Jor 25 Anos', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (227, 7, 56, N'Meus Momentos', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (228, 7, 6, N'Chill: Brazil (Disc 2)', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (229, 7, 72, N'Vinicius De Moraes', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (230, 7, 77, N'Cássia Eller - Sem Limite [Disc 1]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (231, 7, 80, N'Djavan Ao Vivo - Vol. 02', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (232, 7, 80, N'Djavan Ao Vivo - Vol. 1', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (233, 7, 81, N'Unplugged', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (234, 7, 83, N'Deixa Entrar', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (235, 7, 86, N'Roda De Funk', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (236, 7, 96, N'Jota Quest-1995', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (237, 7, 99, N'Mais Do Mesmo', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (238, 8, 100, N'Greatest Hits', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (239, 8, 151, N'UB40 The Best Of - Volume Two [UK]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (240, 8, 19, N'Acústico MTV [Live]', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (241, 8, 19, N'Cidade Negra - Hits', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (242, 9, 21, N'Axé Bahia 2001', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (243, 9, 252, N'Frank', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (244, 5, 276, N'Le Freak', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (245, 5, 278, N'MacArthur Park Suite', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (246, 5, 277, N'Ring My Bell', 8.9900, N'/Content/Images/placeholder.gif')
INSERT [dbo].[Album] ([Id], [GenreId], [ArtistId], [Title], [Price], [AlbumArtUrl]) VALUES (247, 9, 278, N'Jon Galloway and Donna Summer Sing!', 50.0000, N'/Content/Images/placeholder.gif')
SET IDENTITY_INSERT [dbo].[Album] OFF
SET IDENTITY_INSERT [dbo].[Artist] ON 

INSERT [dbo].[Artist] ([Id], [Name]) VALUES (1, N'AC/DC')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (2, N'Accept')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (3, N'Aerosmith')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (4, N'Alanis Morissette')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (5, N'Alice In Chains')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (6, N'Antônio Carlos Jobim')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (7, N'Apocalyptica')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (8, N'Audioslave')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (10, N'Billy Cobham')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (11, N'Black Label Society')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (12, N'Black Sabbath')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (14, N'Bruce Dickinson')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (15, N'Buddy Guy')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (16, N'Caetano Veloso')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (17, N'Chico Buarque')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (18, N'Chico Science & Nação Zumbi')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (19, N'Cidade Negra')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (20, N'Cláudio Zoli')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (21, N'Various Artists')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (22, N'Led Zeppelin')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (23, N'Frank Zappa & Captain Beefheart')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (24, N'Marcos Valle')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (27, N'Gilberto Gil')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (37, N'Ed Motta')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (41, N'Elis Regina')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (42, N'Milton Nascimento')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (46, N'Jorge Ben')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (50, N'Metallica')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (51, N'Queen')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (52, N'Kiss')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (53, N'Spyro Gyra')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (55, N'David Coverdale')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (56, N'Gonzaguinha')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (58, N'Deep Purple')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (59, N'Santana')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (68, N'Miles Davis')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (72, N'Vinícius De Moraes')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (76, N'Creedence Clearwater Revival')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (77, N'Cássia Eller')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (79, N'Dennis Chambers')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (80, N'Djavan')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (81, N'Eric Clapton')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (82, N'Faith No More')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (83, N'Falamansa')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (84, N'Foo Fighters')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (86, N'Funk Como Le Gusta')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (87, N'Godsmack')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (88, N'Guns N'' Roses')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (89, N'Incognito')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (90, N'Iron Maiden')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (92, N'Jamiroquai')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (94, N'Jimi Hendrix')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (95, N'Joe Satriani')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (96, N'Jota Quest')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (98, N'Judas Priest')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (99, N'Legião Urbana')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (100, N'Lenny Kravitz')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (101, N'Lulu Santos')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (102, N'Marillion')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (103, N'Marisa Monte')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (105, N'Men At Work')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (106, N'Motörhead')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (109, N'Mötley Crüe')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (110, N'Nirvana')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (111, N'O Terço')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (112, N'Olodum')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (113, N'Os Paralamas Do Sucesso')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (114, N'Ozzy Osbourne')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (115, N'Page & Plant')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (117, N'Paul D''Ianno')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (118, N'Pearl Jam')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (120, N'Pink Floyd')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (124, N'R.E.M.')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (126, N'Raul Seixas')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (127, N'Red Hot Chili Peppers')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (128, N'Rush')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (130, N'Skank')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (132, N'Soundgarden')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (133, N'Stevie Ray Vaughan & Double Trouble')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (134, N'Stone Temple Pilots')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (135, N'System Of A Down')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (136, N'Terry Bozzio, Tony Levin & Steve Stevens')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (137, N'The Black Crowes')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (139, N'The Cult')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (140, N'The Doors')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (141, N'The Police')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (142, N'The Rolling Stones')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (144, N'The Who')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (145, N'Tim Maia')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (150, N'U2')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (151, N'UB40')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (152, N'Van Halen')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (153, N'Velvet Revolver')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (155, N'Zeca Pagodinho')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (157, N'Dread Zeppelin')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (179, N'Scorpions')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (196, N'Cake')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (197, N'Aisha Duo')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (200, N'The Posies')
GO
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (201, N'Luciana Souza/Romero Lubambo')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (202, N'Aaron Goldberg')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (203, N'Nicolaus Esterhazy Sinfonia')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (204, N'Temple of the Dog')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (205, N'Chris Cornell')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (206, N'Alberto Turco & Nova Schola Gregoriana')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (208, N'English Concert & Trevor Pinnock')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (211, N'Wilhelm Kempff')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (212, N'Yo-Yo Ma')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (213, N'Scholars Baroque Ensemble')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (217, N'Royal Philharmonic Orchestra & Sir Thomas Beecham')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (219, N'Britten Sinfonia, Ivor Bolton & Lesley Garrett')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (221, N'Sir Georg Solti & Wiener Philharmoniker')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (223, N'London Symphony Orchestra & Sir Charles Mackerras')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (224, N'Barry Wordsworth & BBC Concert Orchestra')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (226, N'Eugene Ormandy')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (229, N'Boston Symphony Orchestra & Seiji Ozawa')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (230, N'Aaron Copland & London Symphony Orchestra')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (231, N'Ton Koopman')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (232, N'Sergei Prokofiev & Yuri Temirkanov')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (233, N'Chicago Symphony Orchestra & Fritz Reiner')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (234, N'Orchestra of The Age of Enlightenment')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (236, N'James Levine')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (237, N'Berliner Philharmoniker & Hans Rosbaud')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (238, N'Maurizio Pollini')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (240, N'Gustav Mahler')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (242, N'Edo de Waart & San Francisco Symphony')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (244, N'Choir Of Westminster Abbey & Simon Preston')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (245, N'Michael Tilson Thomas & San Francisco Symphony')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (247, N'The King''s Singers')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (248, N'Berliner Philharmoniker & Herbert Von Karajan')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (250, N'Christopher O''Riley')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (251, N'Fretwork')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (252, N'Amy Winehouse')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (253, N'Calexico')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (255, N'Yehudi Menuhin')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (258, N'Les Arts Florissants & William Christie')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (259, N'The 12 Cellists of The Berlin Philharmonic')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (260, N'Adrian Leaper & Doreen de Feis')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (261, N'Roger Norrington, London Classical Players')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (264, N'Kent Nagano and Orchestre de l''Opéra de Lyon')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (265, N'Julian Bream')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (266, N'Martin Roscoe')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (267, N'Göteborgs Symfoniker & Neeme Järvi')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (270, N'Gerald Moore')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (271, N'Mela Tenenbaum, Pro Musica Prague & Richard Kapp')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (274, N'Nash Ensemble')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (276, N'Chic')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (277, N'Anita Ward')
INSERT [dbo].[Artist] ([Id], [Name]) VALUES (278, N'Donna Summer')
SET IDENTITY_INSERT [dbo].[Artist] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'5a691fb0-3091-4027-9dfc-ffcd06d05e64', N'Administrator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'47503803-122a-45d6-9a34-a621617498dd', N'Customer')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'104676590119237033071', N'123ac7bb-c2b8-4721-8c5f-1f2de2a86879')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'123ac7bb-c2b8-4721-8c5f-1f2de2a86879', N'5a691fb0-3091-4027-9dfc-ffcd06d05e64')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'123ac7bb-c2b8-4721-8c5f-1f2de2a86879', N'tmkzmu@gmail.com', 0, NULL, N'9b838af8-b36e-4e94-a8fd-192bd759dccf', NULL, 0, 0, NULL, 1, 0, N'tmkzmu@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b0b805b0-2057-4423-88f3-aba349ec2796', N'akrola89@gmail.com', 0, N'AN7FV4CUqialfYIytOpGVvh6mqsnVYzdorjQBmlxo9TET2zHaqbcBEEEyaL2HUavGQ==', N'cfb37f14-571d-4c8d-8004-f3353df1ed81', NULL, 0, 0, NULL, 1, 0, N'akrola89@gmail.com')
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([Id], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (1, N'1fd68459-5c2a-4fa0-8349-1c19ee27784f', 4, 1, CAST(0x0000A492001BA322 AS DateTime))
INSERT [dbo].[Cart] ([Id], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (3, N'a65f0c66-a8a2-46ac-a75c-96ce1ea7f4f6', 146, 1, CAST(0x0000A4920077C857 AS DateTime))
INSERT [dbo].[Cart] ([Id], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (7, N'56aa47d2-dbc5-4dea-b24f-fedbf1f139c2', 194, 1, CAST(0x0000A492008DF45B AS DateTime))
INSERT [dbo].[Cart] ([Id], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (8, N'56aa47d2-dbc5-4dea-b24f-fedbf1f139c2', 60, 1, CAST(0x0000A492008DFBA4 AS DateTime))
INSERT [dbo].[Cart] ([Id], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (1016, N'be651aa2-71ee-444d-bc00-1bd0f56deb94', 32, 1, CAST(0x0000A494010458C3 AS DateTime))
INSERT [dbo].[Cart] ([Id], [CartId], [AlbumId], [Count], [DateCreated]) VALUES (1017, N'be651aa2-71ee-444d-bc00-1bd0f56deb94', 135, 1, CAST(0x0000A49401046032 AS DateTime))
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([Id], [Name], [Description]) VALUES (1, N'Rock', N'Rock and Roll is a form of rock music developed in the 1950s and 1960s. Rock music combines many kinds of music from the United States, such as country music, folk music, church music, work songs, blues and jazz.')
INSERT [dbo].[Genre] ([Id], [Name], [Description]) VALUES (2, N'Jazz', N'Jazz is a type of music which was invented in the United States. Jazz music combines African-American music with European music. Some common jazz instruments include the saxophone, trumpet, piano, double bass, and drums.')
INSERT [dbo].[Genre] ([Id], [Name], [Description]) VALUES (3, N'Metal', N'Heavy Metal is a loud, aggressive style of Rock music. The bands who play heavy-metal music usually have one or two guitars, a bass guitar and drums. In some bands, electronic keyboards, organs, or other instruments are used. Heavy metal songs are loud and powerful-sounding, and have strong rhythms that are repeated. There are many different types of Heavy Metal, some of which are described below. Heavy metal bands sometimes dress in jeans, leather jackets, and leather boots, and have long hair. Heavy metal bands sometimes behave in a dramatic way when they play their instruments or sing. However, many heavy metal bands do not like to do this.')
INSERT [dbo].[Genre] ([Id], [Name], [Description]) VALUES (4, N'Alternative', N'Alternative rock is a type of rock music that became popular in the 1980s and became widely popular in the 1990s. Alternative rock is made up of various subgenres that have come out of the indie music scene since the 1980s, such as grunge, indie rock, Britpop, gothic rock, and indie pop. These genres are sorted by their collective types of punk, which laid the groundwork for alternative music in the 1970s.')
INSERT [dbo].[Genre] ([Id], [Name], [Description]) VALUES (5, N'Disco', N'Disco is a style of pop music that was popular in the mid-1970s. Disco music has a strong beat that people can dance to. People usually dance to disco music at bars called disco clubs. The word "disco" is also used to refer to the style of dancing that people do to disco music, or to the style of clothes that people wear to go disco dancing. Disco was at its most popular in the United States and Europe in the 1970s and early 1980s. Disco was brought into the mainstream by the hit movie Saturday Night Fever, which was released in 1977. This movie, which starred John Travolta, showed people doing disco dancing. Many radio stations played disco in the late 1970s.')
INSERT [dbo].[Genre] ([Id], [Name], [Description]) VALUES (6, N'Blues', N'The blues is a form of music that started in the United States during the start of the 20th century. It was started by former African slaves from spirituals, praise songs, and chants. The first blues songs were called Delta blues. These songs came from the area near the mouth of the Mississippi River.')
INSERT [dbo].[Genre] ([Id], [Name], [Description]) VALUES (7, N'Latin', N'Latin American music is the music of all countries in Latin America (and the Caribbean) and comes in many varieties. Latin America is home to musical styles such as the simple, rural conjunto music of northern Mexico, the sophisticated habanera of Cuba, the rhythmic sounds of the Puerto Rican plena, the symphonies of Heitor Villa-Lobos, and the simple and moving Andean flute. Music has played an important part recently in Latin America''s politics, the nueva canción movement being a prime example. Latin music is very diverse, with the only truly unifying thread being the use of Latin-derived languages, predominantly the Spanish language, the Portuguese language in Brazil, and to a lesser extent, Latin-derived creole languages, such as those found in Haiti.')
INSERT [dbo].[Genre] ([Id], [Name], [Description]) VALUES (8, N'Reggae', N'Reggae is a music genre first developed in Jamaica in the late 1960s. While sometimes used in a broader sense to refer to most types of Jamaican music, the term reggae more properly denotes a particular music style that originated following on the development of ska and rocksteady.')
INSERT [dbo].[Genre] ([Id], [Name], [Description]) VALUES (9, N'Pop', N'Pop music is a music genre that developed from the mid-1950s as a softer alternative to rock ''n'' roll and later to rock music. It has a focus on commercial recording, often oriented towards a youth market, usually through the medium of relatively short and simple love songs. While these basic elements of the genre have remained fairly constant, pop music has absorbed influences from most other forms of popular music, particularly borrowing from the development of rock music, and utilizing key technological innovations to produce new variations on existing themes.')
INSERT [dbo].[Genre] ([Id], [Name], [Description]) VALUES (10, N'Classical', N'Classical music is a very general term which normally refers to the standard music of countries in the Western world. It is music that has been composed by musicians who are trained in the art of writing music (composing) and written down in music notation so that other musicians can play it. Classical music can also be described as "art music" because great art (skill) is needed to compose it and to perform it well. Classical music differs from pop music because it is not made just in order to be popular for a short time or just to be a commercial success.')
SET IDENTITY_INSERT [dbo].[Genre] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Username], [FirstName], [LastName], [Address], [City], [State], [PostalCode], [Country], [Phone], [Total], [OrderDate]) VALUES (1, N'tmkzmu@gmail.com', N'Tomek', N'Zmudzinski', N'Obrzezna 1/24', N'Warszawa', N'none', N'81-232', N'Poland', N'690485185', CAST(17.9800 AS Decimal(19, 4)), CAST(0x0000A49400FEB2EE AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (1, 1, 5, 1, CAST(8.9900 AS Decimal(19, 4)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [AlbumId], [Quantity], [UnitPrice]) VALUES (2, 1, 31, 1, CAST(8.9900 AS Decimal(19, 4)))
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2015-05-10 18:20:29 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND name = N'RoleNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2015-05-10 18:20:29 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2015-05-10 18:20:29 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 2015-05-10 18:20:29 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2015-05-10 18:20:29 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 2015-05-10 18:20:29 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND name = N'UserNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Album_Artist]') AND parent_object_id = OBJECT_ID(N'[dbo].[Album]'))
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_Artist] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artist] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Album_Artist]') AND parent_object_id = OBJECT_ID(N'[dbo].[Album]'))
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_Artist]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Album_Genre]') AND parent_object_id = OBJECT_ID(N'[dbo].[Album]'))
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Album_Genre]') AND parent_object_id = OBJECT_ID(N'[dbo].[Album]'))
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_Genre]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cart_Album]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cart]'))
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Album] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cart_Album]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cart]'))
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Album]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Album]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Album] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Album]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Album]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
USE [master]
GO
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
