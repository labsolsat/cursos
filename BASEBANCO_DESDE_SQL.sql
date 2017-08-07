USE [master]
GO
/****** Object:  Database [BANCO]    Script Date: 07/28/2017 14:26:32 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'BANCO')
BEGIN
CREATE DATABASE [BANCO] ON  PRIMARY 
( NAME = N'BANCO', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BANCO.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BANCO_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BANCO_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [BANCO] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BANCO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BANCO] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BANCO] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BANCO] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BANCO] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BANCO] SET ARITHABORT OFF
GO
ALTER DATABASE [BANCO] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [BANCO] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BANCO] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BANCO] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BANCO] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BANCO] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BANCO] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BANCO] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BANCO] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BANCO] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BANCO] SET  DISABLE_BROKER
GO
ALTER DATABASE [BANCO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BANCO] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BANCO] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BANCO] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BANCO] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BANCO] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BANCO] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BANCO] SET  READ_WRITE
GO
ALTER DATABASE [BANCO] SET RECOVERY FULL
GO
ALTER DATABASE [BANCO] SET  MULTI_USER
GO
ALTER DATABASE [BANCO] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BANCO] SET DB_CHAINING OFF
GO
USE [BANCO]
GO
/****** Object:  ForeignKey [FK_CNS]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CNS]') AND parent_object_id = OBJECT_ID(N'[dbo].[CUENTA]'))
ALTER TABLE [dbo].[CUENTA] DROP CONSTRAINT [FK_CNS]
GO
/****** Object:  ForeignKey [FK_PNS]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PNS]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRESTAMO]'))
ALTER TABLE [dbo].[PRESTAMO] DROP CONSTRAINT [FK_PNS]
GO
/****** Object:  ForeignKey [FK_PID_CID]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PID_CID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRESTATARIO]'))
ALTER TABLE [dbo].[PRESTATARIO] DROP CONSTRAINT [FK_PID_CID]
GO
/****** Object:  ForeignKey [FK_PRNP_PNP]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PRNP_PNP]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRESTATARIO]'))
ALTER TABLE [dbo].[PRESTATARIO] DROP CONSTRAINT [FK_PRNP_PNP]
GO
/****** Object:  ForeignKey [FK_IID_CID]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IID_CID]') AND parent_object_id = OBJECT_ID(N'[dbo].[IMPOSITOR]'))
ALTER TABLE [dbo].[IMPOSITOR] DROP CONSTRAINT [FK_IID_CID]
GO
/****** Object:  ForeignKey [FK_INC_CNC]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_INC_CNC]') AND parent_object_id = OBJECT_ID(N'[dbo].[IMPOSITOR]'))
ALTER TABLE [dbo].[IMPOSITOR] DROP CONSTRAINT [FK_INC_CNC]
GO
/****** Object:  ForeignKey [FK_PP]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PP]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAGO]'))
ALTER TABLE [dbo].[PAGO] DROP CONSTRAINT [FK_PP]
GO
/****** Object:  UserDefinedFunction [dbo].[numpagos]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[numpagos]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[numpagos]
GO
/****** Object:  Table [dbo].[PAGO]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PP]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAGO]'))
ALTER TABLE [dbo].[PAGO] DROP CONSTRAINT [FK_PP]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PAGO]') AND type in (N'U'))
DROP TABLE [dbo].[PAGO]
GO
/****** Object:  Table [dbo].[IMPOSITOR]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IID_CID]') AND parent_object_id = OBJECT_ID(N'[dbo].[IMPOSITOR]'))
ALTER TABLE [dbo].[IMPOSITOR] DROP CONSTRAINT [FK_IID_CID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_INC_CNC]') AND parent_object_id = OBJECT_ID(N'[dbo].[IMPOSITOR]'))
ALTER TABLE [dbo].[IMPOSITOR] DROP CONSTRAINT [FK_INC_CNC]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IMPOSITOR]') AND type in (N'U'))
DROP TABLE [dbo].[IMPOSITOR]
GO
/****** Object:  Table [dbo].[PRESTATARIO]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PID_CID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRESTATARIO]'))
ALTER TABLE [dbo].[PRESTATARIO] DROP CONSTRAINT [FK_PID_CID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PRNP_PNP]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRESTATARIO]'))
ALTER TABLE [dbo].[PRESTATARIO] DROP CONSTRAINT [FK_PRNP_PNP]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRESTATARIO]') AND type in (N'U'))
DROP TABLE [dbo].[PRESTATARIO]
GO
/****** Object:  Table [dbo].[PRESTAMO]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PNS]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRESTAMO]'))
ALTER TABLE [dbo].[PRESTAMO] DROP CONSTRAINT [FK_PNS]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRESTAMO]') AND type in (N'U'))
DROP TABLE [dbo].[PRESTAMO]
GO
/****** Object:  Table [dbo].[CUENTA]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CNS]') AND parent_object_id = OBJECT_ID(N'[dbo].[CUENTA]'))
ALTER TABLE [dbo].[CUENTA] DROP CONSTRAINT [FK_CNS]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CUENTA]') AND type in (N'U'))
DROP TABLE [dbo].[CUENTA]
GO
/****** Object:  StoredProcedure [dbo].[up_ClientePorCiudad]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_ClientePorCiudad]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_ClientePorCiudad]
GO
/****** Object:  StoredProcedure [dbo].[up_obtenerClientes]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_obtenerClientes]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[up_obtenerClientes]
GO
/****** Object:  Table [dbo].[SUCURSAL]    Script Date: 07/28/2017 14:26:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SUCURSAL]') AND type in (N'U'))
DROP TABLE [dbo].[SUCURSAL]
GO
/****** Object:  Table [dbo].[HSUCURSAL]    Script Date: 07/28/2017 14:26:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HSUCURSAL]') AND type in (N'U'))
DROP TABLE [dbo].[HSUCURSAL]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 07/28/2017 14:26:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CLIENTE]') AND type in (N'U'))
DROP TABLE [dbo].[CLIENTE]
GO
/****** Object:  Table [dbo].[PRUEBA]    Script Date: 07/28/2017 14:26:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRUEBA]') AND type in (N'U'))
DROP TABLE [dbo].[PRUEBA]
GO
/****** Object:  UserDefinedFunction [dbo].[Sabados]    Script Date: 07/28/2017 14:26:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sabados]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Sabados]
GO
/****** Object:  Table [dbo].[mytable]    Script Date: 07/28/2017 14:26:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mytable]') AND type in (N'U'))
DROP TABLE [dbo].[mytable]
GO
/****** Object:  Table [dbo].[mytable]    Script Date: 07/28/2017 14:26:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mytable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[mytable](
	[ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  UserDefinedFunction [dbo].[Sabados]    Script Date: 07/28/2017 14:26:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sabados]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[Sabados](@FechaI smalldatetime)
RETURNS @Tabla TABLE (Fecha smalldatetime)
BEGIN
     declare @i int
     declare @dia varchar(20)
     declare @fecha datetime
     select @i = 0
     while @i > - DateDiff(Day, ''01/1/2003'', @FechaI)
     begin
          select @dia = DateName(dw, dateadd(d, @i, @FechaI))
          select @fecha = DateAdd(d, @i, @FechaI)
          if @dia in (''Sábado'')
          begin
               INSERT INTO @Tabla Select convert(nvarchar, @fecha, 103)
          end
          select @i = @i - 1
     end
 RETURN
END

' 
END
GO
/****** Object:  Table [dbo].[PRUEBA]    Script Date: 07/28/2017 14:26:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRUEBA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRUEBA](
	[ID] [varchar](50) NULL,
	[N] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[PRUEBA] ([ID], [N]) VALUES (N'SAT', N'Acayucan')
INSERT [dbo].[PRUEBA] ([ID], [N]) VALUES (N'SAT', N'Acayucan')
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 07/28/2017 14:26:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CLIENTE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CLIENTE](
	[CID] [varchar](3) NOT NULL,
	[CNOMBRE] [varchar](30) NULL,
	[CCALLE] [varchar](30) NULL,
	[CCIUDAD] [varchar](50) NULL,
 CONSTRAINT [PK_CID] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CLIENTE] ([CID], [CNOMBRE], [CCALLE], [CCIUDAD]) VALUES (N'312', N'Santos', N'Mayor', N'Peguerinos')
INSERT [dbo].[CLIENTE] ([CID], [CNOMBRE], [CCALLE], [CCIUDAD]) VALUES (N'374', N'Gómez', N'Carretas', N'Cerceda')
INSERT [dbo].[CLIENTE] ([CID], [CNOMBRE], [CCALLE], [CCIUDAD]) VALUES (N'396', N'Valdivieso', N'Goya', N'Vigo')
INSERT [dbo].[CLIENTE] ([CID], [CNOMBRE], [CCALLE], [CCIUDAD]) VALUES (N'609', N'Abril', N'Preciados', N'Valsaín')
INSERT [dbo].[CLIENTE] ([CID], [CNOMBRE], [CCALLE], [CCIUDAD]) VALUES (N'746', N'González', N'Arenal', N'La Granja')
INSERT [dbo].[CLIENTE] ([CID], [CNOMBRE], [CCALLE], [CCIUDAD]) VALUES (N'799', N'Fernández', N'Jazmín', N'León')
INSERT [dbo].[CLIENTE] ([CID], [CNOMBRE], [CCALLE], [CCIUDAD]) VALUES (N'880', N'Pérez', N'Carretas', N'Cerceda')
INSERT [dbo].[CLIENTE] ([CID], [CNOMBRE], [CCALLE], [CCIUDAD]) VALUES (N'901', N'López', N'Mayor', N'Peguerinos')
INSERT [dbo].[CLIENTE] ([CID], [CNOMBRE], [CCALLE], [CCIUDAD]) VALUES (N'902', N'Sotoca', N'Mayor', N'Peguerinos')
INSERT [dbo].[CLIENTE] ([CID], [CNOMBRE], [CCALLE], [CCIUDAD]) VALUES (N'999', N'Rupérez', N'Ramblas', N'León')
/****** Object:  Table [dbo].[HSUCURSAL]    Script Date: 07/28/2017 14:26:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HSUCURSAL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HSUCURSAL](
	[HSUCURSAL] [varchar](30) NULL,
	[HCIUDAD] [varchar](30) NULL,
	[HACTIVOSA] [decimal](10, 3) NULL,
	[HACTIVOSN] [decimal](10, 3) NULL,
	[HFX] [date] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[HSUCURSAL] ([HSUCURSAL], [HCIUDAD], [HACTIVOSA], [HACTIVOSN], [HFX]) VALUES (N'Becerril', N'Aluche', CAST(4000.000 AS Decimal(10, 3)), CAST(8000.000 AS Decimal(10, 3)), CAST(0x053D0B00 AS Date))
INSERT [dbo].[HSUCURSAL] ([HSUCURSAL], [HCIUDAD], [HACTIVOSA], [HACTIVOSN], [HFX]) VALUES (N'Becerril', N'Aluche', CAST(8000.000 AS Decimal(10, 3)), CAST(16000.000 AS Decimal(10, 3)), CAST(0x053D0B00 AS Date))
INSERT [dbo].[HSUCURSAL] ([HSUCURSAL], [HCIUDAD], [HACTIVOSA], [HACTIVOSN], [HFX]) VALUES (N'Becerril', N'Aluche', CAST(16000.000 AS Decimal(10, 3)), CAST(32000.000 AS Decimal(10, 3)), CAST(0x053D0B00 AS Date))
INSERT [dbo].[HSUCURSAL] ([HSUCURSAL], [HCIUDAD], [HACTIVOSA], [HACTIVOSN], [HFX]) VALUES (N'Becerril', N'Aluche', CAST(32000.000 AS Decimal(10, 3)), CAST(64000.000 AS Decimal(10, 3)), CAST(0x053D0B00 AS Date))
INSERT [dbo].[HSUCURSAL] ([HSUCURSAL], [HCIUDAD], [HACTIVOSA], [HACTIVOSN], [HFX]) VALUES (N'Becerril', N'Aluche', CAST(64000.000 AS Decimal(10, 3)), CAST(2000.000 AS Decimal(10, 3)), CAST(0x053D0B00 AS Date))
/****** Object:  Table [dbo].[SUCURSAL]    Script Date: 07/28/2017 14:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SUCURSAL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SUCURSAL](
	[NOMBRESUCURSAL] [varchar](30) NOT NULL,
	[CIUDADSUCURSAL] [varchar](30) NULL,
	[ACTIVOS] [decimal](10, 3) NULL,
 CONSTRAINT [PK_NOMBRESUCURSAL] PRIMARY KEY CLUSTERED 
(
	[NOMBRESUCURSAL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[SUCURSAL] ([NOMBRESUCURSAL], [CIUDADSUCURSAL], [ACTIVOS]) VALUES (N'Becerril', N'Aluche', CAST(2000.000 AS Decimal(10, 3)))
INSERT [dbo].[SUCURSAL] ([NOMBRESUCURSAL], [CIUDADSUCURSAL], [ACTIVOS]) VALUES (N'Centro', N'Arganzuela', CAST(9000.000 AS Decimal(10, 3)))
INSERT [dbo].[SUCURSAL] ([NOMBRESUCURSAL], [CIUDADSUCURSAL], [ACTIVOS]) VALUES (N'Collado Mediano', N'Aluche', CAST(8000.000 AS Decimal(10, 3)))
INSERT [dbo].[SUCURSAL] ([NOMBRESUCURSAL], [CIUDADSUCURSAL], [ACTIVOS]) VALUES (N'Galapagar', N'Arganzuela', CAST(7500.000 AS Decimal(10, 3)))
INSERT [dbo].[SUCURSAL] ([NOMBRESUCURSAL], [CIUDADSUCURSAL], [ACTIVOS]) VALUES (N'Moralzarzal', N'La Granja', CAST(2500.000 AS Decimal(10, 3)))
INSERT [dbo].[SUCURSAL] ([NOMBRESUCURSAL], [CIUDADSUCURSAL], [ACTIVOS]) VALUES (N'Navacerrada', N'Aluche', CAST(1700.000 AS Decimal(10, 3)))
INSERT [dbo].[SUCURSAL] ([NOMBRESUCURSAL], [CIUDADSUCURSAL], [ACTIVOS]) VALUES (N'Navas de la Asunción', N'Alcalá de Henares', CAST(1500.000 AS Decimal(10, 3)))
INSERT [dbo].[SUCURSAL] ([NOMBRESUCURSAL], [CIUDADSUCURSAL], [ACTIVOS]) VALUES (N'Segovia', N'Cerceda', CAST(3700.000 AS Decimal(10, 3)))
/****** Object:  StoredProcedure [dbo].[up_obtenerClientes]    Script Date: 07/28/2017 14:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_obtenerClientes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[up_obtenerClientes]
AS
SELECT CID, CNOMBRE FROM CLIENTE;
' 
END
GO
/****** Object:  StoredProcedure [dbo].[up_ClientePorCiudad]    Script Date: 07/28/2017 14:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_ClientePorCiudad]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[up_ClientePorCiudad](@ciudad  varchar(50))
AS
SELECT * FROM CLIENTE WHERE CCIUDAD=@ciudad;
' 
END
GO
/****** Object:  Trigger [tr_movSucursal]    Script Date: 07/28/2017 14:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_movSucursal]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[tr_movSucursal] ON [dbo].[SUCURSAL] AFTER UPDATE
AS 
BEGIN
DECLARE @VALORNUEVO DECIMAL(10,3)

	SET NOCOUNT ON;
	IF UPDATE(ACTIVOS)
	BEGIN
	SET @VALORNUEVO = (SELECT ACTIVOS FROM DELETED)
	INSERT INTO HSUCURSAL(HSUCURSAL,HCIUDAD,HACTIVOSA,HACTIVOSN,HFX)
	SELECT NOMBRESUCURSAL,CIUDADSUCURSAL,@VALORNUEVO,ACTIVOS,GETDATE() FROM INSERTED
	END
END
'
GO
/****** Object:  Table [dbo].[CUENTA]    Script Date: 07/28/2017 14:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CUENTA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CUENTA](
	[NUMCUENTA] [varchar](5) NOT NULL,
	[NOMBRESUCURSAL] [varchar](30) NULL,
	[SALDO] [decimal](10, 2) NULL,
 CONSTRAINT [PK_NUMCUENTA] PRIMARY KEY CLUSTERED 
(
	[NUMCUENTA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CUENTA] ([NUMCUENTA], [NOMBRESUCURSAL], [SALDO]) VALUES (N'C-101', N'Centro', CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[CUENTA] ([NUMCUENTA], [NOMBRESUCURSAL], [SALDO]) VALUES (N'C-102', N'Navacerrada', CAST(400.00 AS Decimal(10, 2)))
INSERT [dbo].[CUENTA] ([NUMCUENTA], [NOMBRESUCURSAL], [SALDO]) VALUES (N'C-201', N'Galapagar', CAST(750.00 AS Decimal(10, 2)))
INSERT [dbo].[CUENTA] ([NUMCUENTA], [NOMBRESUCURSAL], [SALDO]) VALUES (N'C-215', N'Becerril', CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[CUENTA] ([NUMCUENTA], [NOMBRESUCURSAL], [SALDO]) VALUES (N'C-217', N'Galapagar', CAST(750.00 AS Decimal(10, 2)))
INSERT [dbo].[CUENTA] ([NUMCUENTA], [NOMBRESUCURSAL], [SALDO]) VALUES (N'C-222', N'Moralzarzal', CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[CUENTA] ([NUMCUENTA], [NOMBRESUCURSAL], [SALDO]) VALUES (N'C-305', N'Collado Mediano', CAST(350.00 AS Decimal(10, 2)))
/****** Object:  Table [dbo].[PRESTAMO]    Script Date: 07/28/2017 14:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRESTAMO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRESTAMO](
	[NUMPRESTAMO] [varchar](4) NOT NULL,
	[NOMBRESUCURSAL] [varchar](30) NULL,
	[IMPORTE] [decimal](10, 3) NULL,
 CONSTRAINT [PK_NUMPRESTAMO] PRIMARY KEY CLUSTERED 
(
	[NUMPRESTAMO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[PRESTAMO] ([NUMPRESTAMO], [NOMBRESUCURSAL], [IMPORTE]) VALUES (N'P-11', N'Collado Mediano', CAST(900.000 AS Decimal(10, 3)))
INSERT [dbo].[PRESTAMO] ([NUMPRESTAMO], [NOMBRESUCURSAL], [IMPORTE]) VALUES (N'P-14', N'Centro', CAST(1500.000 AS Decimal(10, 3)))
INSERT [dbo].[PRESTAMO] ([NUMPRESTAMO], [NOMBRESUCURSAL], [IMPORTE]) VALUES (N'P-15', N'Navacerrada', CAST(1500.000 AS Decimal(10, 3)))
INSERT [dbo].[PRESTAMO] ([NUMPRESTAMO], [NOMBRESUCURSAL], [IMPORTE]) VALUES (N'P-16', N'Navacerrada', CAST(1300.000 AS Decimal(10, 3)))
INSERT [dbo].[PRESTAMO] ([NUMPRESTAMO], [NOMBRESUCURSAL], [IMPORTE]) VALUES (N'P-17', N'Centro', CAST(1000.000 AS Decimal(10, 3)))
INSERT [dbo].[PRESTAMO] ([NUMPRESTAMO], [NOMBRESUCURSAL], [IMPORTE]) VALUES (N'P-23', N'Moralzarzal', CAST(2000.000 AS Decimal(10, 3)))
INSERT [dbo].[PRESTAMO] ([NUMPRESTAMO], [NOMBRESUCURSAL], [IMPORTE]) VALUES (N'P-93', N'Becerril', CAST(500.000 AS Decimal(10, 3)))
/****** Object:  Table [dbo].[PRESTATARIO]    Script Date: 07/28/2017 14:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRESTATARIO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRESTATARIO](
	[CID] [varchar](3) NULL,
	[NUMPRESTAMO] [varchar](4) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[PRESTATARIO] ([CID], [NUMPRESTAMO]) VALUES (N'799', N'P-16')
INSERT [dbo].[PRESTATARIO] ([CID], [NUMPRESTAMO]) VALUES (N'374', N'P-93')
INSERT [dbo].[PRESTATARIO] ([CID], [NUMPRESTAMO]) VALUES (N'374', N'P-15')
INSERT [dbo].[PRESTATARIO] ([CID], [NUMPRESTAMO]) VALUES (N'901', N'P-14')
INSERT [dbo].[PRESTATARIO] ([CID], [NUMPRESTAMO]) VALUES (N'880', N'P-17')
INSERT [dbo].[PRESTATARIO] ([CID], [NUMPRESTAMO]) VALUES (N'312', N'P-11')
INSERT [dbo].[PRESTATARIO] ([CID], [NUMPRESTAMO]) VALUES (N'902', N'P-23')
INSERT [dbo].[PRESTATARIO] ([CID], [NUMPRESTAMO]) VALUES (N'396', N'P-17')
/****** Object:  Table [dbo].[IMPOSITOR]    Script Date: 07/28/2017 14:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IMPOSITOR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IMPOSITOR](
	[CID] [varchar](3) NULL,
	[NUMCUENTA] [varchar](5) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[IMPOSITOR] ([CID], [NUMCUENTA]) VALUES (N'609', N'C-102')
INSERT [dbo].[IMPOSITOR] ([CID], [NUMCUENTA]) VALUES (N'374', N'C-101')
INSERT [dbo].[IMPOSITOR] ([CID], [NUMCUENTA]) VALUES (N'746', N'C-201')
INSERT [dbo].[IMPOSITOR] ([CID], [NUMCUENTA]) VALUES (N'746', N'C-217')
INSERT [dbo].[IMPOSITOR] ([CID], [NUMCUENTA]) VALUES (N'901', N'C-222')
INSERT [dbo].[IMPOSITOR] ([CID], [NUMCUENTA]) VALUES (N'999', N'C-215')
INSERT [dbo].[IMPOSITOR] ([CID], [NUMCUENTA]) VALUES (N'312', N'C-305')
/****** Object:  Table [dbo].[PAGO]    Script Date: 07/28/2017 14:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PAGO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PAGO](
	[NUMPRESTAMO] [varchar](4) NOT NULL,
	[NUMPAGO] [int] NOT NULL,
	[FXPAGO] [date] NULL,
	[IMPORTEPAGO] [decimal](10, 3) NULL,
 CONSTRAINT [PK_PP] PRIMARY KEY CLUSTERED 
(
	[NUMPRESTAMO] ASC,
	[NUMPAGO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[PAGO] ([NUMPRESTAMO], [NUMPAGO], [FXPAGO], [IMPORTEPAGO]) VALUES (N'P-11', 53, CAST(0x12260B00 AS Date), CAST(125.000 AS Decimal(10, 3)))
INSERT [dbo].[PAGO] ([NUMPRESTAMO], [NUMPAGO], [FXPAGO], [IMPORTEPAGO]) VALUES (N'P-14', 69, CAST(0x08260B00 AS Date), CAST(500.000 AS Decimal(10, 3)))
INSERT [dbo].[PAGO] ([NUMPRESTAMO], [NUMPAGO], [FXPAGO], [IMPORTEPAGO]) VALUES (N'P-15', 22, CAST(0x03260B00 AS Date), CAST(300.000 AS Decimal(10, 3)))
INSERT [dbo].[PAGO] ([NUMPRESTAMO], [NUMPAGO], [FXPAGO], [IMPORTEPAGO]) VALUES (N'P-16', 58, CAST(0x1D260B00 AS Date), CAST(135.000 AS Decimal(10, 3)))
INSERT [dbo].[PAGO] ([NUMPRESTAMO], [NUMPAGO], [FXPAGO], [IMPORTEPAGO]) VALUES (N'P-17', 5, CAST(0xF6250B00 AS Date), CAST(50.000 AS Decimal(10, 3)))
INSERT [dbo].[PAGO] ([NUMPRESTAMO], [NUMPAGO], [FXPAGO], [IMPORTEPAGO]) VALUES (N'P-17', 6, CAST(0x12260B00 AS Date), CAST(50.000 AS Decimal(10, 3)))
INSERT [dbo].[PAGO] ([NUMPRESTAMO], [NUMPAGO], [FXPAGO], [IMPORTEPAGO]) VALUES (N'P-17', 7, CAST(0x1C260B00 AS Date), CAST(100.000 AS Decimal(10, 3)))
INSERT [dbo].[PAGO] ([NUMPRESTAMO], [NUMPAGO], [FXPAGO], [IMPORTEPAGO]) VALUES (N'P-23', 11, CAST(0xFD250B00 AS Date), CAST(75.000 AS Decimal(10, 3)))
INSERT [dbo].[PAGO] ([NUMPRESTAMO], [NUMPAGO], [FXPAGO], [IMPORTEPAGO]) VALUES (N'P-93', 103, CAST(0x0E260B00 AS Date), CAST(900.000 AS Decimal(10, 3)))
INSERT [dbo].[PAGO] ([NUMPRESTAMO], [NUMPAGO], [FXPAGO], [IMPORTEPAGO]) VALUES (N'P-93', 104, CAST(0x18260B00 AS Date), CAST(200.000 AS Decimal(10, 3)))
/****** Object:  UserDefinedFunction [dbo].[numpagos]    Script Date: 07/28/2017 14:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[numpagos]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[numpagos](@NPRESTAMO AS VARCHAR(4))
RETURNS INT
AS
BEGIN
DECLARE @NPAGO INT

SELECT @NPAGO=COUNT(NUMPAGO) FROM PAGO
GROUP BY NUMPRESTAMO
HAVING NUMPRESTAMO=@NPRESTAMO
ORDER BY NUMPRESTAMO


RETURN @NPAGO
END' 
END
GO
/****** Object:  ForeignKey [FK_CNS]    Script Date: 07/28/2017 14:26:33 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CNS]') AND parent_object_id = OBJECT_ID(N'[dbo].[CUENTA]'))
ALTER TABLE [dbo].[CUENTA]  WITH CHECK ADD  CONSTRAINT [FK_CNS] FOREIGN KEY([NOMBRESUCURSAL])
REFERENCES [dbo].[SUCURSAL] ([NOMBRESUCURSAL])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CNS]') AND parent_object_id = OBJECT_ID(N'[dbo].[CUENTA]'))
ALTER TABLE [dbo].[CUENTA] CHECK CONSTRAINT [FK_CNS]
GO
/****** Object:  ForeignKey [FK_PNS]    Script Date: 07/28/2017 14:26:33 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PNS]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRESTAMO]'))
ALTER TABLE [dbo].[PRESTAMO]  WITH CHECK ADD  CONSTRAINT [FK_PNS] FOREIGN KEY([NOMBRESUCURSAL])
REFERENCES [dbo].[SUCURSAL] ([NOMBRESUCURSAL])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PNS]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRESTAMO]'))
ALTER TABLE [dbo].[PRESTAMO] CHECK CONSTRAINT [FK_PNS]
GO
/****** Object:  ForeignKey [FK_PID_CID]    Script Date: 07/28/2017 14:26:33 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PID_CID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRESTATARIO]'))
ALTER TABLE [dbo].[PRESTATARIO]  WITH CHECK ADD  CONSTRAINT [FK_PID_CID] FOREIGN KEY([CID])
REFERENCES [dbo].[CLIENTE] ([CID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PID_CID]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRESTATARIO]'))
ALTER TABLE [dbo].[PRESTATARIO] CHECK CONSTRAINT [FK_PID_CID]
GO
/****** Object:  ForeignKey [FK_PRNP_PNP]    Script Date: 07/28/2017 14:26:33 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PRNP_PNP]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRESTATARIO]'))
ALTER TABLE [dbo].[PRESTATARIO]  WITH CHECK ADD  CONSTRAINT [FK_PRNP_PNP] FOREIGN KEY([NUMPRESTAMO])
REFERENCES [dbo].[PRESTAMO] ([NUMPRESTAMO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PRNP_PNP]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRESTATARIO]'))
ALTER TABLE [dbo].[PRESTATARIO] CHECK CONSTRAINT [FK_PRNP_PNP]
GO
/****** Object:  ForeignKey [FK_IID_CID]    Script Date: 07/28/2017 14:26:33 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IID_CID]') AND parent_object_id = OBJECT_ID(N'[dbo].[IMPOSITOR]'))
ALTER TABLE [dbo].[IMPOSITOR]  WITH CHECK ADD  CONSTRAINT [FK_IID_CID] FOREIGN KEY([CID])
REFERENCES [dbo].[CLIENTE] ([CID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_IID_CID]') AND parent_object_id = OBJECT_ID(N'[dbo].[IMPOSITOR]'))
ALTER TABLE [dbo].[IMPOSITOR] CHECK CONSTRAINT [FK_IID_CID]
GO
/****** Object:  ForeignKey [FK_INC_CNC]    Script Date: 07/28/2017 14:26:33 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_INC_CNC]') AND parent_object_id = OBJECT_ID(N'[dbo].[IMPOSITOR]'))
ALTER TABLE [dbo].[IMPOSITOR]  WITH CHECK ADD  CONSTRAINT [FK_INC_CNC] FOREIGN KEY([NUMCUENTA])
REFERENCES [dbo].[CUENTA] ([NUMCUENTA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_INC_CNC]') AND parent_object_id = OBJECT_ID(N'[dbo].[IMPOSITOR]'))
ALTER TABLE [dbo].[IMPOSITOR] CHECK CONSTRAINT [FK_INC_CNC]
GO
/****** Object:  ForeignKey [FK_PP]    Script Date: 07/28/2017 14:26:33 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PP]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAGO]'))
ALTER TABLE [dbo].[PAGO]  WITH CHECK ADD  CONSTRAINT [FK_PP] FOREIGN KEY([NUMPRESTAMO])
REFERENCES [dbo].[PRESTAMO] ([NUMPRESTAMO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PP]') AND parent_object_id = OBJECT_ID(N'[dbo].[PAGO]'))
ALTER TABLE [dbo].[PAGO] CHECK CONSTRAINT [FK_PP]
GO
