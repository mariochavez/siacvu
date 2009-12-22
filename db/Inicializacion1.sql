IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
DROP VIEW [dbo].[Usuarios]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[TesisPosgrados]'))
DROP VIEW [dbo].[TesisPosgrados]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[CursoInvestigadores]'))
DROP VIEW [dbo].[CursoInvestigadores]
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Convenios]'))
DROP VIEW [dbo].[Convenios]
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

--Valores para la vista de convenios
CREATE VIEW Convenios AS
SELECT		2 AS Id, 'Centro de Investigación Científica y de Educación Superior de Ensenada' AS Nombre, 
			'Feb  2 2009 12:00AM' AS FechaFirma, 'Feb  27 2009 12:00AM' AS FechaConclusion, 
			'' AS TerminoReferencia, 'Ninguno' AS ProductoComprometido
UNION
SELECT		1 AS Id, 'Centro de Investigación y Desarrollo Tecnológico en Electroquímica' AS Nombre, 
			'Feb  2 2009 12:00AM' AS FechaFirma, 'Feb  27 2009 12:00AM' AS FechaConclusion, 
			'' AS TerminoReferencia, 'Ninguno' AS ProductoComprometido
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
INSERT UsuarioRol VALUES(2, 3)
INSERT UsuarioRol VALUES(2, 4)
INSERT UsuarioRol VALUES(2, 5)
INSERT UsuarioRol VALUES(2, 6)
INSERT UsuarioRol VALUES(2, 7)
INSERT UsuarioRol VALUES(2, 8)
INSERT UsuarioRol VALUES(2, 9)
INSERT UsuarioRol VALUES(2, 10)
INSERT UsuarioRol VALUES(2, 11)
INSERT UsuarioRol VALUES(2, 12)
INSERT UsuarioRol VALUES(2, 13)
INSERT UsuarioRol VALUES(2, 14)
INSERT UsuarioRol VALUES(2, 15)
INSERT UsuarioRol VALUES(2, 16)
INSERT UsuarioRol VALUES(3, 17)
INSERT UsuarioRol VALUES(1, 18)
INSERT UsuarioRol VALUES(3, 51)
INSERT UsuarioRol VALUES(2, 50)

insert into ConsejoComisiones values('Consejo Académico', 2, 0, GETDATE(), GETDATE(), 1, 1, 1);
insert into ConsejoComisiones values('Comisión Dictaminadora', 2, 1, GETDATE(), GETDATE(), 1, 1, 1);
insert into ConsejoComisiones values('Comisiones Evaluadoras Departamentales', 2, 1, GETDATE(), GETDATE(), 1, 1, 1);
insert into ConsejoComisiones values('Comisiones Académicas de Programas de Posgrado', 2, 1, GETDATE(), GETDATE(), 1, 1, 1);
insert into ConsejoComisiones values('Consejo Editorial', 2, 1, GETDATE(), GETDATE(), 1, 1, 1);

