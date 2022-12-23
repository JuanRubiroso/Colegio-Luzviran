-- Creacion Base de datos
CREATE DATABASE ColegioDB
GO

-- Uso base de datos
USE ColegioDB
GO

-- Creacion Tabla Alumnos
CREATE TABLE ALUMNO(
	Alumno_ID INT PRIMARY KEY IDENTITY(1,1),
	[Nombre] NVARCHAR(50),
	[Apellido] NVARCHAR(50),
	[Direccion] NVARCHAR(200),
	[FechaNacimiento] DATE,
	[Cedula] NVARCHAR(15),
	[Edad] INT,
	[Telefono] NVARCHAR(25)
);

-- Creacion Tabla Profesores
CREATE TABLE [Profesor] (
  [Profesor_ID] INT PRIMARY KEY IDENTITY(1,1),
  [Nombre] NVARCHAR(50),
  [Apellido] NVARCHAR(50)
);

-- Creacion Tabla Asignaturas
CREATE TABLE [Asignatura] (
  [Asignatura_ID] INT PRIMARY KEY IDENTITY(1,1),
  [Nombre] NVARCHAR(80)
);

-- Creacion Tabla Semestres
CREATE TABLE [Semestre] (
  [Semestre_ID] INT PRIMARY KEY IDENTITY(1,1),
  [Inicio] NVARCHAR(20),
  [Fin] NVARCHAR(20),
  [Abreviacion] NVARCHAR(20)
);

-- Creacion Tabla Secciones
CREATE TABLE [Seccion] (
  [Seccion_ID] INT PRIMARY KEY IDENTITY(1,1),
  [Profesor_ID] INT,
  [Nombre] NVARCHAR(20),
  CONSTRAINT FK_Profesor_Seccion FOREIGN KEY ([Profesor_ID]) REFERENCES Profesor ([Profesor_ID])
);


-- Creacion Tabla Calificaciones
CREATE TABLE [Calificaciones] (
  [Calificacion_ID] INT PRIMARY KEY IDENTITY(1,1),
  [Profesor_ID] INT,
  [Alumno_ID] INT,
  [Asignatura_ID] INT,
  [Seccion_ID] INT,
  [Semestre_ID] INT,
  [Puntaje] INT,
  [Anio] INT,
  CONSTRAINT FK_Calificaciones_Alumno FOREIGN KEY ([Alumno_ID]) REFERENCES Alumno ([Alumno_ID]),
  CONSTRAINT FK_Calificaciones_Profesor FOREIGN KEY ([Profesor_ID]) REFERENCES Profesor ([Profesor_ID]),
  CONSTRAINT FK_Calificaciones_Asignatura FOREIGN KEY ([Asignatura_ID]) REFERENCES Asignatura ([Asignatura_ID]),
  CONSTRAINT FK_Calificaciones_Seccion FOREIGN KEY ([Seccion_ID]) REFERENCES Seccion ([Seccion_ID]),
  CONSTRAINT FK_Calificaciones_Semestre FOREIGN KEY ([Semestre_ID]) REFERENCES Semestre ([Semestre_ID])
);


-- Creacion Tabla Facturaciones
CREATE TABLE [Factura] (
  [Factura_ID] INT PRIMARY KEY IDENTITY(1,1)	,
  [Alumno_ID] INT,
  [Semestre_ID] INT,
  [CantMaterias] INT,
  [Total] MONEY,
  [Anio] INT,
  CONSTRAINT FK_Factura_Alumno FOREIGN KEY ([Alumno_ID]) REFERENCES Alumno ([Alumno_ID]),
  CONSTRAINT FK_Factura_Semestre FOREIGN KEY ([Semestre_ID]) REFERENCES Semestre ([Semestre_ID])
);