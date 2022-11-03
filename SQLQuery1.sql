/*Creacion de las tablas de la base de datos*/
USE InstitutoGenDB
GO

/*1.1 --- Borrado de las tablas para crearlas nuevamente*/
/*Tabla DiagnosticosInformes*/	
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.DiagnosticosInformes') AND type in (N'U'))
	DROP TABLE dbo.DiagnosticosInformes
GO
/*Borra Tabla DiagnosticosConsultas*/	
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.DiagnosticosConsultas') AND type in (N'U'))
	DROP TABLE dbo.DiagnosticosConsultas
GO	
/*Borra Tabla Informes*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Informes') AND type in (N'U'))
	DROP TABLE dbo.Informes
GO
/*Borra Tabla Consultas*/	
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Consultas') AND type in (N'U'))
	DROP TABLE dbo.Consultas
GO	
/*Borra Tabla Medicos*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Medicos') AND type in (N'U'))
	DROP TABLE dbo.Medicos
GO 
/*Borra Tabla Pacientes*/	
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Pacientes') AND type in (N'U'))
	DROP TABLE dbo.Pacientes
GO 
/*Borra Tabla Estudios*/	
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Estudios') AND type in (N'U'))
	DROP TABLE dbo.Estudios
GO	
/*Borra Tabla Medicaciones*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Medicaciones') AND type in (N'U'))
	DROP TABLE dbo.Medicaciones
GO 
/*Borra Tabla Diagn�sticos*/	
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Diagnosticos') AND type in (N'U'))
	DROP TABLE dbo.Diagnosticos
GO	
/*Borra Tabla Tipos de Pacientes*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.TiposDePacientes') AND type in (N'U'))
	DROP TABLE dbo.TiposDePacientes
GO	
/*Borra Tabla Obras Sociales*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.ObrasSociales') AND type in (N'U'))
	DROP TABLE dbo.ObrasSociales
GO		
/*Borra Tabla Localidades*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Localidades') AND type in (N'U'))
	DROP TABLE dbo.Localidades
GO	
/*Borra Tabla Provincia*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Provincias') AND type in (N'U'))
	DROP TABLE dbo.Provincias
GO	

/*1.2 --- Creaci�n de las tablas*/

/*Tabla Provincia*/
CREATE TABLE Provincias( 
	ID int IDENTITY(0,1) NOT NULL,
	DeProvincia nvarchar(20) NULL/*Nombre de la provincia*/
	,CONSTRAINT PK_Provincias PRIMARY KEY NONCLUSTERED (ID)
);
	
/*Tabla Localidades*/
CREATE TABLE Localidades
(	ID int not null,
	ProvinciaID int NOT NULL,/*FK de Provincias*/
	DeLocalidad nvarchar(100) NULL,
	DeCdPostal nvarchar(9) NULL
	,CONSTRAINT PK_Localidades PRIMARY KEY NONCLUSTERED (ID)
	,CONSTRAINT FK_ProvinciasLocalidad  FOREIGN KEY (ProvinciaID)
     REFERENCES Provincias (ID)
);

/*Tabla Obras Sociales*/
CREATE TABLE ObrasSociales( 
	ID int IDENTITY(0,1) NOT NULL,
	DeCodigoObraSocial nvarchar(10) NOT NULL,
	DeObraSocial nvarchar(100)NOT NULL
	,CONSTRAINT PK_ObrasSociales PRIMARY KEY NONCLUSTERED (ID)
);

/*Tabla Tipos de Pacientes*/
CREATE TABLE TiposDePacientes( 
	ID int IDENTITY(0,1) NOT NULL,
	DeTipoPaciente nvarchar(50) NOT NULL
	,CONSTRAINT PK_TiposDePacientes PRIMARY KEY NONCLUSTERED (ID)
);

