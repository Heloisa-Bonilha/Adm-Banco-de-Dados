USE ESQUINA_VENDAS
----condi��o OR/ OU
SELECT * FROM [TABELA DE PRODUTOS]
WHERE [SABOR] = 'MANGA' OR [TAMANHO] = '700 ML'; 

SELECT * FROM [TABELA DE PRODUTOS]
WHERE NOT([SABOR] = 'MANGA' OR [TAMANHO] = '700 ML'); 

SELECT * FROM [TABELA DE PRODUTOS]
WHERE [SABOR] = 'MANGA' OR NOT([TAMANHO] = '700 ML'); 

---END 

SELECT * FROM [TABELA DE PRODUTOS]
WHERE [SABOR] = 'MANGA' AND [TAMANHO] = '700 ML'; 


SELECT * FROM [TABELA DE PRODUTOS]
WHERE NOT ([SABOR] = 'MANGA' AND [TAMANHO] = '700 ML'); 

SELECT * FROM [TABELA DE PRODUTOS]
WHERE [SABOR] = 'MANGA' AND NOT([TAMANHO] = '700 ML'); 

---- IN 

SELECT * FROM [TABELA DE PRODUTOS]
WHERE [SABOR] IN ('MANGA','LARANJA') 

SELECT * FROM [TABELA DE PRODUTOS]
WHERE [SABOR] ='MANGA' OR [SABOR]='LARANJA' 

SELECT * FROM [TABELA DE PRODUTOS]
WHERE  [SABOR] NOT IN ('MANGA','LARANJA'); 


SELECT * FROM [TABELA DE PRODUTOS]
WHERE  [SABOR] IN ('MANGA','LARANJA') AND [PRECO DE LISTA] > 10; 

---- BETWEEN e AND 

SELECT * FROM [TABELA DE PRODUTOS] 
WHERE [SABOR] IN('MANGA','LARANJA') AND [PRECO DE LISTA] BETWEEN 10 AND 13;


SELECT * FROM [TABELA DE PRODUTOS] 
WHERE [SABOR] IN('MANGA','LARANJA') AND [PRECO DE LISTA] >=10 AND [PRECO DE LISTA] <=13;

SELECT * FROM [dbo].[TABELA DE ITENS NOTAS FISCAIS]
WHERE [QUANTIDADE] > 60 AND [PRE�O]<=3
ORDER BY [PRE�O]

SELECT * FROM [TABELA DE PRODUTOS] 
WHERE [NOME DO PRODUTO] LIKE '%litros%'