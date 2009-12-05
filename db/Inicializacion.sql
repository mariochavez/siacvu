IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
DROP VIEW [dbo].[Usuarios]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[TesisPosgrados]'))
DROP VIEW [dbo].[TesisPosgrados]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CursoInvestigadores]'))
DROP VIEW [dbo].[CursoInvestigadores]
GO

CREATE VIEW Usuarios AS
SELECT     18 AS Id, 'Maria Elena' AS Nombre, 'Melendez' AS ApellidoPaterno, 'Fernandez' AS ApellidoMaterno, 'elena' AS UsuarioNombre, 'elena' AS Clave, 
                      'administrador@colef.mx' AS CorreoElectronico, 'M' AS Sexo, '1975-07-29' AS FechaNacimiento, '2005-11-21' AS FechaIngreso, 0 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     17 AS Id, 'Elvira Gloria' AS Nombre, 'Canales' AS ApellidoPaterno, 'Mapula' AS ApellidoMaterno, 'cintia' AS UsuarioNombre, 'cintia' AS Clave, 
                      'dgaa@colef.mx' AS CorreoElectronico, 'M' AS Sexo, '1987-01-14' AS FechaNacimiento, '1999-03-07' AS FechaIngreso, 0 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     16 AS Id, 'Alfredo' AS Nombre, 'Hualde' AS ApellidoPaterno, 'Alfaro' AS ApellidoMaterno, 'invhualde' AS UsuarioNombre, 'hualde' AS Clave, 
                      'investigador15@colef.mx' AS CorreoElectronico, 'H' AS Sexo, '1970-06-05' AS FechaNacimiento, '2000-04-03' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     15 AS Id, 'Maria del Rocio' AS Nombre, 'Barajas' AS ApellidoPaterno, 'Escamilla' AS ApellidoMaterno, 'invbarajas' AS UsuarioNombre, 
                      'barajas' AS Clave, 'investigador14@colef.mx' AS CorreoElectronico, 'M' AS Sexo, '1970-06-05' AS FechaNacimiento, '2000-04-03' AS FechaIngreso, 
                      1 AS Investigador, 1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     14 AS Id, 'Jorge Agustin' AS Nombre, 'Bustamante' AS ApellidoPaterno, 'Fernandez' AS ApellidoMaterno, 'invbustamante' AS UsuarioNombre, 
                      'bustamante' AS Clave, 'investigador13@colef.mx' AS CorreoElectronico, 'H' AS Sexo, '1970-06-05' AS FechaNacimiento, '2000-04-03' AS FechaIngreso,
                       1 AS Investigador, 1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     13 AS Id, 'Rodolfo' AS Nombre, 'Cruz' AS ApellidoPaterno, 'Piñeiro' AS ApellidoMaterno, 'invcruz' AS UsuarioNombre, 'cruz' AS Clave, 
                      'investigador12@colef.mx' AS CorreoElectronico, 'H' AS Sexo, '1970-06-05' AS FechaNacimiento, '2000-04-03' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     12 AS Id, 'Teresa Elizabeth' AS Nombre, 'Cueva' AS ApellidoPaterno, 'Luna' AS ApellidoMaterno, 'invCueva' AS UsuarioNombre, 'cueva' AS Clave, 
                      'investigador11@colef.mx' AS CorreoElectronico, 'M' AS Sexo, '1970-06-05' AS FechaNacimiento, '2000-04-03' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     11 AS Id, 'Carlos Alfonso' AS Nombre, 'De la Parra' AS ApellidoPaterno, 'Renteria' AS ApellidoMaterno, 'invrenteria' AS UsuarioNombre, 
                      'renteria' AS Clave, 'investigador10@colef.mx' AS CorreoElectronico, 'H' AS Sexo, '1970-06-05' AS FechaNacimiento, '2000-04-03' AS FechaIngreso, 
                      1 AS Investigador, 1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     10 AS Id, 'Laura' AS Nombre, 'Flamand' AS ApellidoPaterno, 'Gomez' AS ApellidoMaterno, 'invflamand' AS UsuarioNombre, 'flamand' AS Clave, 
                      'investigador9@colef.mx' AS CorreoElectronico, 'M' AS Sexo, '1970-06-05' AS FechaNacimiento, '2000-04-03' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     9 AS Id, 'Tonatiuh' AS Nombre, 'Guillén' AS ApellidoPaterno, 'López' AS ApellidoMaterno, 'invguillen' AS UsuarioNombre, 'guillen' AS Clave, 
                      'investigador8@colef.mx' AS CorreoElectronico, 'H' AS Sexo, '1970-06-05' AS FechaNacimiento, '2000-04-03' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     8 AS Id, 'Redi' AS Nombre, 'Gomis' AS ApellidoPaterno, 'Hernández' AS ApellidoMaterno, 'invgomis' AS UsuarioNombre, 'gomis' AS Clave, 
                      'investigador7@colef.mx' AS CorreoElectronico, 'H' AS Sexo, '1970-06-05' AS FechaNacimiento, '2000-04-03' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     7 AS Id, 'Silvia' AS Nombre, 'López' AS ApellidoPaterno, 'Estrada' AS ApellidoMaterno, 'invflamand' AS UsuarioNombre, 'flamand' AS Clave, 
                      'investigador6@colef.mx' AS CorreoElectronico, 'M' AS Sexo, '1970-06-05' AS FechaNacimiento, '2000-04-03' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     6 AS Id, 'Sárah Eva' AS Nombre, 'Martinez' AS ApellidoPaterno, 'Pellégrini' AS ApellidoMaterno, 'invmartinez' AS UsuarioNombre, 'martinez' AS Clave, 
                      'investigador5@colef.mx' AS CorreoElectronico, 'M' AS Sexo, '1970-06-05' AS FechaNacimiento, '2000-04-03' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     5 AS Id, 'Jorge Héctor' AS Nombre, 'Carrillo' AS ApellidoPaterno, 'Viveros' AS ApellidoMaterno, 'invcarrillo' AS UsuarioNombre, 'carrillo' AS Clave, 
                      'investigador4@colef.mx' AS CorreoElectronico, 'H' AS Sexo, '1975-08-25' AS FechaNacimiento, '2002-08-13' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     4 AS Id, 'Sergio' AS Nombre, 'Peña' AS ApellidoPaterno, 'Medina' AS ApellidoMaterno, 'invmedina' AS UsuarioNombre, 'medina' AS Clave, 
                      'investigador3@colef.mx' AS CorreoElectronico, 'H' AS Sexo, '1975-08-25' AS FechaNacimiento, '2002-08-13' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     3 AS Id, 'José María' AS Nombre, 'Ramos' AS ApellidoPaterno, 'Garcia' AS ApellidoMaterno, 'invramos' AS UsuarioNombre, 'ramos' AS Clave, 
                      'investigador2@colef.mx' AS CorreoElectronico, 'H' AS Sexo, '1975-08-25' AS FechaNacimiento, '2002-08-13' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     2 AS Id, 'Gudelia' AS Nombre, 'Rangel' AS ApellidoPaterno, 'Gómez' AS ApellidoMaterno, 'invrangel' AS UsuarioNombre, 'rangel' AS Clave, 
                      'investigador1@colef.mx' AS CorreoElectronico, 'M' AS Sexo, '1975-08-25' AS FechaNacimiento, '2002-08-13' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT	   1 AS Id, 'Administrador' AS Nombre, '' AS ApellidoPaterno, '' AS ApellidoMaterno,
					  'administrador' AS UsuarioNombre, 'password' AS Clave, 'administrador@colef.mx' AS CorreoElectronico,
					  'M' AS Sexo, '1975-07-29' AS FechaNacimiento, '2005-11-21' AS FechaIngreso, 0 AS Investigador, 1 AS Activo,
					  'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'ZXCV456123789TJ' AS CURP, 'ZXCV784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT     50 AS Id, 'Mario' AS Nombre, 'Chavez' AS ApellidoPaterno, 'Cardenas' AS ApellidoMaterno, 'mario.chavez' AS UsuarioNombre, 'password' AS Clave, 
                      'investigador1@colef.mx' AS CorreoElectronico, 'H' AS Sexo, '1975-08-25' AS FechaNacimiento, '2002-08-13' AS FechaIngreso, 1 AS Investigador, 
                      1 AS Activo, 'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'CACM456123789TJ' AS CURP, 'CACM784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
UNION
SELECT	   51 AS Id, 'DGAA' AS Nombre, '' AS ApellidoPaterno, '' AS ApellidoMaterno,
					  'dgaa' AS UsuarioNombre, 'password' AS Clave, 'dgaa@colef.mx' AS CorreoElectronico,
					  'H' AS Sexo, '1987-01-14' AS FechaNacimiento, '1999-03-07' AS FechaIngreso, 0 AS Investigador, 1 AS Activo, 
					  'Conocida' AS Direccion, '664 951 1236' AS Telefono, 'Casado' AS EstadoCivil, 'QWERTY96321' AS DocumentosIdentidad,
					  'CACM456123789TJ' AS CURP, 'CACM784512' AS RFC, 'CELPRO142536' AS CedulaProfesional, 'Mexicana' AS Nacionalidad,
					  'PRT456' AS CodigoRH
GO

--Valores de prueba para la vista de Alumnos
--VinculacionApyDFk 1 => Tesis orientada al Desarrollo Local
--FormaParticipacionFk 1 => Editor
--ProgramaEstudioFk 47 => Ciencias Educativas
--GradoAcademicoFk 1 => Licenciatura
CREATE VIEW TesisPosgrados AS
SELECT		2 AS Id, 'Tesis Posgrado 2' AS Titulo, 'Natalia Zamudio Santos' AS NombreAlumno, 'Feb  2 2009 12:00AM' AS FechaGrado,  
			1 AS VinculacionApyDFk, 1 AS FormaParticipacion, 47 AS ProgramaEstudioFk, 1 AS GradoAcademicoFk, 274 AS InstitucionFk,
			1 AS NivelEstudioFk, 17 AS SectorFk, 108 AS OrganizacionFk , 298 AS Nivel2Fk,1 AS AreaFk, 2 AS DisciplinaFk,
			9 AS SubdisciplinaFk, 2 AS InvestigadorFk
UNION
SELECT		1 AS Id, 'Tesis Posgrado 1' AS Titulo, 'Alejandro Valdéz Ruíz' AS NombreAlumno, 'Feb  2 2009 12:00AM' AS FechaGrado,
			1 AS VinculacionApyDFk, 1 AS FormaParticipacion, 47 AS ProgramaEstudioFk, 1 AS GradoAcademicoFk, 274 AS InstitucionFk,
			1 AS NivelEstudioFk, 17 AS SectorFk, 108 AS OrganizacionFk , 298 AS Nivel2Fk,1 AS AreaFk, 2 AS DisciplinaFk,
			9 AS SubdisciplinaFk, 1 AS InvestigadorFk
GO

--Valores de prueba para la vista de CursosInvestigadores
--ProgramaEstudioFk 47 => Ciencias Educativas
--InstitucionFk 14 => UABC Mexicali
CREATE VIEW CursoInvestigadores AS
SELECT		2 AS Id, 'Teoría económica y regional' AS Nombre, 'Aguilar Benítez Ismael' AS NombreInvestigador, 'Feb  2 2009 12:00AM' AS FechaInicial,
			'Feb  27 2009 12:00AM' AS FechaFinal, 60 AS NumeroHoras, 47 AS ProgramaEstudioFk, 274 AS InstitucionFk, 1 AS NivelEstudioFk,
			17 AS SectorFk, 108 AS OrganizacionFk , 298 AS Nivel2Fk,1 AS AreaFk, 2 AS DisciplinaFk, 9 AS SubdisciplinaFk,
			2 AS InvestigadorFk
UNION
SELECT		1 AS Id, 'Teorías del desarrollo' AS Nombre, 'Martínez Pellégrini Sárah Eva' AS NombreInvestigador, 'Feb  2 2009 12:00AM' AS FechaInicial,
			'Feb  27 2009 12:00AM' AS FechaFinal, 30 AS NumeroHoras, 47 AS ProgramaEstudioFk, 274 AS InstitucionFk, 1 AS NivelEstudioFk,
			17 AS SectorFk, 108 AS OrganizacionFk , 298 AS Nivel2Fk,1 AS AreaFk, 2 AS DisciplinaFk, 9 AS SubdisciplinaFk,
			1 AS InvestigadorFk
GO

INSERT Roles VALUES('Administradores', GETDATE(), GETDATE(), 1, 1, 1)
INSERT Roles VALUES('Investigadores', GETDATE(), GETDATE(), 1, 1, 1)
INSERT Roles VALUES('Dgaa', GETDATE(), GETDATE(), 1, 1, 1)
INSERT Roles VALUES('Jefe Departamento', GETDATE(), GETDATE(), 1, 1, 1)
INSERT Roles VALUES('Departamento de estudios culturales',GETDATE(), GETDATE(), 1, 1, 1)
INSERT Roles VALUES('Departamento de estudios de administración pública',GETDATE(), GETDATE(), 1, 1, 1)
INSERT Roles VALUES('Departamento de estudios de población',GETDATE(), GETDATE(), 1, 1, 1)
INSERT Roles VALUES('Departamento de estudios económicos',GETDATE(), GETDATE(), 1, 1, 1)
INSERT Roles VALUES('Departamento de estudios sociales',GETDATE(), GETDATE(), 1, 1, 1)
INSERT Roles VALUES('Departamento de estudios urbanos y del medio ambiente',GETDATE(), GETDATE(), 1, 1, 1)

INSERT UsuarioRol VALUES(1, 1)
INSERT UsuarioRol VALUES(2, 2)
INSERT UsuarioRol VALUES(3, 2)
INSERT UsuarioRol VALUES(4, 2)
INSERT UsuarioRol VALUES(5, 2)
INSERT UsuarioRol VALUES(6, 2)
INSERT UsuarioRol VALUES(7, 2)
INSERT UsuarioRol VALUES(8, 2)
INSERT UsuarioRol VALUES(9, 2)
INSERT UsuarioRol VALUES(10, 2)
INSERT UsuarioRol VALUES(11, 2)
INSERT UsuarioRol VALUES(12, 2)
INSERT UsuarioRol VALUES(13, 2)
INSERT UsuarioRol VALUES(14, 2)
INSERT UsuarioRol VALUES(15, 2)
INSERT UsuarioRol VALUES(16, 2)
INSERT UsuarioRol VALUES(17, 3)
INSERT UsuarioRol VALUES(18, 1)
INSERT UsuarioRol VALUES(51, 3)
INSERT UsuarioRol VALUES(50, 2)

insert into ConsejoComisiones values('Consejo Académico', 2, 0, GETDATE(), GETDATE(), 1, 1, 1);
insert into ConsejoComisiones values('Comisión Dictaminadora', 2, 1, GETDATE(), GETDATE(), 1, 1, 1);
insert into ConsejoComisiones values('Comisiones Evaluadoras Departamentales', 2, 1, GETDATE(), GETDATE(), 1, 1, 1);
insert into ConsejoComisiones values('Comisiones Académicas de Programas de Posgrado', 2, 1, GETDATE(), GETDATE(), 1, 1, 1);
insert into ConsejoComisiones values('Consejo Editorial', 2, 1, GETDATE(), GETDATE(), 1, 1, 1);
insert into ConsejoComisiones values('Consejo de Biblioteca', 2, 1, GETDATE(), GETDATE(), 1, 1, 1);

insert into AreaInvestigaciones values('Administración Pública',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Antropología',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Arte',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Ciencias de la Información',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Cultura',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Demografía',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Derecho',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Economía',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Educación',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Estudios Agrarios',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Estudios Ambientales',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Estudios Territoriales',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Filosofía y Ciencia',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Geografía',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Historia',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Lengua y Literatura',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Multidisciplinarias (Ciencias Sociales y Humanidades)',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Política',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Psicología',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Relaciones Internacionales',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Salud',GETDATE(), GETDATE(), 1, 1, 1);
insert into AreaInvestigaciones values('Sociología',GETDATE(), GETDATE(), 1, 1, 1);

insert into USEGs values('Cartografía Digital',GETDATE(), GETDATE(), 1, 1, 1);
insert into USEGs values('Geo-Estadística',GETDATE(), GETDATE(), 1, 1, 1);
insert into USEGs values('Análisis Espacial',GETDATE(), GETDATE(), 1, 1, 1);

insert into DirigidoAs values('Empresarios', GETDATE(), GETDATE(), 1, 1, 1)
insert into DirigidoAs values('Estudiantes', GETDATE(), GETDATE(), 1, 1, 1)
insert into DirigidoAs values('Funcionarios', GETDATE(), GETDATE(), 1, 1, 1)
insert into DirigidoAs values('Público en General', GETDATE(), GETDATE(), 1, 1, 1)
insert into DirigidoAs values('Sector Académico', GETDATE(), GETDATE(), 1, 1, 1)
insert into DirigidoAs values('Sector Privado', GETDATE(), GETDATE(), 1, 1, 1)
insert into DirigidoAs values('Sector Público', GETDATE(), GETDATE(), 1, 1, 1)
insert into DirigidoAs values('Sector Social', GETDATE(), GETDATE(), 1, 1, 1)

insert into EstatusFormacionAcademicas values('Crédito terminado',GETDATE(), GETDATE(), 1, 1, 1);
insert into EstatusFormacionAcademicas values('Grado obtenido',GETDATE(), GETDATE(), 1, 1, 1);
insert into EstatusFormacionAcademicas values('Truncado',GETDATE(), GETDATE(), 1, 1, 1);
insert into EstatusFormacionAcademicas values('En proceso',GETDATE(), GETDATE(), 1, 1, 1);

insert into ActividadPrevistas values('Taller',GETDATE(), GETDATE(), 1, 1, 1);
insert into ActividadPrevistas values('Seminario',GETDATE(), GETDATE(), 1, 1, 1);
insert into ActividadPrevistas values('Diplomado',GETDATE(), GETDATE(), 1, 1, 1);
insert into ActividadPrevistas values('Otro',GETDATE(), GETDATE(), 1, 1, 1);

insert into ImpactoPoliticaPublicas values('Elaboración de Diagnóstico',GETDATE(), GETDATE(), 1, 1, 1);
insert into ImpactoPoliticaPublicas values('Elaboración de Plan Estratégico',GETDATE(), GETDATE(), 1, 1, 1);
insert into ImpactoPoliticaPublicas values('Diseño de Programa',GETDATE(), GETDATE(), 1, 1, 1);
insert into ImpactoPoliticaPublicas values('Diseño de Estrategias',GETDATE(), GETDATE(), 1, 1, 1);
insert into ImpactoPoliticaPublicas values('Evaluación de Política',GETDATE(), GETDATE(), 1, 1, 1);
insert into ImpactoPoliticaPublicas values('Evaluación de Impacto',GETDATE(), GETDATE(), 1, 1, 1);
insert into ImpactoPoliticaPublicas values('Otro',GETDATE(), GETDATE(), 1, 1, 1);

insert into Monedas values('Pesos',GETDATE(), GETDATE(), 1, 1, 1);
insert into Monedas values('Dolares',GETDATE(), GETDATE(), 1, 1, 1);

insert into ProductoAcademicos values('Libro',GETDATE(), GETDATE(), 1, 1, 1);
insert into ProductoAcademicos values('Capítulo en libro',GETDATE(), GETDATE(), 1, 1, 1);
insert into ProductoAcademicos values('Artículo',GETDATE(), GETDATE(), 1, 1, 1);
insert into ProductoAcademicos values('Ponencia',GETDATE(), GETDATE(), 1, 1, 1);
insert into ProductoAcademicos values('Tesis de maestría',GETDATE(), GETDATE(), 1, 1, 1);
insert into ProductoAcademicos values('Tesis de doctorado',GETDATE(), GETDATE(), 1, 1, 1);

insert into ProductoDerivados values('Con arbitraje',GETDATE(), GETDATE(), 1, 1, 1);
insert into ProductoDerivados values('Sin arbitraje',GETDATE(), GETDATE(), 1, 1, 1);

