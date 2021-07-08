-- NOVO TESTE PARA BACKUP PASSO A PASSO COM EXEMPLO DE POL�TICA DE BACKUP EMPRESARIAL

-- NOVO DB
CREATE DATABASE TESTE_BACKUP

USE TESTE_BACKUP

-- CRIANDO TABELA DE CONTROLE
CREATE TABLE CTRL_BACKUP (POS INT)

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (1)

-- VERIFICANDO REGISTROS DA TABELA
SELECT * FROM CTRL_BACKUP

--> BACKUP FULL INICIAL �S 1:00 AM
BACKUP DATABASE TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH INIT

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (2)

--> BACKUP LOG DE TRANSA��O DAS 4:00 �S 8:00 AM DE 2 EM 2 HORAS

-- BACKUP LOG DE TRANSA��O �S 4:00
BACKUP LOG TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH NOINIT

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (3)

-- BACKUP LOG DE TRANSA��O �S 6:00
BACKUP LOG TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH NOINIT

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (4)

-- BACKUP LOG DE TRANSA��O �S 8:00
BACKUP LOG TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH NOINIT

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (5)

--> BACKUP DIFFERENTIAL �S 9:00
BACKUP DATABASE TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH DIFFERENTIAL

--> BACKUP LOG DE TRANSA��O DAS 10:00 �S 14:00 DE 2 EM 2 HORAS

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (6)

-- BACKUP LOG DE TRANSA��O �S 10:00
BACKUP LOG TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH NOINIT

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (7)

-- BACKUP LOG DE TRANSA��O �S 12:00
BACKUP LOG TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH NOINIT

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (8)

-- BACKUP LOG DE TRANSA��O �S 14:00
BACKUP LOG TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH NOINIT

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (9)

--> BACKUP DIFFERENTIAL �S 14:00
BACKUP DATABASE TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH DIFFERENTIAL

--> BACKUP LOG DE TRANSA��O DAS 15:00 �S 21:00 DE 2 EM 2 HORAS

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (10)

-- BACKUP LOG DE TRANSA��O �S 15:00
BACKUP LOG TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH NOINIT

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (11)

-- BACKUP LOG DE TRANSA��O �S 17:00
BACKUP LOG TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH NOINIT

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (12)

-- BACKUP LOG DE TRANSA��O �S 19:00
BACKUP LOG TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH NOINIT

-- INSERINDO REGISTRO
INSERT INTO CTRL_BACKUP (POS) VALUES (13)

-- BACKUP LOG DE TRANSA��O �S 21:00
BACKUP LOG TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH NOINIT


--	SE QUISERMOS RECUPERAR OS DADOS DAS 17:30 |
--		RECUPERAR PRIMEIRO O FULL (1:00)
--			DEPOIS O DIFERENCIAL MAIS PR�XIMO DO HOR�RIO QUE DEU PROBLEMA (14:00)
--				DEPOIS OS ARQUIVOS DE TRANSA��O MAIS PR�XIMOS DO HOR�RIO (15:00, 17:00)


-- RESTAURA��O DO BANCO DE DADOS

USE MASTER

-- ALTERANDO SOMENTE PARA UM �NICO USU�RIO PARA SEGURAN�A
ALTER DATABASE TESTE_BACKUP SET SINGLE_USER WITH ROLLBACK IMMEDIATE

DROP DATABASE TESTE_BACKUP

-- VERIFICA��O DO ARQUIVO DE BACKUP (1 = V�LIDO)
RESTORE VERIFYONLY FROM DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK'

-- VERIFICA��O DO CABE�ALHO DOS BACKUPS
RESTORE HEADERONLY FROM DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK'

-- BACKUP FULL INICIAL | 1:00 AM
RESTORE DATABASE TESTE_BACKUP FROM DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH FILE = 1, NORECOVERY

-- BACKUP DIFFERENTIAL | 14:00
RESTORE DATABASE TESTE_BACKUP FROM DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH FILE = 9, NORECOVERY

-- BACKUP LOG | 15:00
RESTORE DATABASE TESTE_BACKUP FROM DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH FILE = 10, NORECOVERY

-- BACKUP LOG | 17:00
RESTORE DATABASE TESTE_BACKUP FROM DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH FILE = 11, RECOVERY


-- VERIFICA SE DEU CERTO (AT� A POS 11)

USE TESTE_BACKUP

SELECT * FROM CTRL_BACKUP


-- PARA ADICIONAR DESCRI��O NO BACKUP
BACKUP LOG TESTE_BACKUP TO DISK = 'C:\SQL_BKP\TESTE_BACKUP.BAK' WITH NOINIT, DESCRIPTION='21:00 Log de Transa��o'

-- ESSA � SOMENTE UMA SIMULA��O, NA VIDA REAL O BACKUP � AGENDADO