USE SIACVU

DECLARE @organoExternoId INT
DECLARE @tipoOrgano INT
DECLARE @totalOrganosExtenosConacyt INT
DECLARE @totalOtrosOrganosExtenos INT
DECLARE @puntos DECIMAL(10, 2)
DECLARE @creadoEl DATETIME

SET @organoExternoId = 1

SELECT @tipoOrgano = oe.TipoOrganoFk
 FROM OrganoExternos oe
 INNER JOIN TipoOrganos tor
 ON oe.TipoOrganoFk = tor.Id
 WHERE oe.Id = @organoExternoId
 AND DATEPART(yy, oe.CreadoEl) = DATEPART(yy, GETDATE()) 
 AND oe.CreadoEl BETWEEN oe.FechaInicial AND oe.FechaFinal
 
IF @tipoOrgano = 1
BEGIN
	SELECT @totalOrganosExtenosConacyt = COUNT(oe.Id)
	 FROM OrganoExternos oe 
	 INNER JOIN TipoOrganos tor
	 ON oe.TipoOrganoFk = tor.Id
	 WHERE tor.Id = 1 
	 AND DATEPART(yy, oe.CreadoEl) = DATEPART(yy, GETDATE()) 
	 AND oe.CreadoEl BETWEEN oe.FechaInicial AND oe.FechaFinal

	IF @totalOrganosExtenosConacyt = 1
	BEGIN
		SET @puntos = 0.20
	END
END
ELSE IF @tipoOrgano <> 1
BEGIN
	SELECT @totalOtrosOrganosExtenos = COUNT(oe.Id)
	 FROM OrganoExternos oe INNER JOIN TipoOrganos tor
	 ON oe.TipoOrganoFk = tor.Id
	 WHERE tor.Id <> 1 
	 AND DATEPART(yy, oe.CreadoEl) = DATEPART(yy, GETDATE()) 
	 AND oe.CreadoEl BETWEEN oe.FechaInicial AND oe.FechaFinal
	 
	IF @totalOtrosOrganosExtenos = 1
	BEGIN
		SET @puntos = 0.10
	END
END
PRINT @puntos