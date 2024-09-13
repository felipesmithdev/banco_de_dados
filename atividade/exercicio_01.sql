CREATE DATABASE exercicio2;
USE exercicio2;
CREATE TABLE notebook(
	idNotebook int primary key,
    hostname varchar (20),
    processador varchar (30), 
    marca varchar (20),
    memoria varchar (8),
    armazenamento varchar (3),
    tamanho int,
    CONSTRAINT chkArmazenamento check (armazenamento in ('hd', 'ssd'))
);


INSERT INTO notebook VALUES
	(1, 'felipe', 'intelCoreI7', 'acer', '16gb', 'ssd', '512'),
    (2, 'carlos', 'razen 12665', 'positivo', '8gb', 'hd', '1000'),
    (3, 'iabela', 'intel core i52', 'dell', '4gb', 'ssd', '250');

UPDATE notebook 
SET hostname = 'vitoria'
WHERE idNotebook = 3;

SELECT * FROM notebook
WHERE hostname = 'felipe';

SELECT * FROM notebook
WHERE marca LIKE ('_o%');

SELECT * FROM notebook
WHERE armazenamento LIKE ('%d%') ORDER BY hostname;

DELETE FROM notebook
WHERE idNotebook = 2;

ALTER TABLE notebook MODIFY COLUMN hostname varchar (80);

ALTER TABLE notebook ADD COLUMN valor int;

SELECT * FROM notebook;

-- EXERCICIO 02

CREATE TABLE instrumento (
	idInstrumento INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar (20),
    tipo varchar (10),
    preco double,
	CONSTRAINT chkTipo CHECK (tipo in ('corda', 'percussao'))
) AUTO_INCREMENT = 100;

INSERT INTO instrumento VALUES
	(DEFAULT,'violao', 'corda', 100.00),
    (DEFAULT,'guitarra', 'corda', '400.00'),
    (DEFAULT, 'bateria', 'percussao', 1000.00);
    
UPDATE instrumento
SET nome = 'pandeiro'
WHERE idInstrumento = 101;

SELECT * FROM instrumento 
WHERE tipo = 'corda';

SELECT * FROM instrumento
WHERE nome LIKE ('%a%');

SELECT * FROM instrumento 
WHERE nome like ('%i%') order by tipo;

DELETE FROM instrumento 
WHERE idInstrumento = 2;

ALTER TABLE instrumento ADD COLUMN cor VARCHAR (10);

ALTER TABLE instrumento MODIFY COLUMN cor varchar (15);

DESCRIBE instrumento;

-- FIM DOS EXERCICIOS