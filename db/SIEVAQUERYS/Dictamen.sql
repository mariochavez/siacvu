USE SIACVUDEV

DECLARE @puntos DECIMAL(10,2)
DECLARE @totalDictamenesProyectos INT
DECLARE @totalDictamenesArticulos INT
DECLARE @tipoRevista INT

SELECT @totalDictamenesProyectos = COUNT(1)
FROM Dictamenes d INNER JOIN TipoDictamenes td
ON d.TipoDictamenFk = td.Id
WHERE td.Id = 3 AND DATEPART(yy, d.CreadoEl) = DATEPART(yy, GETDATE()) 
IF @totalDictamenesProyectos <= 2
	BEGIN	
		SET @Puntos = 0.10
	END

SELECT @tipoRevista = rp.ClasificacionSieva
FROM RevistaPublicaciones rp INNER JOIN (Dictamenes d INNER JOIN TipoDictamenes td
ON d.TipoDictamenFk = td.Id)
ON d.RevistaPublicacionFk = rp.Id
WHERE td.Id = 1

SELECT @totalDictamenesArticulos = COUNT(1)
FROM Dictamenes d INNER JOIN TipoDictamenes td
ON d.TipoDictamenFk = td.Id
WHERE td.Id = 1 AND DATEPART(yy, d.CreadoEl) = DATEPART(yy, GETDATE()) 
IF @totalDictamenesArticulos <= 2 AND @tipoRevista <= 2
	BEGIN
		SET @Puntos = 0.15
	END

PRINT @Puntos