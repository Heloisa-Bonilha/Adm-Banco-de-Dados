

-- O dono da Esquina do Sucos pediu para que criasse um relat�rio mostrando qual foi o faturamento em dinheiro por sabor de produto e tamb�m que comparasse a participa��o daquela venda em rela��o ao total (%). Somente do ano 2016
-- Modifique o segundo relat�rio feito na aula, mas agora para ver o ranking das vendas por tamanho.
CREATE VIEW TODOS_CAMPOS_2 AS
SELECT P.TAMANHO, P.[CODIGO DO PRODUTO], INF.PRE�O, INF.QUANTIDADE, NF.DATA, NF.NUMERO FROM [dbo].[TABELA DE ITENS NOTAS FISCAIS]INF
INNER JOIN [dbo].[TABELA DE PRODUTOS] P ON INF.[CODIGO DO PRODUTO] = P.[CODIGO DO PRODUTO]
INNER JOIN [dbo].[TABELA DE NOTAS FISCAIS]NF ON INF.NUMERO = NF.NUMERO

CREATE VIEW FATURAMENTO_2 AS
SELECT TAMANHO, YEAR(DATA) AS 'ANO',ROUND( SUM(QUANTIDADE*PRE�O),2) AS 'FATURAMENTO' FROM TODOS_CAMPOS_2
WHERE YEAR(DATA) = 2016
GROUP BY TAMANHO, YEAR(DATA)

CREATE VIEW FATURAMENTO_TOTAL_2 AS
SELECT ANO, SUM(FATURAMENTO) AS 'FATURAMENTO TOTAL' FROM FATURAMENTO_2
GROUP BY ANO

SELECT F.TAMANHO, F.ANO, F.FATURAMENTO, CONCAT(ROUND((F.FATURAMENTO*100/FT.[FATURAMENTO TOTAL]),2),' %' )AS 'PARTICIPA��O' FROM FATURAMENTO_2 F
INNER JOIN FATURAMENTO_TOTAL_2 FT
ON F.ANO = FT.ANO
ORDER BY F.FATURAMENTO DESC