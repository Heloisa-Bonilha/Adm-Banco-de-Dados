-- INDICES
USE ESQUINA_VENDAS

-- CRIANDO INDICE
-- CRIANDO TABELAS HEAP (SEM ÍNDICES)
CREATE TABLE TEST_INDICE1 (VALOR VARCHAR (10) NOT NULL)
CREATE TABLE TEST_INDICE2 (VALOR VARCHAR (10) NOT NULL)

-- CRIANDO INDICE
CREATE NONCLUSTERED INDEX IX_TEST_INDICE1 ON TEST_INDICE1 (VALOR)

-- COM INDEX
SELECT * FROM SYS.INDEXES
WHERE OBJECT_ID = OBJECT_ID ('TEST_INDICE1')

-- SÓ HEAP
SELECT * FROM SYS.INDEXES
WHERE OBJECT_ID = OBJECT_ID ('TEST_INDICE2')

SP_HELPINDEX [TEST_INDICE1]
SP_HELPINDEX [TEST_INDICE2]
SP_HELPINDEX [TABELA DE CLIENTES]

-- INDICE CLUSTERED ORGANIZA FISICAMENTE AS PÁGINAS DE DADOS
-- INDEX NÃO CLUSTERED VAI TER QUE CRIAR PÁGINAS DE INDICE QUE VÃO TER QUE APONTAR PARA PAG. DE DADOS (MEMÓRIA)
-- NO INDICE NÃO CLUSTERED PODEMOS TER VÁRIOS INDICES NÃO CLUSTERED
-- USAR COM DISCERNIMENTO: NÃO CRIE INDICES NÃO CLUSTERED PARA MUITAS COLUNAS EM UMA TABELA!
-- É COMUM CRIARMOS INDICES NÃO CLUSTERED EM COLUNAS QUE POSSUEM CONSTRAINT FK POIS ELAS SERÃO USADAS EM JOINS

-- Dica: indice cluster é o indice armazenado nas mesmas páginas de dados da tabela, geralmente os registros da tabela são ordenados na ordem do indice cluster
-- Dica: o indice não cluster NÃO é armazenado nas páginas de dados da tabela, ou seja, existe um espaço interno no SQL server que ele armazena os dados dos índices, imagina que estes dados armazenados de indice é o sumário de um livro, então cada registro tem um 'um ponteiro' que aponta para a pagina onde o dado se localiza.
-- Dica: uma tabela pode conter apenas 1 indice cluster, este indice pode ser composto (2 ou mais colunas) ou indice comum (1 coluna)
