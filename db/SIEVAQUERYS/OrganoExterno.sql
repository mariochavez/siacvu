USE SIACVU

DECLARE @organoExternoId INT
DECLARE @totalOrganosExtenosConacyt INT
DECLARE @totalOtrosOrganosExtenos INT
DECLARE @puntos DECIMAL(10, 2)
DECLARE @creadoEl DATETIME

SET @organoExternoId = 1
 
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

PRINT @puntos