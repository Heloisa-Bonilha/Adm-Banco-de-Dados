USE ESQUINA_VENDAS

DECLARE @LimiteCredito MONEY;
DECLARE @LimiteCreditoTotal MONEY;
DECLARE C_Limite CURSOR
	FOR SELECT C.[LIMITE DE CREDITO]
	      FROM [dbo].[TABELA DE CLIENTES] AS C;

SET @LimiteCredito = 0
SET @LimiteCreditoTotal = 0
OPEN C_Limite;
FETCH NEXT FROM C_Limite INTO @LimiteCredito;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @LimiteCreditoTotal = @LimiteCreditoTotal + @LimiteCredito;

	FETCH NEXT FROM C_Limite INTO @LimiteCredito;	
END;

CLOSE C_Limite;
DEALLOCATE C_Limite;

PRINT CONCAT('Limite de Crédito Total: '
			  , FORMAT(@LimiteCreditoTotal, 'C')
			);