insert into TipoEstancias values('Académica',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoEstancias values('Sabática',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoEstancias values('Postdoctoral',GETDATE(), GETDATE(), 1, 1, 1);

insert into Convenios values('Centro de Investigación Científica y de Educación Superior de Ensenada',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Centro de Investigación y Desarrollo Tecnológico en Electroquímica',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Consejo Latinoamericano de Ciencias Sociales',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('El Colegio de México',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('El Colegio de Tlaxcala',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Facultad Latinoamericana de Ciencias Sociales',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Asociación Nacional de Universidades e Institutos de Educación  Superior',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Centro de Estudios de Política Comparada, A.C.',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Centro de Investigación en Materiales Avanzados',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Centro Pedagógico de Sonora',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Centro de Investigación y Estudios Superiores en Antropología Social',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('El Colegio de la Frontera Sur',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('El Colegio de Michoacán',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('El Colegio Mexiquense',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Institut Francais de Recherche Scientifique pour le Developpement en Cooperation',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Instituto de Investigaciones Dr. José María Luis Mora',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Southwest Center for Environmental Research and Policy',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Universidad Autónoma de Coahuila',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Centro de Investigación en Alimentación y Desarrollo',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Centro de Investigaciones Biológicas del Noroeste',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Centro de Investigación Científica de Yucatán',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Centro de Investigación en Matemáticas',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Centro de Investigaciones en Óptica',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Instituto de Ecología',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Instituto Nacional de Astrofísica, Óptica y Electrónica',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Instituto Potosino de Investigación Científica y Tecnológica',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Centro de Investigación y Docencia Económicas A. C.',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('Centro de Investigación en Geografía y Geomática Ing. Jorge L. Tamayo',GETDATE(), GETDATE(), 1, 1, 1);
insert into Convenios values('El Colegio de San Luis',GETDATE(), GETDATE(), 1, 1, 1);

insert into TipoProyectos values('Consultoría',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoProyectos values('Investigación',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoProyectos values('Planes de trabajo',GETDATE(), GETDATE(), 1, 1, 1);

insert into IdentificadorLibros values('Publicado',GETDATE(), GETDATE(), 1, 1, 1);
insert into IdentificadorLibros values('Editado',GETDATE(), GETDATE(), 1, 1, 1);
insert into IdentificadorLibros values('Traducido',GETDATE(), GETDATE(), 1, 1, 1);
insert into IdentificadorLibros values('Compilación',GETDATE(), GETDATE(), 1, 1, 1);

insert into Proyectos values('El asma in Tijuana: multiple medical systems (El asma en Tijuana: múltiples sistemas médicos)',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Trayectoria del crecimiento urbano y evaluación de la planeación en ciudades intermedias de la frontera norte de México: Piedras Negras, Matamoros y Reynosa',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('La reforma municipal en México. Agenda para una reforma legislativa',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Prevención y oportuna detección de cáncer cervicouterino para las mixtecas migrantes de Oaxaca a Baja California',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Antropología del arte indígena transfronterizo. La identidad estético religiosa en la ritualidad contemporánea',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Un análisis comparativo de la interacción en los corredores fronterizos Vancouver-Seatle y San Diego-Tijuana',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Los que no se rindieron: las actividades revolucionarias magonistas en la region fronteriza México-Estados Unidos, 1910-1913',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Identidad, racismos y estereotipos en la frontera México-Estados Unidos',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('United State-Mexico border communities in the Nafta Era',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('El papel de las normas ambientales  y las estretegias competitivas en el cuidado ambiental  de la industria en México.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Hacia una política de articulación entre los perfiles educativos  y las necesidades del desarrollo regional. (Etapa III)',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Las remesas de migrantes mexicanos en Estados Unidos y su impacto en la economía mexicana',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Estudio demográfico retrospectivo: movilidad, empleo y familia en México.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('El envejecimiento en México: la siguiente crisis de la transición demográfica',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Condiciones de salud y bienestar de la población envejecida en la Ciudad de México.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Uso y significado de la casa como lugar de trabajo y relaciones de género en trabajadores por cuenta propia en el hogar de Tijuana',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Migración, empleo y vivienda en los municipios y condados de la frontera internacional Estados Unidos-México',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Programa de salud reproductiva',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Construyendo através de las fronteras:  consolidación del consorcio transfronterizo para la acción y la investigación sobre género y salud reproductiva en la frontera México-Estados Unidos',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Grupo de intercambio académico sobre salud reproductiva',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Migración internacional, riesgos asociados al cruce de la frontera y programas locales de ayuda al migrante.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Encuesta sobre Migración en la Frontera Norte de México (Fase V)',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Estudio para impulsar el mejoramiento de la calidad del empleo en la industria maquiladora de exportación.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Inmigración laboral de latinoamérica en España: sectores de ocupación, perfiles  y redes sociales.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('La transformación de la industria automotriz y del vestido: comparación entre México, Estados Unidos y Canadá.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Integración norteamericana y desarrollo: impactos del tratado de libre comercio en la reestructuración industrial y el empleo.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Producción de computadoras personales en México y su articulación con la producción global: una valoración de su estado actual y su futuro potencial.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Desarrollo del internet y el ecomercio en México',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Migración y religión: análisis de la relación entre las afiliaciones religiosas y la redefinición identitaria de los migrantes mexicanos en el Sur de California',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Actualización del módulo urbano del programa regional de desarrollo del corredor costero Tijuana-Ensenada',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Uso y manejo sustentable del agua en el medio urbano de la frontera norte de México',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Turismo, migración y empleo en el municipio de playas de Rosarito, B.C.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Planeación de una estrategia de desarrollo sustentable para las comunidades locales en la reserva de la biósfera el Pinacate y el gran Desierto del Altar.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Elaboración-reformulación del Plan de Desarrollo Urbano en  Nuevo Laredo',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('La movilidad laboral geográfica como recurso social en la cuenca carbonífera de Coahuila.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Un grito silenciado: mujer madre en la frontera Este Méxicoamericana',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Apostando a un sueño: la experiencia de las mujeres que van a parir a Estados Unidos',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Crecimiento, planeación y gestión urbana de dos metrópolis del Noreste. Hacia un modelo alternativo  para Monterrey y Saltillo.',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Estudio comparativo de la urbanización popular en ciudades de la frontera tamaulipeca',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Zonas de alto riesgo, regeneración urbana y reactivación social: la zona poniente de Cd. Juárez, de cara a los retos de competitividad internacional del centro urbano',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)
insert into Proyectos values('Estudio de opinión pública en Ojinaga Chihuahua',0,GETDATE(),GETDATE(),GETDATE(),0,GETDATE(),0,null,null,null,null,null,null,null,0,GETDATE(),0,null,0,GETDATE(),GETDATE(),1,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,1,1)

insert into Paises values('México', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('España', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Estados Unidos', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Canada', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Venezuela', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Japón', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Francia', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Colombia', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Costa Rica', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Cuba', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Italia', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Argentina', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Brasil', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Uruguay', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Panama', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Guatemala', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Honduras', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Alemania', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Turquía', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('El Salvador', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Gran Bretaña', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('China', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Inglaterra', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Tunicia', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Egipto', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Bulgaria', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Puerto Rico', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Holanda', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Ecuador', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Suiza', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('India', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Suecia', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('República Dominicana', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Hawaii', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Irlanda', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Chile', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Bélgica', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Reino Unido', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Bolivia', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Eslovaquia', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('República Checa', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Portugal', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Filipinas', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Marruecos', GETDATE(), GETDATE(), 1, 1, 1)
insert into Paises values('Nigeria', GETDATE(), GETDATE(), 1, 1, 1)

-- 1=Mexico 3=Estados Unidos
insert into EstadoPaises values('Aguascalientes',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Baja California Norte',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Baja California Sur',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Campeche',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Chihuahua',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Chiapas',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Coahuila',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Colima',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Distrito Federal',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Durango',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Estado de México',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Guerrero',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Guanajuato',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Hidalgo',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Jalisco',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Michoacán',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Morelos',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Nayarit',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Nuevo León',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Oaxaca',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Puebla',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Querétaro',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Quintana Roo',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Sinaloa',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('San Luis Potos',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Sonora',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Tabasco',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Tamaulipas',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Tlaxcala',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Veracruz',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Yucatán',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Zacatecas',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into EstadoPaises values('Samoa Americana',GETDATE(), GETDATE(), 1, 3, 1, 1);
insert into EstadoPaises values('California',GETDATE(), GETDATE(), 1, 3, 1, 1);
insert into EstadoPaises values('Colorado',GETDATE(), GETDATE(), 1, 3, 1, 1);
insert into EstadoPaises values('Florida',GETDATE(), GETDATE(), 1, 3, 1, 1);
insert into EstadoPaises values('Georgia',GETDATE(), GETDATE(), 1, 3, 1, 1);
insert into EstadoPaises values('Hawaii',GETDATE(), GETDATE(), 1, 3, 1, 1);
insert into EstadoPaises values('Kansas',GETDATE(), GETDATE(), 1, 3, 1, 1);

insert into MedioImpresos values('Periódico',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioImpresos values('Tabloide',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioImpresos values('Revista',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioImpresos values('Otro',GETDATE(), GETDATE(), 1, 1, 1);

insert into MedioElectronicos values('Radio',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioElectronicos values('Televisión',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioElectronicos values('Internet',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioElectronicos values('Video',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioElectronicos values('Otro',GETDATE(), GETDATE(), 1, 1, 1);

insert into Generos values('Entrevista',GETDATE(), GETDATE(), 1, 1, 1);
insert into Generos values('Columna',GETDATE(), GETDATE(), 1, 1, 1);
insert into Generos values('Artículo',GETDATE(), GETDATE(), 1, 1, 1);
insert into Generos values('Comentario',GETDATE(), GETDATE(), 1, 1, 1);
insert into Generos values('Mesa de análisis',GETDATE(), GETDATE(), 1, 1, 1);
insert into Generos values('Otro',GETDATE(), GETDATE(), 1, 1, 1);

insert into Ambitos values('Internacional',GETDATE(), GETDATE(), 1, 1, 1);
insert into Ambitos values('Binacional',GETDATE(), GETDATE(), 1, 1, 1);
insert into Ambitos values('Nacional/Federal',GETDATE(), GETDATE(), 1, 1, 1);
insert into Ambitos values('Regional',GETDATE(), GETDATE(), 1, 1, 1);
insert into Ambitos values('Estatal',GETDATE(), GETDATE(), 1, 1, 1);
insert into Ambitos values('Local/Municipal',GETDATE(), GETDATE(), 1, 1, 1);

insert into TipoOrganos values('Comité de Evaluación (CONACyT)',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoOrganos values('Consejo Editorial',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoOrganos values('Comités Evaluadores (Premios)',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoOrganos values('Consejos (Consultivos)',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoOrganos values('Comisiones',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoOrganos values('Comités (Sub-Comités)',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoOrganos values('Grupos de trabajo',GETDATE(), GETDATE(), 1, 1, 1);

insert into TipoDictamenes values('Artículo',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoDictamenes values('Libro',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoDictamenes values('Proyecto de investigación CONACyT',GETDATE(), GETDATE(), 1, 1, 1);

insert into TipoDistinciones values('Reconocimientos',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoDistinciones values('Premios',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoDistinciones values('Becas para estancias académicas',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoDistinciones values('Cátedras académicas/Patrimoniales',GETDATE(), GETDATE(), 1, 1, 1);

insert into TipoEventos values('Evento Estratégico (El Colef)',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoEventos values('Congreso',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoEventos values('Coloquio',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoEventos values('Foro',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoEventos values('Conferencia',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoEventos values('Simposium',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoEventos values('Seminario',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoEventos values('Taller',GETDATE(), GETDATE(), 1, 1, 1);

insert into TipoFinanciamientos values('Fiscal',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoFinanciamientos values('Complementario',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoFinanciamientos values('Financiamiento externo',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoFinanciamientos values('Mixto',GETDATE(), GETDATE(), 1, 1, 1);

--Sector financiamiento = 2
insert into Sectores values('Gobierno federal', null, 2,GETDATE(), GETDATE(), 1, 1, 1);
insert into Sectores values('Gobierno estatal', null, 2,GETDATE(), GETDATE(), 1, 1, 1);
insert into Sectores values('Gobierno municipal', null, 2,GETDATE(), GETDATE(), 1, 1, 1);
insert into Sectores values('Gubernamental binacional', null, 2,GETDATE(), GETDATE(), 1, 1, 1);
insert into Sectores values('Fondos CONACyT', null, 2,GETDATE(), GETDATE(), 1, 1, 1);
insert into Sectores values('UC-MEXUS/CONACyT', null, 2,GETDATE(), GETDATE(), 1, 1, 1);
insert into Sectores values('Académico interinstitucional', null, 2,GETDATE(), GETDATE(), 1, 1, 1);
insert into Sectores values('Fundaciones', null, 2,GETDATE(), GETDATE(), 1, 1, 1);
insert into Sectores values('Sociedad Civil Organizada', null, 2,GETDATE(), GETDATE(), 1, 1, 1);
insert into Sectores values('Privado', null, 2,GETDATE(), GETDATE(), 1, 1, 1);
--Sector Organo Externo = 3
insert into Sectores values('Académico (Educación Superior)', null, 3,GETDATE(), GETDATE(), 1, 1, 1);
insert into Sectores values('Gubernamental/Público', null, 3,GETDATE(), GETDATE(), 1, 1, 1);
insert into Sectores values('Social', null, 3,GETDATE(), GETDATE(), 1, 1, 1);
insert into Sectores values('Privado', null, 3,GETDATE(), GETDATE(), 1, 1, 1);

insert into Departamentos values('Departamento de Estudios Culturales',GETDATE(), GETDATE(), 1, 1, 1);
insert into Departamentos values('Departamento de Estudios de Administración Pública',GETDATE(), GETDATE(), 1, 1, 1);
insert into Departamentos values('Departamento de Estudios de Población',GETDATE(), GETDATE(), 1, 1, 1);
insert into Departamentos values('Departamento de Estudios Económicos',GETDATE(), GETDATE(), 1, 1, 1);
insert into Departamentos values('Departamento de Estudios Sociales',GETDATE(), GETDATE(), 1, 1, 1);
insert into Departamentos values('Departamento de Estudios Urbanos y del Medio Ambiente',GETDATE(), GETDATE(), 1, 1, 1);

insert into Estados values('Activo',GETDATE(), GETDATE(), 1, 1, 1);
insert into Estados values('Sabático',GETDATE(), GETDATE(), 1, 1, 1);
insert into Estados values('Licencia c/ sueldo',GETDATE(), GETDATE(), 1, 1, 1);
insert into Estados values('Licencia s/ sueldo',GETDATE(), GETDATE(), 1, 1, 1);
insert into Estados values('Superación académica',GETDATE(), GETDATE(), 1, 1, 1);
insert into Estados values('Baja',GETDATE(), GETDATE(), 1, 1, 1);

insert into GradoAcademicos values('Licenciatura',GETDATE(), GETDATE(), 1, 1, 1);
insert into GradoAcademicos values('Maestría',GETDATE(), GETDATE(), 1, 1, 1);
insert into GradoAcademicos values('Doctorado',GETDATE(), GETDATE(), 1, 1, 1);

insert into Categorias values('Titular A',GETDATE(), GETDATE(), 1, 1, 1);
insert into Categorias values('Titular B',GETDATE(), GETDATE(), 1, 1, 1);
insert into Categorias values('Titular C',GETDATE(), GETDATE(), 1, 1, 1);
insert into Categorias values('Asociado A',GETDATE(), GETDATE(), 1, 1, 1);
insert into Categorias values('Asociado B',GETDATE(), GETDATE(), 1, 1, 1);
insert into Categorias values('Asociado C',GETDATE(), GETDATE(), 1, 1, 1);

insert into Puestos values('Investigador',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Presidente',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Secretario General Académico',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Secretario General de Planeación y Desarrollo Institucional',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Director General de Vinculación Institucional',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Director General de Asuntos Académicos',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Director General Regional Noreste',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Director General de Docencia',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Director Regional Noroeste ',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Director del Departamento de Estudios de Administración Pública',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Director del Departamento de Estudios Culturales',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Director del Departamento de Estudios Económicos',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Director del Departamento de Estudios Sociales',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Director del Departamento de Estudios de Población ',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Director del Departamento de Estudios Urbanos y del Medio Ambiente',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Coordinador del Doctorado en Ciencias Sociales',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Coordinador de la Maestría en Desarrollo Regional ',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Coordinador de la Maestría en Demografía',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Coordinador de la Maestría en Economía Aplicada',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Coordinador de la Maestría en Administración Integral y del Medio Ambiente',GETDATE(), GETDATE(), 1, 1, 1);
insert into Puestos values('Coordinador de la Maestría en Estudios Socioculturales',GETDATE(), GETDATE(), 1, 1, 1);


insert into SNIs values('No pertenece',GETDATE(), GETDATE(), 1, 1, 1);
insert into SNIs values('Candidato',GETDATE(), GETDATE(), 1, 1, 1);
insert into SNIs values('Nivel 1',GETDATE(), GETDATE(), 1, 1, 1);
insert into SNIs values('Nivel 2',GETDATE(), GETDATE(), 1, 1, 1);
insert into SNIs values('Nivel 3',GETDATE(), GETDATE(), 1, 1, 1);
insert into SNIs values('Emerito',GETDATE(), GETDATE(), 1, 1, 1);

insert into Indices values('Indice Revistas CONACyT','Índice de Revistas Mexicanas de Investigación Científica y Tecnológica (CONACyT)',GETDATE(), GETDATE(), 1, 1, 1);
insert into Indices values('CLASE','Citas Latinoamericanas en Ciencias Sociales y Humanidades',GETDATE(), GETDATE(), 1, 1, 1);
insert into Indices values('Red ALyC','Red de Revistas Científicas de América Latina y El Caribe',GETDATE(), GETDATE(), 1, 1, 1);
insert into Indices values('Latindex','Sistema Regional para Revistas Científicas de América Latina, El Caribe, España y Portugal',GETDATE(), GETDATE(), 1, 1, 1);
insert into Indices values('HAPI','Hispanic American Periodicals Index',GETDATE(), GETDATE(), 1, 1, 1);
insert into Indices values('CSA','Cambridge Scientific Abstracts',GETDATE(), GETDATE(), 1, 1, 1);
insert into Indices values('HLAS','Hand Book of Latin American Studies',GETDATE(), GETDATE(), 1, 1, 1);
insert into Indices values('LANIC','Latin American Network Information Center',GETDATE(), GETDATE(), 1, 1, 1);
insert into Indices values('LADB','Latin America Data Base (Universidad de Nuevo México)',GETDATE(), GETDATE(), 1, 1, 1);
insert into Indices values('IRESIE','Indice de Revistas de Educación Superior e Investigación Educativa',GETDATE(), GETDATE(), 1, 1, 1);
insert into Indices values('HELA','Hemeroteca Latinoamericana',GETDATE(), GETDATE(), 1, 1, 1);
insert into Indices values('Otro', null,GETDATE(), GETDATE(), 1, 1, 1);
insert into Indices values('Sin índice', null,GETDATE(), GETDATE(), 1, 1, 1);

insert into Instituciones values('Universidad Externado de Colombia',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Ayuntamiento de Matamoros',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('DIF Matamoros',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Casa de las Culturas del Mundo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Mexicano de la Juventud',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro Universitario de Ciencias Sociales y Humanidades. Universidad de Guadalajara',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto de Investigaciones Jurídicas de la UNAM',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Organización Jóvenes Demócratas',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Producen',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fuerza Aerea de Chile',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Secretaría  Plan del Desarrollo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('UAM-Iztapalapa',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CEISAL',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('UABC MEXICALI',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1, 1,null,null,null, 1, 1);
insert into Instituciones values('Universidad Nacional Autónoma de México',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de York',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma Metropolitana - Azcapotzalco',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CREDAL',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SOMDE, CONAPO, CRIM, UNFPA',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Organización Política Alemana Jóvenes Demócratas',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Veracruzana',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Michoacana de San Nicolás de Hidalgo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Asociación Mexicana de Estudios del Trabajo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Banco Interamericano de Desarrollo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Tecnologico de Piedras Negras',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Tecnológica Centroamericana (Honduras)',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('The University of Califronia and The COLEF',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de California',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('University of East Anglia G.B.',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SOMEE (Sociedad Mexicana de Estudios Electorales)',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('REVES 15, Universidad de Guadalajara y COLEF',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('The University of the Texas at Austin',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Random House Mondadori',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Raya en el Agua',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Culturas Populares del ICBC',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Latin American Studies Association',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Sonora',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de Investigación en Alimentación y Desarrollo (CIAD)',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('UIA-Noroeste, El COLEF, CETYS, DIF- municipal, CSPP, Alliant University Children s Hospital',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Suth western College',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Asociación Latino-Iberoamericana de Gestión Tecnológica',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Colegio de Michoacán',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Planned Parethood, Instituto nacional de la mujer y COLEF',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Planned parenthood, de San Diego  Instituto estatal de la mujer de BC y COLEF',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Plan Estratégico de Ciudad Juárez',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de Estudios Culturales. Museo UABC',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('University Galery',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('IMAFED',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Georgetown University, Washington, DC, Estados Unidos',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad La Sapienza, Roma',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Maestría en Estudios Latinoamericanos',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Tecnológico de Estudios Superiores de Occidente',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Tecnológico y de Estudios Superiores de Occidente',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('XVII Ayuntamiento de Tijuana',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CEPAL-CELADE',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('La Comisión de Cooperación Laboral',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Gobierno de Italia',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidada de Guadalajara',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Pedagógica Nacional',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('El Colegio de México',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Nacional de Salud Pública',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Red Internacional  de Colaboración en las Ciencias del Comportamiento',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Iberoamericana Noroeste',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Southwestem College',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fundación Mexicana de la Salud',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Zacatecas',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Iberoamericana Noroeste en colaboración con El Colef',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto de Investigaciones Dr. José María Luis Mora',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Organización de Estados Iberamericanos',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma de Baja California Sur',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Scalabrini House of Theology',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('El Colegio de Tamaulipas',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro Panamericano de Humanidades',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad del Noreste de México',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro Comunitario de Salud Mental de Regla',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Whittir College',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Comisión para Prevenir y Erradicar la Violencia Contra las Mujeres en Ciudad Juárez',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Weatherhead Center Harvard University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Redlands',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma de chihuahua',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Sociedad Cubana de Psiquiatría',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Foro Migraciones',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universite de Nice-Sophia Antipolis',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto de Administración Pública del Estado de Quintana Roo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de Estudios Universitarios Xochicalco',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Comisión Ciudadana de Derechos Humanos Noroeste A.C.',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Secretaría de Salud',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma de Yucatán',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Red Internacional de Investigadores en Ciencias Sociales y Humanas',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('ENLACE',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de Estudios Superiores del Noroeste',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de la Habana',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro Interamericano de Estudios de Seguridad Social',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de La Laguna, Tenerife, España',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de Investigacines Biológicas del Noroeste',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Trakya University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('San Diego Natural History Museum',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de Enseñanza Técnica y Superior',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Politécnico Nacional',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Université de Poitiers',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('El Colegio de San Luis',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Université d Orléans',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma del Estado de Hidalgo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('University San Diego',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Consulado de los Estados Unidos',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('University of Pittsburgh',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de Investigación y Estudios Avanzados-IPN',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Complutense de Madrid',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Milán',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Sin Fronteras',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Rey Juan Carlos',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Woodrow Wilson Center',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Murcia',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma de Madrid',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('COLEF-UABC',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Écoles des Hautes Études en Sciences Sociales (EHESS). Université de Paris, Sorbonne',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fondo de las Naciones Unidas para la Infancia (UNICEF',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('El Colef, UABC, Universidad de California San Diego, Universidad Estatal de San Diego',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Woodbury University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Latina de Panamá',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Comisión Interamericana de Mujeres',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('University of Essex',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Seminario Mayor de Nuevo Laredo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Mexicano de Doctrina Social',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro Fronterizo de Promoción de Derechos Humanos A.C.',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fundación para el Debido Proceso Legal',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro Nacional para Tribunales Estatales',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Secretaría de Relaciones Exteriores',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Comisión Internacional de Límites y Aguas entre México y Estados Unidos',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Coalición Pro Defensa del Migrante',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Michoacana de San Nicolás Hidalgo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Washington',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Queretaro',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Rural Services Research Institute',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Cristóbal Colon',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Comisión Económica para América Latina-México',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Institut National de Etude Demogaphiques',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Secretaría de la Comisión de Población',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Sin Fronteras, A.C',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Asuntos Migratorios de la LIX Legislatura de la Cámara de Diputados',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('University of  California, San Diego',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad del Caribe',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Museo de Historia Mexicana',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Consejo Nacional para Prevenir la Discriminación',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('La Comisión Coordinadora y las Instituciones Convocantes',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Sonora, UAS,  UABC, Centro de Investigación en Alimentación y Desarrollo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Deutscher Akademischer Austauschdienst Servicio Alemán  de Intercambio Académico',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('University of Skovde',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Nacional de Antropología e Historia',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universitat de Valencia',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Facultad de Psicología Universidad de la Habana',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto de Investigación e Inversión estrategica del Gobierno de Guanajuato',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Francisco Gavidia',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de Referencia Latinoamericano para la Educación Especial',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad UNIVER Noroeste',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Tijuana',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universite de Toulouse',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Tecnológico de Ciudad Juárez',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Xochicalco',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Iowa States University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma del Estado de Morelos',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Gobierno del Estado de Coahuila',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Medical School',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Red de Salud de las Mujeres Latinoamericanas y del Caribe',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Observatorio Ciudadano del Feminicidio',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Valencia',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Michoacana del Oriente',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Tecnológico de Monterrey',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de Investigaciones y Estudios Superiores en Antropología Social',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('East Carolina University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Ayuntamiento de Nuevo Laredo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Ayuntamiento de Tijuana',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Barton Aschman Associates',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CECUT',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CESPT',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CICESE',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CIESAS',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CNIME',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('COLMEX',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CONACYT',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SIREYES',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CONAGUA',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CONAPO',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('COPARMEX',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CUT',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('FLACSO-Guatemala',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Ford Foundation',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('FOSIMAC',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('FOSIREYES',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('FOSIVILLA',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fundación Friedrich Ebert',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Gobierno del Estado SCT',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Gobierno del Estado de Chihuahua',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Federal Electoral',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('INEGI',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Tecnológico de la Paz',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('ITPN',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('ISSSTE',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Medicina Social Comunitaria',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('New Mexico State University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SEMARNAP',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Nacional de Ecología',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SDSU',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SEBS',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SEDESOL',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SRE',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('STPS',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SOMEDE',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('TAMIU',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('UABC',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma de Coahuila',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('UABCS',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Colima',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autonoma Metropolitana Iztapalapa',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('UIA - Noroeste',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('WWU',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SFU',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Nacional de Migración',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Secretaria de Comercio',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma de Guadalajara',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma de Ciudad Juárez',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('S.E.P.',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CREA',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Guadalajara',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('XIII Ayuntamiento de Mexicali',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma de Nuevo León',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fondo de Cultura Económica',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Miguel Ángel Porrúa',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('UNAM',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('El Colmex',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Secretaría del Trabajo y Previsión Social',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Consejo Nacional de Población',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Asociacón Latinoamericana de Sociología',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('ORSTOM',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Consejo Estatal de Población de Oaxaca',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('ITESO',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Chicana/Latina Research Center-UCD',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Plaza y Valdez',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Iberoamericana',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Programa Cultural de las Fronteras',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Conaculta',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('IRD',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Wisconsin',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Iberomericana Santa Fé',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Consorcio transfronterizo de investigación en Acción',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de investigación y Docencia Económica',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('University of Texas',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fundación Rockefeler',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fondo Nacional para la Cultura y las Artes',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Procuraduría Federal de Protección al Ambiente',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Consejo de Desarrollo Económico de Tijuana',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Organización Panamericana de la Salud Ely Lilly',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Programa Interdisciplinario de Estudios de la Mujer (PIEM)',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fundación Mac Arthur',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Secretaría de Gobernación',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('UC Mexus',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SAHOPE',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('University of Southern California',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Comisión de Cooperación Ambiental México-Estados Unidos',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Sistema de Investigación Francisco Villa',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Comisión de Cooperación Económica Fronteriza (COCEF)',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Organización Franco y Asociados',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Municipio de Juarez, Chihuahua',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Junta Municipal de Agua y Saneamiento',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SIMAC',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('University of California, in Santa Cruz, Ca.',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Parsons Transportation Group',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Colegio de Postgraduados',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('COESPO-GUANAJUATO',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('HEWLETT FOUNDATION',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('USC',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('AIDS RESEARCH PROGRAM',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('USAID',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('El Colef',null,null,null,null,null,null,1,'Tijuana',GETDATE(), GETDATE(),1,1,2,null,null, 1, 1);
insert into Instituciones values('Comisión de Cooperación Ecologica',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('The Border Studies Program',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Secretaría de Energía de la Federación',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Institut De Recherche Pour Le Development',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Compton Foundation',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('San Diego State University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('International Community Foundation',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('COESPO ( SONORA )',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Baker & Associates, energy Consultants',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Nacional de Nutrición',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CDT de Tecate',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fundación El Colef',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Municipio de San Pedro Garza Garcia Nuevo León',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('El Colegio Mexiquense',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Mexicano de Seguro Social',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Environmental Resources Management',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Camp Dresser & Mckee Inc.',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fideicomiso',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Subsecretaria de asuntos religiosos en la Sec. de Gobernación',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('SEMPRA ENERGY MEXICO',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Dir. Gral. Finanzas del Gobierno de Chihuahua',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Estatal de Michigan',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Mexicano del Seguro Social',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Cuentas Bancarias',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('FLACSO - MEXICO',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Tecnológico y de Estudios Superiores de Monterrey',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Tecnológica de Matamoros',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro Universitario del Noreste',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Municipal de Planeación',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Comisión para Asuntos de la Frontera Norte',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Archivo General del Estado de Nuevo León',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Texas El Paso',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('UAM',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Secretaría de Desarrollo Urbano y Obras Públicas del Gobierno del Estado de Nuevo León',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Consejo Estatal de Población',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CONARTE',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Otro',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('International Community Foundation San Diego, Ca.',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto de Cultura de Baja California',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Southwestern College',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Pacific Sociological association',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('ITAM',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autonoma de Sinaloa',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('St Josephs Inivercity',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Loyola Marymount University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fairfiled University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('LaSalle University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('John Carrol University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Monterrey',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('El Colegio de Michoacán',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma de Tamaulipas',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Tecnológico de Nuevo Laredo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Interamericana del Norte',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Museo Casamata',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de Investigación en Materiales Avanzados (CIMAV)',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('St. Josephs University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Layola College',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('University  of Notre Dame',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Institut Natinal Du Travail de Emploi et de la formation professionnelle',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma Metropolitana-Xochimilco',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Gabriel Zzekely Sánchez',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Quitar Juarez',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Banco de México',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CIAD',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autonoma del Estado de México',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('INESER',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('El Colegio de Sonora',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Guanajuato',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('nada tijuana',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro Regional de Investigación Multidisciplinaria CRIM',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma de Puebla (UAP)',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('INSP',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('INSAD',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de Estudios México- Estados Unidos',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto de Altos Estudios Internacionales',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Escuela Nacional de Antropología e Historia. Unidad Chihuahua',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Casa del Migrante en Tijuana, Centro Scalabrini',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Colegio de Michoacan',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Planned parethood, Instituto estatal de la mujer  de BC y COLEF',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma de Baja California',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CIDE',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Tijuana Trabaja',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de San Francisco',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Planned parethood de San Diego, Instituto estatal de la mujer de BC y COLEF',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Hosei University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CREDAL, COLEF e ITESM',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Grupo Editorial EON',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autonóma Agraria Antonio Narro (UAAAN)',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('University of California, San Diego (UCSD)',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('The University of California',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('The University of California and El Colegio de la Frontera Norte',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Estatal de San Diego',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Red nacional  de colaboración en las ciencias del comportamiento',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('CETYS-Universidad',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,1,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma de Sinaloa',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Barcelona',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Plaza & Janés',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('IMAC',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Escuela Normal Fronteriza',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('INSITE',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Department of chicana chicano studies',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Harvard University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('UPN',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto Nacional de Desarrollo Social',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('UABC Ensenada',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,1,null,null,null, 1, 1);
insert into Instituciones values('Secretaría de Desarrollo Social',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad de Guadalajara y El COLEF',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Fondo Poblacional de Naciones Unidas',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Universidad Autónoma Metropolitana-Iztapalapa',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Centro de Estudios Estratégicos para el Desarrollo',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('COLEF - CICESE',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Instituto de la Mujer para el Estado de Baja California',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);
insert into Instituciones values('Arizona State University',null,null,null,null,null,null,0,null,GETDATE(), GETDATE(),1,null,null,null,null, 1, 1);

--Tipo participacion capitulos
insert into TipoParticipaciones values('Autor', 1, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Traductor', 1, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Inventor', 1, GETDATE(), GETDATE(), 1, 1, 1);

--Tipo participacion eventos
insert into TipoParticipaciones values('Organizador', 2, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Co-organizador', 2, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Conferencista magistral', 2, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Ponente', 2, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Participante', 2, GETDATE(), GETDATE(), 1, 1, 1);

--Tipo participacion participacion en medios
insert into TipoParticipaciones values('Presentación de libro', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Presentación resultados de investigación', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Periódico/Diario', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Conferencias', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Demostraciones', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Ferias Científicas y Tecnológicas', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Ferias Empresariales', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Medios Impresos', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Radio', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Revistas de Divulgación', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Seminarios', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Simposium', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Talleres', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Teatro', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Televisión', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Video', 3, GETDATE(), GETDATE(), 1, 1, 1);

insert into TipoActividades values('Investigación',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoActividades values('Docencia',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoActividades values('Vinculación',GETDATE(), GETDATE(), 1, 1, 1);

insert into TipoParticipantes values('Persona física',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipantes values('Investigador',GETDATE(), GETDATE(), 1, 1, 1);

/*
insert into InvestigadorExternos values('Acevedo Gladys', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Aceves Calderón Patricia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Adolfo Sánchez Rebolledo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Adrian de León Arias', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Adriana Chávez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('AGERWALD VINOD', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Aguilar Barajas Ismael', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Aguilar Ismael', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Aguilar Villanueva Luis Fernando', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Agustín Sández Pérez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alan R. Sweedler', null, 'Acting Assitant Vice President for  International Programs', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('ALARCÓN DIANA', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Albert Berry', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alberto Palloni', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alberto Palloni', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Albornoz Liliana', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alegre Lisette', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alejandro Canales Cerón', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alejandro Cervantes Carson', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alejandro Diaz Bautista', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alejandro Mungaray', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alejandro Rodríguez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('ALFONSO DIAZ JIMENEZ', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alfonso Macias Laylle', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alfredo Alvarez', null, 'Director General', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alfredo Lattes', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alfredo Limas Hernández', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alicia Maguid', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alicia Ziccandi', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Allen Jedicka', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Alma Rodríguez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Álvarez de la Torre Guillermo Benjamin', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Amelia Malagamba', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('AMEZCUA M.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Amorim Mónica', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Amuedo Dorantes Catalino', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ana Celia Zentella', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ana Leticia Salcedo Rocha', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ana Luz Torres Martínez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ana María López Salas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ana Martínez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Andrea Revueltas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Andrés Lira González', null, 'Presidente', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Andrés Tornos Cubillo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Angel López López', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Angel Ronald', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Angela Renee De la Torre Castellanos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Anne Runyan', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Aparicio Mijares Francisco Javier', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Araceli Mercado', 'relinst@juarez.ciesas.edu.mx', null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Aralia López González', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Arreola Hernández Francisco', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Arroyo Magaña Wendy', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Arturo Lara', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Atsuko Tanabe', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ayllón Trujillo María Teresa', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Azizur R. Khan', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Balbuena Raúl', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Banda Gustavo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Baptista Raúl', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Bárbara A. Driscoll', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Basilia Valenzuela V.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Basilio Verduzco Chávez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('BASSOLS MARIO', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Baudasse Thierry', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Benitez Raúl', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Benítez Raúl', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Bensúnsan Graciela', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Bergareche Ana', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Bernal Guillermo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Bernard Bauer O.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Bernardo de Jesús Saldaña Téllez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Bernardo Flores Báez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Bernardo González Aréchiga', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Bernardo Romero Vázquez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Blackwell Maylei', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Blanca Acedo', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Blanca Lomelí', null, 'Directora', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Blanca Rodríguez', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Brodine Stephanie', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Brown Christopher', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Brown-Gort Allert', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Brugeilles Carole', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Brusati Annalisa', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Bullock Stephen', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('BUNCLE KARIN', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Bustelo Ruesta María', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Caballero Ortega Heriberto', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cabrero Enrique', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cadena Magdalena', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Calderón Chelius Leticia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Caldéron Segura Esther', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Camacho Gonzalo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('CAMERON MAXWELL', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Campos Marcia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Canales Ceron Alejandro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cañedo Solares Irma', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cantú Martínez Pedro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cappello Héctor', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cardona Antonio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Carla Pederzini', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Carlos Graizbord', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Carlos Gutiérrez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Carlos M. Jarque', null, 'Presidente', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Carlos Salazar Silva', null, 'Rector', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Carlos Silva', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Carlos Welti', null, 'Presidente', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Carole Brugeilles', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Carrillo Arturo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('CASASOLA S.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('CASTILLO DEBRA', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('CASTILLO MANUEL ÁNGEL', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Castillo Octelina', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Castro Ceiro Teresa', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Castro Teresa', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Catalina Denman', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cázares Rivera Enrique', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cejudo Guillermo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Celaya Tentori Minerva', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cerutti Mario', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cesar Alfredo Olivas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('César Benítez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('César González González', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Chavez Ana María', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Chávez Galindo Ana María', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Chávez Mauricio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Christian Zlolnisky Palacios', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Christopher Brown', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Claudia Sandoval', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Claudio Mauricio Stern Feiter', null, 'INSTITUCION OMS', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Claudio Mauricio Stern Feitler', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Clemente Ruiz Durán', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Clemente Zúñiga', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Concepción Martínez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Conde Carlos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Conde González Carlos Jesús', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Conde Zambada Gilberto', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('CONTRERAS OSCAR', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cordera Campos Rolando', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Córdova Plaza Rosío', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cornelius Wayne', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Corona Paez Sergio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Corral Osuna Beatriz', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Corral Rafael', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cosio María Eugenia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cosio-Zavala María Eugenia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('COUTIGNO RAMÍREZ ANA CLAUDIA', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cristina Ocampo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cruz Norma', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Cuauhtémoc Calderón Villarreal', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Dae Won Choi', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Daniel Delaunay', null, 'No tiene', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Daniel Delaunay', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Daniel Hernandez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Daniel Venegas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Danielé Joly', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('David Ontiveros', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('David Pepper', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('David Runsten', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('David Runsten Ruíz Clemente', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('David Schauer', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('David Sroaf', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Dávila Alejandro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('de la O María Eugenia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('de la Torre Rodolfo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('De Lucas Javier', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('de Oliveira Orlandina', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('de Oliveira Orlando', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Dennis L. Soden', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Diana Alarcón González', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Djamel Toudert', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Domínguez Santos Rufino E.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Dr. J.C. Agunwamba', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Duane G. Metzger', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Durand Jorge', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Echarri Canovas Carlos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Edmé Domínguez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Eduardo González', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Eduardo Hurtado García', null, 'Secretario Técnico', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Eduardo López', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Eduardo Margáin', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Eduardo Zepeda', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Edward Brown', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ekart Wild', null, 'Representante de la Fundación Friedrich Ebert', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Elena Bilbao', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Elena Urrutia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Eliseo Mendoza Berrueto', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Elizabeth Juárez Cerdi', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Embajador Jorge Alberto Lozoya', null, 'Director Ejecutivo', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Emeterio Martínez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Enrique Dussel', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Enrique Hernández Laos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Enrique Luengo González', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('ENUAU EMILIO', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ernesto Jáuregui', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('ESCANDÓN JULIO', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Escobar Diego', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Escobar Latapí Agustín', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Espejel Carbajal Martha Ileana', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Espinosa Damián Gisela', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Espinoza Morales Lydia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Estévez Federico', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Estrella Gabriel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Evan Ward', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('EZCURRA E. EDUARDO', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('EZCURRA EXEQUIEL', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('F. Vázquez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Fabiola Vargas Valencia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Farfán Morales Olimpia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Farley Kathleen A.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Favret Rita', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Feas Roger', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Felipe Cuamea Velázquez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Félix Arredondo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Félix Verduzco Gustavo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Fernado Lozano Ascencio', null, 'Coordinador', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Fernando Lozano Ascencio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ferreira Luís', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Few Roger', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Figueroa Juan Guillermo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Fitzpatrik Jody', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Flamand Gómez Laura', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Flavio Alonso Rosales Díaz', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Fletes Ocón Hector Bernabé', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Flores Aubanel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Flores Simental Raúl', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Flores Torres Oscar', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Fouquet Guerineau Anne', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Francisco A. Bernal Rodríguez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Francisco Fernández de Castro Santos', null, 'Director Adjunto de Administración y Finanzas', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Francisco Malagamba', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Francisco Miranda López', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Franco María del Carmen', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Francoise Lestage', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Fray Cruzalta Aguirre Julián', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Fullerton Tom', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gabriel Estrella', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gabriela Adriana', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gabriela Dutrénit', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gámez Moisés', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('GARCÍA  BRIGIDA', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('García  Galvan Alejandro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('GARCÍA DE ALBA', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('García del Castillo Rodolfo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('GARCÍA GERARDO', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('GARCÍA J.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('García López Patricia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('García Martha', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('García Martínez Bernardo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('García Miriam', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('García Páez Benjamín', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('García Pérez Hilda', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('García y Griego Manuel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('García Zamora Rodolfo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Garda Roberto', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gardea Torresdey Jorge', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gary Gereffi', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gaxiola Aldama Ruth', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gerardo Chávez Velazco', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gerardo Jacobs', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gerardo Otero', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('GERBER JAMES', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gereffy Gary', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gilberto Giménez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Giorguli Silvia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gloria Elizabeth García Hernández', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('González Cesar', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('González César', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('González Corona Rosa María', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('González Fagoaga Eduardo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('González Igael', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('GONZÁLEZ ISRAEL', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('González Leyva Sergio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('González Maíz Rocío', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('González Quiroga Miguel A.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('González Quiroga Miguel Ángel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('González Quiróga Miguel Ángel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('GONZÁLEZ RITA', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('González Rosa María', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('González-Aréchiga Bernardo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gracida Romo Juan José', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Graciela Bensunsan', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Graizbord Boris', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Grajeda Leilanie', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Green Stanley', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Grijalva Gabriela', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Guadalupe Ortega Villa', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gudarrama Rocío', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Guevara Ivonne', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Guido Pinto', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Guillermo Villalobos', null, 'Director General', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gustavo de J. Bravo Castillo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gustavo Garza', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gutiérrez Arturo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Gutiérrez Luis Miguel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Héctor Everardo Beltrán Corona', null, 'Rector', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Héctor Menchaca Solís', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Héctor Padilla', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Héctor Terán Terán', null, 'Gobernador Constitucional de B.C.', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Hernán Ahuja', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Hernández Cabrera Porfirio M.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Hernández David', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Hernández Gonzalo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Hernández Hilda', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Hernández Juan M.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('HERNANDEZ MADRID MIGUEL', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Hernández María del Carmen', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Hernández Ramiro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Herrera Barrientos Jaime', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('HERRERA J.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Herrera Montes Salvador', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('HERRERA PÉREZ OCTAVIO', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('HINOJOSA R.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Hipólito Rodríguez Herrero', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Horacio Garza Graza', null, 'Presidente Municipal', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Hovell Melbourne F.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Howell Melbourne F.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Humberto Barquera Gémez', null, 'Apoderado', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Humberto González Galbán', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Humberto Inzunza Fonseca', 'hinzunza@telnor.net', 'Presidente', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Humberto Lugo Gil', null, 'Oficial Mayor', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Igor Israel González', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('IGOR JOSÉ', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ilescas Vela Virginia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ilíana Sonntag', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Inés Favela', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('IRACHETA ALFONSO', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Irazuzta Di Chiara Ignacio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Islas Yadira', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ismael Aguilar Barajas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ismael Grijalba Palomino', null, 'Director General', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ismael Martínez García', null, 'Director General', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Itzel Magali Perez Zagal', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('IVAN55', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Izquierdo Antonio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('J. Charles Jennet', null, 'Presidente', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('J. M. Robine', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jaime Hererra Barrientos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jaime Martuscelli Quintana', null, 'Director Adjunto de Investigación Científica y Secretario Ejecutivo Suplente de Fondos', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jalette Patrice', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('James Gerber', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Janice Monk', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jáquez Gabriel Román', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Javier Landa', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Javier Monk', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jean Daniel M. Saphores', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jean Papail', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('JENKINS  RHYS', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jesus', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jesús Arroyo Alejandre', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jesús J. Ruiz Barraza', null, 'Presidente', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jesús M. Sandoval Armenta', null, 'Director General de Fomento Económico', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jesús Moises Beltrán', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jesús Román Calleros', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Joel Jennings', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Johm O. Stubbs', null, 'President and Vice Chancellor', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('John Cross', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jorge Alberto Vale Sánchez', null, 'Rector', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jorge Alonso Sánchez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jorge Antonio Hernández Plascencia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jorge Castro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jorge Deantes del Ángel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jorge Durand', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jorge Eduardo Mendoza Cota', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('JORGE ENRRIQUE CASTRO', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jorge Gil', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jorge Herrera', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Alejandro García Galván', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Arturo Pérez Sánchez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Carlos Lozano', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Carlos Ramírez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Guadalupe Osuna Millán', null, 'Presidente Municipal', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Guerrero Guerrero', null, 'Director General', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Javier Robles', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Luis Aranda', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Luis Contreras', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Luis García', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Luis Molina Hernández', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Luis Trava Manzanilla', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José María Parra Ramos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Molina Ruíz', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('José Woldenberg Karakosky', null, 'Consejero Presidente', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Joseph Devinny', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Juan Antonio Legaspi Delgado', null, 'Director General de Seguridad e Higiene', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Juan Carlos Herguera', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Juan Pablo Guerro', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Julie Stanton', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Julio Boltvinik', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Jusidman Clara', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Karina Orozco Rocha', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Karla Gallo Campos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Katherine Side', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Kathryn A. Woolard', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Kathryn Kopinak', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Kay Eekhoff', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Kazuko Shiraishi', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('KENNEY MARTIN', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('KERR BILL', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Kosacoff Bernardo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Kristin Espinoza', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Kuhner Gretchen', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Kumar Acharya Arun', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Kumar Arun', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('L. L. Gutiérrez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('L. Reyes', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Laniado Rafael', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Lara Cisneros Gerardo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Lara Francisco', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Lara Gerardo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('LATTES ALFREDO', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Laura Ochoa', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Leite Moreira Américo Carlos Américo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Lejano Raul', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Leobardo Jiménez Sánchez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('León Ledesma Miguel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Léon Ledesma Miguel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Lestage Francoise', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Leticia Calderón Chelius', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Leyva Claudia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Leyva Osvaldo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Leyva René', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ligia González', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('List Reyes Mauricio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('López Castro Gustavo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('López López Álvaro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('López María de la Paz', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('López Vladimir', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Lorenzo Gómez Morín', null, 'Secretario', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Lourdes Nieblas Cuevas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Lourdes Pacheco', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Loza Gloria María', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Luengas Rubén', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('LUGO SONIA', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Luis Antonio Miranda', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Luis E. Calderón', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Luis Mier', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Luis Miguel Gutierrez Robledo', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Luis Miguel Morales', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Luis Miguel Rionda', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Luis Miguel Rionda Martínez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Luján Ponce Noemí', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Luna Pastén Héctor', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Macías Luis Fernando', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Macías Marie-Carmen', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Maldonado Vasquez Centolino', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Manuel Angel Castillo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Manuel Arroyo Galván', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Manuel Chavez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Manuel Chávez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Manuel Gutiérrez Vidal', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Manuel Villa Issa', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Marcelino Bauza Rosete', null, 'Director', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Marco Antonio Samaniego L.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('María Antonieta Robles', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('María Cristina Gutiérrez Zúñiga', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Maria de los Angeles Pozas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('María de los Ángeles Pozas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('María de Lourdes Ampudia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Maria de Lourdes Camarena Ojinaga', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('María del Carmen García Peña', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('María del Rosario Cota Yañez Cota', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('MARIA ELENA REYES', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('María Eugenia Cosio-Zavala', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('María Eugenia de la O', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('María Eugenia Treviño', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('María José González', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Maria Luisa Erranti', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Marianne Marchand', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mariano Norzagaray Campos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Marina Ariza', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mario Alberto Magaña', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('MARIO ALBERTO ROSAS', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mario Alberto Rosas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mario Bassols', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mario Bassols Ricardez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mario Lungo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mario Martínez García', null, 'Director General', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mario Palma Rojo', null, 'Subsecretario de Desarrollo Regional', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Markides Kiriakos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Marlene Solís', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Márquez Yanod', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Marta Torres', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Martín de la Rosa', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Martin Kenney', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Martín L. Celaya Barragan', null, 'Secretario Técnico', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Martínez Alejandra', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Martínez Corona Francisco Javier', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Martínez Cristina', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Martinez Donate Ana', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Martínez Donate Ana, Sipan,  C y  José Luis Izazola', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('MARTÍNEZ FRANCISCO', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Martínez Lucas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Martínez Martínez Alejandro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mary Alcocer', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mary Carmen Villeda Santana', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mary I. O Connor', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Matínez Martínez Alejendro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Max J. Castro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('May Relaño Pastor', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mayo Murrieta', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Medina Alejandra', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Medina Patricia Eugenia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Meghnad Desai', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('MEHTA KALA', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mejía Arango Silvia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Melbourne Hovell', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('MELÉ PATRICE', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Melgar Mayra Patricia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Méndez Alma Ivonne', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mendez Eloy', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Méndez Reyes Jesús', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mercado Alfonso', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Michael R. Pfau', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Michel Peraldi', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('MIDDLEBROOK KEVIN', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Miguel Ángel Ramírez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Miguel Anguel Cancino Aguilar', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('MIguel Cervera Flores', null, 'Director General de Estadística', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Miguel Jesús Hernández Madrid', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Miguel León Pérez', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('MINES RICHARD', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('MIRNA SASTRÉ', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Moguel Reyna', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mohar Alejandro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Moisés Gamez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Molina García Mario', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mónica Gendreau', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mónica Jasis Silberg', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Monterrubio Cordero Juan C.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('MOORE C.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Moreno David', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Moreno Jaimes Carlos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Moreno José Luis', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Moreno Mena José', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('MURRIETA MAYO', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Mwangi wa Githinji', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Nadia Cadia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Nancy A. Marlin', null, 'Provost and Vicepresident of Academic Affaris', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Nancy Grey Posfero', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Nancy Lowery', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Natalia Ribas Mateos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Nava Isalia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Navarrete Sergio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Neves Nogueira Paula Cristina', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Nieblas Ortiz Efraín Carlos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Noemí Ehrenfeld L.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Nombre', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Norma Iglesias', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Norris Clement', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Nuñez Guillermo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Núñez Leopoldo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Nuno María Rosa', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ochoa Dávila Enrique', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ochoa Enrique', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ochoa Marín Sandra Catalina', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ofelia Woo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Olimpia Talia Jimenéz', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Olivia Ruiz', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Olvera José Juan', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ortiz Alegría Luz Belinda', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ortiz Luis', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ortiz Rafael', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Oscar Contreras Montellano', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Oscar Fernández', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Oscar Pedrin Osuna', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ovidio González Gómez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Pablo Cotler', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Pablo Serrano Vallejo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Pablo Vila', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Pacheco Edith', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Padilla Delgado Héctor', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('PADILLA HÉCTOR', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Palacios Hernández Lylia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Palloni Alberto', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Parra Avila Juan', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Parson Jason G.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Partida Busch Virgilio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Pat Mac Dermott', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Patrice Mele', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Patricia Fernández Ham', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Patricio Cardoso Ruiz', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Paul Ganster', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Pedraza Laura', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Pedro Cital', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Pedro Martínez Briones', null, 'Presidente', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Peña Medina Sergio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Penagos Sergio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Peralta Videa José Ramón', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Peredo Quezada María Isabel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Pereira de Melo María Cristina', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Pérez Patricia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Pineda Pablos Nicolás', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('POOM MEDINA JUAN', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Portillo José Antonio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Pozas María de los Angeles', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Prieto González José Manuel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Provencio Enrique', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Puar Jasbir', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('R. Wong', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rafael Pérez-Abreu', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ramírez López Berenice', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ramírez Miguel Ángel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ramón Eduardo Ruíz', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ramos María Elena', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ramos Salvador', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Raúl Fernández', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Raúl Hinojosa', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Raúl Loyola Díaz', null, 'Director General', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('René Eduardo Poitevin', null, 'Director', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('René Zenteno', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ricardo Silva Toledo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ricardo Trejo Hernández', null, 'Director General de Programación y Presupuesto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Richard Gordon', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Richard Hofstetter', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Richard Wright', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Richardson Chad', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rick Miner', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rivas Eva', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rivas Sada Eva', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Robert Alvarez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Robert C. Scales', null, 'Asesoría, coordinación y diseño del Sistema de Información Integral de la Secretaría Pública', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Roberto Rivera Carmona', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Roberto Sánchez Rodríguez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Roberto Verdugo Díaz', null, 'Director de Educación Superior e Investigación', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Robles Ortega Rosalba', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rocío Barajas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rodolfo García', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rodrigo Pimental Lastra', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rodríguez Francisco', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rodríguez Yosu', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rolando Cordera Campos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Román Artuto R.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Román Gabriela', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Romero Hernandez Odilia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Romero Navarrete Lourdes Magdalena', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ronald Angel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ros Jaime', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rosa Linda Fregoso', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rosa María González Corona', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rosa María Ruvalcaba', null, 'Directora de Población', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rosalba Casas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rosalina Cano García', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rosas Karina', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Rossana Reguillo Cruz', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('RUBEL A.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ruíz Marco A.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ryoshiro Baba', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('SALAS JOSÉ LUIS', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Salazar Mario', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Salazar Vidal', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Saldaña Téllez Bernardo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Salguero Friné', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Salinas Patti', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Samuel Schmidt', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sánchez Adrián', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sánchez Crispín Álvaro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sánchez Juan Carlos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sánchez Martha', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Santacruz de León Germán', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Saphores Jean Daniel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sassen Saskia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Scott Whiteford', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Selee Andrew', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Senen Cecilia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sereseres Cesar A.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sergio Ramírez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sergio Solís', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sergio Zendejas Romero', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Shawn Kanaupuni', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sheridan Cecilia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Shibata Harumi', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Silvia Guendelman', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Simonett Helena', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Socorro Arzaluz', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Soledad González', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Solís Gilberto', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Solis Patricio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sonia Baires', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sonia Lugo Morones', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sophie Bava', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('SPARROW GLEN', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Stephanie Pincetl', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Steve Wallace', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Strathdee Steffanie', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Stuart Aitken', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sueli Ramos', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Susan Gzesh', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Susana Pastrana Corral', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Susanne Jonas', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Swanie Potot', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Sylvie Mazzela', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Takeyuki Tsuda', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Telésforo Ramírez', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Tellez Edward', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Tello Peón Jorge', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Téran Casanueva', null, 'Rector', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Teresa Montero', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Terry McKinley', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Teruel Graciela', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Theodore H. Cohn', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Thomas J. Kelly', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Thomas M. Fullerton', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Tintos Juan', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Tipa Nadia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Tons H. Hilker', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('TORRES GABRIEL', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Torres José Luis', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Torres Oscar', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Torres Victor', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Tovar Esquivel Enrique', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Trejo Peña Alma Paola', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('TREVIÑO RODRÍGUEZ MARÍA EUGENIA', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Tridib Banerjee', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Trujillo Joel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Valdés Alma Victoria', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Valdés Carlos Manuel', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Valencia Armas Alberto', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Valentín Vargas Arenal', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Van Broeck Anne Marie', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Van der Knaap Peter', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('VAN DOOREN ROBINE', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('VAN TULDER R.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Vargas Adriana', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Vargas Fabiola', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Vargas Villavicencio José Antonio', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Vazquez Sandrin German', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Vendrell Ferré Joan', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Véronique Manry', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Víctor Gabriel Muro', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Víctor Klagsbrunn', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Víctor Manuel Ibarra Balderas', null, 'Director', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Víctor Raúl Martínez V.', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Víctor Zuñiga', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Vidaurrázaga René', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Villalobos Iliana', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Villarreal María Elena', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Wallace Steve', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('William Conroy', null, 'Presidente', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Wong Pablo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Wong Rebeca', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Wright Robert', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Yamile Mizrahi', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Yolanda Palma', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Yrizar Guillermo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Yuridia Rodríguez', null, 'Participa en proyecto', GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Zamudio Patricia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Zapico Goñi Eduardo', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Zavala de Cosio María Eugenia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('ZEPEDA EDUARDO', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Ziccardi Alicia', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Zuniga Gil Clemente', null, null, GETDATE(), GETDATE(), 1, 1, 1)
insert into InvestigadorExternos values('Zúñiga González Víctor', null, null, GETDATE(), GETDATE(), 1, 1, 1)
*/

insert into Idiomas values('Albanés', GETDATE(), GETDATE(), 1, 1, 1)
insert into Idiomas values('Alemán', GETDATE(), GETDATE(), 1, 1, 1)
insert into Idiomas values('Amárico', GETDATE(), GETDATE(), 1, 1, 1)
insert into Idiomas values('Árabe', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Aragonés', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Arameo', GETDATE(), GETDATE(), 1, 1, 1)     
insert into Idiomas values('Balinés', GETDATE(), GETDATE(), 1, 1, 1)         
insert into Idiomas values('Bengalí', GETDATE(), GETDATE(), 1, 1, 1)      
insert into Idiomas values('Birmano', GETDATE(), GETDATE(), 1, 1, 1)      
insert into Idiomas values('Bosnio', GETDATE(), GETDATE(), 1, 1, 1)                   
insert into Idiomas values('Búlgaro', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Camboyano', GETDATE(), GETDATE(), 1, 1, 1)                   
insert into Idiomas values('Cantonés', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Catalán', GETDATE(), GETDATE(), 1, 1, 1)         
insert into Idiomas values('Checo', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Chino', GETDATE(), GETDATE(), 1, 1, 1)                  
insert into Idiomas values('Coreano', GETDATE(), GETDATE(), 1, 1, 1)                  
insert into Idiomas values('Croata', GETDATE(), GETDATE(), 1, 1, 1)                   
insert into Idiomas values('Danés', GETDATE(), GETDATE(), 1, 1, 1)                  
insert into Idiomas values('Escocés', GETDATE(), GETDATE(), 1, 1, 1)               
insert into Idiomas values('Eslovaco', GETDATE(), GETDATE(), 1, 1, 1)        
insert into Idiomas values('Esloveno', GETDATE(), GETDATE(), 1, 1, 1)         
insert into Idiomas values('Español', GETDATE(), GETDATE(), 1, 1, 1)        
insert into Idiomas values('Estonio', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Feroés', GETDATE(), GETDATE(), 1, 1, 1)                
insert into Idiomas values('Finés', GETDATE(), GETDATE(), 1, 1, 1)                  
insert into Idiomas values('Flamenco', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Francés', GETDATE(), GETDATE(), 1, 1, 1)              
insert into Idiomas values('Gallego', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Galés', GETDATE(), GETDATE(), 1, 1, 1)                   
insert into Idiomas values('Griego', GETDATE(), GETDATE(), 1, 1, 1)                   
insert into Idiomas values('Groenlandés', GETDATE(), GETDATE(), 1, 1, 1)               
insert into Idiomas values('Gótico', GETDATE(), GETDATE(), 1, 1, 1)                  
insert into Idiomas values('Hawaiano', GETDATE(), GETDATE(), 1, 1, 1)              
insert into Idiomas values('Hebreo', GETDATE(), GETDATE(), 1, 1, 1)                
insert into Idiomas values('Hindi', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Húngaro', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Indonesio', GETDATE(), GETDATE(), 1, 1, 1)          
insert into Idiomas values('Inglés', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Irlandés', GETDATE(), GETDATE(), 1, 1, 1)   
insert into Idiomas values('Islandés', GETDATE(), GETDATE(), 1, 1, 1)                    
insert into Idiomas values('Italiano', GETDATE(), GETDATE(), 1, 1, 1)           
insert into Idiomas values('Japonés', GETDATE(), GETDATE(), 1, 1, 1)          
insert into Idiomas values('Javanés', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Lacandón', GETDATE(), GETDATE(), 1, 1, 1)               
insert into Idiomas values('Lao', GETDATE(), GETDATE(), 1, 1, 1)        
insert into Idiomas values('Latín', GETDATE(), GETDATE(), 1, 1, 1)         
insert into Idiomas values('Letón', GETDATE(), GETDATE(), 1, 1, 1)                   
insert into Idiomas values('Limburgués', GETDATE(), GETDATE(), 1, 1, 1)
insert into Idiomas values('Lituano', GETDATE(), GETDATE(), 1, 1, 1)
insert into Idiomas values('Lombardo', GETDATE(), GETDATE(), 1, 1, 1)
insert into Idiomas values('Luganda', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Luvenda', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Luxemburgués', GETDATE(), GETDATE(), 1, 1, 1)     
insert into Idiomas values('Náhuatl', GETDATE(), GETDATE(), 1, 1, 1)         
insert into Idiomas values('Persa', GETDATE(), GETDATE(), 1, 1, 1)      
insert into Idiomas values('Polaco', GETDATE(), GETDATE(), 1, 1, 1)      
insert into Idiomas values('Portugués', GETDATE(), GETDATE(), 1, 1, 1)                   
insert into Idiomas values('Romanche', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Romaní', GETDATE(), GETDATE(), 1, 1, 1)                   
insert into Idiomas values('Rumano', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Ruso', GETDATE(), GETDATE(), 1, 1, 1)         
insert into Idiomas values('Samoano', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Serbio', GETDATE(), GETDATE(), 1, 1, 1)                  
insert into Idiomas values('Serbocroata', GETDATE(), GETDATE(), 1, 1, 1)                  
insert into Idiomas values('Sueco', GETDATE(), GETDATE(), 1, 1, 1)                   
insert into Idiomas values('Sumerio', GETDATE(), GETDATE(), 1, 1, 1)                  
insert into Idiomas values('Tagalo', GETDATE(), GETDATE(), 1, 1, 1)               
insert into Idiomas values('Tahitiano', GETDATE(), GETDATE(), 1, 1, 1)        
insert into Idiomas values('Tailandés', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Telugú', GETDATE(), GETDATE(), 1, 1, 1)                   
insert into Idiomas values('Tongano', GETDATE(), GETDATE(), 1, 1, 1)                   
insert into Idiomas values('Turco', GETDATE(), GETDATE(), 1, 1, 1)               
insert into Idiomas values('Ucraniano', GETDATE(), GETDATE(), 1, 1, 1)                  
insert into Idiomas values('Urdu', GETDATE(), GETDATE(), 1, 1, 1)              
insert into Idiomas values('Veneciano', GETDATE(), GETDATE(), 1, 1, 1)                
insert into Idiomas values('Vietnamita', GETDATE(), GETDATE(), 1, 1, 1)                 
insert into Idiomas values('Yue', GETDATE(), GETDATE(), 1, 1, 1)                 

insert into LineaInvestigaciones values('Actividad económica fronteriza', GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaInvestigaciones values('Ambiente  y  recursos naturales', GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaInvestigaciones values('Dinámica poblacional de la frontera', GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaInvestigaciones values('Fronteras y seguridad nacional ', GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaInvestigaciones values('Gobernabilidad', GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaInvestigaciones values('Historia del norte de México', GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaInvestigaciones values('Integración económica México-Estados Unidos', GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaInvestigaciones values('Interacción binacional-local', GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaInvestigaciones values('Migración internacional', GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaInvestigaciones values('Procesos culturales', GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaInvestigaciones values('Urbanización del norte de México', GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaInvestigaciones values('N/A', GETDATE(), GETDATE(), 1, 1, 1)

insert into LineaTematicas values('Ambiente y Desarrollo',GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaTematicas values('Desarrollo Económico',GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaTematicas values('Desarrollo Regional',GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaTematicas values('Estudios Culturales',GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaTematicas values('Estudios de la Industria y el Trabajo',GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaTematicas values('Migración',GETDATE(), GETDATE(), 1, 1, 1)
insert into LineaTematicas values('Población',GETDATE(), GETDATE(), 1, 1, 1)

insert into AreaTematicas values('Ambiente y Recursos Naturales', GETDATE(), GETDATE(), 1, 1, 1, 1)
insert into AreaTematicas values('Desarrollo regional y Medio Ambiente', GETDATE(), GETDATE(), 1, 1, 1, 1)
insert into AreaTematicas values('Gestión Ambiental ', GETDATE(), GETDATE(), 1, 1, 1, 1)
insert into AreaTematicas values('Recursos Naturales', GETDATE(), GETDATE(), 1, 1, 1, 1)
insert into AreaTematicas values('Economía y sociedad', GETDATE(), GETDATE(), 1, 2, 1, 1)
insert into AreaTematicas values('Evaluación de Políticas Económicas', GETDATE(), GETDATE(), 1, 2, 1, 1)
insert into AreaTematicas values('Integración Económica Fronteriza Méxuco-EU', GETDATE(), GETDATE(), 1, 2, 1, 1)
insert into AreaTematicas values('Administración Pública y Finanzas', GETDATE(), GETDATE(), 1, 3, 1, 1)
insert into AreaTematicas values('Desarrollo Regional y Restructuración Productiva', GETDATE(), GETDATE(), 1, 3, 1, 1)
insert into AreaTematicas values('Estudios Urbanos', GETDATE(), GETDATE(), 1, 3, 1, 1)
insert into AreaTematicas values('Gobiernos Locales y Gestión Binacional', GETDATE(), GETDATE(), 1, 3, 1, 1)
insert into AreaTematicas values('Instituciones Políticas y Procesos Sociales', GETDATE(), GETDATE(), 1, 3, 1, 1)
insert into AreaTematicas values('Políticas Públicas y Desarrollo Regional', GETDATE(), GETDATE(), 1, 3, 1, 1)
insert into AreaTematicas values('Estudio de las Identidades', GETDATE(), GETDATE(), 1, 4, 1, 1)
insert into AreaTematicas values('Estudios Culturales', GETDATE(), GETDATE(), 1, 4, 1, 1)
insert into AreaTematicas values('Estudios de los Procesos históricos', GETDATE(), GETDATE(), 1, 4, 1, 1)
insert into AreaTematicas values('Historia y Cultura', GETDATE(), GETDATE(), 1, 4, 1, 1)
insert into AreaTematicas values('Cambio Técnico y Organización Industrial', GETDATE(), GETDATE(), 1, 5, 1, 1)
insert into AreaTematicas values('Estudios del Trabajo e Industriales', GETDATE(), GETDATE(), 1, 5, 1, 1)
insert into AreaTematicas values('Estudios del Trabajo', GETDATE(), GETDATE(), 1, 5, 1, 1)
insert into AreaTematicas values('Estudios del Trabajo e Industriales', GETDATE(), GETDATE(), 1, 5, 1, 1)
insert into AreaTematicas values('Estudios del Trabajo e Industriales', GETDATE(), GETDATE(), 1, 5, 1, 1)
insert into AreaTematicas values('Mercados de Trabajo y Fuerza Laboral', GETDATE(), GETDATE(), 1, 5, 1, 1)
insert into AreaTematicas values('Estudios Sociales de Migración', GETDATE(), GETDATE(), 1, 6, 1, 1)
insert into AreaTematicas values('Migración Internacional e Interna', GETDATE(), GETDATE(), 1, 6, 1, 1)
insert into AreaTematicas values('Envejecimiento', GETDATE(), GETDATE(), 1, 7, 1, 1)
insert into AreaTematicas values('Familia y Salud', GETDATE(), GETDATE(), 1, 7, 1, 1)

insert into RevistaPublicaciones values('AMERICAN NATURALIST', null, '0003-0147', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN NEPTUNE', null, '0003-0155', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN PHILOSOPHICAL QUARTERLY', null, '0003-0481', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN POETRY REVIEW', null, '0360-3709', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN POLITICAL SCIENCE REVIEW', null, '0003-0554', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN POLITICS QUARTERLY', null, '0044-7803', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN PSYCHIATRIC ASSOCIATION 150TH ANNUAL MEETING SAN DIEGO   CALIFORNIA PROGRAM AND ABSTRACTS ON NEW RESEARCH IN SUMMARY FORM', null, '+ACoAKgAqACo--+ACoAKgAqACo-', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN PSYCHOLOGIST', null, '0003-066X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN QUARTERLY', null, '0003-0678', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN REVIEW OF PUBLIC ADMINISTRATION', null, '0275-0740', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN SCHOLAR', null, '0003-0937', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN SCIENTIST', null, '0003-0996', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN SOCIETY FOR REPRODUCTIVE MEDICINE-ABSTRACT SEARCH', null, '+ACoAKgAqACo--+ACoAKgAqACo-', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN SOCIOLOGICAL REVIEW', null, '0003-1224', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN SPEECH', null, '0003-1283', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN STATISTICIAN', null, '0003-1305', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN STUDIES IN SCANDINAVIA', null, '0044-8060', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN STUDIES INTERNATIONAL', null, '+ACoAKgAqACo--+ACoAKgAqACo-', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN SURGEON', null, '0003-1348', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN TRANSCENDENTAL QUARTERLY', null, '0149-9017', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN ZOOLOGIST', null, '0003-1569', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAS', null, '0003-1615', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAS NETWORK', null, '1075-5292', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMINO ACIDS', null, '0939-4451', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMPHIBIA-REPTILIA', null, '0173-5373', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANAEROBE', null, '1075-9964', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANAESTHESIA', null, '0003-2409', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMYLOID-INTERNATIONAL JOURNAL OF EXPERIMENTAL AND CLINICAL INVESTIGATION', null, '1350-6129', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANAESTHESIA AND INTENSIVE CARE', null, '0310-057X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANAESTHESIST', null, '0003-2417', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALES DE LA ASOCIACION QUIMICA ARGENTINA', null, '0365-0375', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALES DE LA LITERATURA ESPANOLA CONTEMPORANEA', null, '0272-1635', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALES ESPANOLES DE PEDIATRIA', null, '0302-4342', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALOG INTEGRATED CIRCUITS AND SIGNAL PROCESSING', null, '0925-1030', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALUSIS', null, '0365-4877', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALYSIS', null, '0003-2638', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALYST', null, '0003-2654', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALYTICA CHIMICA ACTA', null, '0003-2670', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALYTICAL AND QUANTITATIVE CYTOLOGY AND HISTOLOGY', null, '0884-6812', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALYTICAL BIOCHEMISTRY', null, '0003-2697', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALYTICAL CELLULAR PATHOLOGY', null, '0921-8912', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALYTICAL CHEMISTRY', null, '0003-2700', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALYTICAL COMMUNICATIONS', null, '1359-7337', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALYTICAL LETTERS', null, '0003-2719', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALYTICAL SCIENCES', null, '0910-6340', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANALYTISCHE PSYCHOLOGIE', null, '0301-3006', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANASTHESIOLOGIE +ACY- INTENSIVMEDIZIN', null, '0170-5334', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANASTHESIOLOGIE INTENSIVMEDIZIN NOTFALLMEDIZIN SCHMERZTHERAPIE', null, '0939-2661', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANATOMIA HISTOLOGIA EMBRYOLOGIA-JOURNAL OF VETERINARY MEDICINE SERIES C', null, '0340-2096', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANATOMICAL RECORD', null, '0003-276X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANATOMY AND EMBRYOLOGY', null, '0340-2061', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANDROLOGIA', null, '0303-4569', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANESTHESIA AND ANALGESIA', null, '0003-2999', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANESTHESIOLOGY', null, '0003-3022', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANESTHESIOLOGY CLINICS OF NORTH AMERICA', null, '0889-8537', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANGEWANDTE CHEMIE-INTERNATIONAL EDITION', null, '1433-7851', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANGIOLOGY', null, '0003-3197', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANGLE ORTHODONTIST', null, '0003-3219', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANGLIA-ZEITSCHRIFT FUR ENGLISCHE PHILOLOGIE', null, '0340-5222', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANIMAL BEHAVIOUR', null, '0003-3472', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANIMAL BIOTECHNOLOGY', null, '1049-5398', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANIMAL FEED SCIENCE AND TECHNOLOGY', null, '0377-8401', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANIMAL GENETICS', null, '0268-9146', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANIMAL LEARNING +ACY- BEHAVIOR', null, '0090-4996', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANIMAL REPRODUCTION SCIENCE', null, '0378-4320', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANIMAL SCIENCE', null, '1357-7298', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANIMAL WELFARE', null, '0962-7286', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALEN DER PHYSIK', null, '0003-3804', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES ACADEMIAE SCIENTIARUM FENNICAE-MATHEMATICA', null, '1239-629X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES BOTANICI FENNICI', null, '0003-3847', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES CHIRURGIAE ET GYNAECOLOGIAE', null, '0355-9521', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES D ENDOCRINOLOGIE', null, '0003-4266', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES D UROLOGIE', null, '0003-4401', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE BIOLOGIE CLINIQUE', null, '0003-3898', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE BRETAGNE ET DES PAYS DE L OUEST', null, '0399-0826', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE CARDIOLOGIE ET D ANGEIOLOGIE', null, '0003-3928', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE CHIMIE-SCIENCE DES MATERIAUX', null, '0151-9107', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE CHIRURGIE', null, '0003-3944', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE DERMATOLOGIE ET DE VENEREOLOGIE', null, '0151-9638', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE GASTROENTEROLOGIE ET D HEPATOLOGIE', null, '0066-2070', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE GENETIQUE', null, '0003-3995', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE L INSTITUT FOURIER', null, '0373-0956', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE L INSTITUT HENRI POINCARE-ANALYSE NON LINEAIRE', null, '0294-1449', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE L INSTITUT HENRI POINCARE-PROBABILITES ET STATISTIQUES', null, '0246-0203', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE LA SOCIETE ENTOMOLOGIQUE DE FRANCE', null, '0037-9271', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE LIMNOLOGIE-INTERNATIONAL JOURNAL OF LIMNOLOGY', null, '0003-4088', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE MEDECINE INTERNE', null, '0003-410X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE MEDECINE VETERINAIRE', null, '0003-4118', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE PATHOLOGIE', null, '0242-6498', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE PEDIATRIE', null, '0066-2097', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE PHYSIQUE', null, '0003-4169', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE ZOOTECHNIE', null, '0003-424X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DES SCIENCES NATURELLES-ZOOLOGIE ET BIOLOGIE ANIMALE', null, '0003-4339', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DES TELECOMMUNICATIONS-ANNALS OF TELECOMMUNICATIONS', null, '0003-4347', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES FRANCAISES D ANESTHESIE ET DE REANIMATION', null, '0750-7658', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES GEOPHYSICAE-ATMOSPHERES HYDROSPHERES AND SPACE SCIENCES', null, '0992-7689', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES HENRI POINCARE', null, '1424-0637', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES HISTORIQUES DE LA REVOLUTION FRANCAISE', null, '0003-4436', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES MEDICO-PSYCHOLOGIQUES', null, '0003-4487', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES SCIENTIFIQUES DE L ECOLE NORMALE SUPERIEURE', null, '0012-9593', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES ZOOLOGICI FENNICI', null, '0003-455X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES-HISTOIRE SCIENCES SOCIALES', null, '0395-2649', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALI DI CHIMICA', null, '0003-4592', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALI DI GEOFISICA', null, '0365-2556', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALI DI MICROBIOLOGIA ED ENZIMOLOGIA', null, '0003-4649', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF ALLERGY ASTHMA +ACY- IMMUNOLOGY', null, '1081-1206', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF ANATOMY-ANATOMISCHER ANZEIGER', null, '0940-9602', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF APPLIED BIOLOGY', null, '0003-4746', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF APPLIED PROBABILITY', null, '1050-5164', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF ARID ZONE', null, '0570-1791', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF BEHAVIORAL MEDICINE', null, '0883-6612', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF BIOMEDICAL ENGINEERING', null, '0090-6964', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF BOTANY', null, '0305-7364', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF CARNEGIE MUSEUM', null, '0097-4463', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF CLINICAL AND LABORATORY SCIENCE', null, '0091-7370', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF CLINICAL BIOCHEMISTRY', null, '0004-5632', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF DYSLEXIA', null, '0736-9387', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF EMERGENCY MEDICINE', null, '0196-0644', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF EPIDEMIOLOGY', null, '1047-2797', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF FOREST SCIENCE', null, '1286-4560', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF GLACIOLOGY', null, '0260-3055', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF GLOBAL ANALYSIS AND GEOMETRY', null, '0232-704X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF HEMATOLOGY', null, '0939-5555', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF HUMAN BIOLOGY', null, '0301-4460', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF HUMAN GENETICS', null, '0003-4800', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF INTERNAL MEDICINE', null, '0003-4819', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF MATHEMATICS', null, '0003-486X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF MATHEMATICS AND ARTIFICIAL INTELLIGENCE', null, '1012-2443', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF MATHEMATICS STUDIES', null, '0066-2313', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF MEDICINE', null, '0785-3890', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF NEUROLOGY', null, '0364-5134', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF NUCLEAR ENERGY', null, '0306-4549', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF NUCLEAR MEDICINE', null, '0914-7187', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF NUTRITION AND METABOLISM', null, '0250-6807', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF OCCUPATIONAL HYGIENE', null, '0003-4878', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF ONCOLOGY', null, '0923-7534', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF OPERATIONS RESEARCH', null, '0254-5330', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF OPHTHALMOLOGY', null, '1079-4794', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF OTOLOGY RHINOLOGY AND LARYNGOLOGY', null, '0003-4894', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF PHARMACOTHERAPY', null, '1060-0280', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF PHYSICS', null, '0003-4916', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF PLASTIC SURGERY', null, '0148-7043', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF PROBABILITY', null, '0091-1798', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF PURE AND APPLIED LOGIC', null, '0168-0072', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF REGIONAL SCIENCE', null, '0570-1864', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF SAUDI MEDICINE', null, '0256-4947', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF SCIENCE', null, '0003-3790', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF SOFTWARE ENGINEERING', null, '1022-7091', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF STATISTICS', null, '0090-5364', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF SURGERY', null, '0003-4932', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF SURGICAL ONCOLOGY', null, '1068-9265', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF THE AMERICAN ACADEMY OF POLITICAL AND SOCIAL SCIENCE', null, '0002-7162', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF THE ASSOCIATION OF AMERICAN GEOGRAPHERS', null, '0004-5608', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF THE ENTOMOLOGICAL SOCIETY OF AMERICA', null, '0013-8746', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF THE INSTITUTE OF STATISTICAL MATHEMATICS', null, '0020-3157', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF THE MISSOURI BOTANICAL GARDEN', null, '0026-6493', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF THE NEW YORK ACADEMY OF SCIENCES', null, '0077-8923', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF THE RHEUMATIC DISEASES', null, '0003-4967', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF THE ROYAL COLLEGE OF SURGEONS OF ENGLAND', null, '0035-8843', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF THORACIC SURGERY', null, '0003-4975', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF TOURISM RESEARCH', null, '0160-7383', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF TROPICAL MEDICINE AND PARASITOLOGY', null, '0003-4983', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF TROPICAL PAEDIATRICS', null, '0272-4936', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALS OF VASCULAR SURGERY', null, '0890-5096', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNEE PSYCHOLOGIQUE', null, '0003-5033', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL OF THE SOCIETY OF CHRISTIAN ETHICS', null, '0732-4928', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REPORTS IN MEDICINAL CHEMISTRY', null, '0065-7743', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REPORTS ON NMR SPECTROSCOPY', null, '0066-4103', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF ANTHROPOLOGY', null, '0084-6570', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF ASTRONOMY AND ASTROPHYSICS', null, '0066-4146', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF BIOCHEMISTRY', null, '0066-4154', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF BIOMEDICAL ENGINEERING', null, '1523-9829', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF BIOPHYSICS AND BIOMOLECULAR STRUCTURE', null, '1056-8700', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF CELL AND DEVELOPMENTAL BIOLOGY', null, '1081-0706', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF EARTH AND PLANETARY SCIENCES', null, '0084-6597', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF ECOLOGY AND SYSTEMATICS', null, '0066-4162', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF ENERGY AND THE ENVIRONMENT', null, '1056-3466', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF ENTOMOLOGY', null, '0066-4170', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF FLUID MECHANICS', null, '0066-4189', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF GENETICS', null, '0066-4197', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF IMMUNOLOGY', null, '0732-0582', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF INFORMATION SCIENCE AND TECHNOLOGY', null, '0066-4200', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF MATERIALS SCIENCE', null, '0084-6600', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF MEDICINE', null, '0066-4219', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF MICROBIOLOGY', null, '0066-4227', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF NEUROSCIENCE', null, '0147-006X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF NUCLEAR AND PARTICLE SCIENCE', null, '0163-8998', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF NUTRITION', null, '0199-9885', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF PHARMACOLOGY AND TOXICOLOGY', null, '0362-1642', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF PHYSICAL CHEMISTRY', null, '0066-426X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF PHYSIOLOGY', null, '0066-4278', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF PHYTOPATHOLOGY', null, '0066-4286', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF PLANT PHYSIOLOGY AND PLANT MOLECULAR BIOLOGY', null, '1040-2519', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF PSYCHOLOGY', null, '0066-4308', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF PUBLIC HEALTH', null, '0163-7525', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNUAL REVIEW OF SOCIOLOGY', null, '0360-0572', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANQ-A QUARTERLY JOURNAL OF SHORT ARTICLES NOTES AND REVIEWS', null, '0895-769X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTARCTIC SCIENCE', null, '0954-1020', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTHROPOLOGICAL QUARTERLY', null, '0003-5491', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTHROPOLOGICAL SCIENCE', null, '0918-7960', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTHROPOLOGIE', null, '0003-5521', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTHROPOLOGY +ACY- EDUCATION QUARTERLY', null, '0161-7761', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTHROPOLOGY AND ARCHEOLOGY OF EURASIA', null, '1061-1959', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTHROPOS', null, '0257-9774', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTHROZOOS', null, '0892-7936', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('UCLA Law Reviw', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Law Review', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista de Leyes', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('En pleno, debate legislativo', null, '1665-4226', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Chamizal', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Lateinamerika +AJY-Analysen und Berichte', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Les Cahiers Am+AOk-rique Latine, Histoire et M+AOk-moire', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Nueva Sociedad', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Aztl+AOE-n', null, 'null', null, null, null, null, null, 2, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Documental del Proceso Electoral Baja California 2001', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('http://repositories.cdlib.org/usmex/usmex+AF8-02+AF8-02b', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Mexico Attacks+ACE-', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Save Our Heritage Organisation', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVIEW Of LAW - UCLA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Nuestro Siglo', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('MEMORIAS', null, '0188-7416', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Cambio', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Espiral', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('La critica sociologica', null, 'null', null, null, null, null, null, 2, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Ejecutivos y Finanzas', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Aztlan', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Universitaria', null, 'null', null, null, null, null, null, 2, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Trayectorias', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Gomorra', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Magma', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Carta Econ+APM-mica Regional', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Portularia', null, '1578-0236', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Cat+AOE-logo BC-3 Nueva fotograf+AO0-a de Baja California', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Serie Poblaci+APM-n y Desarrollo', null, '1680-8991', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Nshaak', null, 'xx', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Econom+AO0-a, Sociedad y  Territorio', null, '1405-8421', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Memorias de la Academia Mexicana de la Historia', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Women on the border', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Probl+AOk-mes D Am+AOk-rique Lat+AO0-ne', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Psicolog+AO0-a y Salud', null, '1405-1109', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('http://www.voices.no/contry/month1.htm1', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('No aplica', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Notas. Revista de informaci+APM-n y an+AOE-lisis', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('http://repositories.cdliv.org/usmex/ruiz', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Cuadernos del Cendes', null, 'null', null, null, null, null, null, 2, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Journal of Borderlands Studies', null, '0886-5655', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Biom+AOk-dica', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Momento Econ+APM-mico', null, 'null', null, null, null, null, null, 2, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Universitaria', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Americas Review', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Prospectiva Econ+APM-mica', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Aids Care', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Airpower History Journal', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('American Economic Association (Proceedings)', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Anales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Anales del Instituto de Biolog+AO0-a: Serie  Bot+AOE-nica', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANCIENT MESOAMERICA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANNALES DE GEOGRAPHIE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANUARIO DE ESTUDIOS AMERICANOS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANUARIO DE HISTORIA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANUARIO DE HISTORIA CONTEMPOR+AME-NEA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANUARIO INVENTARIO ANTROPOLOG+AM0-A', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANUARIO MEXICANO DE HISTORIA DEL DERECHO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ARCHIVES DE SCIENCES SOCIALES DES RELIGIONS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ARCHIVOS HISPANOAMERICANOS DE SEXOLOG+AM0-A', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ARQUEOLOG+AM0-A', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ARQUEOLOG+AM0-A MEXICANA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BOLET+AM0-N DE ANTROPOLOG+AM0-A AMERICANA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BOLET+AM0-N DE LA ESCUELA DE CIENCIAS ANTROPOL+ANM-GICAS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BOLET+AM0-N DEL ARCHIVO GENERAL DE LA NACI+ANM-N', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BOLET+AM0-N DEL FIDEICOMISO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BULLETIN OF LATIN AMERICAN RESERCH', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CAHIERS DE I''UNITE DE RECHERCHE MIGRATION ET SOCIETE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CAHIERS DU C.R.I.A.R. CENTRE DE RECHERCHES D''ETUDES IBERIQUES ET IBERO-AMERICAINES DE ROUEN', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CAMINOS. REVISTA CUBANA DE PENSAMIENTO SOCIOTEOL+ANM-GICO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CAPITAL AND CLASS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CIENCIA FORESTAL EN M+AMk-XICO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CIENCIAS AGOPECUARIAS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CL+AM0-O', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('COLLOQUI (Cornell journal of Planning and Urban Issues)', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('COMMUNITY DEVELOPMENT JOURNAL', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('COMUNICACI+ANM-N Y CULTURA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CONSERVATION ECOLOGY', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CONVERGENCE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CR+AM0-TICA JUR+AM0-DICA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CR+AM0-TICA: A JOURNAL OF CRITICAL ESSAYS/CHICANO STUDIES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CUADERNOS AGRARIOS (NUEVA +AMk-POCA)', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CUADERNOS AMERICANOS.. NUEVA EPOCA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CULTURE, HEALTH +ACY- SEXUALITY', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CULTURE, MEDICINE AND PSICHIATRY', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Debate Feminista', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Desacatos', null, '1405-9274', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('DESARROLLO ECON+ANM-MICO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('DESERTS PLANTS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('DEVELOPMENT IN PRACTICE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('DEVELOPMENT POLICY REVIEW', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('DIARIO DE CAMPO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('DI+AME-SPORA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Econom+AO0-a y Sociedad', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ECONOMIST, THE.', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Entorno Urbano', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ENVIRONMENTAL SCIENCE AND POLOCY', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ENVIRONMENTS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ESLABONES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ESTUDES MEXICAINES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ESTUDIOS AGARIOS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ESTUDIO DE HISTORIA MODERNA Y CONTEMP+ANM-RANEA DE M+AMk-XICO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ESTUDIOS DEL HOMBRE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ESTUDIOS LATINOAMERICANOS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ESTUDIOS POL+AM0-TICOS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Estudios Sociales', null, '0188-4557', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ESTUDIOS TUR+AM0-STICOS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ETHNO BIOLOGY', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('FEDERALISMO Y DESARROLLO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('FEMINIST MEDIA STUDIES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('FORMACI+ANM-N PROFESIONAL', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('FRONTERA INTERIOR', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('GEOGRAF+AM0-A Y DESARROLLO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('GLOBAL SOCIAL POLICY', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HACIENDA MUNICIPAL, LA.', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HACIENDO HISTORIA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HEALTH CARE FOR WOMEN INTERNATIONAL', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HETEROFON+AM0-A', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HIDROBIOLOG+AM0-A', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HISPANIC-AMERICAN STUDIES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HISTORIA GR+AME-FICA DE M+AMk-XICO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HISTORIA SOCIAL', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HISTORIAS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HISTORIC PRESERVATION FORUM', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HIST+ANM-RICA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HIST+ANM-RICAS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('HISTORIES ET SOCIETES DE L''AMERIQUE LATINE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('INDETEC', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Lateinamerika Nachrichten', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('APITEC', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('INTERNATIONAL FAMILY PLANNING PERSPECTIVE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('INTERNATIONAL JOURNAL OF POLITICS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('INTERNATIONAL JOURNAL OF REFUGEE LAW', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('INTERNATIONAL MIGRATION TODAY', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('INTERNATIONAL STUDIES PERSPECTIVES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('INTERNATIONAL STUDIES REVIEW', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('INVENTARIO ANTROPOL+ANM-GICO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ISTOR', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('JORNADAS DE HISTORIA DE OCCIDENTE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('JOURNAL DE LA SOCI+AMk-T+AMk- DES AM+AMk-RICANISTES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('JOURNAL DES ANTHROPOLOGUES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('JOURNAL OF CHURCH OF AND STATE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('JOURNAL OF DEVELOPMENT AND STUDIES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('JOURNAL OF INTERNATIONAL MIGRATION AND INTEGRATION', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('JOURNAL OF MENTAL HEALTH', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('JOURNAL OF RELIGIONS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('JOURNAL OF THE STUDY OF MEDIA AND COMPOSITE CULTURES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('JOURNAL OF YOUTH STUDIES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('L''HOMME. REVUE FRANCAISE D''ANTHROPOLOGIE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('MONTHLY REVIEW', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('NEW MEDIA AND SOCIETY', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('NEW POLITICAL ECONOMY', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('NONPROFIT AND VOLUNTARY SECTOR LEADERSHIP', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('NONPROFIT AND VOLUNTARY SECTOR MARKETING', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('NONPROFIT AND VOLUNTARY SECTOR QUATERLY', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('NOROESTE DE M+AMk-XICO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('NOVOHISPANIA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('NOVOS ESTUDOS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('PAPERS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('PAPERS ON SOCIAL REPRESENTATIONS THREADS OF DISCUSSION', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('PAUTA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('PERSPECTIVAS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('PERSPECTIVAS HISTORICAS/HISTORICAL PERSPECTIVES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('POLEMICA, REVISTA CENTROAMERICANA DE CIENCIAS SOCIALES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('POLITICA Y CULTURA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('POL+AM0-TICAS AGRICOLAS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('POPULATION AND DEVELOPMENT AND REVIEW', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('QUATERLY REVIEW OF ECONOMICS AND BUSSINESS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('RAND: Journal of Economics', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REFORMA Y DEMOCRACIA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REFUGE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REFUGEE SURVEY QUATERLY', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REGIONES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('RELIGION WATH', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA BRASILEIRA DE ECONOMIA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA CARTOGR+AME-FICA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA DE ESTUDIOS JALISCIENCES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA DE LA CEPAL', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA DE PSICOLOGIA SOCIAL Y PERSONALIDAD', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA DEBATE FEMINISTA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA DO SERVICIO P+ANo-BLICO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA EUROPEA DE ESTUDIOS LATINOAMERICANOS Y DEL CARIBE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA INTERAMERICANA DE PLANIFICACI+ANM-N', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA IZTAPALAPA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA MEXICANA DEL CARIBE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA TERRA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVUE FRANCAISE DE SCIENCE POLITIQUE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVUE TIERS MONDE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('SEMINARIO DE HISTORIA MEXICANA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('TRANSFER. European Review of Labour and Research', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('El Cotidiano', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('La Critica Sociol+APM-gica', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Ciudad y Territorio', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Entorno', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Jack London Journal', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Journal of Cross Cultural Research', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Mexicana de Agronegocios', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Nexos', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Akamon Managment Review', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Historia, Antropolog+AO0-a y Fuentes Orales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Actas', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Imagining Ourselves', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Mexicana de Estudios Canadoenses', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('R+AO0-o Bravo Journal', null, '1067-0149', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Panamericana de Salud P+APo-blica', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Nexos', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Araucaria', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Migraciones', null, 'null', null, null, null, null, null, 2, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Latinoamerica de Estudios Educativoss', null, 'null', null, null, null, null, null, 2, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA LATINOAMERICANA DE ESTUDIOS EDUCATIVOS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA LATINOAMERICANA DE ESTUDIOS URBANOS REGIONALES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('The Americas Review', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Scripta Nava', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Salud Fronteriza', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('SCERP MONOGRAPH SERIES', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Area', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Voces de la Peninsula', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Disco Instituto Nacional de Antropolog+AO0-a e Historia', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Antropolog+AO0-a del Desierto', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Migration and Theology', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista de Estudios Sociales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Comisi+APM-n de Biblioteca y Asuntos Editoriales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Estado en Movimiento', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Estudios Centroamericanos', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('The U.S. Mexican Border Environment: Dynamics of Human-Environment Interactions', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Les Latinos des USA', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Ryspin Revista Electr+APM-nica', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Ciencia, Conocimiento y Tecnolog+AO0-a', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Encuentros, Revista Historia y Ciencias Sociales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Pan American Journal of Public Health', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista de Ciencias Sociales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Comparative American Studies', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Estudios Culturales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Puentes', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Hipertexto', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('En Pleno. Debate Legislativo.', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('La politica social y el combate a la pobreza en M+AOk-xico', null, '84-669-2413-2', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Culturales', null, '1870-1191', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Encyclopedia of Health +ACY- Aging', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Comercio Exterior', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Japanese Hybrid Factories in Worldwide Comparison: Suggestions for the Global Production Strategies of Multinational Enterprises', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Innovation: Managment, Policy +ACY- Practice', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Lezamma', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Anales de la Educaci+APM-n Com+APo-n', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Ipercorpo Spaesamenti Nella Creazione Contemporanea', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Antropologia Iberoamericana', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revue Europeenne de Migrations Internacionales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Voz y Voto', null, '0187-7024', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Tijuana en Zaragoza', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('The Journal of Politics', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('El Colegio de la Frontera Norte', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Southwest Hydrology', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('JAPA (Journal of the American Planning Association)', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('North American Journal of Fisheries Management', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Latrin American Perspectives', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Mas alla del esp+AO0-ritu. Actores, acciones y pr+AOE-cticas en Iglesias Pentecostales.', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Manufactura', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Estudios de Seguridad Social', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Este Pa+AO0-s. Tendencias y opiniones', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Mundo del trabajo', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Enfoque Social', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('El Desarrollo Rural Hoy', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Enfermedades Infecciosas y Microbiolog+AO0-a', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Foreign  Affairs', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Calei-Doscopio', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Border Trends, Border Cultures', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Investigaciones Regionales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Trabalhos do XXV Congreso  ALAS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Gaceta Ide+AEA-s CONCYTEG', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REMHU Revista Interdisciplinar da Mobilidade Humana', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('The ICFAI Journal of Applied Economics', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Campo Abierto', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Campestre la Revista de Baja California', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CHRISTUS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Cuadernos de Estudios Empresariales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Raz+APM-n y palabra', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Global Economic Journal', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Bolet+AO0-n de los Sistemas Nacionales Estad+AO0-stico y de Informaci+APM-n Geogr+AOE-fica', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Contribuciones desde Coatepec', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Applied Vegetation Science', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('PROBLEMAS DEL DESARROLLO', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Bolet+AO0-n de Derecho Comparado', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('LA REVUE HOMMES ET MIGRATIONS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Atlantic Economic Journal', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('After the Washington Conference: colaborative scholarship for a new America', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Development Annual Newsletter', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Archivio Di Studi Urbani e Regionali', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Esp+AO0-ritu Cient+AO0-fico en Acci+APM-n', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('LiminaR', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Econom+AO0-a Informa', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Ciencia y Desarrollo', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Publicaci+APM-n en l+AO0-nea del Consejo de Ciencia y Tegnolog+AO0-a del estado de Guanajuato CONCyTEG', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Hommes et Migrations', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Am+AOk-rica Latina Hoy. Revista de ciencias sociales.', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Foro de la frontera norte', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Am+AOk-rica Latina Hoy. Revista de Ciencias Sociales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ASURE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Sociedad de Econom+AO0-a Mundial', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Mexico Indigena', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Cubana de Psicolog+AO0-a', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista de Educaci+APM-n Superior', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Estudios Fronterizos', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Econom+AO0-a UNAM', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Meyib+APM-', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Crisol: Fusi+APM-n de ideas', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Rituales Sonoros de los Muertos', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Examen', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Paramo del Campo y la Ciudad, Centro de Estudios sobre Migracion y Pobreza del Estado de Mexico', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Paramo del Campo y la Ciudad', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Reflexiones sobre la violencia', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Gender Terrorism', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Foro Frontera Norte 2007, Ciudad Ju+AOE-rez', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Harvard Design Magazine', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Espa+APE-ola de Salud P+APo-blica', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Berkeley Planning Journal', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Outre Terre Revue Francaise de Geopolitique', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Sons de la Mediterrania', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Contingencies', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Poblaci+APM-n Chihuahua', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Papers de demograf+AO0-a', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Quehacer Regio', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Pueblos y fronteras digital, Iniciativa empresarial y desarrollo local en Am+AOk-rica Latina', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Gaceta del Senado', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('DELOS: Desarrollo Local Sostenible', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('UNAM', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CISAN', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('CIDE', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Csiro Publishing', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Applies Geography', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Mujer y Salud', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Rizoma: Revista de Cultura Urbana', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Esp+AOk-culo', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Nuestro Quehacer Regio', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Electr+APM-nica de Investigaci+APM-n Educativa', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Cahier Des Am+AOk-riques Latines', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('La Frontera', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Water Policy', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTI-CANCER DRUG DESIGN', null, '0266-9536', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTI-CANCER DRUGS', null, '0959-4973', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTI-CORROSION METHODS AND MATERIALS', null, '0003-5599', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTIBIOTICS AND CHEMOTHERAPY', null, '0066-4758', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTICANCER RESEARCH', null, '0250-7005', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTIGONISH REVIEW', null, '0003-5661', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTIKE UND ABENDLAND', null, '0003-5696', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTIMICROBIAL AGENTS AND CHEMOTHERAPY', null, '0066-4804', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTIOCH REVIEW', null, '0003-5769', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTIPODE', null, '0066-4812', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTIQUITY', null, '0003-598X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTISENSE +ACY- NUCLEIC ACID DRUG DEVELOPMENT', null, '1087-2906', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTITRUST LAW JOURNAL', null, '0003-6056', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ANTIVIRAL CHEMISTRY +ACY- CHEMOTHERAPY', null, '0956-3202', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF ORTHODONTICS AND DENTOFACIAL ORTHOPEDICS', null, '0889-5406', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF ORTHOPSYCHIATRY', null, '0002-9432', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF OTOLARYNGOLOGY', null, '0196-0709', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF OTOLOGY', null, '0192-9763', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PATHOLOGY', null, '0002-9440', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PERINATOLOGY', null, '0735-1631', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PHARMACEUTICAL EDUCATION', null, '0002-9459', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PHILOLOGY', null, '0002-9475', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PHYSICAL ANTHROPOLOGY', null, '0002-9483', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PHYSICAL MEDICINE +ACY- REHABILITATION', null, '0894-9115', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PHYSICS', null, '0002-9505', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PHYSIOLOGY-CELL PHYSIOLOGY', null, '0363-6143', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PHYSIOLOGY-ENDOCRINOLOGY AND METABOLISM', null, '0193-1849', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PHYSIOLOGY-GASTROINTESTINAL AND LIVER PHYSIOLOGY', null, '0193-1857', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PHYSIOLOGY-HEART AND CIRCULATORY PHYSIOLOGY', null, '0363-6135', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PHYSIOLOGY-LUNG CELLULAR AND MOLECULAR PHYSIOLOGY', null, '1040-0605', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PHYSIOLOGY-REGULATORY INTEGRATIVE AND COMPARATIVE   PHYSIOLOGY', null, '0363-6119', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PHYSIOLOGY-RENAL PHYSIOLOGY', null, '0363-6127', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF POLITICAL SCIENCE', null, '0092-5853', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF POTATO RESEARCH', null, '0003-0589', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF ENOLOGY AND VITICULTURE', null, '0002-9254', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF EPIDEMIOLOGY', null, '0002-9262', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF EVALUATION', null, '1098-2140', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF FAMILY THERAPY', null, '0192-6187', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF FORENSIC MEDICINE AND PATHOLOGY', null, '0195-7910', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF GASTROENTEROLOGY', null, '0002-9270', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF GERIATRIC PSYCHIATRY', null, '1064-7481', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF HEALTH BEHAVIOR', null, '1087-3244', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF HEALTH PROMOTION', null, '0890-1171', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF HEALTH-SYSTEM PHARMACY', null, '1079-2082', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF HEMATOLOGY', null, '0361-8609', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF HUMAN BIOLOGY', null, '1042-0533', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF HUMAN GENETICS', null, '0002-9297', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF HYPERTENSION', null, '0895-7061', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF INDUSTRIAL MEDICINE', null, '0271-3586', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF INFECTION CONTROL', null, '0196-6553', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF INTERNATIONAL LAW', null, '0002-9300', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF KIDNEY DISEASES', null, '0272-6386', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF LAW +ACY- MEDICINE', null, '0098-8588', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF LEGAL HISTORY', null, '0002-9319', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF MANAGED CARE', null, '1088-0224', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF MATHEMATICS', null, '0002-9327', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF MEDICAL GENETICS', null, '0148-7299', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF MEDICAL QUALITY', null, '1062-8606', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF MEDICINE', null, '0002-9343', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF NEPHROLOGY', null, '0250-8095', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN INDIAN AND ALASKA NATIVE MENTAL HEALTH RESEARCH', null, '0893-5394', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN INDIAN CULTURE AND RESEARCH JOURNAL', null, '0161-6463', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN INDUSTRIAL HYGIENE ASSOCIATION JOURNAL', null, '0002-8894', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JEWISH HISTORY', null, '0164-0178', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF AGRICULTURAL ECONOMICS', null, '0002-9092', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF ALTERNATIVE AGRICULTURE', null, '0889-1893', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF ARCHAEOLOGY', null, '0002-9114', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF ART THERAPY', null, '0007-4764', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF BOTANY', null, '0002-9122', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF CARDIOLOGY', null, '0002-9149', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF CARDIOVASCULAR PATHOLOGY', null, '0887-8005', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF CHINESE MEDICINE', null, '0192-415X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF CLINICAL HYPNOSIS', null, '0002-9157', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF CLINICAL NUTRITION', null, '0002-9165', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF CLINICAL ONCOLOGY-CANCER CLINICAL TRIALS', null, '0277-3732', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF CLINICAL PATHOLOGY', null, '0002-9173', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF COMMUNITY PSYCHOLOGY', null, '0091-0562', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF COMPARATIVE LAW', null, '0002-919X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF DENTISTRY', null, '0894-8275', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF DERMATOPATHOLOGY', null, '0193-1091', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF DRUG AND ALCOHOL ABUSE', null, '0095-2990', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF ECONOMICS AND SOCIOLOGY', null, '0002-9246', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF EDUCATION', null, '0195-6744', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF ELECTRONEURODIAGNOSTIC TECHNOLOGY', null, '1086-508X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF EMERGENCY MEDICINE', null, '0735-6757', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMBIO', null, '0044-7447', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMEGHINIANA', null, '0002-7014', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERASIA JOURNAL', null, '0044-7471', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN ANNALS OF THE DEAF', null, '0002-726X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN ANTHROPOLOGIST', null, '0002-7294', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN ANTIQUITY', null, '0002-7316', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMAZONIANA-LIMNOLOGIA ET OECOLOGIA REGIONALIS SYSTEMAE FLUMINIS AMAZONAS', null, '0065-6755', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN BANKRUPTCY LAW JOURNAL', null, '0027-9048', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN BEE JOURNAL', null, '0002-7626', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN BEHAVIORAL SCIENTIST', null, '0002-7642', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN BIOLOGY TEACHER', null, '0002-7685', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN BOOK PUBLISHING RECORD', null, '0002-7707', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN BOOK REVIEW', null, '0149-9408', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN BUSINESS LAW JOURNAL', null, '0002-7766', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN CATHOLIC PHILOSOPHICAL QUARTERLY', null, '1051-3558', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN CERAMIC SOCIETY BULLETIN', null, '0002-7812', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN CRIMINAL LAW REVIEW', null, '0164-0364', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN ECONOMIC REVIEW', null, '0002-8282', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN EDUCATIONAL RESEARCH JOURNAL', null, '0002-8312', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN ETHNOLOGIST', null, '0094-0496', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN FAMILY PHYSICIAN', null, '0002-838X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN FERN JOURNAL', null, '0002-8444', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN HEART JOURNAL', null, '0002-8703', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN HERITAGE', null, '0002-8738', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN HISTORICAL REVIEW', null, '0002-8762', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN HISTORY', null, '1076-8866', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN IMAGO', null, '0065-860X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AKTUELLE UROLOGIE', null, '0001-7868', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AKZENTE-ZEITSCHRIFT FUR LITERATUR', null, '0002-3957', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AL-QANTARA', null, '0211-3589', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALBERTA JOURNAL OF EDUCATIONAL RESEARCH', null, '0002-4805', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALBION', null, '0095-1390', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALCATEL TELECOMMUNICATIONS REVIEW', null, '1267-7167', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALCHERINGA', null, '0311-5518', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALCOHOL', null, '0741-8329', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALCOHOL AND ALCOHOLISM', null, '0735-0414', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALCOHOL RESEARCH +ACY- HEALTH', null, '0090-838X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALCOHOLISM-CLINICAL AND EXPERIMENTAL RESEARCH', null, '0145-6008', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALDRICHIMICA ACTA', null, '0002-5100', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALGEBRA COLLOQUIUM', null, '1005-3867', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALGEBRA UNIVERSALIS', null, '0002-5240', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALGORITHMICA', null, '0178-4617', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALIMENTA', null, '0002-5402', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALIMENTARY PHARMACOLOGY +ACY- THERAPEUTICS', null, '0269-2813', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALLELOPATHY JOURNAL', null, '0971-4693', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALLERGOLOGIE', null, '0344-5062', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALLERGY', null, '0105-4538', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALLERGY AND ASTHMA PROCEEDINGS', null, '1088-5412', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALLGEMEINE FORST UND JAGDZEITUNG', null, '0002-5852', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALTERNATIVE THERAPIES IN HEALTH AND MEDICINE', null, '1078-6791', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALTERNATIVES JOURNAL', null, '0002-6638', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALTERNATIVES-SOCIAL TRANSFORMATION AND HUMANE GOVERNANCE', null, '0304-3754', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALTEX-ALTERNATIVEN ZU TIEREXPERIMENTEN', null, '0946-7785', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALZHEIMER DISEASE +ACY- ASSOCIATED DISORDERS', null, '0893-0341', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ALZHEIMERS REPORTS', null, '1461-6130', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGRICULTURAL AND FOOD SCIENCE IN FINLAND', null, '1239-0992', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGRICULTURAL AND FOREST METEOROLOGY', null, '0168-1923', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGRICULTURAL ECONOMICS', null, '0169-5150', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGRICULTURAL HISTORY', null, '0002-1482', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AFRICA', null, '0001-9720', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AFRICA TODAY', null, '0001-9887', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AFRICAN AFFAIRS', null, '0001-9909', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AFRICAN AMERICAN REVIEW', null, '1062-4783', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AFRICAN ARTS', null, '0001-9933', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AFRICAN ECONOMIC HISTORY', null, '0145-2258', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AFRICAN ENTOMOLOGY', null, '1021-3589', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AFRICAN JOURNAL OF ECOLOGY', null, '0141-6707', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGE', null, '0161-9152', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGE AND AGEING', null, '0002-0729', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGEING AND SOCIETY', null, '0144-686X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGENDA', null, '0002-0796', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGENTS AND ACTIONS SUPPLEMENTS', null, '0379-0363', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGGRESSION AND VIOLENT BEHAVIOR', null, '1359-1789', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGGRESSIVE BEHAVIOR', null, '0096-140X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGING +ACY- MENTAL HEALTH', null, '1360-7863', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGING NEUROPSYCHOLOGY AND COGNITION', null, '1382-5585', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGING-CLINICAL AND EXPERIMENTAL RESEARCH', null, '0394-9532', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AGRIBIOLOGICAL RESEARCH-ZEITSCHRIFT FUR AGRARBIOLOGIE AGRIKULTURCHEMIE   OKOLOGIE', null, '0938-0337', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Cooperaci+APM-n Internacional', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista de Estudios Regionales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Gaceta Laboral', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('KOREA JOURNAL', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('JOURNAL BORDERLINE STUDIES', null, 'null', null, null, null, null, null, 2, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Migraciones Internacionales', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Journals of the statistical', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista divulgar+AOk-', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('REVISTA SEDOS', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Memorias del 4to. Congreso de la Rama Latinoamericana', null, 'null', null, null, null, null, null, 2, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('xxx', null, 'null', null, null, null, null, null, 2, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Enfoque', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Revista Aduanas', null, '16652029', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Atenci+APM-n M+AOk-xico Positionen der Gegenwart / Posiciones en la actualidad', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('International Journal of Automative Technology and Management', null, 'null', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('Papeles de Poblaci+APM-n', null, 'null', null, null, null, null, null, 2, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN WATER RESOURCES', null, '0309-1708', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVERSE DRUG REACTIONS AND TOXICOLOGICAL REVIEWS', null, '0964-198X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AEI AUTOMAZIONE ENERGIA INFORMAZIONE', null, '0013-6131', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AERONAUTICAL JOURNAL', null, '0001-9240', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY IMMUNOLOGY AND IMMUNOPATHOLOGY', null, '0165-2427', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY JOURNAL', null, '1090-0233', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY MEDICINE', null, '8750-7943', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY MICROBIOLOGY', null, '0378-1135', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY PARASITOLOGY', null, '0304-4017', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY PATHOLOGY', null, '0300-9858', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY PRACTICE STAFF', null, '1047-8639', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY QUARTERLY', null, '0165-2176', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY RADIOLOGY +ACY- ULTRASOUND', null, '1058-8183', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY RECORD', null, '0042-4900', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY RESEARCH', null, '0928-4249', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY RESEARCH COMMUNICATIONS', null, '0165-7380', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY SURGERY', null, '0161-3499', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETERINARY TECHNICIAN', null, '8750-8990', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VETUS TESTAMENTUM', null, '0042-4935', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VIATOR-MEDIEVAL AND RENAISSANCE STUDIES', null, '0083-5897', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VIBRATIONAL SPECTROSCOPY', null, '0924-2031', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VICTORIAN LITERATURE AND CULTURE', null, '0092-4725', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VICTORIAN NEWSLETTER', null, '0042-5192', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VICTORIAN POETRY', null, '0042-5206', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VICTORIAN STUDIES', null, '0042-5222', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('VIDE-SCIENCE TECHNIQUE ET APPLICATIONS', null, '1266-0167', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN MICROBIAL PHYSIOLOGY', null, '0065-2911', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN MICROCIRCULATION', null, '0065-2938', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN NEUROLOGY', null, '0091-3952', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN NUCLEAR PHYSICS', null, '0065-2970', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN NURSING SCIENCE', null, '0161-9268', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN NUTRITIONAL RESEARCH', null, '0149-9483', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN ORGANOMETALLIC CHEMISTRY', null, '0065-3055', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN OTO-RHINO-LARYNGOLOGY', null, '0065-3071', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN PAIN RESEARCH AND THERAPY', null, '0146-0722', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN PARASITOLOGY', null, '0065-308X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN PHYSICAL ORGANIC CHEMISTRY', null, '0065-3160', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN PHYSICS', null, '0001-8732', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN PHYSIOLOGY EDUCATION', null, '1043-4046', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN POLYMER SCIENCE', null, '0065-3195', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN POLYMER TECHNOLOGY', null, '0730-6679', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN PROSTAGLANDIN THROMBOXANE AND LEUKOTRIENE RESEARCH', null, '0361-5952', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN PROTEIN CHEMISTRY', null, '0065-3233', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN PSYCHOSOMATIC MEDICINE', null, '0065-3268', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN QUANTUM CHEMISTRY', null, '0065-3276', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN RADIATION BIOLOGY', null, '0065-3292', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN RENAL REPLACEMENT THERAPY', null, '1073-4449', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN SECOND MESSENGER AND PHOSPHOPROTEIN RESEARCH', null, '1040-7952', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN SERVICES MARKETING AND MANAGEMENT', null, '1067-5671', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN SPACE RESEARCH', null, '0273-1177', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN STRATEGIC MANAGEMENT', null, '0742-3322', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN STRATEGIC MANAGEMENT : A RESEARCH ANNUAL', null, '+ACoAKgAqACo--+ACoAKgAqACo-', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN THE STUDY OF BEHAVIOR', null, '0065-3454', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN COLLOID AND INTERFACE SCIENCE', null, '0001-8686', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN COMPUTATIONAL MATHEMATICS', null, '1019-7168', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN ATMOSPHERIC SCIENCES', null, '0256-1530', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN ATOMIC MOLECULAR AND OPTICAL PHYSICS', null, '0065-2199', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN AUDIOLOGY', null, '0254-8747', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN BIOCHEMICAL PSYCHOPHARMACOLOGY', null, '0065-2229', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN BIOPHYSICS', null, '0065-227X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN BOTANICAL RESEARCH INCORPORATING ADVANCES IN PLANT PATHOLOGY', null, '+ACoAKgAqACo--+ACoAKgAqACo-', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN CANCER RESEARCH', null, '0065-230X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN CARBOHYDRATE CHEMISTRY AND BIOCHEMISTRY', null, '0065-2318', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN CARDIOLOGY', null, '0065-2326', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN CATALYSIS', null, '0360-0564', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN CEMENT RESEARCH', null, '0951-7197', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN CHEMICAL PHYSICS', null, '0065-2385', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN CHEMISTRY SERIES', null, '0065-2393', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN CHILD DEVELOPMENT AND BEHAVIOR', null, '0065-2407', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN CHROMATOGRAPHY', null, '0065-2415', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN CLINICAL CHEMISTRY', null, '0065-2423', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCES IN CLINICAL CHILD PSYCHOLOGY', null, '0149-4732', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA VIROLOGICA', null, '0001-723X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA ZOOLOGICA', null, '0001-7272', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA ZOOLOGICA ACADEMIAE SCIENTIARUM HUNGARICAE', null, '1217-8837', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTAS ESPANOLAS DE PSIQUIATRIA', null, '1139-9287', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTES DE LA RECHERCHE EN SCIENCES SOCIALES', null, '0335-5322', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTUALITE CHIMIQUE', null, '0151-9093', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACUPUNCTURE +ACY- ELECTRO-THERAPEUTICS RESEARCH', null, '0360-1293', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACUSTICA', null, '0001-7884', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADAPTED PHYSICAL ACTIVITY QUARTERLY', null, '0736-5829', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADAPTIVE BEHAVIOR', null, '1059-7123', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADDICTION', null, '0965-2140', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADDICTION BIOLOGY', null, '1355-6215', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADDICTION RESEARCH', null, '1058-6989', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADDICTIVE BEHAVIORS', null, '0306-4603', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADHESIVES AGE', null, '0001-821X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADMINISTRATION +ACY- SOCIETY', null, '0095-3997', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADMINISTRATION AND POLICY IN MENTAL HEALTH', null, '0894-587X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADMINISTRATION IN SOCIAL WORK', null, '0364-3107', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADMINISTRATIVE LAW REVIEW', null, '0001-8368', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADMINISTRATIVE SCIENCE QUARTERLY', null, '0001-8392', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADOLESCENCE', null, '0001-8449', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADOLESCENT PSYCHIATRY', null, '0065-2008', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADSORPTION SCIENCE +ACY- TECHNOLOGY', null, '0263-6174', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADSORPTION-JOURNAL OF THE INTERNATIONAL ADSORPTION SOCIETY', null, '0929-5607', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADULT EDUCATION QUARTERLY', null, '0741-7136', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCED COMPOSITE MATERIALS', null, '0924-3046', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCED COMPOSITES LETTERS', null, '0963-6935', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCED DRUG DELIVERY REVIEWS', null, '0169-409X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ADVANCED MATERIALS', null, '0935-9648', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA ORTHOPAEDICA SCANDINAVICA', null, '0001-6470', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA OTO-LARYNGOLOGICA', null, '0001-6489', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PAEDIATRICA', null, '0803-5253', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PALAEONTOLOGICA POLONICA', null, '0567-7920', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PARASITOLOGICA', null, '1230-2821', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PHARMACOLOGICA SINICA', null, '0253-9756', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PHYSICA HUNGARICA NEW SERIES-HEAVY ION PHYSICS', null, '1219-7580', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PHYSICA POLONICA A', null, '0587-4246', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PHYSICA POLONICA B', null, '0587-4254', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PHYSICA SINICA', null, '1000-3290', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PHYSICA SLOVACA', null, '0323-0465', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PHYSICO-CHIMICA SINICA', null, '1000-6818', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PHYSIOLOGIAE PLANTARUM', null, '0137-5881', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PHYSIOLOGICA SCANDINAVICA', null, '0001-6772', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA POLONIAE HISTORICA', null, '0001-6829', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA POLYMERICA', null, '0323-7648', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA POLYMERICA SINICA', null, '1000-3304', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PROTOZOOLOGICA', null, '0065-1583', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PSYCHIATRICA SCANDINAVICA', null, '0001-690X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA PSYCHOLOGICA', null, '0001-6918', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA RADIOLOGICA', null, '0284-1851', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA SOCIETATIS BOTANICORUM POLONIAE', null, '0001-6977', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA SOCIOLOGICA', null, '0001-6993', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA THERIOLOGICA', null, '0001-7051', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA TROPICA', null, '0001-706X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA VETERINARIA BRNO', null, '0001-7213', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA VETERINARIA HUNGARICA', null, '0236-6290', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA VETERINARIA SCANDINAVICA', null, '0044-605X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA VETERINARIA-BEOGRAD', null, '0567-8315', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA HAEMATOLOGICA', null, '0001-5792', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA HISTOCHEMICA', null, '0065-1281', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA HISTOCHEMICA ET CYTOCHEMICA', null, '0044-5991', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA HYDROCHIMICA ET HYDROBIOLOGICA', null, '0323-4320', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA INFORMATICA', null, '0001-5903', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA MATERIALIA', null, '1359-6454', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA MATHEMATICA', null, '0001-5962', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA MATHEMATICA HUNGARICA', null, '0236-5294', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA MATHEMATICA SCIENTIA', null, '0252-9602', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA MATHEMATICA SINICA-ENGLISH SERIES', null, '1000-9574', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA MECHANICA', null, '0001-5970', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA MECHANICA SINICA', null, '0567-7718', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA MECHANICA SOLIDA SINICA', null, '0894-9166', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA MEDICA AUSTRIACA', null, '0303-8173', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA MEDICA OKAYAMA', null, '0386-300X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA MOZARTIANA', null, '0001-6233', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA MUSICOLOGICA', null, '0001-6241', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA NEUROBIOLOGIAE EXPERIMENTALIS', null, '0065-1400', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA NEUROCHIRURGICA', null, '0001-6268', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA NEUROLOGICA BELGICA', null, '0300-9009', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA NEUROLOGICA SCANDINAVICA', null, '0001-6314', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA NEUROPATHOLOGICA', null, '0001-6322', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA NEUROPSYCHIATRICA', null, '0924-2708', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA OBSTETRICIA ET GYNECOLOGICA SCANDINAVICA', null, '0001-6349', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA ODONTOLOGICA SCANDINAVICA', null, '0001-6357', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA OECOLOGICA-INTERNATIONAL JOURNAL OF ECOLOGY', null, '1146-609X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA ONCOLOGICA', null, '0284-186X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA OPHTHALMOLOGICA SCANDINAVICA', null, '1395-3907', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA ASTRONOMICA', null, '0001-5237', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA BIOCHIMICA ET BIOPHYSICA SINICA', null, '0582-9879', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA BIOCHIMICA POLONICA', null, '0001-527X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA BIOLOGICA CRACOVIENSIA SERIES BOTANICA', null, '0001-5296', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA BIOLOGICA HUNGARICA', null, '0236-5383', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA BIOQUIMICA CLINICA LATINOAMERICANA', null, '0325-2957', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA BIOTECHNOLOGICA', null, '0138-4988', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA BIOTHEORETICA', null, '0001-5342', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA BOTANICA GALLICA', null, '1253-8078', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA BOTANICA SINICA', null, '0577-7496', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA CARDIOLOGICA', null, '0001-5385', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA CHEMICA SCANDINAVICA', null, '0904-213X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA CHIMICA SINICA', null, '0567-7351', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA CHIMICA SLOVENICA', null, '1318-0207', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA CHIRURGICA BELGICA', null, '0001-5458', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA CHIRURGICA ITALICA', null, '0001-5466', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA CLINICA BELGICA', null, '0001-5512', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA CRYSTALLOGRAPHICA SECTION A', null, '0108-7673', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA CRYSTALLOGRAPHICA SECTION B-STRUCTURAL SCIENCE', null, '0108-7681', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA CRYSTALLOGRAPHICA SECTION C-CRYSTAL STRUCTURE COMMUNICATIONS', null, '0108-2701', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA CRYSTALLOGRAPHICA SECTION D-BIOLOGICAL CRYSTALLOGRAPHY', null, '0907-4449', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA CYTOLOGICA', null, '0001-5547', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA DERMATO-VENEREOLOGICA', null, '0001-5555', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA DIABETOLOGICA', null, '0940-5429', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA GASTRO-ENTEROLOGICA BELGICA', null, '0001-5644', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACTA GEOLOGICA SINICA-ENGLISH EDITION', null, '1000-9515', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN MATHEMATICAL MONTHLY', null, '0002-9890', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN MIDLAND NATURALIST', null, '0003-0031', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN MINERALOGIST', null, '0003-004X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN MUSIC', null, '0734-4392', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACI STRUCTURAL JOURNAL', null, '0889-3241', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACM COMPUTING SURVEYS', null, '0360-0300', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACM SIGPLAN NOTICES', null, '0362-1340', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACM TRANSACTIONS ON COMPUTER SYSTEMS', null, '0734-2071', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACM TRANSACTIONS ON DATABASE SYSTEMS', null, '0362-5915', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACM TRANSACTIONS ON DESIGN AUTOMATION OF ELECTRONIC SYSTEMS', null, '1084-4309', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACM TRANSACTIONS ON GRAPHICS', null, '0730-0301', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ACM TRANSACTIONS ON INFORMATION SYSTEMS', null, '1046-8188', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PSYCHOLOGY', null, '0002-9556', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PSYCHOTHERAPY', null, '0002-9564', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF PUBLIC HEALTH', null, '0090-0036', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF REPRODUCTIVE IMMUNOLOGY', null, '8755-8920', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF RESPIRATORY AND CRITICAL CARE MEDICINE', null, '1073-449X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF RESPIRATORY CELL AND MOLECULAR BIOLOGY', null, '1044-1549', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF RHINOLOGY', null, '1050-6586', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF ROENTGENOLOGY', null, '0361-803X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF SCIENCE', null, '0002-9599', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF SOCIOLOGY', null, '0002-9602', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF SPEECH-LANGUAGE PATHOLOGY', null, '1058-0360', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF SPORTS MEDICINE', null, '0363-5465', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF SURGERY', null, '0002-9610', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF SURGICAL PATHOLOGY', null, '0147-5185', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF THE MEDICAL SCIENCES', null, '0002-9629', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF TROPICAL MEDICINE AND HYGIENE', null, '0002-9637', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF VETERINARY RESEARCH', null, '0002-9645', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL ON ADDICTIONS', null, '1055-0496', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL ON MENTAL RETARDATION', null, '0895-8017', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN LABORATORY', null, '0044-7749', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN LITERARY HISTORY', null, '0896-7148', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN LITERARY REALISM 1870-1910', null, '0002-9823', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN LITERATURE', null, '0002-9831', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN MALACOLOGICAL BULLETIN', null, '0740-2783', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF NEURORADIOLOGY', null, '0195-6108', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF NURSING', null, '0002-936X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF OBSTETRICS AND GYNECOLOGY', null, '0002-9378', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF OCCUPATIONAL THERAPY', null, '0272-9490', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AMERICAN JOURNAL OF OPHTHALMOLOGY', null, '0002-9394', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BALLET REVIEW', null, '0522-0653', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BALLETT INTERNATIONAL-TANZ AKTUELL', null, '0722-6268', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BANGLADESH JOURNAL OF BOTANY', null, '0253-5416', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BANK MARKETING', null, '0888-3149', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BANKING LAW JOURNAL', null, '0005-5506', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BASIC AND APPLIED SOCIAL PSYCHOLOGY', null, '0197-3533', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BASIC RESEARCH IN CARDIOLOGY', null, '0300-8428', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BASIN RESEARCH', null, '0950-091X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEE WORLD', null, '0005-772X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIOR ANALYST', null, '0738-6729', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIOR AND PHILOSOPHY', null, '1053-8348', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIOR GENETICS', null, '0001-8244', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIOR MODIFICATION', null, '0145-4455', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIOR RESEARCH METHODS INSTRUMENTS +ACY- COMPUTERS', null, '0743-3808', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIOR THERAPY', null, '0005-7894', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIORAL +ACY- SOCIAL SCIENCES LIBRARIAN', null, '0163-9269', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIORAL AND BRAIN SCIENCES', null, '0140-525X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIORAL DISORDERS', null, '0198-7429', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIORAL ECOLOGY', null, '1045-2249', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIORAL ECOLOGY AND SOCIOBIOLOGY', null, '0340-5443', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIORAL HEALTHCARE TOMORROW', null, '1063-8490', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIORAL INTERVENTIONS', null, '1072-0847', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIORAL MEDICINE', null, '0896-4289', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIORAL NEUROSCIENCE', null, '0735-7044', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIORAL SCIENCES +ACY- THE LAW', null, '0735-3936', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('BEHAVIOUR', null, '0005-7959', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN JOURNAL OF PHYSIOTHERAPY', null, '0004-9514', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN JOURNAL OF PLANT PHYSIOLOGY', null, '0310-7841', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN JOURNAL OF POLITICAL SCIENCE', null, '1036-1146', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN JOURNAL OF POLITICS AND HISTORY', null, '0004-9522', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN JOURNAL OF PSYCHOLOGY', null, '0004-9530', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN JOURNAL OF PUBLIC ADMINISTRATION', null, '0313-6647', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN JOURNAL OF SOCIAL ISSUES', null, '0157-6321', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN JOURNAL OF SOIL RESEARCH', null, '0004-9573', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN JOURNAL OF ZOOLOGY', null, '0004-959X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN LITERARY STUDIES', null, '0004-9697', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN METEOROLOGICAL MAGAZINE', null, '0004-9743', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN PSYCHOLOGIST', null, '0005-0067', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN SYSTEMATIC BOTANY', null, '1030-1887', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN VETERINARY JOURNAL', null, '0005-0423', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN VETERINARY PRACTITIONER', null, '0310-138X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUT AUT', null, '0005-0601', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUTOIMMUNITY', null, '0891-6934', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUTOMATIC CONTROL AND COMPUTER SCIENCES', null, '0146-4116', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUTOMATICA', null, '0005-1098', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUTOMATION AND REMOTE CONTROL', null, '0005-1179', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUTOMATION IN CONSTRUCTION', null, '0926-5805', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUTOMOTIVE ENGINEER', null, '0307-6490', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUTOMOTIVE ENGINEERING INTERNATIONAL', null, '0098-2571', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUTONOMOUS ROBOTS', null, '0929-5593', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AVANT SCENE OPERA', null, '0764-2873', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AVIAN DISEASES', null, '0005-2086', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AVIAN PATHOLOGY', null, '0307-9457', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN +ACY- NEW ZEALAND JOURNAL OF OBSTETRICS +ACY- GYNAECOLOGY', null, '0004-8666', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN +ACY- NEW ZEALAND JOURNAL OF STATISTICS', null, '1369-1473', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN AND NEW ZEALAND JOURNAL OF CRIMINOLOGY', null, '0004-8658', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN AND NEW ZEALAND JOURNAL OF MEDICINE', null, '0004-8291', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN AND NEW ZEALAND JOURNAL OF OPHTHALMOLOGY', null, '0814-9763', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN AND NEW ZEALAND JOURNAL OF PSYCHIATRY', null, '0004-8674', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN AND NEW ZEALAND JOURNAL OF PUBLIC HEALTH', null, '1326-0200', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN AND NEW ZEALAND JOURNAL OF SURGERY', null, '0004-8682', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN DENTAL JOURNAL', null, '0045-0421', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN ECONOMIC HISTORY REVIEW', null, '0004-8992', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('AUSTRALIAN JOURNAL OF PHYSICS', null, '0004-9506', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ASTROPHYSICS AND SPACE SCIENCE', null, '0004-640X', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ASYMPTOTIC ANALYSIS', null, '0921-7134', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ATENE E ROMA', null, '0004-6493', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ATHENAEUM-STUDI PERIODICI DI LETTERATURA E STORIA DELL ANTICHITA', null, '0004-6574', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ATHEROSCLEROSIS', null, '0021-9150', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ATHLETIC THERAPY TODAY', null, '1078-7895', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)
insert into RevistaPublicaciones values('ATLA-ALTERNATIVES TO LABORATORY ANIMALS', null, '0261-1929', null, null, null, null, null, 1, null, null, null, 0, 0, GETDATE(), GETDATE(), 1, null, null, null, null, null, null, null, 1, 1)

insert into ProgramaEstudios values('Acceso de las Trabajadoras al Poder Legislativo', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Actuaria', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Administraci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Administraci+APM-n de la Construcci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Administraci+APM-n Estrat+AOk-gica Internacional', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Administraci+APM-n P+APo-blca con Especialidad en Gobiernos Locales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Administraci+APM-n P+APo-blica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Administraci+APM-n P+APo-blica con Especialidad en Gobiernos Locales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Administraci+APM-n P+APo-blica.', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('An+AOE-lisis de la Cultura', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Antrhopology', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Antropolog+AO0-a', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Antropolog+AO0-a Social', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Applied Ecology and Conservation', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Arquitectura', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Arquitectura y Asuntos Urbanos', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Arquitectura y Asuntos Urbanos', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Artes Pl+AOE-sticas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('ASOCIACI+ANM-N  MEXICANA DE POBLACI+ANM-N', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Asuntos Internacionales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('ASUNTOS INTERNACIONALES', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Asuntos Urbanos', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Biolog+AO0-a', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Biologia de la Conservacion', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Biologia de la Conservacionn', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Biology', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Centre de Recherche sur l''Am+AOk-rique Pr+AOk-hispanique', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Centro de Estudios Superiores del Noroeste', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Chicana and  Chicano Studies', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('CHICANA AND CHICANO STUDIES DEPARTMENT', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Chicano Studies', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('CHICANOS AND CHICANOS STUDIES DEPARTMENT', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('CIENCIA DE LA COMUNICACI+ANM-N', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('CIENCIA DE LA EDUCACI+ANM-N', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('CIENCIA SOCIALES', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('CIENCIAS AGR+AM0-COLAS', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias de la Comunicaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias de la Comunicaci+APM-n Social', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias de la Educaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('CIENCIAS DE LA EDUCACI+ANM-N', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias de la educaci+APM-nn', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias de la Salud', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('CIENCIAS DE LA SALUD', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias Econ+APM-micas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias Econ+APM-micas  y Empresariales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias Educativas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias para la Planificaci+APM-n de los Asentamientos Humanos', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias Pol+AO0-ticas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias Pol+AO0-ticas y Sociales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias Sociales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('CIENCIAS SOCIALES', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias Sociales Aplicadas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('CIENCIAS SOCIALES CON ESPECIALIDAD EN ESTUDIOS LABORALES', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias Sociales y Estudios Internacionales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ciencias socialess', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Cincias Sociales aplicadas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Comunicaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Comunicaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Comunicaci+APM-n Cultural e Identidad en Europa e Iberoamerica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Contabilidad', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('CONTABILIDAD Y ADMINISTRACI+ANM-N', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Convenio COESPO-Guanajuato', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Convenio con el COESPO-Guanajuato', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('COOPERACI+ANM-N INTERNACIONAL ENTRE LA UNI+ANM-N EUROPEA Y AM+AMk-RICA LATINA', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Criminolog+AO0-a y Ciencias Forenses', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Cultural Changes in the Border', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Curso de actualizaci+APM-n de Derechos Humanos y Migraci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Curso internacional sobre calidad de vida de personas mayores: conceptos e instrumentos de an+AOE-lisis', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Demograf+AO0-a', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Deparment of  Hispanic Languages and Literatures', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('DEPARTAMENT OF POL+AM0-TICA SCIENCE', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Department of Government. Office of Career Services.', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('DEPERTMENT OF POL+AM0-TICA SCIENCE', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Derecho', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('DESARROLLO CULTURAL COMUNITARIO', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Desarrollo Humano', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Desarrollo humano', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Desarrollo Integral de la Familia', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('DESARROLLO ORGANIZACIONAL', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Desarrollo Regional', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('DESARROLLO REGIONAL', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Desarrollo regionall', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('DESARROLLO REGIONALlll', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('DESARROLLO RURAL', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Desarrollo Urbano', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Development Education Program', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Dip+AFs-limado en poblaci+APM-n y desarrollo', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Diplomado en estudios migratorios', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Diplomado en G+AOk-nero', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Diplomado en Gesti+APM-n Cultural', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Diplomado presencial y a distancia de la actualizaci+APM-n profesional', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Do Antropolog+AO0-a Social', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Docencia Universitaria', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado de Medicina', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado en Ciencias de la Educaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado en ciencias de la educaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado en Ciencias Econ+APM-micas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado en Ciencias Sociales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado en ciencias sociales aplicadass', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado en Ciencias Sociales con Especialidad en Estudios Regionales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado en ciencias socilales aplicadas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado en Educaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado en Estudios en Poblaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado en Estudios Sociales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado en Poblaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctorado en psicolog+AO0-a', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Doctrina Social de la Iglesia', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('ECOLOG+AM0-A Y DESARROLLO SUSTENTABLE', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Econom+AO0-a', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Econom+AO0-a Regional', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('ECONOM+AM0-A REGIONAL', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Econom+AO0-a y Ciencias Sociales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Econom+AO0-a y ciencias sociales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Econom+AO0-a y Gesti+APM-n del Cambio Tecnol+APM-gico', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Econom+AO0-a, Sociedad y Ecolog+AO0-a de las Californias', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Educaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('EDUCACI+ANM-N', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Educaci+APM-n Especial', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('EDUCACI+ANM-N INTERNACIONAL', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Educaci+APM-n Superior', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Enfermer+AO0-a', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('ENSE+ANE-ANZA SUPERIOR', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Escuela de Humanidades', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Espacios, Sociedad, Cultura de America Latina', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('ESPECIALIDAD EN HISTORIA DE M+AMk-XICO', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estructura Econ+APM-mica y Econom+AO0-a del Desarrollo', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudio Sociales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('ESTUDIOS CHICANOS', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios Culturales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios de Estados Unidos y Canada', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios de Frontera', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios de G+AOk-nero en Educaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios de Poblaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios en Desarrollo Global', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios en Poblaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios Hist+APM-ricos', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios Interdisciplinarios', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('ESTUDIOS INTERNACIONALES', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios Latinoamericanos', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios Migratorios', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios Sociales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios Sociales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios Sociales y Human+AO0-sticos de Frontera', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios Socialess', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios y Proyectos Sociales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Estudios y proyectos sociales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Facultad de Contabilidad y Administraci+APM-n.', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Faculty of Intercultural Studies', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Filosof+AO0-a', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Filosof+AO0-a con Especialidad  en administraci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Filosof+AO0-a con Orientaci+APM-n en Asuntos Urbanos', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Filosof+AO0-a con orientaci+APM-n en asuntos urbanos', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Filosof+AO0-a con orientaci+APM-n en Asuntos Urbanoss', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Filosof+AO0-a con Orientaci+APM-n en Trabajo Social', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Finanzas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Finanzas, Gobierno y Relaciones Internacionales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Formaci+APM-n de Seminaristas Scalabrinianos', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Gender Studies', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('G+AOk-nero', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Geograf+AO0-a F+AO0-sica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Geograf+AO0-a Humana', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('GERENCIA P+ANo-BLICA MUNICIPAL', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Gesti+APM-n Cultural', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Gesti+APM-n y Pol+AO0-ticas Publicas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Gobierno  y Gesti+APM-n Local', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Gobierno y pol+AO0-ticas p+APo-blicas en M+AOk-xico', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Historia', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('HISTORIA', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Historia de M+AOk-xico', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('HISTORIA REGIONAL', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('HORTICULTURA', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Importance and Future of Mexican Maquiladora Industry', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ingenier+AO0-a Ambiental', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Ingenier+AO0-a Mecatr+APM-nica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Intervenci+APM-n Pedag+APM-gica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Introducci+APM-n al Estudio de la Historia', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Investigaci+APM-n Aplicada', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Investigaci+APM-n Cuantitativa de Educaci+APM-n Universitaria', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Investigaci+APM-n Pedag+APM-gica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Latin American Studies', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('LATIN AMERICAN STUDIES', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Letras y Comunicaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Licenciatura en Comunicaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Licenciatura en Historia', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Administraci+APM-n P+APo-blica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('MAESTRIA EN ADMINISTRACION PUBLICA CON ESPECIALIDAD EN GOBIERNOS LOCALES', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Administraci+APM-n P+APo-blicaa', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Administraci+APM-n P+APo-blicaaa', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Antropolog+AO0-a Social', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestria en asuntos Internacionales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestria en asuntos internacionaless', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Ciencias de la Educaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Ciencias Educativas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Ciencias Sociales (Especialidad en Salud)', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Ciencias Sociales Aplicadas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Ciencias Sociales FLACSO SEDE M+AOk-xico', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestria en Demografia', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestria en desarro urbano', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestria en Desarrollo Humano', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Desarrollo Regional', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Docencia Universitaria', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en docencia universitaria', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestria en Educaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en estudios  y proyectos sociales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en estudios Latinoamericanos', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Filosof+AO0-a de la Cultura', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestria en manejo de ecosistemas de zonas aridas.', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Manejo de Zonas Aridass', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Manejo de Zonas Fridas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en nutrici+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Planificaci+APM-n Urbana', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Planificaci+APM-n Urbanaa', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Poblaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('MAESTR+AM0-A EN PROCESOS INDUSTRIALES', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Salud p+APo-blica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en salud p+APo-blica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Zona Costera', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Maestr+AO0-a en Zona Costera.', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Manejo de Ecosistemas de Zonas Aridas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Manejo de Zonas Aridas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Master in Business Administration', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Master Internacional de Migraciones y Doctorado en Movilidad Humana', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Master of Arts in Spanish', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('MASTERS DEGREE IN LATIN AMERICAN STUDIES', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Master''s in Public Policy', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Math Sciences and Engineering', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('M+AOk-dico Cirujano', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Medio Ambiente y Desarrollo', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Mestr+AO0-a en Ciencias Sociales  (Especialidad en Salud)', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Metodolog+AO0-a', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Metodolog+AO0-a de la Ciencia', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('METODOLOG+AM0-A DE LA CIENCIA', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Mexican +ACY- Chicano Images in Film', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Migraci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Migraci+APM-n e Multiculturalidad', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Migraci+APM-n y Religi+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Migraciones Internacionales y Derechos Humanos', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Movilidad Humana', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Movilidades y Fronteras', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Museo de Historia Mexicana', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Musicoterapia', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('NEGOCIOS Y ESTUDIOS ECON+ANM-MICOS', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Nutrici+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('NUTRICI+ANM-N', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Orientaci+APM-n Familiar', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Planeaci+APM-n Agropecuaria', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Planeaci+APM-n Urbana', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Planeaci+APM-n y Desarrollo Sustentable', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Planificaci+APM-n Urbana', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Planificaci+APM-n urbana', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Planificaci+APM-n y Desarrollo Urbana', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Poblaci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('POBLACI+ANM-N', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Poblaci+APM-n y Desarrollo', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('POLITICA SCIENCE', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Pol+AO0-tica y Gesti+APM-n Social', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Political Science', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Pr+AOE-ctica Docente de Integraci+APM-n Cultural', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('PROGRAMA DE INTERCAMBIO BINACIONAL', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Programa de Movilidades y Fronteras', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Programa General  de Formaci+APM-n Policial del Estado', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Programa general de formaci+APM-n policial del estado', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Programa Integral  de Alto Liderazgo', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Promoci+APM-n y Desarrollo Cultural', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Psicolog+AO0-a', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('PSICOLOG+AM0-A', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('PSICOLOG+AM0-A DE LA SALUD', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Psicolog+AO0-as', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Public Policy', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('quitar', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Relaciones Industriales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Relaciones industriales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Relaciones Internacionales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Salud Mental', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Salud Ocupacional', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Salud P+APo-blica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Salud p+APo-blica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Salud y Envejecimiento', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Second Year Medical Students', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Seminario de Cultura Popular', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Seminario de Patrimonio Cultural', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Seminario Decentralizaci+APM-n y Desarrollo Local', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Sensibilizaci+APM-n ante la Violencia Dom+AOk-stica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Social Sciences and International Studies', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Social Sciences and International Studies', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Social Studies and International Studies', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Social Studies and International Studiess', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Sociolog+AO0-a', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Sociolog+AO0-a', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Sociolog+AO0-a Pol+AO0-tica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Sociolog+AO0-a Rural', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Sociolog+AO0-aa', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Sonas Aridas', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Southwestern College', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('TALLER DE INVESTIGACI+ANM-N EDUCATIVA', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Taller Sobre Migraci+APM-n y Desarrollo', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('T+AOk-cnico Superior en Procesos de Producci+APM-n', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Tecnolog+AO0-a de Materiales', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Teologado', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Traba', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Trabajo Social', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Tratado de libre comercio', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Tratados de Libre Comercio', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Turismo', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('U.S Latin Studies Program', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('U.S Mexican Border', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Urban Design', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Urbanismo', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Valuaci+APM-n Inmobiliaria', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Verano de Investigaci+APM-n Cient+AO0-fica', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Violencia  Familiar', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Vivienda', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('Women''s Rights and Citizenship in Latin America', GETDATE(), GETDATE(), 1, 1, 1)
insert into ProgramaEstudios values('zonas +AOE-ridaS', GETDATE(), GETDATE(), 1, 1, 1)

insert into NivelEstudios values('Licenciatura', GETDATE(), GETDATE(), 1, 1, 1)
insert into NivelEstudios values('Maestría', GETDATE(), GETDATE(), 1, 1, 1)
insert into NivelEstudios values('Doctorado', GETDATE(), GETDATE(), 1, 1, 1)
insert into NivelEstudios values('Posdoctorado', GETDATE(), GETDATE(), 1, 1, 1)
insert into NivelEstudios values('Especialidad', GETDATE(), GETDATE(), 1, 1, 1)
insert into NivelEstudios values('Diplomado', GETDATE(), GETDATE(), 1, 1, 1)

insert into TipoApoyos values('Formacion académica', GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoApoyos values('Proyecto científico', GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoApoyos values('Desarrollo tecnológico', GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoApoyos values('Nuevos negocios', GETDATE(), GETDATE(), 1, 1, 1)

insert into SubprogramaConacyts values('Fondo sectorial', GETDATE(), GETDATE(), 1, 1, 1)
insert into SubprogramaConacyts values('Beca', GETDATE(), GETDATE(), 1, 1, 1)
insert into SubprogramaConacyts values('Estímulo fiscal', GETDATE(), GETDATE(), 1, 1, 1)
insert into SubprogramaConacyts values('Cátedras posdoctorales', GETDATE(), GETDATE(), 1, 1, 1)
insert into SubprogramaConacyts values('Estímulo SNI', GETDATE(), GETDATE(), 1, 1, 1)
insert into SubprogramaConacyts values('Avance', GETDATE(), GETDATE(), 1, 1, 1)
insert into SubprogramaConacyts values('Cátedras patrimoniales', GETDATE(), GETDATE(), 1, 1, 1)
insert into SubprogramaConacyts values('Repatriación/Consolidación', GETDATE(), GETDATE(), 1, 1, 1)
insert into SubprogramaConacyts values('Fondo ciencia básica', GETDATE(), GETDATE(), 1, 1, 1)
insert into SubprogramaConacyts values('Fondo mixto', GETDATE(), GETDATE(), 1, 1, 1)
insert into SubprogramaConacyts values('Apoyos especiales', GETDATE(), GETDATE(), 1, 1, 1)

insert into FondoConacyts values('CONACyT Ciencia Básica', GETDATE(), GETDATE(), 1, 1, 1)
insert into FondoConacyts values('CONACyT Fondo Mixto', GETDATE(), GETDATE(), 1, 1, 1)
insert into FondoConacyts values('CONACyT Fondo Sectorial', GETDATE(), GETDATE(), 1, 1, 1)

insert into TipoArchivos values('Carta de la Revista',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Carta de la Editorial',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Carta de Aceptación',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Copia del producto',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Portada',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Contraportada',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Indice',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Introducción',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Ultima página',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Carta de aprobación de la Tesis',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Programa del Evento',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Invitación',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Reporte de Actividades',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Boletin',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Carta de la institución',GETDATE(), GETDATE(), 1, 1, 1)
insert into TipoArchivos values('Posgrado Colef',GETDATE(), GETDATE(), 1, 1, 1)

insert into VinculacionAPyDes values('Tesis orientada al Desarrollo Local', GETDATE(), GETDATE(), 1, 1, 1)
insert into VinculacionAPyDes values('Tesis Orientada a la Contribución del Bienestar social', GETDATE(), GETDATE(), 1, 1, 1)
insert into VinculacionAPyDes values('Tesis orientada al desarrollo de grupos vulnerables', GETDATE(), GETDATE(), 1, 1, 1)
insert into VinculacionAPyDes values('Tesis orientada a las políticas públicas', GETDATE(), GETDATE(), 1, 1, 1)
insert into VinculacionAPyDes values('Tesis orientada al desarrollo socioeconómico', GETDATE(), GETDATE(), 1, 1, 1)

--Valores de prueba
insert into Editoriales values('Editorial 1',GETDATE(), GETDATE(), 1, 1, 12, 1, 1)
insert into Editoriales values('Editorial 2',GETDATE(), GETDATE(), 1, 2, 13, 1, 1)
insert into Editoriales values('Editorial 3',GETDATE(), GETDATE(), 1, 3, 14, 1, 1)

insert into DireccionRegionales values('Dirección General Regional Noreste',GETDATE(), GETDATE(), 1, 1, 1)
insert into DireccionRegionales values('Dirección Regional Noroeste',GETDATE(), GETDATE(), 1, 1, 1)
insert into DireccionRegionales values('Tijuana',GETDATE(), GETDATE(), 1, 1, 1)

insert into Sedes values('Matamoros',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into Sedes values('Nuevo Laredo',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into Sedes values('Piedras Negras',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into Sedes values('Monterrey',GETDATE(), GETDATE(), 1, 1, 1, 1);
insert into Sedes values('Ciudad Juarez',GETDATE(), GETDATE(), 2, 1, 1, 1);
insert into Sedes values('Mexicali',GETDATE(), GETDATE(), 1, 2, 1, 1);
insert into Sedes values('Nogales',GETDATE(), GETDATE(), 1, 2, 1, 1);
insert into Sedes values('Tijuana',GETDATE(), GETDATE(), 1, 3, 1, 1);

INSERT Investigadores VALUES('Dec 15 2008 12:00AM', 'Dec 14 2008 12:00AM', 'Produccion','Academico','CVU', 'Expediente SNI', 'Area 1', 'Area 2', 'Area 3', 'Aug 18 2009  9:23AM', 'Aug 18 2009  9:23AM', 1, 2, 1, 1, 1)
INSERT EstadoInvestigadores VALUES('Jan  5 2009 12:00AM','Aug 18 2009  9:23AM',GETDATE(), GETDATE(),1,1,1,1,1)
INSERT CargoInvestigadores VALUES('Aug 18 2009  9:23AM','Aug 18 2009  9:23AM',1,1,1,1,1,1,1)
INSERT CategoriaInvestigadores VALUES('Feb  2 2009 12:00AM','Aug 18 2009  9:23AM',GETDATE(), GETDATE(),1,1,1,1,1)
INSERT GradoAcademicoInvestigadores VALUES('Jan  5 2009 12:00AM','Migracion en la frontera norte de Mexico', GETDATE(),GETDATE(),1,1,1,1,1,1)
INSERT SNIInvestigadores VALUES('Feb  2 2009 12:00AM','Feb  2 2010 12:00AM','Aug 18 2009  9:23AM','Aug 18 2009  9:23AM',1,2,1,1,1)

--Investigador de prueba
INSERT Investigadores VALUES('Dec 15 2008 12:00AM', 'Dec 14 2008 12:00AM', 'Produccion','Academico','CVU', 'Expediente SNI', 'Area 1', 'Area 2', 'Area 3', 'Aug 18 2009  9:23AM', 'Aug 18 2009  9:23AM', 1, 4, 1, 1, 1)
INSERT EstadoInvestigadores VALUES('Jan  5 2009 12:00AM','Aug 18 2009  9:23AM',GETDATE(), GETDATE(),1,1,1,1,2)
INSERT CargoInvestigadores VALUES('Aug 18 2009  9:23AM','Aug 18 2009  9:23AM',1,1,1,1,1,1,2)
INSERT CategoriaInvestigadores VALUES('Feb  2 2009 12:00AM','Aug 18 2009  9:23AM',GETDATE(), GETDATE(),1,1,1,1,2)
INSERT GradoAcademicoInvestigadores VALUES('Jan  5 2009 12:00AM','Migracion en la frontera norte de Mexico', GETDATE(),GETDATE(),1,1,1,1,1,2)
INSERT SNIInvestigadores VALUES('Feb  2 2009 12:00AM','Feb  2 2010 12:00AM','Aug 18 2009  9:23AM','Aug 18 2009  9:23AM',1,2,1,1,2)

INSERT Investigadores VALUES('Dec 15 2008 12:00AM', 'Dec 14 2008 12:00AM', 'Produccion','Academico','CVU', 'Expediente SNI', 'Area 1', 'Area 2', 'Area 3', 'Aug 18 2009  9:23AM', 'Aug 18 2009  9:23AM', 1, 3, 1, 1, 1)
INSERT EstadoInvestigadores VALUES('Jan  5 2009 12:00AM','Aug 18 2009  9:23AM',GETDATE(), GETDATE(),1,1,1,1,3)
INSERT CargoInvestigadores VALUES('Aug 18 2009  9:23AM','Aug 18 2009  9:23AM',1,1,1,1,1,1,3)
INSERT CategoriaInvestigadores VALUES('Feb  2 2009 12:00AM','Aug 18 2009  9:23AM',GETDATE(), GETDATE(),1,1,1,1,3)
INSERT GradoAcademicoInvestigadores VALUES('Jan  5 2009 12:00AM','Migracion en la frontera norte de Mexico', GETDATE(),GETDATE(),1,1,1,1,1,3)
INSERT SNIInvestigadores VALUES('Feb  2 2009 12:00AM','Feb  2 2010 12:00AM','Aug 18 2009  9:23AM','Aug 18 2009  9:23AM',1,2,1,1,3)