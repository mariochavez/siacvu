USE SIACVUDEV

DECLARE @puntos DECIMAL(10,2)
DECLARE @organoInternoId INT
DECLARE @consejoComisionId INT

SET @organoInternoId = 1

SELECT @consejoComisionId = ConsejoComisionFk 
FROM OrganoInternos
WHERE Id = @organoInternoId
IF @consejoComisionId <> 6
	BEGIN	
		SET @Puntos = 0.15
	END
PRINT @Puntos