/*Tabla Diagn�sticos*/
CREATE TABLE Diagnosticos( 
	ID int IDENTITY(0,1) NOT NULL,
	DeCodigoDiagnostico nvarchar(10) NOT NULL,
	DeDiagnostico nvarchar(100) NOT NULL
	,CONSTRAINT PK_Diagnosticos PRIMARY KEY NONCLUSTERED (ID)
);

/*Tabla Medicaciones*/
CREATE TABLE Medicaciones( 
	ID int IDENTITY(0,1) NOT NULL,
	DeMedicacion nvarchar(100) NOT NULL
	,CONSTRAINT PK_Medicaciones PRIMARY KEY NONCLUSTERED (ID)
);

/*Tabla Estudios*/
CREATE TABLE Estudios( 
	ID int IDENTITY(0,1) NOT NULL,
	DeCodigoEstudio nvarchar(10) NOT NULL,
	DeEstudio nvarchar(100) NOT NULL
	,CONSTRAINT PK_Estudios PRIMARY KEY NONCLUSTERED (ID)
);

/*Tabla Pacientes*/
CREATE TABLE Pacientes( 
	ID int IDENTITY(0,1) NOT NULL,
	LocalidadID int NOT NULL, 
	ObraSocialID int NOT NULL, 
	TipoPacienteID int NOT NULL, 
	DeNombre nvarchar(100) NOT NULL,
	DeApellido nvarchar(100) NOT NULL,
	DeDomicilio nvarchar(100) NOT NULL,
	DeTipoDocumento varchar(3) NOT NULL,
	NuDocumento bigint not null,
	FeNacimiento datetime NOT NULL,
	DeSexo nvarchar(1) NOT NULL,
	DeTelefono nvarchar(20) NOT NULL,
	DeCelular nvarchar(20) NOT NULL,
	DeEmail nvarchar(100) NOT NULL,
	FeAlta datetime NOT NULL,
	DeOcupacion nvarchar(100) NOT NULL,
	DeNumeroAfiliado nvarchar(100) NOT NULL	
	,CONSTRAINT PK_Pacientes PRIMARY KEY NONCLUSTERED (ID)
	,CONSTRAINT FK_PacienteLocalidad  FOREIGN KEY (LocalidadID)
     REFERENCES Localidades (ID)
	,CONSTRAINT FK_PacienteObraSocial  FOREIGN KEY (ObraSocialID)
     REFERENCES ObrasSociales (ID)
	,CONSTRAINT FK_PacienteTipoPaciente  FOREIGN KEY (TipoPacienteID)
     REFERENCES TiposDePacientes (ID)
);

/*Tabla Medicos*/
CREATE TABLE Medicos( 
	ID int IDENTITY(0,1) NOT NULL,
	LocalidadID int NOT NULL,
	NuMatricula nvarchar(10)NOT NULL, 
	DeNombre nvarchar(100) NOT NULL,
	DeApellido nvarchar(100) NOT NULL,
	DeDomicilio nvarchar(100) NOT NULL,
	DeTipoDocumento varchar(3) NOT NULL,
	NuDocumento bigint NOT NULL,
	FeNacimiento datetime NOT NULL,
	DeSexo nvarchar(1) NOT NULL,
	DeTelefono nvarchar(20) NOT NULL,
	DeCelular nvarchar(20) NOT NULL,
	DeEmail nvarchar(100) NOT NULL,
	FeAlta datetime NOT NULL,
	DeOcupacion nvarchar(100) NOT NULL,
	DeNumeroAfiliado nvarchar(100) NOT NULL	
	,CONSTRAINT PK_Medicos PRIMARY KEY NONCLUSTERED (ID)
	,CONSTRAINT FK_MedicoLocalidad  FOREIGN KEY (LocalidadID)
     REFERENCES Localidades (ID)
);

