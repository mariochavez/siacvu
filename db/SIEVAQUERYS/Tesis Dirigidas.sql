USE SIACVU

DECLARE @tesisId INT

DECLARE @totalDireccionTesisInterna INT
DECLARE @totalDireccionTesisExterna INT
DECLARE @totalDireccionTesis INT

DECLARE @totalLectorOsinodalTesisInterna INT
DECLARE @totalLectorOsinodalTesisExterna INT
DECLARE @totalLectorOsinodalTesis INT

DECLARE @tiempoTranscurrido INT
DECLARE @gradoAcademico INT
DECLARE @formaParticipacion INT
DECLARE @tipoTesis INT
DECLARE @pertenecePNPC BIT
DECLARE @tieneConvenio BIT
DECLARE @puntos DECIMAL(10, 2)

SET @tesisId = 1

--Total de direccion de tesis interna de el año en curso (maestria y doctorado)
SELECT @totalDireccionTesisInterna = COUNT(td.Id)
 FROM TesisDirigidas td 
 INNER JOIN TesisPosgrados tp
 ON td.TesisPosgradoFk = tp.Id
 WHERE DATEPART(yy, td.CreadoEl) = DATEPART(yy, GETDATE())
 AND tp.FormaParticipacion = 1
 AND tp.GradoAcademicoFk IN (2, 3)
 
--Total de direccion de tesis externa de el año en curso (maestria y doctorado)
SELECT @totalDireccionTesisExterna = COUNT(Id)
 FROM TesisDirigidas
 WHERE DATEPART(yy, CreadoEl) = DATEPART(yy, GETDATE())
 AND FormaParticipacion = 1
 AND GradoAcademicoFk IN (2, 3)

SET @totalDireccionTesis =  @totalDireccionTesisInterna + @totalDireccionTesisExterna

IF @totalDireccionTesis > 0 AND @totalDireccionTesis <= 2
BEGIN
	--Extraer el tipo de tesis para saber los puntos a asignar
	SELECT @tipoTesis = TipoTesis
	 FROM TesisDirigidas
	 WHERE Id = @tesisId
	 
	 IF @tipoTesis = 1
	 BEGIN
		--Direccion de tesis doctorales y maestrias COLEF. el año de sustentacion (maximo 1)
		SELECT @tiempoTranscurrido = DATEDIFF(YY, tp.FechaGrado, GETDATE()), @gradoAcademico = tp.GradoAcademicoFk, @formaParticipacion = tp.FormaParticipacion
		 FROM TesisDirigidas td 
		 INNER JOIN TesisPosgrados tp
		 ON td.TesisPosgradoFk = tp.Id
		 WHERE td.Id = @tesisId
		 
		IF @tiempoTranscurrido = 0
		BEGIN
			IF @gradoAcademico = 3 AND @formaParticipacion = 1
			BEGIN
	 			SET @puntos = 3.00
	 		END
	 		ELSE IF @gradoAcademico = 2 AND @formaParticipacion = 1
	 		BEGIN
	 			SET @puntos = 2.00
	 		END
		END
	END
	ELSE IF @tipoTesis = 2
	BEGIN
		--Direccion de tesis doctorales y maestrias externas. el año de sustentacion (maximo 1)
		SELECT @tiempoTranscurrido = DATEDIFF(YY, FechaGrado, GETDATE()), @gradoAcademico = GradoAcademicoFk, @formaParticipacion = FormaParticipacion,
		 @pertenecePNPC = PertenecePNPC, @tieneConvenio = TieneConvenio
		 FROM TesisDirigidas
		 WHERE Id = @tesisId
		 
		IF @tiempoTranscurrido = 0
		BEGIN
			IF @gradoAcademico = 3 AND @formaParticipacion = 1 AND (@pertenecePNPC = 1 OR @tieneConvenio = 1)
			BEGIN
	 			SET @puntos = 2.50
	 		END
	 		ELSE IF @gradoAcademico = 2 AND @formaParticipacion = 1 AND (@pertenecePNPC = 1 OR @tieneConvenio = 1)
	 		BEGIN
	 			SET @puntos = 1.50
	 		END
		END
	END
END

PRINT 'Tesis Direccion: ' + CAST(@puntos AS VARCHAR)

--Total Lector o Sinodal de tesis interna de el año en curso (maestria y doctorado)
SELECT @totalLectorOsinodalTesisInterna = COUNT(td.Id)
 FROM TesisDirigidas td 
 INNER JOIN TesisPosgrados tp
 ON td.TesisPosgradoFk = tp.Id
 WHERE DATEPART(yy, td.CreadoEl) = DATEPART(yy, GETDATE())
 AND tp.FormaParticipacion = 3
 AND tp.GradoAcademicoFk IN (2, 3)
 
--Total Lector o Sinodal de tesis externa de el año en curso (maestria y doctorado)
SELECT @totalLectorOsinodalTesisExterna = COUNT(Id)
 FROM TesisDirigidas
 WHERE DATEPART(yy, CreadoEl) = DATEPART(yy, GETDATE())
 AND FormaParticipacion = 3
 AND GradoAcademicoFk IN (2, 3)

SET @totalLectorOsinodalTesis = @totalLectorOsinodalTesisInterna + @totalLectorOsinodalTesisExterna
 
IF @totalLectorOsinodalTesis > 0 AND @totalLectorOsinodalTesis <= 2
BEGIN
	--Extraer el tipo de tesis para saber los puntos a asignar
	SELECT @tipoTesis = TipoTesis
	 FROM TesisDirigidas
	 WHERE Id = @tesisId
	 
	IF @tipoTesis = 1
	BEGIN	 
		--Lector o Sinodal de tesis doctorales y maestrias COLEF. el año de sustentacion (maximo 1)
		SELECT @tiempoTranscurrido = DATEDIFF(YY, tp.FechaGrado, GETDATE()), @gradoAcademico = tp.GradoAcademicoFk, @formaParticipacion = tp.FormaParticipacion
		 FROM TesisDirigidas td 
		 INNER JOIN TesisPosgrados tp
		 ON td.TesisPosgradoFk = tp.Id
		 WHERE td.Id = @tesisId
		 
		IF @tiempoTranscurrido = 0
		BEGIN
			IF @gradoAcademico = 3 AND @formaParticipacion = 3
			BEGIN
	 			SET @puntos = 0.75
	 		END
	 		ELSE IF @gradoAcademico = 2 AND @formaParticipacion = 3
	 		BEGIN
	 			SET @puntos = 0.50
	 		END
		END
	END
	ELSE IF @tipoTesis = 2
	BEGIN
		--Lector o Sinodal de tesis doctorales o maestrias externas. el año de sustentacion (maximo 1)
		SELECT @tiempoTranscurrido = DATEDIFF(YY, FechaGrado, GETDATE()), @gradoAcademico = GradoAcademicoFk, @formaParticipacion = FormaParticipacion,
		 @pertenecePNPC = PertenecePNPC, @tieneConvenio = TieneConvenio
		 FROM TesisDirigidas
		 WHERE Id = @tesisId
		 
		IF @tiempoTranscurrido = 0
		BEGIN
			IF @gradoAcademico IN (2, 3) AND @formaParticipacion = 3 AND (@pertenecePNPC = 1 OR @tieneConvenio = 1)
			BEGIN
	 			SET @puntos = 0.25
	 		END
		END
	END
END

PRINT 'Tesis Lector Sinodal: ' + CAST(@puntos AS VARCHAR)