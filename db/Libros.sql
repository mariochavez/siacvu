USE SIACVUDEV

DECLARE	@formatoPublicacion INT
DECLARE @totalCoautoresInternos INT
DECLARE @totalCoautoresExternos INT
DECLARE @totalAutores INT
DECLARE @arbitraje INT
DECLARE @libroId INT
DECLARE @puntos DECIMAL(10, 2)

SET @libroId = 1

SELECT @totalCoautoresExternos = COUNT(1)
 FROM CoautorExternoLibro 
 WHERE LibroFk = @libroId
 
SELECT @totalCoautoresInternos = COUNT(1)
 FROM CoautorInternoLibro
 WHERE LibroFk = @libroId
 
SELECT @arbitraje = TipoProducto, @formatoPublicacion = FormatoPublicacion
 FROM Libros 
 WHERE Id = @libroId
 
SET @totalAutores =  @totalCoautoresExternos + @totalCoautoresInternos + 1
 
IF @formatoPublicacion = 1
BEGIN
	IF @totalAutores = 1
	BEGIN
		IF @arbitraje = 1
		BEGIN
			SET @puntos = 4.00
		END
		ELSE IF @arbitraje = 2
		BEGIN
			SET @puntos = 1.33
		END
	END
	ELSE IF @totalAutores >= 2 AND @totalAutores <= 4
	BEGIN
		IF @arbitraje = 1
		BEGIN
			SET @puntos = 3.00
		END
		ELSE IF @arbitraje = 2
		BEGIN
			SET @puntos = 1.00
		END		
	END
	ELSE IF @totalAutores > 4
	BEGIN
		IF @arbitraje = 1
		BEGIN
			SET @puntos = 1.50
		END
		ELSE IF @arbitraje = 2
		BEGIN
			SET @puntos = 0.50
		END			
	END
END
ELSE IF @formatoPublicacion = 2
BEGIN
	IF @totalAutores = 1
	BEGIN
		IF @arbitraje = 1
		BEGIN
			SET @puntos = 1.50
		END
		ELSE IF @arbitraje = 2
		BEGIN
			SET @puntos = 0.50
		END	
	END
	ELSE IF @totalAutores > 1
	BEGIN
		IF @arbitraje = 1
		BEGIN
			SET @puntos = 1.00
		END
		ELSE IF @arbitraje = 2
		BEGIN
			SET @puntos = 0.33
		END	
	END
END
ELSE IF @formatoPublicacion = 3
BEGIN
	IF @totalAutores = 1
	BEGIN
		IF @arbitraje = 1
		BEGIN
			SET @puntos = 0.75
		END
		ELSE IF @arbitraje = 2
		BEGIN
			SET @puntos = 0.25
		END	
	END
	ELSE IF @totalAutores > 1
	BEGIN
		IF @arbitraje = 1
		BEGIN
			SET @puntos = 0.50
		END
		ELSE IF @arbitraje = 2
		BEGIN
			SET @puntos = 0.17
		END	
	END
END

PRINT @puntos