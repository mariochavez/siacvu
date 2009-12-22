USE SIACVU

DECLARE @cursoId INT
DECLARE @totalHorasPosgradoCursoInterno INT
DECLARE @totalHorasPosgradoCursoExterno INT
DECLARE @tipoCurso INT
DECLARE @esPrivada BIT
DECLARE @tieneConvenio BIT
DECLARE @nivelEstudio INT
DECLARE @institucion INT
DECLARE @pais INT
DECLARE @totalHorasCursoExterno INT
DECLARE @totalHorasCursoInterno INT
DECLARE @puntos DECIMAL(10, 4)

SET @cursoId = 1

SELECT @tipoCurso = TipoCurso, @tieneConvenio = TieneConvenio, @esPrivada = EsPrivada, @nivelEstudio = NivelEstudioFk, @institucion = InstitucionFk,
 @totalHorasCursoExterno = NumeroHoras
 FROM Cursos
 WHERE Id = @cursoId
 
SELECT @pais = PaisFk
 FROM Instituciones
 WHERE Id = @institucion

IF @tipoCurso = 1
BEGIN
	SELECT @totalHorasCursoInterno = ci.NumeroHoras
	 FROM Cursos c
	 INNER JOIN CursoInvestigadores ci
	 ON c.CursoInvestigadorFk = ci.Id
	 WHERE c.Id = @cursoId
 
	--Total de horas de cursos internos de el año en curso (maestria y doctorado)
	SELECT @totalHorasPosgradoCursoInterno = SUM(ci.NumeroHoras)
	 FROM Cursos c 
	 INNER JOIN CursoInvestigadores ci
	 ON c.CursoInvestigadorFk = ci.Id
	 WHERE DATEPART(yy, c.CreadoEl) = DATEPART(yy, GETDATE())
	 AND ci.NivelEstudioFk IN (2, 3)

	IF @totalHorasPosgradoCursoInterno > 0 AND @totalHorasPosgradoCursoInterno <= 90
	BEGIN
		SET @puntos = 0.030 * @totalHorasCursoInterno
	END
END
ELSE IF @tipoCurso = 2
BEGIN
	--Total de horas de cursos externos de el año en curso (maestria y doctorado)
	SELECT @totalHorasPosgradoCursoExterno = SUM(c.NumeroHoras)
	 FROM Cursos c
	 WHERE DATEPART(yy, c.CreadoEl) = DATEPART(yy, GETDATE())
	 AND c.NivelEstudioFk IN (2, 3)
	 AND c.EsPrivada <> 1
	
	IF @totalHorasPosgradoCursoExterno > 0 AND @totalHorasPosgradoCursoExterno <= 45
	BEGIN
		SET @puntos = 0.022 * @totalHorasCursoExterno
	END
	
	IF @tieneConvenio = 1 AND @esPrivada = 1 AND @nivelEstudio IN (2, 3)
	BEGIN
		SET @puntos = 0.015 * @totalHorasCursoExterno
	END	
	ELSE IF @esPrivada = 0 AND @nivelEstudio = 1 AND @pais = 1
	BEGIN
		SET @puntos = 0.010 * @totalHorasCursoExterno
	END
END

PRINT @puntos