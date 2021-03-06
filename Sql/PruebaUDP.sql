USE [CentrosMedicosDB]
GO
/****** Object:  StoredProcedure [dbo].[UDP_tbPlantilla_Turno]    Script Date: 30/3/2022 17:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UDP_tbPlantilla_Turno]
@turno CHAR
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
  WHERE [planti_Turno] = @turno

END

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