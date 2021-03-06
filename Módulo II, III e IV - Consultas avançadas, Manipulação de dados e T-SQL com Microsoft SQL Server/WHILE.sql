USE ESQUINA_VENDAS

DECLARE @LIMITE_MINIMO INT, @LIMITE_MAXIMO INT

SET @LIMITE_MINIMO = 1
SET @LIMITE_MAXIMO = 10

WHILE (@LIMITE_MINIMO <= @LIMITE_MAXIMO)
	BEGIN
		PRINT @LIMITE_MINIMO
		SET @LIMITE_MINIMO = @LIMITE_MINIMO + 1
		IF (@LIMITE_MINIMO = 6)
			BREAK
	END

-- DESAFIO

DECLARE @DATAINICIAL DATE, @DATAFINAL DATE, @NUMNOTAS INT
SET @DATAINICIAL = '2017-01-01'
SET @DATAFINAL = '2017-01-10'
WHILE (@DATAINICIAL <= @DATAFINAL)
	BEGIN
		SELECT @NUMNOTAS = COUNT([NUMERO]) FROM [dbo].[TABELA DE NOTAS FISCAIS] WHERE [DATA] = @DATAINICIAL GROUP BY [DATA]
		PRINT CONVERT(VARCHAR(10),@DATAINICIAL) + ' --> ' +CONVERT(VARCHAR(10), @NUMNOTAS) + ' NOTAS'
		SET @DATAINICIAL = DATEADD(DAY,1,@DATAINICIAL)
	END
-- END

