USE [master]
GO
/****** Object:  Database [CryptoBD]    Script Date: 2017-11-20 14:05:36 ******/
CREATE DATABASE [CryptoBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CryptoBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CryptoBD.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CryptoBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CryptoBD_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CryptoBD] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CryptoBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CryptoBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CryptoBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CryptoBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CryptoBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CryptoBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [CryptoBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CryptoBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CryptoBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CryptoBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CryptoBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CryptoBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CryptoBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CryptoBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CryptoBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CryptoBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CryptoBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CryptoBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CryptoBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CryptoBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CryptoBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CryptoBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CryptoBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CryptoBD] SET RECOVERY FULL 
GO
ALTER DATABASE [CryptoBD] SET  MULTI_USER 
GO
ALTER DATABASE [CryptoBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CryptoBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CryptoBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CryptoBD] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CryptoBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CryptoBD', N'ON'
GO
USE [CryptoBD]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2017-11-20 14:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2017-11-20 14:05:36 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2017-11-20 14:05:36 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2017-11-20 14:05:36 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2017-11-20 14:05:36 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2017-11-20 14:05:36 ******/
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
	[UserPath_Img] [nvarchar](150) NULL CONSTRAINT [DF_AspNetUsers_UserPath_Img]  DEFAULT (N'\img\blog\user.jpg'),
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categorie]    Script Date: 2017-11-20 14:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorie](
	[Categorie_ID] [int] IDENTITY(1,1) NOT NULL,
	[CategorieName] [nvarchar](50) NULL,
	[CategorieDescription] [nvarchar](250) NULL,
	[Categorie_Path_Img] [nchar](150) NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[Categorie_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 2017-11-20 14:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[Comment_Text] [text] NOT NULL,
	[Comment_Date_Heure] [datetime] NOT NULL,
	[FK_Post_ID] [int] NOT NULL,
	[FK_User_ID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 2017-11-20 14:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[Post_ID] [int] IDENTITY(1,1) NOT NULL,
	[Post_Name] [varchar](50) NOT NULL,
	[Post_Message] [text] NOT NULL,
	[Post_Date_Heure] [datetime] NOT NULL,
	[FK_Categories_ID] [int] NOT NULL,
	[FK_User_ID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Post_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [UserPath_Img]) VALUES (N'07540c69-257d-4c01-bb30-d9c197a2aaa5', N'jtunCave@gay.com', 0, N'AHBDsKD/8zewmySPagZWa8C5ccxhMB1c43NVIZIbrCs6EcXt2jh4jJRoZ0MvcgUeQQ==', N'3b98b94e-446e-4107-8ca9-91c9df29e71b', NULL, 0, 0, NULL, 1, 0, N'Nooby', N'\img\blog\user.jpg')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [UserPath_Img]) VALUES (N'450e343b-29ee-405e-a0af-a95cb5f749db', N'seg@dw.acs', 0, N'AL9ynaY3Fa4GdKeHbW5f4/T+aKiIvmxlRYHie+eiUFdSdTi+JY7WZYp+N2n5+CK5GA==', N'3f7416d8-0f13-445b-82d4-878402eac945', NULL, 0, 0, NULL, 1, 0, N'Big', N'\img\blog\user.jpg')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [UserPath_Img]) VALUES (N'9b021fd4-a5f3-4577-97c3-617268f571a9', N'tylObey@lol.com', 0, N'AOLDIQcgY5m+p3WjRPoRYxOqKRllVvGrHu+H9pwqwcNRMh9KS0qdC7KDM3no/w9xAQ==', N'a0edec52-5a99-472d-82a4-f11b148d1b46', NULL, 0, 0, NULL, 1, 0, N'KiKoo3000', NULL)
SET IDENTITY_INSERT [dbo].[Categorie] ON 

INSERT [dbo].[Categorie] ([Categorie_ID], [CategorieName], [CategorieDescription], [Categorie_Path_Img]) VALUES (1, N'Bitcoins', N'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non skateboard dolor brunch.', N'\img\blog\Bitcoins.png                                                                                                                                ')
INSERT [dbo].[Categorie] ([Categorie_ID], [CategorieName], [CategorieDescription], [Categorie_Path_Img]) VALUES (2, N'Dogecoins', N'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non skateboard dolor brunch.', N'\img\blog\Dogecoins.png                                                                                                                               ')
INSERT [dbo].[Categorie] ([Categorie_ID], [CategorieName], [CategorieDescription], [Categorie_Path_Img]) VALUES (3, N'Litecoins', N'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non skateboard dolor brunch.', N'\img\blog\litecoins.png                                                                                                                               ')
INSERT [dbo].[Categorie] ([Categorie_ID], [CategorieName], [CategorieDescription], [Categorie_Path_Img]) VALUES (4, N'Verge', N'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non skateboard dolor brunch.', N'\img\blog\Verge.png                                                                                                                                   ')
INSERT [dbo].[Categorie] ([Categorie_ID], [CategorieName], [CategorieDescription], [Categorie_Path_Img]) VALUES (5, N'Dogecoins', N'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non skateboard dolor brunch.', N'                                                                                                                               \img\blog\Dogecoins.png')
SET IDENTITY_INSERT [dbo].[Categorie] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [Comment_Text], [Comment_Date_Heure], [FK_Post_ID], [FK_User_ID]) VALUES (1, N'Non perso je trouve que c''est vrm a chier looool', CAST(N'2017-10-30 00:00:00.000' AS DateTime), 3, N'9b021fd4-a5f3-4577-97c3-617268f571a9')
INSERT [dbo].[Comment] ([CommentID], [Comment_Text], [Comment_Date_Heure], [FK_Post_ID], [FK_User_ID]) VALUES (4, N'tyllll', CAST(N'2017-10-30 00:00:00.000' AS DateTime), 3, N'07540c69-257d-4c01-bb30-d9c197a2aaa5')
INSERT [dbo].[Comment] ([CommentID], [Comment_Text], [Comment_Date_Heure], [FK_Post_ID], [FK_User_ID]) VALUES (6, N'<p>hahahaha</p>', CAST(N'2017-11-15 11:09:00.607' AS DateTime), 3, N'9b021fd4-a5f3-4577-97c3-617268f571a9')
INSERT [dbo].[Comment] ([CommentID], [Comment_Text], [Comment_Date_Heure], [FK_Post_ID], [FK_User_ID]) VALUES (20, N'<p>wqe</p>', CAST(N'2017-11-15 13:15:38.927' AS DateTime), 7, N'07540c69-257d-4c01-bb30-d9c197a2aaa5')
INSERT [dbo].[Comment] ([CommentID], [Comment_Text], [Comment_Date_Heure], [FK_Post_ID], [FK_User_ID]) VALUES (21, N'<p>GRos esti de cave !!!</p>', CAST(N'2017-11-20 11:16:01.010' AS DateTime), 3, N'9b021fd4-a5f3-4577-97c3-617268f571a9')
INSERT [dbo].[Comment] ([CommentID], [Comment_Text], [Comment_Date_Heure], [FK_Post_ID], [FK_User_ID]) VALUES (22, N'<p>ghd</p>', CAST(N'2017-11-20 12:57:09.197' AS DateTime), 3, N'9b021fd4-a5f3-4577-97c3-617268f571a9')
INSERT [dbo].[Comment] ([CommentID], [Comment_Text], [Comment_Date_Heure], [FK_Post_ID], [FK_User_ID]) VALUES (23, N'<p>wdadawdawd</p>', CAST(N'2017-11-20 12:57:45.987' AS DateTime), 12, N'9b021fd4-a5f3-4577-97c3-617268f571a9')
INSERT [dbo].[Comment] ([CommentID], [Comment_Text], [Comment_Date_Heure], [FK_Post_ID], [FK_User_ID]) VALUES (24, N'<p>awdawd</p>', CAST(N'2017-11-20 13:00:27.320' AS DateTime), 3, N'9b021fd4-a5f3-4577-97c3-617268f571a9')
INSERT [dbo].[Comment] ([CommentID], [Comment_Text], [Comment_Date_Heure], [FK_Post_ID], [FK_User_ID]) VALUES (25, N'<p>rg</p>', CAST(N'2017-11-20 13:03:49.977' AS DateTime), 3, N'9b021fd4-a5f3-4577-97c3-617268f571a9')
INSERT [dbo].[Comment] ([CommentID], [Comment_Text], [Comment_Date_Heure], [FK_Post_ID], [FK_User_ID]) VALUES (29, N'<p>sasf</p>', CAST(N'2017-11-20 13:40:42.190' AS DateTime), 3, N'450e343b-29ee-405e-a0af-a95cb5f749db')
INSERT [dbo].[Comment] ([CommentID], [Comment_Text], [Comment_Date_Heure], [FK_Post_ID], [FK_User_ID]) VALUES (30, N'<p>awdawdawd</p>', CAST(N'2017-11-20 13:41:26.967' AS DateTime), 7, N'07540c69-257d-4c01-bb30-d9c197a2aaa5')
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Post_ID], [Post_Name], [Post_Message], [Post_Date_Heure], [FK_Categories_ID], [FK_User_ID]) VALUES (3, N'Les Bitcoins c''est bon ???', N'Bonjour je suis venu ici car je voulais en savoir plus sur les bitcoins pouves-vous me renseignez ? Merci', CAST(N'2017-10-30 00:00:00.000' AS DateTime), 1, N'9b021fd4-a5f3-4577-97c3-617268f571a9')
INSERT [dbo].[Post] ([Post_ID], [Post_Name], [Post_Message], [Post_Date_Heure], [FK_Categories_ID], [FK_User_ID]) VALUES (7, N'Comment sa marche ?????', N'salut je voudrait savoir comment tout ce systeme fonctionne merci', CAST(N'2017-10-30 00:00:00.000' AS DateTime), 2, N'9b021fd4-a5f3-4577-97c3-617268f571a9')
INSERT [dbo].[Post] ([Post_ID], [Post_Name], [Post_Message], [Post_Date_Heure], [FK_Categories_ID], [FK_User_ID]) VALUES (11, N'sa c frais', N'<p>esfesfefwsfwf</p>', CAST(N'2017-11-08 19:57:34.450' AS DateTime), 2, N'9b021fd4-a5f3-4577-97c3-617268f571a9')
INSERT [dbo].[Post] ([Post_ID], [Post_Name], [Post_Message], [Post_Date_Heure], [FK_Categories_ID], [FK_User_ID]) VALUES (12, N'TBNKK le protocol est pas mis !/{}{!?}?', N'<p>AWDFGRv|EfezasfeswGFefswegdrgbvdrxbgvhyudetnhtfrchjufrgcnhjhyydhy<strong>rrrrbfher\rrh</strong></p>', CAST(N'2017-11-08 20:01:00.497' AS DateTime), 4, N'9b021fd4-a5f3-4577-97c3-617268f571a9')
INSERT [dbo].[Post] ([Post_ID], [Post_Name], [Post_Message], [Post_Date_Heure], [FK_Categories_ID], [FK_User_ID]) VALUES (13, N'ergtergegergerg', N'<p>egeggegergergerg</p>', CAST(N'2017-11-09 08:30:07.103' AS DateTime), 2, N'9b021fd4-a5f3-4577-97c3-617268f571a9')
SET IDENTITY_INSERT [dbo].[Post] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2017-11-20 14:05:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2017-11-20 14:05:36 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2017-11-20 14:05:36 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 2017-11-20 14:05:36 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 2017-11-20 14:05:36 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 2017-11-20 14:05:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_AspNetUsers] FOREIGN KEY([FK_User_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_AspNetUsers]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_CommentPostID_PostID] FOREIGN KEY([FK_Post_ID])
REFERENCES [dbo].[Post] ([Post_ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_CommentPostID_PostID]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_AspNetUsers] FOREIGN KEY([FK_User_ID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_AspNetUsers]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Categorie] FOREIGN KEY([FK_Categories_ID])
REFERENCES [dbo].[Categorie] ([Categorie_ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Categorie]
GO
USE [master]
GO
ALTER DATABASE [CryptoBD] SET  READ_WRITE 
GO
