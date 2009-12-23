USE SIACVU

DECLARE @puntos DECIMAL(10,2)
DECLARE @totalDictamenesProyectos INT
DECLARE @totalDictamenesArticulos INT
DECLARE @tipoRevista INT
DECLARE @dictamenId INT

SET @dictamenId = 1

SELECT @totalDictamenesProyectos = COUNT(1)
 FROM Dictamenes d 
 INNER JOIN TipoDictamenes td
 ON d.TipoDictamenFk = td.Id
 WHERE td.Id = 3 AND DATEPART(yy, d.CreadoEl) = DATEPART(yy, GETDATE()) 

IF @totalDictamenesProyectos > 0 AND @totalDictamenesProyectos <= 2
BEGIN	
	SET @Puntos = 0.10
END

SELECT @totalDictamenesArticulos = COUNT(1)
 FROM RevistaPublicaciones rp
 INNER JOIN Dictamenes d 
 INNER JOIN TipoDictamenes td
 ON d.TipoDictamenFk = td.Id
 ON d.RevistaPublicacionFk = rp.Id
 WHERE td.Id = 1 AND DATEPART(yy, d.CreadoEl) = DATEPART(yy, GETDATE()) AND rp.ClasificacionSieva IN (1, 2)

IF @totalDictamenesArticulos > 0 AND @totalDictamenesArticulos <= 2
BEGIN
	SET @Puntos = 0.15
END

PRINT @Puntos