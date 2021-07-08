-- INDICES
USE ESQUINA_VENDAS

-- CRIANDO INDICE
-- CRIANDO TABELAS HEAP (SEM �NDICES)
CREATE TABLE TEST_INDICE1 (VALOR VARCHAR (10) NOT NULL)
CREATE TABLE TEST_INDICE2 (VALOR VARCHAR (10) NOT NULL)

-- CRIANDO INDICE
CREATE NONCLUSTERED INDEX IX_TEST_INDICE1 ON TEST_INDICE1 (VALOR)

-- COM INDEX
SELECT * FROM SYS.INDEXES
WHERE OBJECT_ID = OBJECT_ID ('TEST_INDICE1')

-- S� HEAP
SELECT * FROM SYS.INDEXES
WHERE OBJECT_ID = OBJECT_ID ('TEST_INDICE2')

SP_HELPINDEX [TEST_INDICE1]
SP_HELPINDEX [TEST_INDICE2]
SP_HELPINDEX [TABELA DE CLIENTES]

-- INDICE CLUSTERED ORGANIZA FISICAMENTE AS P�GINAS DE DADOS
-- INDEX N�O CLUSTERED VAI TER QUE CRIAR P�GINAS DE INDICE QUE V�O TER QUE APONTAR PARA PAG. DE DADOS (MEM�RIA)
-- NO INDICE N�O CLUSTERED PODEMOS TER V�RIOS INDICES N�O CLUSTERED
-- USAR COM DISCERNIMENTO: N�O CRIE INDICES N�O CLUSTERED PARA MUITAS COLUNAS EM UMA TABELA!
-- � COMUM CRIARMOS INDICES N�O CLUSTERED EM COLUNAS QUE POSSUEM CONSTRAINT FK POIS ELAS SER�O USADAS EM JOINS

-- Dica: indice cluster � o indice armazenado nas mesmas p�ginas de dados da tabela, geralmente os registros da tabela s�o ordenados na ordem do indice cluster
-- Dica: o indice n�o cluster N�O � armazenado nas p�ginas de dados da tabela, ou seja, existe um espa�o interno no SQL server que ele armazena os dados dos �ndices, imagina que estes dados armazenados de indice � o sum�rio de um livro, ent�o cada registro tem um 'um ponteiro' que aponta para a pagina onde o dado se localiza.
-- Dica: uma tabela pode conter apenas 1 indice cluster, este indice pode ser composto (2 ou mais colunas) ou indice comum (1 coluna)
