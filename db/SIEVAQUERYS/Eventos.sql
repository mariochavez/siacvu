USE SIACVU

DECLARE @puntos DECIMAL(10,2)
DECLARE @eventoId INT
DECLARE @totalEventosExternos INT

SET @eventoId = 1
 
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
	
PRINT @Puntos