/*
insert into USEGs values('Cartografía Digital',GETDATE(), GETDATE(), 1, 1, 1);
insert into USEGs values('Geo-Estadística',GETDATE(), GETDATE(), 1, 1, 1);
insert into USEGs values('Análisis Espacial',GETDATE(), GETDATE(), 1, 1, 1);
*/
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
/*
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
*/
insert into Monedas values('Pesos',GETDATE(), GETDATE(), 1, 1, 1);
insert into Monedas values('Dolares',GETDATE(), GETDATE(), 1, 1, 1);
/*
insert into ProductoAcademicos values('Libro',GETDATE(), GETDATE(), 1, 1, 1);
insert into ProductoAcademicos values('Capítulo en libro',GETDATE(), GETDATE(), 1, 1, 1);
insert into ProductoAcademicos values('Artículo',GETDATE(), GETDATE(), 1, 1, 1);
insert into ProductoAcademicos values('Ponencia',GETDATE(), GETDATE(), 1, 1, 1);
insert into ProductoAcademicos values('Tesis de maestría',GETDATE(), GETDATE(), 1, 1, 1);
insert into ProductoAcademicos values('Tesis de doctorado',GETDATE(), GETDATE(), 1, 1, 1);

insert into ProductoDerivados values('Con arbitraje',GETDATE(), GETDATE(), 1, 1, 1);
insert into ProductoDerivados values('Sin arbitraje',GETDATE(), GETDATE(), 1, 1, 1);
*/
insert into TipoEstancias values('Académica',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoEstancias values('Sabática',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoEstancias values('Postdoctoral',GETDATE(), GETDATE(), 1, 1, 1);
/*
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
*/

insert into TipoProyectos values('Consultoría',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoProyectos values('Investigación',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoProyectos values('Planes de trabajo',GETDATE(), GETDATE(), 1, 1, 1);
/*
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
*/

insert into MedioImpresos values('Periódico',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioImpresos values('Tabloide',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioImpresos values('Revista',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioImpresos values('Otro',GETDATE(), GETDATE(), 1, 1, 1);

insert into MedioElectronicos values('Radio',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioElectronicos values('Televisión',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioElectronicos values('Internet',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioElectronicos values('Video',GETDATE(), GETDATE(), 1, 1, 1);
insert into MedioElectronicos values('Otro',GETDATE(), GETDATE(), 1, 1, 1);
/*
insert into Generos values('Entrevista',GETDATE(), GETDATE(), 1, 1, 1);
insert into Generos values('Columna',GETDATE(), GETDATE(), 1, 1, 1);
insert into Generos values('Artículo',GETDATE(), GETDATE(), 1, 1, 1);
insert into Generos values('Comentario',GETDATE(), GETDATE(), 1, 1, 1);
insert into Generos values('Mesa de análisis',GETDATE(), GETDATE(), 1, 1, 1);
insert into Generos values('Otro',GETDATE(), GETDATE(), 1, 1, 1);
*/

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
/*
insert into TipoFinanciamientos values('Fiscal',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoFinanciamientos values('Complementario',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoFinanciamientos values('Financiamiento externo',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoFinanciamientos values('Mixto',GETDATE(), GETDATE(), 1, 1, 1);
*/

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
insert into TipoParticipaciones values('Seminarios', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Simposium', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Talleres', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Teatro', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Televisión', 3, GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipaciones values('Video', 3, GETDATE(), GETDATE(), 1, 1, 1);

insert into TipoActividades values('Investigación',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoActividades values('Docencia',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoActividades values('Vinculación',GETDATE(), GETDATE(), 1, 1, 1);
/*
insert into TipoParticipantes values('Persona física',GETDATE(), GETDATE(), 1, 1, 1);
insert into TipoParticipantes values('Investigador',GETDATE(), GETDATE(), 1, 1, 1);
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
INSERT EstadoInvestigadores VALUES('Jan  5 2009 12:00AM','Aug 18 2009  9:23AM',GETDATE(), GETDATE(),1,1,1,1,null,1)
INSERT CargoInvestigadores VALUES('Aug 18 2009  9:23AM','Aug 18 2009  9:23AM',1,1,1,1,1,1,null,1)
INSERT CategoriaInvestigadores VALUES('Feb  2 2009 12:00AM','Aug 18 2009  9:23AM',GETDATE(), GETDATE(),1,1,1,1,null,1)
INSERT GradoAcademicoInvestigadores VALUES('Jan  5 2009 12:00AM','Migracion en la frontera norte de Mexico', GETDATE(),GETDATE(),1,1,1,1,1,null,1)
INSERT SNIInvestigadores VALUES('Feb  2 2009 12:00AM','Feb  2 2010 12:00AM','Aug 18 2009  9:23AM','Aug 18 2009  9:23AM',1,2,1,1,null,1)

--Investigador de prueba
INSERT Investigadores VALUES('Dec 15 2008 12:00AM', 'Dec 14 2008 12:00AM', 'Produccion','Academico','CVU', 'Expediente SNI', 'Area 1', 'Area 2', 'Area 3', 'Aug 18 2009  9:23AM', 'Aug 18 2009  9:23AM', 1, 4, 1, 1, 1)
INSERT EstadoInvestigadores VALUES('Jan  5 2009 12:00AM','Aug 18 2009  9:23AM',GETDATE(), GETDATE(),1,1,1,1,null,2)
INSERT CargoInvestigadores VALUES('Aug 18 2009  9:23AM','Aug 18 2009  9:23AM',1,1,1,1,1,1,null,2)
INSERT CategoriaInvestigadores VALUES('Feb  2 2009 12:00AM','Aug 18 2009  9:23AM',GETDATE(), GETDATE(),1,1,1,1,null,2)
INSERT GradoAcademicoInvestigadores VALUES('Jan  5 2009 12:00AM','Migracion en la frontera norte de Mexico', GETDATE(),GETDATE(),1,1,1,1,1,null,2)
INSERT SNIInvestigadores VALUES('Feb  2 2009 12:00AM','Feb  2 2010 12:00AM','Aug 18 2009  9:23AM','Aug 18 2009  9:23AM',1,2,1,1,null,2)

INSERT Investigadores VALUES('Dec 15 2008 12:00AM', 'Dec 14 2008 12:00AM', 'Produccion','Academico','CVU', 'Expediente SNI', 'Area 1', 'Area 2', 'Area 3', 'Aug 18 2009  9:23AM', 'Aug 18 2009  9:23AM', 1, 3, 1, 1, 1)
INSERT EstadoInvestigadores VALUES('Jan  5 2009 12:00AM','Aug 18 2009  9:23AM',GETDATE(), GETDATE(),1,1,1,1,null,3)
INSERT CargoInvestigadores VALUES('Aug 18 2009  9:23AM','Aug 18 2009  9:23AM',1,1,1,1,1,1,null,3)
INSERT CategoriaInvestigadores VALUES('Feb  2 2009 12:00AM','Aug 18 2009  9:23AM',GETDATE(), GETDATE(),1,1,1,1,null,3)
INSERT GradoAcademicoInvestigadores VALUES('Jan  5 2009 12:00AM','Migracion en la frontera norte de Mexico', GETDATE(),GETDATE(),1,1,1,1,1,null,3)
INSERT SNIInvestigadores VALUES('Feb  2 2009 12:00AM','Feb  2 2010 12:00AM','Aug 18 2009  9:23AM','Aug 18 2009  9:23AM',1,2,1,1,null,3)