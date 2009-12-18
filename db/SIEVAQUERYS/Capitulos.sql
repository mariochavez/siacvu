USE SIACVUDEV

DECLARE @totalCoautoresInternos INT
DECLARE @totalCoautoresExternos INT
DECLARE @totalAutores INT
DECLARE @arbitraje INT
DECLARE @capituloId INT
DECLARE @puntos DECIMAL(10, 2)

SET @capituloId = 1

SELECT @totalCoautoresExternos = COUNT(1)
 FROM CoautorExternoCapitulo 
 WHERE CapituloFk = @capituloId
 
SELECT @totalCoautoresInternos = COUNT(1)
 FROM CoautorInternoCapitulo
 WHERE CapituloFk = @capituloId
 
SELECT @arbitraje = TipoCapitulo
 FROM Capitulos 
 WHERE Id = @capituloId
 
SET @totalAutores =  @totalCoautoresExternos + @totalCoautoresInternos + 1
 
IF @totalAutores = 1
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
ELSE IF @totalAutores > 1
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

PRINT @puntos