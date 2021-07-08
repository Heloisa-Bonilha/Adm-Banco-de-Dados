USE ESQUINA_VENDAS
DECLARE @ANO INT;
DECLARE @MES INT;
DECLARE @DATA DATE;
DECLARE @ValorFaturamento MONEY;
DECLARE @ValorFaturamentoTotal MONEY;

DECLARE C_Faturamento CURSOR
	FOR SELECT NF.[DATA]
	         , SUM(INF.[QUANTIDADE] * INF.[PREÇO])
	      FROM [dbo].[TABELA DE NOTAS FISCAIS] AS NF
		  JOIN [dbo].[TABELA DE ITENS NOTAS FISCAIS] AS INF ON (INF.NUMERO = NF.NUMERO)
		  GROUP BY NF.[DATA];

SET @ANO = 2017
SET @MES = 1
SET @ValorFaturamento = 0
SET @ValorFaturamentoTotal = 0

OPEN C_Faturamento;
FETCH NEXT FROM C_Faturamento INTO @DATA, @ValorFaturamento;

WHILE @@FETCH_STATUS = 0
BEGIN
	IF (YEAR(@DATA) = @ANO) AND (MONTH(@DATA) = @MES)
	BEGIN
		SET @ValorFaturamentoTotal = @ValorFaturamentoTotal + @ValorFaturamento;
	END;
	
	FETCH NEXT FROM C_Faturamento INTO @DATA, @ValorFaturamento;
END;

CLOSE C_Faturamento;
DEALLOCATE C_Faturamento;

PRINT CONCAT('Valor total do Faturamento em ' , DATENAME(m, str(@MES) + '/1/' + str(@ANO)) , '/' , @ANO , ': ' , FORMAT(@ValorFaturamentoTotal, 'C'));

