USE ESQUINA_VENDAS

-- 1 - Na aula, constru�mos um relat�rio que apresentou os clientes que tiveram vendas inv�lidas. 
-- Complemente este relat�rio, listando somente os que tiveram vendas inv�lidas e 
--calculando a diferen�a entre o limite de venda m�ximo e o realizado, em percentuais. 
CREATE VIEW A AS
SELECT NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.DATA,120),1,7) AS 'ANO/M�S', SUM(INF.QUANTIDADE) AS 'QUANTIDADE M�S' FROM [dbo].[TABELA DE NOTAS FISCAIS]NF
INNER JOIN [dbo].[TABELA DE ITENS NOTAS FISCAIS]INF
ON NF.NUMERO = INF.NUMERO	
GROUP BY NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.DATA,120),1,7)

CREATE VIEW B AS
SELECT C.NOME, A.[ANO/M�S], A.[QUANTIDADE M�S], C.[VOLUME DE COMPRA],
CASE
		WHEN A.[QUANTIDADE M�S] > C.[VOLUME DE COMPRA] THEN 'VENDA INV�LIDA' 
		ELSE 'VENDA V�LIDA'
	END AS 'CLASSIFICA��O'
FROM [dbo].[TABELA DE CLIENTES] C
INNER JOIN A
ON C.CPF = A.CPF


SELECT B.NOME ,B.[ANO/M�S],B.[QUANTIDADE M�S], B.[VOLUME DE COMPRA], B.CLASSIFICA��O, (1-(B.[VOLUME DE COMPRA]/B.[QUANTIDADE M�S]))*100 AS 'DIFEREN�A EM PERCENTUAL'
FROM B
WHERE B.CLASSIFICA��O = 'VENDA INV�LIDA' 
ORDER BY B.NOME, B.[ANO/M�S]