/*Tabla Consultas*/
CREATE TABLE Consultas( 
	ID int IDENTITY(0,1) NOT NULL,
	PacienteID int NOT NULL,
	MedicoID int NOT NULL,
	FeConsulta datetime NOT NULL,
	DeAntecedenteEnfermedadActual nvarchar(500) NOT NULL,
	DeMotivoConsulta nvarchar(500) NOT NULL,
	DeExamenFisico nvarchar(500) NOT NULL,
	DeIndicaciones nvarchar(500) NOT NULL,
	DeTratamiento nvarchar(500) NOT NULL
	,CONSTRAINT PK_Consultas PRIMARY KEY NONCLUSTERED (ID)
	,CONSTRAINT FK_ConsultaPaciente  FOREIGN KEY (PacienteID)
     REFERENCES Pacientes (ID)
	,CONSTRAINT FK_ConsultaMedico  FOREIGN KEY (MedicoID)
     REFERENCES Medicos (ID)
);

/*Tabla DiagnosticosConsultas*/
CREATE TABLE DiagnosticosConsultas( 
	DiagnosticoID int NOT NULL,
	ConsultaID int NOT NULL
	,CONSTRAINT PK_DiagnosticosConsultas PRIMARY KEY NONCLUSTERED (DiagnosticoID asc,ConsultaID asc)
	,CONSTRAINT FK_DiagnosticoDiagCons  FOREIGN KEY (DiagnosticoID)
     REFERENCES Diagnosticos (ID)
	,CONSTRAINT FK_ConsultaDiagCons  FOREIGN KEY (ConsultaID)
     REFERENCES Consultas (ID)
);

/*Tabla Informes*/
CREATE TABLE Informes( 
	ID int IDENTITY(0,1) NOT NULL,
	PacienteID int NOT NULL,
	MedicoReferenteID int NOT NULL,
	MedicoTratanteID int NOT NULL,
	MedicoAnestesistaID int NOT NULL,
	EstudioID int NOT NULL,
	MedicacionID int NOT NULL,	
	FeInforme datetime NOT NULL,
	DeMotivoInforme varchar(8000) NOT NULL,
	DeHallazgo varchar(8000) NOT NULL,
	DeEquipoUsado nvarchar(500) NOT NULL,
	DeDescripcionPreparacion nvarchar(500) NOT NULL,
	TiEstado varchar(2) NOT NULL /*podria ser NU(nuevo);TE(terminado)*/
	,CONSTRAINT PK_Informes PRIMARY KEY NONCLUSTERED (ID)
	,CONSTRAINT FK_InformePaciente  FOREIGN KEY (PacienteID)
     REFERENCES Pacientes (ID)
	,CONSTRAINT FK_InformeMedicoReferente  FOREIGN KEY (MedicoReferenteID)
     REFERENCES Medicos (ID)
	,CONSTRAINT FK_InformeMedicoTratante  FOREIGN KEY (MedicoTratanteID)
     REFERENCES Medicos (ID)
	,CONSTRAINT FK_InformeMedicoAnestesista  FOREIGN KEY (MedicoAnestesistaID)
     REFERENCES Medicos (ID)
	,CONSTRAINT FK_InformeEstudio  FOREIGN KEY (EstudioID)
     REFERENCES Estudios (ID)
	,CONSTRAINT FK_InformeMedicacion  FOREIGN KEY (MedicacionID)
     REFERENCES Medicaciones (ID)
);

/*Tabla DiagnosticosInformes*/
CREATE TABLE DiagnosticosInformes( 
	DiagnosticoID int NOT NULL,
	InformeID int NOT NULL
	,CONSTRAINT PK_DiagnosticosInformes PRIMARY KEY NONCLUSTERED (DiagnosticoID asc,InformeID asc)
	,CONSTRAINT FK_DiagnosticoInfCons  FOREIGN KEY (DiagnosticoID)
     REFERENCES Diagnosticos (ID)
	,CONSTRAINT FK_InformeInfCons  FOREIGN KEY (InformeID)
     REFERENCES Informes (ID)
);