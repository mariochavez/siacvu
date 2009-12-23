USE SIACVU

DECLARE @puntos DECIMAL(10,2)
DECLARE @eventoId INT
DECLARE @tipoEvento INT
DECLARE @institucion INT
DECLARE @totalEventosExternos INT

SET @eventoId = 2

SELECT @tipoEvento = TipoEventoFk
 FROM Eventos
 WHERE Id = @eventoId
 
SELECT @institucion = ip.InstitucionFk
 FROM InstitucionEvento ie
 INNER JOIN InstitucionProductos ip
 ON ie.InstitucionProducto = ip.Id
 WHERE EventoFk = @eventoId
 
IF @tipoEvento IN (7, 3, 6, 2) AND @institucion = 92
BEGIN
	SELECT @totalEventosExternos = COUNT(e.Id)
	 FROM InstitucionProductos ip 
	 INNER JOIN InstitucionEvento ie 
	 INNER JOIN Eventos e 
	 INNER JOIN TipoEventos te
	 ON e.TipoEventoFk = te.Id
	 ON ie.EventoFk = e.Id
	 ON ie.InstitucionProducto = ip.Id
	 WHERE te.Id IN(7, 3, 6, 2) AND ip.InstitucionFk = 92

	IF @totalEventosExternos = 1
	BEGIN
		SET @puntos = 0.10
	END
END
	
PRINT @Puntos