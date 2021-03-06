USE [CentrosMedicosDB]
GO
/****** Object:  Table [dbo].[tbPlantilla]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  View [dbo].[UDV_Select_tbPlantilla]    Script Date: 30/3/2022 12:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UDV_Select_tbPlantilla]

AS
SELECT *
	FROM [dbo].[tbPlantilla];
GO
/****** Object:  Table [dbo].[tbAccesos]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  Table [dbo].[tbEnfermo]    Script Date: 30/3/2022 12:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbEnfermo](
	[enfer_Inscripcioon] [int] IDENTITY(1,1) NOT NULL,
	[enfer_Apellido] [nvarchar](15) NOT NULL,
	[enfer_Direccion] [nvarchar](20) NOT NULL,
	[enfer_FechaNac] [date] NULL,
	[enfer_NSS] [int] NOT NULL,
	[planti_EmpleadoId] [int] NULL,
 CONSTRAINT [PK_tbEnfermo_planti_enfer_Inscripcioon] PRIMARY KEY CLUSTERED 
(
	[enfer_Inscripcioon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbHospiltales]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  Table [dbo].[tbPantallas]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  Table [dbo].[tbRoles]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  Table [dbo].[tbSala]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  Table [dbo].[tbUsuarios]    Script Date: 30/3/2022 12:42:21 ******/
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
INSERT [dbo].[tbAccesos] ([acce_Id], [rol_Id], [pant_Id]) VALUES (6, 2, 4)
SET IDENTITY_INSERT [dbo].[tbAccesos] OFF
GO
SET IDENTITY_INSERT [dbo].[tbEnfermo] ON 

INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (1, N'Izaguirre', N'Barrio el Progreso', CAST(N'1999-12-01' AS Date), 155451, NULL)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (2, N'Aguirre', N'Colonia Bendeck', CAST(N'1999-12-01' AS Date), 454558, NULL)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (3, N'Zuniga', N'Villa Angeles', CAST(N'1999-12-01' AS Date), 71045841, NULL)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (4, N'Aguilar', N'Barrio San Francisco', CAST(N'1999-12-01' AS Date), 5454568, NULL)
INSERT [dbo].[tbEnfermo] ([enfer_Inscripcioon], [enfer_Apellido], [enfer_Direccion], [enfer_FechaNac], [enfer_NSS], [planti_EmpleadoId]) VALUES (5, N'Vasquez', N'Colonia Canada', CAST(N'1999-12-01' AS Date), 5641512, NULL)
SET IDENTITY_INSERT [dbo].[tbEnfermo] OFF
GO
SET IDENTITY_INSERT [dbo].[tbHospiltales] ON 

INSERT [dbo].[tbHospiltales] ([hospi_Id], [hospi_Nombre], [hospi_Telefono]) VALUES (1, N'San Flipe', N'51515221')
INSERT [dbo].[tbHospiltales] ([hospi_Id], [hospi_Nombre], [hospi_Telefono]) VALUES (2, N'IHSS', N'18475852')
INSERT [dbo].[tbHospiltales] ([hospi_Id], [hospi_Nombre], [hospi_Telefono]) VALUES (3, N'Cristiana', N'11747154')
INSERT [dbo].[tbHospiltales] ([hospi_Id], [hospi_Nombre], [hospi_Telefono]) VALUES (4, N'Santa Rosita', N'878811')
INSERT [dbo].[tbHospiltales] ([hospi_Id], [hospi_Nombre], [hospi_Telefono]) VALUES (5, N'Mario Catarino Rivas', N'788455150')
SET IDENTITY_INSERT [dbo].[tbHospiltales] OFF
GO
SET IDENTITY_INSERT [dbo].[tbPantallas] ON 

INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (1, N'Inicio')
INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (2, N'Reporte')
INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (3, N'formulario')
INSERT [dbo].[tbPantallas] ([pant_Id], [pant_Nombre]) VALUES (4, N'formulario2')
SET IDENTITY_INSERT [dbo].[tbPantallas] OFF
GO
SET IDENTITY_INSERT [dbo].[tbPlantilla] ON 

INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (2, 2, 1, N'Mauricio', N'Doctor', N'T', 222222)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 1, 2, N'Jose', N'Pedriata', N'M', 15000)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (3, 3, 3, N'Dayanne', N'Cirujana', N'N', 1500000)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (4, 4, 4, N'Angela', N'Enfermera', N'T', 2500)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (5, 5, 5, N'Noemy', N'Enfermera', N'N', 5500)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 10, 6, N'Luis', N'Cirujano', N'M', 255585)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (1, 10, 7, N'Aguirre', N'Cirujano', N'N', 4184485)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (2, 8, 8, N'Ronal', N'Pedriatra', N'T', 787452)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (2, 15, 10, N'Dos Santos', N'Pediratra', N'M', 4748758)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (3, 9, 11, N'Pedrerol', N'Cardiologo', N'T', 55454754)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (3, 12, 12, N'Muriilo', N'Cardiologo', N'T', 7784484)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (4, 7, 14, N'Handal', N'Farmacia', N'N', 410121)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (4, 13, 16, N'Fernanda', N'Farmacia', N'N', 5845174)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (5, 6, 18, N'Gomez', N'Urologa', N'M', 1474474)
INSERT [dbo].[tbPlantilla] ([hospi_Id], [sala_Id], [planti_EmpleadoId], [planti_Apellido], [planti_Funcion], [planti_Turno], [planti_Salario]) VALUES (5, 14, 19, N'Gomez', N'Urologo', N'N', 7415150)
SET IDENTITY_INSERT [dbo].[tbPlantilla] OFF
GO
SET IDENTITY_INSERT [dbo].[tbRoles] ON 

