USE SIACVUDEV

DECLARE @arbitraje INT
DECLARE @articuloId INT
DECLARE @puntos DECIMAL(10, 2)
DECLARE @tipoRevista INT

SET @articuloId = 1
 
SELECT @arbitraje = a.TipoArticulo, @tipoRevista = r.ClasificacionSieva
 FROM Articulos a INNER JOIN RevistaPublicaciones r
 ON a.RevistaPublicacionFk = r.Id
 WHERE a.Id = @articuloId
 
IF @tipoRevista = 1
BEGIN
	IF @arbitraje = 1
	BEGIN
		SET @puntos = 4.00
	END
END
ELSE IF @tipoRevista = 2
BEGIN
	IF @arbitraje = 1
	BEGIN
		SET @puntos = 1.80
	END
END
ELSE IF @tipoRevista = 3
BEGIN
	IF @arbitraje = 1
	BEGIN
		SET @puntos = 1.00
	END
END
ELSE IF @tipoRevista = 4
BEGIN
	IF @arbitraje = 2
	BEGIN
		SET @puntos = 0.33
	END
END

PRINT @puntos