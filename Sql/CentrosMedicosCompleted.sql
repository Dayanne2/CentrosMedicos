USE [master]
GO
/****** Object:  Database [CentrosMedicosDB]    Script Date: 1/4/2022 01:01:44 ******/
CREATE DATABASE [CentrosMedicosDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CentrosMedicosDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CentrosMedicosDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CentrosMedicosDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CentrosMedicosDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CentrosMedicosDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CentrosMedicosDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CentrosMedicosDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CentrosMedicosDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CentrosMedicosDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CentrosMedicosDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CentrosMedicosDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CentrosMedicosDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CentrosMedicosDB] SET  MULTI_USER 
GO
ALTER DATABASE [CentrosMedicosDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CentrosMedicosDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CentrosMedicosDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CentrosMedicosDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CentrosMedicosDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CentrosMedicosDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CentrosMedicosDB] SET QUERY_STORE = OFF
GO
USE [CentrosMedicosDB]
GO
/****** Object:  Table [dbo].[tbPlantilla]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPlantilla](
	[hospi_Id] [int] NULL,
	[sala_Id] [int] NULL,
	[planti_EmpleadoId] [int] IDENTITY(1,1) NOT NULL,
	[planti_Apellido] [nvarchar](20) NOT NULL,
	[planti_Funcion] [nvarchar](10) NOT NULL,
	[planti_Turno] [char](1) NOT NULL,
	[planti_Salario] [int] NOT NULL,
 CONSTRAINT [PK_tbPlantilla_planti_EmpleadoId] PRIMARY KEY CLUSTERED 
(
	[planti_EmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UDV_Select_tbPlantilla]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UDV_Select_tbPlantilla]

AS
SELECT *
	FROM [dbo].[tbPlantilla];
GO
/****** Object:  Table [dbo].[tbAccesos]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAccesos](
	[acce_Id] [int] IDENTITY(1,1) NOT NULL,
	[rol_Id] [int] NOT NULL,
	[pant_Id] [int] NOT NULL,
 CONSTRAINT [PK_tbAccesos] PRIMARY KEY CLUSTERED 
(
	[acce_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbEnfermo]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbEnfermo](
	[enfer_Inscripcioon] [int] IDENTITY(1,1) NOT NULL,
	[enfer_Apellido] [nvarchar](15) NULL,
	[enfer_Direccion] [nvarchar](20) NULL,
	[enfer_FechaNac] [date] NULL,
	[enfer_NSS] [int] NULL,
	[planti_EmpleadoId] [int] NULL,
 CONSTRAINT [PK_tbEnfermo_planti_enfer_Inscripcioon] PRIMARY KEY CLUSTERED 
(
	[enfer_Inscripcioon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbHospiltales]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbHospiltales](
	[hospi_Id] [int] IDENTITY(1,1) NOT NULL,
	[hospi_Nombre] [nvarchar](20) NOT NULL,
	[hospi_Telefono] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tbHospiltales_hospi_Id] PRIMARY KEY CLUSTERED 
(
	[hospi_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPantallas]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPantallas](
	[pant_Id] [int] IDENTITY(1,1) NOT NULL,
	[pant_Nombre] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_tbPantallas] PRIMARY KEY CLUSTERED 
(
	[pant_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbRoles]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbRoles](
	[rol_Id] [int] IDENTITY(1,1) NOT NULL,
	[rol_Nombre] [nvarchar](150) NOT NULL,
	[rol_Descripcion] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_gral_tbRoles_rol_ID] PRIMARY KEY CLUSTERED 
(
	[rol_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSala]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSala](
	[hospi_Id] [int] NULL,
	[sala_Id] [int] IDENTITY(1,1) NOT NULL,
	[sala_Nombre] [nvarchar](20) NOT NULL,
	[sala_NumCamas] [int] NULL,
 CONSTRAINT [PK_tbSala_sala_Id] PRIMARY KEY CLUSTERED 
(
	[sala_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUsuarios]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUsuarios](
	[usu_ID] [int] IDENTITY(1,1) NOT NULL,
	[rol_ID] [int] NOT NULL,
	[usu_Nombre] [nvarchar](150) NOT NULL,
	[usu_Apellido] [nvarchar](150) NOT NULL,
	[usu_Email] [nvarchar](100) NOT NULL,
	[usu_Password] [nvarchar](100) NOT NULL,
	[usu_PasswordSalt] [nvarchar](100) NOT NULL,
	[usu_NumeroTelefono] [nvarchar](30) NOT NULL,
	[usu_NumeroCelular] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_dbo_tbUsuarios_usu_ID] PRIMARY KEY CLUSTERED 
(
	[usu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbAccesos] ON 

INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (1, 1, 1)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (2, 1, 2)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (3, 1, 3)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (4, 1, 4)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (5, 2, 1)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (6, 2, 8)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (7, 1, 5)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (8, 1, 6)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (9, 1, 7)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (10, 1, 8)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (11, 1, 9)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (12, 1, 10)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (13, 2, 9)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (14, 2, 10)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (15, 3, 1)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (16, 3, 2)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (17, 3, 3)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (18, 3, 4)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (19, 3, 5)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (20, 3, 8)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (21, 3, 9)
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (22, 3, 10)
SET IDENTITY_INSERT [dbo].[tbAccesos] OFF
GO
SET IDENTITY_INSERT [dbo].[tbEnfermo] ON 

INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (1, N'Izaguirre', N'Barrio el Progreso', CAST(N'1986-05-30' AS Date), 527601750, 2)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (2, N'Aguirre', N'Colonia Bendeck', CAST(N'1989-07-05' AS Date), 336326921, 3)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (3, N'Zuniga', N'Villa Angeles', CAST(N'2016-12-11' AS Date), 583059707, 1)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (4, N'Aguilar', N'Barrio San Francisco', CAST(N'1927-04-04' AS Date), 202651447, 2)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (5, N'Vasquez', N'Colonia Canada', CAST(N'2012-09-17' AS Date), 193914389, 5)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (6, N'Abraham', N'Las Pastor', CAST(N'1972-05-21' AS Date), 953856666, 4)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (7, N'Pizarro', N'Los Orosco', CAST(N'1972-05-21' AS Date), 709604447, 11)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (8, N'Justo', N'Villa Trujillo', CAST(N'1982-08-10' AS Date), 254654289, 22)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (9, N'Pamela', N'A Antón', CAST(N'1932-11-02' AS Date), 941464051, 27)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (10, N'Rivero', N'Villa Vera', CAST(N'1938-07-11' AS Date), 861713790, 14)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (11, N'Saioa', N'L'' Benavídez Medio', CAST(N'1928-05-24' AS Date), 112640843, 43)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (12, N'Coca', N'El Saucedo Baja', CAST(N'1943-01-12' AS Date), 573060659, 40)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (13, N'Amaya', N'Rincón del Puerto', CAST(N'2007-03-03' AS Date), 193253525, 39)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (14, N'Nahia', N'Sáenz del Bages', CAST(N'1943-05-26' AS Date), 925857462, 37)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (15, N'Tudela', N'Los Quiñónez', CAST(N'1990-07-29' AS Date), 368960948, 34)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (16, N'Webb', N'As Benítez', CAST(N'2003-09-27' AS Date), 995403696, 1)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (17, N'Howell', N'Os Cardona', CAST(N'1981-10-05' AS Date), 789855625, 2)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (18, N'Guerrero', N'Las Maya', CAST(N'1977-01-05' AS Date), 761963233, 10)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (19, N'Byrd', N'Carrero de Lemos', CAST(N'2006-07-06' AS Date), 451805412, 11)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (20, N'Perry', N'Valle del Mirador', CAST(N'1934-04-08' AS Date), 606342942, 16)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (21, N'Kennedy', N'Medina del Vallès', CAST(N'1985-08-09' AS Date), 264312752, 19)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (22, N'Garrison', N'Oliva de San Pedro', CAST(N'1930-10-16' AS Date), 558160592, 21)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (23, N'Murray', N'Limón de las Torres', CAST(N'1972-12-02' AS Date), 382050047, 22)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (24, N'Blackwell', N'L'' Concepción', CAST(N'2001-01-18' AS Date), 684908295, 26)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (25, N'Adams', N'El Pereira', CAST(N'2000-02-21' AS Date), 306887342, 27)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (26, N'Lee', N'El Acosta del Bages', CAST(N'2002-03-21' AS Date), 370070854, 33)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (27, N'Gardner', N'As Velázquez', CAST(N'1957-12-18' AS Date), 933905714, 34)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (28, N'Scott', N'Leal de Arriba', CAST(N'1992-02-22' AS Date), 791844851, 12)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (29, N'Holt', N'Raya del Mirador', CAST(N'1988-10-14' AS Date), 445796104, 5)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (30, N'James', N'Las Zelaya', CAST(N'1958-03-02' AS Date), 817808529, 6)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (31, N'Johnson', N'As Aparicio Baja', CAST(N'1996-05-26' AS Date), 580865911, 7)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (32, N'Nichols', N'Abreu Alta', CAST(N'2000-10-30' AS Date), 794356805, 19)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (33, N'Morgan', N'San Castaño', CAST(N'1993-06-24' AS Date), 265414231, 21)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (34, N'Garner', N'Lomeli del Mirador', CAST(N'1990-01-12' AS Date), 295571109, 24)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (35, N'Hansen', N'Carballo del Barco', CAST(N'1987-12-08' AS Date), 890259989, 26)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (36, N'Saunders', N'O Chavarría', CAST(N'1965-09-28' AS Date), 622265391, 12)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (37, N'Thompson', N'López de Arriba', CAST(N'1958-07-10' AS Date), 456412262, 8)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (38, N'Larson', N'Roybal de Lemos', CAST(N'1987-04-20' AS Date), 840350106, 6)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (39, N'Carter', N'Las Becerra', CAST(N'1959-03-23' AS Date), 858245079, 5)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (40, N'Mata', N'Os Nieto', CAST(N'2000-08-31' AS Date), 919289103, 14)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (41, N'Garcia', N'Las Chapa', CAST(N'1994-03-26' AS Date), 609935428, 16)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (42, N'Faulkner', N'Los Gonzáles', CAST(N'1995-03-26' AS Date), 626594225, 42)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (43, N'Martinez', N'A Véliz', CAST(N'1997-05-13' AS Date), 628052343, 21)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (44, N'Chapman', N'Pineda de Ulla', CAST(N'2001-09-11' AS Date), 650773878, 41)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (45, N'Stephenson', N'Vélez de Ulla', CAST(N'1998-08-03' AS Date), 357565586, 40)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (46, N'Chen', N'Os Lorenzo', CAST(N'1966-05-19' AS Date), 874805216, 43)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (47, N'Martinez', N'Los Bermúdez', CAST(N'1999-10-14' AS Date), 267014152, 39)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (48, N'Larson', N'Vall Carballo', CAST(N'1962-08-01' AS Date), 770213469, 37)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (49, N'Mendoza', N'Roque del Puerto', CAST(N'1957-04-02' AS Date), 968438489, 36)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (50, N'Faulkner', N'Los Pastor Medio', CAST(N'1993-10-08' AS Date), 987279002, 33)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (51, N'Vega', N'Almanza Baja', CAST(N'1984-03-15' AS Date), 614771978, 34)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (52, N'Chen', N'La Oliver', CAST(N'1966-10-09' AS Date), 172798315, 39)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (53, N'Ward', N'Farías del Bages', CAST(N'1982-08-23' AS Date), 439319063, 22)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (54, N'Hansen', N'Aparicio Baja', CAST(N'1999-04-18' AS Date), 928601057, 11)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (55, N'Anderson', N'El Rolón', CAST(N'1969-03-10' AS Date), 791737661, 10)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (56, N'Morgan', N'O Ramírez Alta', CAST(N'1965-11-13' AS Date), 645339933, 8)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (57, N'Ryan', N'As Alva', CAST(N'2001-08-21' AS Date), 530168494, 19)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (58, N'Glass', N'Quiñones de Lemos', CAST(N'1969-02-22' AS Date), 464236530, 21)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (59, N'Bennett', N'Delatorre Baja', CAST(N'1999-11-17' AS Date), 551059216, 18)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (60, N'Woods', N'Vall Murillo', CAST(N'1983-08-15' AS Date), 603266676, 22)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (61, N'Smith', N'Zapata de la Sierra', CAST(N'2004-08-01' AS Date), 594140418, 14)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (62, N'Parker', N'El Estévez', CAST(N'2004-07-14' AS Date), 348144917, 3)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (63, N'Berger', N'El Estévez', CAST(N'2008-04-13' AS Date), 606366338, 4)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (64, N'Lopez', N'O Sedillo', CAST(N'2006-10-15' AS Date), 268719741, 7)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (65, N'Gonzales', N'As Cortés', CAST(N'2007-08-30' AS Date), 912789620, 8)
SET IDENTITY_INSERT [dbo].[tbEnfermo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbHospiltales] ON 

INSERT [dbo].[tbHospiltales] ([hospi_Id], [hospi_Nombre], [hospi_Telefono]) VALUES (1, N'San Marcos', N'2663-4491')
INSERT [dbo].[tbHospiltales] ([hospi_Id], [hospi_Nombre], [hospi_Telefono]) VALUES (2, N'San Felipe', N'2236-7917')
INSERT [dbo].[tbHospiltales] ([hospi_Id], [hospi_Nombre], [hospi_Telefono]) VALUES (3, N'Militar', N'8795-4744')
INSERT [dbo].[tbHospiltales] ([hospi_Id], [hospi_Nombre], [hospi_Telefono]) VALUES (4, N'Santa Rosita', N'2200-0000')
INSERT [dbo].[tbHospiltales] ([hospi_Id], [hospi_Nombre], [hospi_Telefono]) VALUES (5, N'Mario Catarino Rivas', N'9784-8294')
SET IDENTITY_INSERT [dbo].[tbHospiltales] OFF
GO
SET IDENTITY_INSERT [dbo].[tbPantallas] ON 

INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (1, N'Home')
INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (2, N'InsertPersonal')
INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (3, N'InsertHospital')
INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (4, N'InsertSalas')
INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (5, N'InsertEnfermo')
INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (6, N'InsertUsuarios')
INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (7, N'IndexUsuario')
INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (8, N'ReporteGeneral')
INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (9, N'ReporteEmpleadoHospital')
INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (10, N'ReporteEmpleadoSala')
SET IDENTITY_INSERT [dbo].[tbPantallas] OFF
GO
SET IDENTITY_INSERT [dbo].[tbPlantilla] ON 

INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 1, 1, N'Mauricio', N'Médico ', N'T', 12000)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 2, 2, N'Maria', N'Auxiliar', N'M', 9800)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 3, 3, N'Dayanne', N'Enfermera', N'N', 13000)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 4, 4, N'Angela', N'Enfermera', N'T', 11980)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (2, 5, 5, N'Noemy', N'Enfermera', N'N', 10340)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (5, 21, 6, N'Luis', N'Logopeda', N'M', 9130)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (3, 10, 7, N'Saenz', N'Auxiliar', N'N', 10000)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (5, 19, 8, N'Ronal', N'Médico', N'T', 18500)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (2, 6, 10, N'Minguez', N'Médico', N'M', 23400)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (2, 8, 11, N'Pedrerol', N'Auxiliar', N'T', 12350)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (3, 12, 12, N'Muriilo', N'Logopeda', N'T', 12560)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 4, 14, N'Handal', N'Enfermera', N'N', 12900)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 2, 16, N'Fernanda', N'Enfermera', N'N', 12320)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (5, 22, 18, N'Gomez', N'Médico', N'M', 14000)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (5, 20, 19, N'Dieguez', N'Auxiliar', N'N', 9700)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (3, 11, 21, N'Abelardo', N'Logopeda', N'M', 10470)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (2, 7, 22, N'Brito', N'Logopeda', N'N', 15000)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (3, 12, 23, N'Villa', N'Médico', N'T', 17000)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 3, 24, N'Narciso', N'Auxiliar', N'N', 11300)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (2, 8, 26, N'Pizarro', N'Enfermera', N'M', 9760)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 1, 27, N'Martnez', N'Enfermera', N'N', 14000)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (3, 9, 28, N'Balaguer', N'Médico', N'M', 22535)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (5, 20, 29, N'Serrano', N'Auxiliar', N'N', 13400)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (4, 13, 33, N'Perea', N'Logopeda', N'M', 9860)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (5, 22, 34, N'Haizea', N'Logopeda', N'T', 7890)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (4, 16, 36, N'Rio', N'Logopeda', N'M', 8990)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 4, 37, N'Castels', N'Auxiliar', N'N', 12350)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (3, 9, 39, N'Casimiro', N'Médico', N'T', 11200)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (2, 5, 40, N'Segui', N'Enfermera', N'M', 14090)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 2, 41, N'Peñalver', N'Médico', N'N', 21800)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (4, 15, 42, N'Gómez', N'Logopeda', N'M', 16780)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (4, 14, 43, N'Melchor', N'Enfermera', N'T', 13450)
SET IDENTITY_INSERT [dbo].[tbPlantilla] OFF
GO
SET IDENTITY_INSERT [dbo].[tbRoles] ON 

INSERT [dbo].[tbRoles] ([rol_Id], [rol_Nombre], [rol_Descripcion]) VALUES (1, N'Admin', N'Control Total')
INSERT [dbo].[tbRoles] ([rol_Id], [rol_Nombre], [rol_Descripcion]) VALUES (2, N'User', N'Acceso a Reportes')
INSERT [dbo].[tbRoles] ([rol_Id], [rol_Nombre], [rol_Descripcion]) VALUES (3, N'Staff', N'Accesos de Reportes e Insercion de Datos')
SET IDENTITY_INSERT [dbo].[tbRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[tbSala] ON 

INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (1, 1, N'Urgencias', 50)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (1, 2, N'Maternidad', 62)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (1, 3, N'Pediatría', 40)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (1, 4, N'Psiquiatría', 25)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (2, 5, N'Urgencias', 70)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (2, 6, N'Maternidad', 80)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (2, 7, N'Pediatría', 30)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (2, 8, N'Psiquiatría', 50)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (3, 9, N'Urgencias', 89)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (3, 10, N'Maternidad', 123)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (3, 11, N'Pediatría', 69)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (3, 12, N'Psiquiatría', 77)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (4, 13, N'Urgencias', 98)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (4, 14, N'Maternidad', 147)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (4, 15, N'Pediatría', 97)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (4, 16, N'Psiquiatría', 56)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (5, 19, N'Urgencias', 159)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (5, 20, N'Maternidad', 123)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (5, 21, N'Pediatría', 76)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (5, 22, N'Psiquiatría', 89)
SET IDENTITY_INSERT [dbo].[tbSala] OFF
GO
SET IDENTITY_INSERT [dbo].[tbUsuarios] ON 

INSERT [dbo].[tbUsuarios] ([usu_ID], [rol_ID], [usu_Nombre], [usu_Apellido], [usu_Email], [usu_Password], [usu_PasswordSalt], [usu_NumeroTelefono], [usu_NumeroCelular]) VALUES (1, 1, N'Luis', N'Izaguirre', N'luisizaguirre@gmail.com', N'6CBBC26008C8660002CB0BA8141586109FEF3AC95F02F818351EAFD646A529E2', N'eda628b3-de13-46eb-b9ef-49fc89abb1f1', N'26874680', N'98765820')
INSERT [dbo].[tbUsuarios] ([usu_ID], [rol_ID], [usu_Nombre], [usu_Apellido], [usu_Email], [usu_Password], [usu_PasswordSalt], [usu_NumeroTelefono], [usu_NumeroCelular]) VALUES (2, 1, N'Mauricio', N'Escalante', N'mauUwU@gmail.com', N'40D92CA933B040C0D73D1B9E6EED100376AAE8BEC59067283D1FE75DD4039939', N'61ffecce-4d2d-4b47-896d-c5a851e38872', N'26785712', N'98745630')
INSERT [dbo].[tbUsuarios] ([usu_ID], [rol_ID], [usu_Nombre], [usu_Apellido], [usu_Email], [usu_Password], [usu_PasswordSalt], [usu_NumeroTelefono], [usu_NumeroCelular]) VALUES (3, 3, N'Jireh', N'Madrid', N'jirehmadrid@gmail.com', N'648FB91CAFCA151FF386891CAD806C0059650FA352F868A8DC831B361BE02DC8', N'564c6493-654e-4988-b8e4-a35e44423c90', N'26748930', N'97503568')
INSERT [dbo].[tbUsuarios] ([usu_ID], [rol_ID], [usu_Nombre], [usu_Apellido], [usu_Email], [usu_Password], [usu_PasswordSalt], [usu_NumeroTelefono], [usu_NumeroCelular]) VALUES (4, 2, N'Gloria', N'Sanchez', N'gloriasanchez@gmail.com', N'E86873AF1AB0DAB50152698FDD4CAEA98726D4531D8F564AFA03D40409F919F1', N'bf7169b0-3258-4ed5-9aeb-0c7d383b0f88', N'26423680', N'87563240')
INSERT [dbo].[tbUsuarios] ([usu_ID], [rol_ID], [usu_Nombre], [usu_Apellido], [usu_Email], [usu_Password], [usu_PasswordSalt], [usu_NumeroTelefono], [usu_NumeroCelular]) VALUES (5, 2, N'Fernando', N'Rios', N'Fer_Duarte1405@gmail.com', N'4B2B37C48695E68EE76A7BCA279FFA24567332EE22B5DF7E3F811B7128BE9434', N'f3875ca9-6a43-467d-8693-f4443c24ae4a', N'26874560', N'87456307')
SET IDENTITY_INSERT [dbo].[tbUsuarios] OFF
GO
ALTER TABLE [dbo].[tbAccesos]  WITH CHECK ADD  CONSTRAINT [FK_tbAccesos_tbAccesos] FOREIGN KEY([rol_Id])
REFERENCES [dbo].[tbRoles] ([rol_Id])
GO
ALTER TABLE [dbo].[tbAccesos] CHECK CONSTRAINT [FK_tbAccesos_tbAccesos]
GO
ALTER TABLE [dbo].[tbAccesos]  WITH CHECK ADD  CONSTRAINT [FK_tbAccesos_tbPantallas] FOREIGN KEY([pant_Id])
REFERENCES [dbo].[tbPantallas] ([pant_Id])
GO
ALTER TABLE [dbo].[tbAccesos] CHECK CONSTRAINT [FK_tbAccesos_tbPantallas]
GO
ALTER TABLE [dbo].[tbEnfermo]  WITH CHECK ADD  CONSTRAINT [FK_tbEnfermo_planti_EmpleadoId] FOREIGN KEY([planti_EmpleadoId])
REFERENCES [dbo].[tbPlantilla] ([planti_EmpleadoId])
GO
ALTER TABLE [dbo].[tbEnfermo] CHECK CONSTRAINT [FK_tbEnfermo_planti_EmpleadoId]
GO
ALTER TABLE [dbo].[tbPlantilla]  WITH CHECK ADD  CONSTRAINT [FK_tbPlantilla_tbHospiltales_hospi_Id] FOREIGN KEY([hospi_Id])
REFERENCES [dbo].[tbHospiltales] ([hospi_Id])
GO
ALTER TABLE [dbo].[tbPlantilla] CHECK CONSTRAINT [FK_tbPlantilla_tbHospiltales_hospi_Id]
GO
ALTER TABLE [dbo].[tbPlantilla]  WITH CHECK ADD  CONSTRAINT [FK_tbPlantilla_tbSala_sala_Id] FOREIGN KEY([sala_Id])
REFERENCES [dbo].[tbSala] ([sala_Id])
GO
ALTER TABLE [dbo].[tbPlantilla] CHECK CONSTRAINT [FK_tbPlantilla_tbSala_sala_Id]
GO
ALTER TABLE [dbo].[tbSala]  WITH CHECK ADD  CONSTRAINT [FK_tbSala_tbHospiltales_hospi_Id] FOREIGN KEY([hospi_Id])
REFERENCES [dbo].[tbHospiltales] ([hospi_Id])
GO
ALTER TABLE [dbo].[tbSala] CHECK CONSTRAINT [FK_tbSala_tbHospiltales_hospi_Id]
GO
ALTER TABLE [dbo].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbRoles_role_Id] FOREIGN KEY([rol_ID])
REFERENCES [dbo].[tbRoles] ([rol_Id])
GO
ALTER TABLE [dbo].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbRoles_role_Id]
GO
ALTER TABLE [dbo].[tbPlantilla]  WITH CHECK ADD  CONSTRAINT [CC_tbPlantilla_planti_Salario] CHECK  (([planti_Salario]>(0)))
GO
ALTER TABLE [dbo].[tbPlantilla] CHECK CONSTRAINT [CC_tbPlantilla_planti_Salario]
GO
ALTER TABLE [dbo].[tbPlantilla]  WITH CHECK ADD  CONSTRAINT [CC_tbPlantilla_planti_Turno] CHECK  (([planti_Turno]='N' OR [planti_Turno]='M' OR [planti_Turno]='T'))
GO
ALTER TABLE [dbo].[tbPlantilla] CHECK CONSTRAINT [CC_tbPlantilla_planti_Turno]
GO
/****** Object:  StoredProcedure [dbo].[UDP_Empleados_Cada_Hospital]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_Empleados_Cada_Hospital]
    @id INT
AS
BEGIN
SELECT [hospi_Nombre]
      ,[planti_EmpleadoId]
      ,[planti_Apellido]
      ,[planti_Funcion]
      ,[planti_Turno]
      ,[planti_Salario]
  FROM [dbo].[tbPlantilla] T1, [dbo].[tbHospiltales] T2
  WHERE T1.hospi_Id = T2.hospi_Id
  AND T1.hospi_Id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[UDP_Empleados_Cada_Sala]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_Empleados_Cada_Sala]
    @id INT
AS
BEGIN
SELECT T2.[sala_Id]
      ,[planti_EmpleadoId]
      ,[planti_Apellido]
      ,[planti_Funcion]
      ,[planti_Turno]
      ,[planti_Salario]
  FROM [dbo].[tbPlantilla] T1, [dbo].[tbSala] T2
  WHERE T1.sala_Id = T2.sala_Id
  AND T1.sala_Id = @id;
END

--exec [UDP_Empleados_Cada_Hospital]1
GO
/****** Object:  StoredProcedure [dbo].[UDP_insertar_enfermo]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_insertar_enfermo]
			@enfer_Apellido nvarchar(15),
           @enfer_Direccion nvarchar(20),
           @enfer_FechaNac date,
           @enfer_NSS int,
           @planti_EmpleadoId int
		   as
BEGIN


INSERT INTO [dbo].[tbEnfermo]
           ([enfer_Apellido]
           ,[enfer_Direccion]
           ,[enfer_FechaNac]
           ,[enfer_NSS]
           ,[planti_EmpleadoId])
     VALUES
           (@enfer_Apellido ,
           @enfer_Direccion,
           @enfer_FechaNac ,
           @enfer_NSS ,
           @planti_EmpleadoId )
END
GO
/****** Object:  StoredProcedure [dbo].[UDP_insertar_hospitales]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_insertar_hospitales]
			@hospi_Nombre nvarchar(20),
           @hospi_Telefono nvarchar(10)
		   as
BEGIN

INSERT INTO [dbo].[tbHospiltales]
           ([hospi_Nombre]
           ,[hospi_Telefono])
     VALUES
           (@hospi_Nombre ,
           @hospi_Telefono)

END
GO
/****** Object:  StoredProcedure [dbo].[UDP_insertar_Plantilla]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_insertar_Plantilla]
			@hospi_Id int,
           @sala_Id int,
           @planti_Apellido nvarchar(20),
           @planti_Funcion nvarchar(10),
           @planti_Turno char(1),
           @planti_Salario int
		   as
BEGIN


INSERT INTO [dbo].[tbPlantilla]
           ([hospi_Id]
           ,[sala_Id]
           ,[planti_Apellido]
           ,[planti_Funcion]
           ,[planti_Turno]
           ,[planti_Salario])
     VALUES
           (@hospi_Id ,
           @sala_Id ,
           @planti_Apellido,
           @planti_Funcion,
           @planti_Turno ,
           @planti_Salario )
END
GO
/****** Object:  StoredProcedure [dbo].[UDP_insertar_Sala]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UDP_insertar_Sala]
@hospi_Id				int,
@sala_Nombre			NVARCHAR(20),
@sala_NumCamas			int
AS 
BEGIN
	 insert into [dbo].[tbSala] 	 values (@hospi_Id,@sala_Nombre,@sala_NumCamas)	
END 
GO
/****** Object:  StoredProcedure [dbo].[UDP_insertar_usuarios]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UDP_insertar_usuarios]
			@rol_ID int,
          @usu_Nombre nvarchar(150),
           @usu_Apellido nvarchar(150),
           @usu_Email nvarchar(100),
           @usu_Password nvarchar(100),
           @usu_PasswordSalt nvarchar(100),
           @usu_NumeroTelefono nvarchar(30),
           @usu_NumeroCelular nvarchar(30)
		   as
BEGIN


    -- Insert statements for procedure here
	INSERT INTO [dbo].[tbUsuarios]
           ([rol_ID]
           ,[usu_Nombre]
           ,[usu_Apellido]
           ,[usu_Email]
           ,[usu_Password]
           ,[usu_PasswordSalt]
           ,[usu_NumeroTelefono]
           ,[usu_NumeroCelular])
     VALUES
           (@rol_ID ,
		   @usu_Nombre ,
           @usu_Apellido ,
           @usu_Email ,
           @usu_Password ,
           @usu_PasswordSalt ,
           @usu_NumeroTelefono ,
           @usu_NumeroCelular )
END
GO
/****** Object:  StoredProcedure [dbo].[UDP_Permisos_Usuarios]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_Permisos_Usuarios]
    @usu_Email    nvarchar(100)
AS
BEGIN
    SELECT Panta.pant_Nombre
      FROM [CentrosMedicosDB].[dbo].[tbAccesos] AS Acce 
      INNER JOIN [CentrosMedicosDB].[dbo].[tbUsuarios] AS Usu   ON Acce.rol_Id = Usu.rol_ID 
      INNER JOIN [CentrosMedicosDB].[dbo].[tbPantallas] AS Panta ON Acce.pant_Id = Panta.pant_Id
     WHERE Usu.usu_Email = @usu_Email;
END

--EXEC [UDP_Permisos_Usuarios] 'Luis1';
GO
/****** Object:  StoredProcedure [dbo].[UDP_Registro_Paciente]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_Registro_Paciente]
@id	INT	
AS
BEGIN
    SELECT [hospi_Nombre]
      ,[hospi_Telefono]
      ,[planti_Apellido]
      ,[planti_Funcion]
      ,[sala_Nombre]
      ,[enfer_Apellido]
      ,[enfer_Direccion]
      ,[enfer_FechaNac]
      ,[enfer_NSS]
      ,[enfer_Inscripcioon]
	  ,T3.[sala_Id]
  FROM [dbo].[tbHospiltales] T1, [dbo].[tbPlantilla] T2, [dbo].[tbSala] T3, [dbo].[tbEnfermo] T4
  WHERE T2.hospi_Id = T1.hospi_Id
  AND T2.hospi_Id = T3.hospi_Id
  AND T3.sala_Id = T2.sala_Id
  AND T4.planti_EmpleadoId = T2.planti_EmpleadoId
  AND T4.enfer_Inscripcioon = @id;	
END
GO
/****** Object:  StoredProcedure [dbo].[UDP_ReportePrincipal_Select]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_ReportePrincipal_Select]
	@hospi_Id INT
AS
BEGIN
SELECT [hospi_Nombre]
      ,[hospi_Telefono]
	  ,[planti_Apellido]
	  ,[planti_Funcion]
	  ,[sala_Nombre]
  FROM [dbo].[tbHospiltales] T1, [dbo].[tbPlantilla] T2, [dbo].[tbSala] T3, [dbo].[tbEnfermo] T4
  WHERE T2.hospi_Id = T1.hospi_Id
  AND T2.hospi_Id = T3.hospi_Id
  AND T3.sala_Id = T2.sala_Id
  AND T4.planti_EmpleadoId = T2.planti_EmpleadoId
  AND T1.hospi_Id = @hospi_Id;
END
GO
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbEnfermo]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--******ACCESOS
--Create PROCEDURE [dbo].[UDP_Select_Accesos]

--AS
--BEGIN

--SELECT TOP (1000) [acce_Id]
--      ,[rol_Id]
--      ,[pant_Id]
--  FROM [CentrosMedicosDB].[dbo].[tbAccesos]

--END
--******HOSPITALES
--Create PROCEDURE [dbo].[UDP_Select_tbHospiltales]

--AS
--BEGIN

--SELECT TOP (1000) [hospi_Id]
--      ,[hospi_Nombre]
--      ,[hospi_Telefono]
--  FROM [CentrosMedicosDB].[dbo].[tbHospiltales]

--END

--******PANTALLAS
--Create PROCEDURE [dbo].[UDP_Select_tbPantallas]

--AS
--BEGIN

--SELECT TOP (1000) [pant_Id]
--      ,[pant_Nombre]
--  FROM [CentrosMedicosDB].[dbo].[tbPantallas]

--END

--******ROLES
--Create PROCEDURE [dbo].[UDP_Select_tbRoles]

--AS
--BEGIN

--SELECT TOP (1000) [rol_Id]
--      ,[rol_Nombre]
--      ,[rol_Descripcion]
--  FROM [CentrosMedicosDB].[dbo].[tbRoles]

--END
----******tbPlantilla
--Create PROCEDURE [dbo].[UDP_Select_tbPlantilla]
--AS
--BEGIN

--SELECT TOP (1000) [hospi_Id]
--      ,[sala_Id]
--      ,[planti_EmpleadoId]
--      ,[planti_Apellido]
--      ,[planti_Funcion]
--      ,[planti_Turno]
--      ,[planti_Salario]
--  FROM [CentrosMedicosDB].[dbo].[tbPlantilla]

----******USARIOS
--Create PROCEDURE [dbo].[UDP_Select_tbUsuarios]
--AS
--BEGIN

--SELECT TOP (1000) [usu_ID]
--      ,[rol_ID]
--      ,[usu_Nombre]
--      ,[usu_Apellido]
--      ,[usu_Email]
--      ,[usu_Password]
--      ,[usu_PasswordSalt]
--      ,[usu_NumeroTelefono]
--      ,[usu_NumeroCelular]
--  FROM [CentrosMedicosDB].[dbo].[tbUsuarios]


----******ENFERMOS
CREATE PROCEDURE [dbo].[UDP_Select_tbEnfermo]
AS
BEGIN

SELECT TOP (1000) [enfer_Inscripcioon]
      ,[enfer_Apellido]
      ,[enfer_Direccion]
      ,[enfer_FechaNac]
      ,[enfer_NSS]
      ,[planti_EmpleadoId]
  FROM [CentrosMedicosDB].[dbo].[tbEnfermo]

--******SALA
--Create PROCEDURE [dbo].[UDP_Select_tbEnfermo]
--AS
--BEGIN

--SELECT TOP (1000) [enfer_Inscripcioon]
--      ,[enfer_Apellido]
--      ,[enfer_Direccion]
--      ,[enfer_FechaNac]
--      ,[enfer_NSS]
--  FROM [CentrosMedicosDB].[dbo].[tbEnfermo]

END
GO
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbHospiltales]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create PROCEDURE [dbo].[UDP_Select_Accesos]

--AS
--BEGIN

--SELECT TOP (1000) [acce_Id]
--      ,[rol_Id]
--      ,[pant_Id]
--  FROM [CentrosMedicosDB].[dbo].[tbAccesos]

--END

Create PROCEDURE [dbo].[UDP_Select_tbHospiltales]

AS
BEGIN

SELECT TOP (1000) [hospi_Id]
      ,[hospi_Nombre]
      ,[hospi_Telefono]
  FROM [CentrosMedicosDB].[dbo].[tbHospiltales]

END
GO
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbPlantilla]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--******ACCESOS
--Create PROCEDURE [dbo].[UDP_Select_Accesos]

--AS
--BEGIN

--SELECT TOP (1000) [acce_Id]
--      ,[rol_Id]
--      ,[pant_Id]
--  FROM [CentrosMedicosDB].[dbo].[tbAccesos]

--END
--******HOSPITALES
--Create PROCEDURE [dbo].[UDP_Select_tbHospiltales]

--AS
--BEGIN

--SELECT TOP (1000) [hospi_Id]
--      ,[hospi_Nombre]
--      ,[hospi_Telefono]
--  FROM [CentrosMedicosDB].[dbo].[tbHospiltales]

--END

--******PANTALLAS
--Create PROCEDURE [dbo].[UDP_Select_tbPantallas]

--AS
--BEGIN

--SELECT TOP (1000) [pant_Id]
--      ,[pant_Nombre]
--  FROM [CentrosMedicosDB].[dbo].[tbPantallas]

--END

--******ROLES
--Create PROCEDURE [dbo].[UDP_Select_tbRoles]

--AS
--BEGIN

--SELECT TOP (1000) [rol_Id]
--      ,[rol_Nombre]
--      ,[rol_Descripcion]
--  FROM [CentrosMedicosDB].[dbo].[tbRoles]

--END
----******tbPlantilla
--Create PROCEDURE [dbo].[UDP_Select_tbPlantilla]
--AS
--BEGIN

--SELECT TOP (1000) [hospi_Id]
--      ,[sala_Id]
--      ,[planti_EmpleadoId]
--      ,[planti_Apellido]
--      ,[planti_Funcion]
--      ,[planti_Turno]
--      ,[planti_Salario]
--  FROM [CentrosMedicosDB].[dbo].[tbPlantilla]

----******USARIOS
--Create PROCEDURE [dbo].[UDP_Select_tbUsuarios]
--AS
--BEGIN

--SELECT TOP (1000) [usu_ID]
--      ,[rol_ID]
--      ,[usu_Nombre]
--      ,[usu_Apellido]
--      ,[usu_Email]
--      ,[usu_Password]
--      ,[usu_PasswordSalt]
--      ,[usu_NumeroTelefono]
--      ,[usu_NumeroCelular]
--  FROM [CentrosMedicosDB].[dbo].[tbUsuarios]


----******ENFERMOS
--ALTER PROCEDURE [dbo].[UDP_Select_tbEnfermo]
--AS
--BEGIN

--SELECT TOP (1000) [enfer_Inscripcioon]
--      ,[enfer_Apellido]
--      ,[enfer_Direccion]
--      ,[enfer_FechaNac]
--      ,[enfer_NSS]
--      ,[planti_EmpleadoId]
--  FROM [CentrosMedicosDB].[dbo].[tbEnfermo]

----******SALA
--Create PROCEDURE [dbo].[UDP_Select_tbSala]
--AS
--BEGIN

--SELECT TOP (1000) [hospi_Id]
--      ,[sala_Id]
--      ,[sala_Nombre]
--      ,[sala_NumCamas]
--  FROM [CentrosMedicosDB].[dbo].[tbSala]

--******tbPlantilla
Create PROCEDURE [dbo].[UDP_Select_tbPlantilla]
AS
BEGIN

SELECT TOP (1000) [hospi_Id]
      ,[sala_Id]
      ,[planti_EmpleadoId]
      ,[planti_Apellido]
      ,[planti_Funcion]
      ,[planti_Turno]
      ,[planti_Salario]
  FROM [CentrosMedicosDB].[dbo].[tbPlantilla]

END
GO
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbRoles]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--******ACCESOS
--Create PROCEDURE [dbo].[UDP_Select_Accesos]

--AS
--BEGIN

--SELECT TOP (1000) [acce_Id]
--      ,[rol_Id]
--      ,[pant_Id]
--  FROM [CentrosMedicosDB].[dbo].[tbAccesos]

--END
--******HOSPITALES
--Create PROCEDURE [dbo].[UDP_Select_tbHospiltales]

--AS
--BEGIN

--SELECT TOP (1000) [hospi_Id]
--      ,[hospi_Nombre]
--      ,[hospi_Telefono]
--  FROM [CentrosMedicosDB].[dbo].[tbHospiltales]

--END

--******PANTALLAS
--Create PROCEDURE [dbo].[UDP_Select_tbPantallas]

--AS
--BEGIN

--SELECT TOP (1000) [pant_Id]
--      ,[pant_Nombre]
--  FROM [CentrosMedicosDB].[dbo].[tbPantallas]

--END

--******ROLES
Create PROCEDURE [dbo].[UDP_Select_tbRoles]

AS
BEGIN

SELECT TOP (1000) [rol_Id]
      ,[rol_Nombre]
      ,[rol_Descripcion]
  FROM [CentrosMedicosDB].[dbo].[tbRoles]

END
GO
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbSala]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--******ACCESOS
--Create PROCEDURE [dbo].[UDP_Select_Accesos]

--AS
--BEGIN

--SELECT TOP (1000) [acce_Id]
--      ,[rol_Id]
--      ,[pant_Id]
--  FROM [CentrosMedicosDB].[dbo].[tbAccesos]

--END
--******HOSPITALES
--Create PROCEDURE [dbo].[UDP_Select_tbHospiltales]

--AS
--BEGIN

--SELECT TOP (1000) [hospi_Id]
--      ,[hospi_Nombre]
--      ,[hospi_Telefono]
--  FROM [CentrosMedicosDB].[dbo].[tbHospiltales]

--END

--******PANTALLAS
--Create PROCEDURE [dbo].[UDP_Select_tbPantallas]

--AS
--BEGIN

--SELECT TOP (1000) [pant_Id]
--      ,[pant_Nombre]
--  FROM [CentrosMedicosDB].[dbo].[tbPantallas]

--END

--******ROLES
--Create PROCEDURE [dbo].[UDP_Select_tbRoles]

--AS
--BEGIN

--SELECT TOP (1000) [rol_Id]
--      ,[rol_Nombre]
--      ,[rol_Descripcion]
--  FROM [CentrosMedicosDB].[dbo].[tbRoles]

--END
----******tbPlantilla
--Create PROCEDURE [dbo].[UDP_Select_tbPlantilla]
--AS
--BEGIN

--SELECT TOP (1000) [hospi_Id]
--      ,[sala_Id]
--      ,[planti_EmpleadoId]
--      ,[planti_Apellido]
--      ,[planti_Funcion]
--      ,[planti_Turno]
--      ,[planti_Salario]
--  FROM [CentrosMedicosDB].[dbo].[tbPlantilla]

----******USARIOS
--Create PROCEDURE [dbo].[UDP_Select_tbUsuarios]
--AS
--BEGIN

--SELECT TOP (1000) [usu_ID]
--      ,[rol_ID]
--      ,[usu_Nombre]
--      ,[usu_Apellido]
--      ,[usu_Email]
--      ,[usu_Password]
--      ,[usu_PasswordSalt]
--      ,[usu_NumeroTelefono]
--      ,[usu_NumeroCelular]
--  FROM [CentrosMedicosDB].[dbo].[tbUsuarios]


----******ENFERMOS
--ALTER PROCEDURE [dbo].[UDP_Select_tbEnfermo]
--AS
--BEGIN

--SELECT TOP (1000) [enfer_Inscripcioon]
--      ,[enfer_Apellido]
--      ,[enfer_Direccion]
--      ,[enfer_FechaNac]
--      ,[enfer_NSS]
--      ,[planti_EmpleadoId]
--  FROM [CentrosMedicosDB].[dbo].[tbEnfermo]

--******SALA
Create PROCEDURE [dbo].[UDP_Select_tbSala]
AS
BEGIN

SELECT TOP (1000) [hospi_Id]
      ,[sala_Id]
      ,[sala_Nombre]
      ,[sala_NumCamas]
  FROM [CentrosMedicosDB].[dbo].[tbSala]

END
GO
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbUsuarios]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--******ACCESOS
--Create PROCEDURE [dbo].[UDP_Select_Accesos]

--AS
--BEGIN

--SELECT TOP (1000) [acce_Id]
--      ,[rol_Id]
--      ,[pant_Id]
--  FROM [CentrosMedicosDB].[dbo].[tbAccesos]

--END
--******HOSPITALES
--Create PROCEDURE [dbo].[UDP_Select_tbHospiltales]

--AS
--BEGIN

--SELECT TOP (1000) [hospi_Id]
--      ,[hospi_Nombre]
--      ,[hospi_Telefono]
--  FROM [CentrosMedicosDB].[dbo].[tbHospiltales]

--END

--******PANTALLAS
--Create PROCEDURE [dbo].[UDP_Select_tbPantallas]

--AS
--BEGIN

--SELECT TOP (1000) [pant_Id]
--      ,[pant_Nombre]
--  FROM [CentrosMedicosDB].[dbo].[tbPantallas]

--END

--******ROLES
--Create PROCEDURE [dbo].[UDP_Select_tbRoles]

--AS
--BEGIN

--SELECT TOP (1000) [rol_Id]
--      ,[rol_Nombre]
--      ,[rol_Descripcion]
--  FROM [CentrosMedicosDB].[dbo].[tbRoles]

--END
----******tbPlantilla
--Create PROCEDURE [dbo].[UDP_Select_tbPlantilla]
--AS
--BEGIN

--SELECT TOP (1000) [hospi_Id]
--      ,[sala_Id]
--      ,[planti_EmpleadoId]
--      ,[planti_Apellido]
--      ,[planti_Funcion]
--      ,[planti_Turno]
--      ,[planti_Salario]
--  FROM [CentrosMedicosDB].[dbo].[tbPlantilla]

--******USARIOS
Create PROCEDURE [dbo].[UDP_Select_tbUsuarios]
AS
BEGIN

SELECT TOP (1000) [usu_ID]
      ,[rol_ID]
      ,[usu_Nombre]
      ,[usu_Apellido]
      ,[usu_Email]
      ,[usu_Password]
      ,[usu_PasswordSalt]
      ,[usu_NumeroTelefono]
      ,[usu_NumeroCelular]
  FROM [CentrosMedicosDB].[dbo].[tbUsuarios]

END
GO
/****** Object:  StoredProcedure [dbo].[UDP_tbEnfermo_SelectId]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_tbEnfermo_SelectId]
	@id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [enfer_Inscripcioon]
		  ,[enfer_Apellido]
		  ,[enfer_Direccion]
		  ,[enfer_FechaNac]
		  ,[enfer_NSS]
		  ,[planti_EmpleadoId]
	FROM [CentrosMedicosDB].[dbo].[tbEnfermo]
	WHERE [enfer_Inscripcioon] = @id
END
GO
/****** Object:  StoredProcedure [dbo].[UDP_tbHospital_SelectId]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_tbHospital_SelectId]
    @id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT [hospi_Id]
          ,[hospi_Nombre]
          ,[hospi_Telefono]
    FROM [CentrosMedicosDB].[dbo].[tbHospiltales]
    WHERE [hospi_Id] = @id
END
GO
/****** Object:  StoredProcedure [dbo].[UDP_tbPlantilla_Select]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_tbPlantilla_Select]
AS
BEGIN

SELECT [hospi_Id]
      ,[sala_Id]
      ,[planti_EmpleadoId]
      ,[planti_Apellido]
      ,[planti_Funcion]
      ,[planti_Turno]
      ,[planti_Salario]
  FROM [CentrosMedicosDB].[dbo].[tbPlantilla]

END
GO
/****** Object:  StoredProcedure [dbo].[UDP_tbPlantilla_SelectId]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_tbPlantilla_SelectId]
    @id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT [hospi_Id]
          ,[sala_Id]
          ,[planti_EmpleadoId]
          ,[planti_Apellido]
          ,[planti_Funcion]
          ,[planti_Turno]
          ,[planti_Salario]
    FROM [CentrosMedicosDB].[dbo].[tbPlantilla]
    WHERE [planti_EmpleadoId] = @id
END
GO
/****** Object:  StoredProcedure [dbo].[UDP_tbSala_SelectId]    Script Date: 1/4/2022 01:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_tbSala_SelectId] 
@id    INT
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    SELECT [hospi_Id]
      ,[sala_Id]
      ,[sala_Nombre]
      ,[sala_NumCamas]
  FROM [CentrosMedicosDB].[dbo].[tbSala]
  WHERE [sala_Id] = @id;

END
GO
USE [master]
GO
ALTER DATABASE [CentrosMedicosDB] SET  READ_WRITE 
GO
