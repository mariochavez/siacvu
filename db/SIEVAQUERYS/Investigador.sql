USE SIACVUDEV

DECLARE @puntos DECIMAL(10,2)
DECLARE @investigadorId INT
DECLARE @sniId INT

SET @investigadorId = 1

SELECT @sniId = SNIFk 
FROM SNIInvestigadores
WHERE InvestigadorFk = @investigadorId
IF @sniId = 2
	BEGIN	
		SET @Puntos = 12
	END
ELSE IF @sniId = 3
	BEGIN	
		SET @Puntos = 18
	END
ELSE IF @sniId = 4
	BEGIN	
		SET @Puntos = 24
	END
ELSE IF @sniId > 4
	BEGIN	
		SET @Puntos = 30
	END
PRINT @Puntos