USE SIACVUDEV

DECLARE @resenaId INT
DECLARE @puntos DECIMAL(10, 2)
DECLARE @tipoRevista INT

SET @resenaId = 1
 
SELECT @tipoRevista = rp.ClasificacionSieva
 FROM Resenas r INNER JOIN RevistaPublicaciones rp
 ON r.RevistaPublicacionFk = rp.Id
 WHERE r.Id = @resenaId
 
IF @tipoRevista = 1
BEGIN
	SET @puntos = 0.20
END
ELSE IF @tipoRevista = 2
BEGIN
	SET @puntos = 0.15
END
ELSE IF @tipoRevista = 3
BEGIN
	SET @puntos = 0.10
END

PRINT @puntos