INSERT [dbo].[tbRoles] ([rol_Id], [rol_Nombre], [rol_Descripcion]) VALUES (1, N'Administrador', N'Control Total')
INSERT [dbo].[tbRoles] ([rol_Id], [rol_Nombre], [rol_Descripcion]) VALUES (2, N'Usuario', N'Control de ciertas Areas')
SET IDENTITY_INSERT [dbo].[tbRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[tbSala] ON 

INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (1, 1, N'Pedriatia', 575)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (2, 2, N'Emergencias', 757)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (3, 3, N'Quirofano1', 575)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (4, 4, N'Hematologia', 427)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (5, 5, N'Cardiologia', 4274)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (5, 6, N'Pedriatia', 75)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (4, 7, N'Emergencias', 424)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (2, 8, N'Quirofano1', 275)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (3, 9, N'Quirofano1', 17)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (1, 10, N'Cardiologia', 7457)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (1, 11, N'Pedriatia', 171)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (3, 12, N'Emergencias', 77)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (4, 13, N'Quirofano1', 41)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (5, 14, N'Quirofano1', 47)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (2, 15, N'Cardiologia', 77)
INSERT [dbo].[tbSala] ([hospi_Id], [sala_Id], [sala_Nombre], [sala_NumCamas]) VALUES (1, 16, N'enfermeria', 150)
SET IDENTITY_INSERT [dbo].[tbSala] OFF
GO
SET IDENTITY_INSERT [dbo].[tbUsuarios] ON 

INSERT [dbo].[tbUsuarios] ([usu_ID], [rol_ID], [usu_Nombre], [usu_Apellido], [usu_Email], [usu_Password], [usu_PasswordSalt], [usu_NumeroTelefono], [usu_NumeroCelular]) VALUES (1, 1, N'luis angel', N'romero', N'luis1', N'6CBBC26008C8660002CB0BA8141586109FEF3AC95F02F818351EAFD646A529E2
', N'eda628b3-de13-46eb-b9ef-49fc89abb1f1', N'232', N'2424')
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
/****** Object:  StoredProcedure [dbo].[UDP_insertar_Accesos]    Script Date: 30/3/2022 12:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_insertar_Accesos]
			@rol_Id int,
           @pant_Id int
		   as
BEGIN


INSERT INTO [dbo].[tbAccesos]
           ([rol_Id]
           ,[pant_Id])
     VALUES
           (@rol_Id,@pant_Id)
END
GO
/****** Object:  StoredProcedure [dbo].[UDP_insertar_enfermo]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  StoredProcedure [dbo].[UDP_insertar_hospitales]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  StoredProcedure [dbo].[UDP_insertar_pantalas]    Script Date: 30/3/2022 12:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_insertar_pantalas]
			@pant_Nombre nvarchar(150)
         
		   as
BEGIN

INSERT INTO [dbo].[tbPantallas]
           ([pant_Nombre])
     VALUES
           (@pant_Nombre)
END
GO
/****** Object:  StoredProcedure [dbo].[UDP_insertar_Plantilla]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  StoredProcedure [dbo].[UDP_insertar_roles]    Script Date: 30/3/2022 12:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_insertar_roles]
			@rol_Nombre nvarchar(150),
           @rol_Descripcion nvarchar(400)
		   as
BEGIN

INSERT INTO [dbo].[tbRoles]
           ([rol_Nombre]
           ,[rol_Descripcion])
     VALUES
           (@rol_Nombre,
           @rol_Descripcion)
		   
		   END
GO
/****** Object:  StoredProcedure [dbo].[UDP_insertar_Sala]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  StoredProcedure [dbo].[UDP_insertar_usuarios]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  StoredProcedure [dbo].[UDP_Permisos_Usuarios]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  StoredProcedure [dbo].[UDP_Select_Accesos]    Script Date: 30/3/2022 12:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UDP_Select_Accesos]

AS
BEGIN

SELECT TOP (1000) [acce_Id]
      ,[rol_Id]
      ,[pant_Id]
  FROM [CentrosMedicosDB].[dbo].[tbAccesos]

END
GO
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbEnfermo]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbHospiltales]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbPantallas]    Script Date: 30/3/2022 12:42:21 ******/
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
Create PROCEDURE [dbo].[UDP_Select_tbPantallas]

AS
BEGIN

SELECT TOP (1000) [pant_Id]
      ,[pant_Nombre]
  FROM [CentrosMedicosDB].[dbo].[tbPantallas]

END
GO
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbPlantilla]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbRoles]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbSala]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  StoredProcedure [dbo].[UDP_Select_tbUsuarios]    Script Date: 30/3/2022 12:42:21 ******/
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
/****** Object:  StoredProcedure [dbo].[UDP_tbHospiltales_ACTUALIZAR]    Script Date: 30/3/2022 12:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UDP_tbHospiltales_ACTUALIZAR]
@hospi_Nombre			NVARCHAR(20),
@hospi_Telefono			NVARCHAR(20),
@hospi_Id				int
AS 
BEGIN
		update [dbo].[tbHospiltales]		set [hospi_Nombre]=@hospi_Nombre,			[hospi_Telefono]=@hospi_Telefono		where [hospi_Id]=@hospi_Id
END 
GO
/****** Object:  StoredProcedure [dbo].[UDP_tbPlantilla_ACTUALIZAR]    Script Date: 30/3/2022 12:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UDP_tbPlantilla_ACTUALIZAR]
--create proc UDP_tbPlantilla_UPDATE
@hospi_Id				INT,
@sala_Id				INT,
@planti_Apellido		NVARCHAR(20),
@planti_Funcion			NVARCHAR(10),
@planti_Turno			CHAR(1),
@planti_Salario			INT,
@planti_EmpleadoId		INT
AS 
BEGIN
		update [dbo].[tbPlantilla]			set [hospi_Id]=@hospi_Id,				[sala_Id]=@sala_Id,				[planti_Apellido]=@planti_Apellido,				[planti_Funcion]=@planti_Funcion,				[planti_Turno]=@planti_Turno,				[planti_Salario]=@planti_Salario			WHERE [planti_EmpleadoId]=@planti_EmpleadoId
END
GO
