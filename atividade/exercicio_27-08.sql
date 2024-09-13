CREATE DATABASE atividade1;
USE atividade1;
CREATE TABLE heroi(
	idHeroi int primary key auto_increment,
    nome varchar(45),
    versao varchar(45),
    habilidade varchar(45),
    altura int
);

INSERT INTO heroi VALUES
(DEFAULT, 'Capitão América', 'Guerra Cívil', 'Super velocidade', 185),
(DEFAULT, 'Homem de Ferro', 'Vingadores 2012', 'Raio congelante', 176),
(DEFAULT, 'Homem Aranha', 'Tobey Maguire', 'Instinto superior', 170),
(DEFAULT, 'Thor', 'Thor Ragnarok', 'Raios', 185),
(DEFAULT, 'Hulk','O incrível hulk', 'Super força', 280);

SELECT * FROM heroi;

ALTER TABLE heroi ADD COLUMN regeneracao CHAR(5);
ALTER TABLE heroi ADD CONSTRAINT
check(regeneracao in (TRUE OR FALSE));

ALTER TABLE heroi MODIFY COLUMN versao varchar (100);

DELETE FROM heroi
WHERE idHeroi = 3;

INSERT INTO heroi VALUES 
(DEFAULT, 'Soldier Boy', 'The boys', 'Super força', 1.80, true);

SELECT * FROM heroi
WHERE nome LIKE ('h%') OR nome LIKE ('c%');

SELECT * FROM heroi 
WHERE nome NOT LIKE ('%a%');

SELECT nome FROM heroi 
WHERE altura > 190;

SELECT * FROM heroi
WHERE altura > 180 ORDER BY nome DESC;

TRUNCATE TABLE heroi;

-- EXERCICIO 4

CREATE DATABASE estoque;
USE estoque;

CREATE TABLE misteriosSA(
	idMist int primary key auto_increment,
    nome varchar(45),
    dtCompra date,
    preco decimal(6,2),
    peso int,
    dtRetirada date
    );

INSERT INTO misteriosSA (nome,dtCompra,preco,peso) VALUES 
('Cachorro-Quente', '2004-12-25', 10.55, 150),
('Cachorro-Quente', '2022-06-28', 2.80, 500),
('Cachorro-Quente', '2024-06-19', 50.80, 5000),
('Biscoitos Scooby', '2022-01-19', 10.37, 250),
('Biscoitos Scooby', '2024-08-26', 30, 500);

SELECT * FROM misteriosSA;

SELECT idMist, nome, dtCompra, dtRetirada FROM misteriosSA ORDER BY dtCompra;

UPDATE misteriosSA
SET nome = 'Biscoitos Scooby'
WHERE idMist = 1;

UPDATE misteriosSA
SET dtRetirada = '2024-08-26'
WHERE idMist = 1;

ALTER TABLE misteriosSA rename column idMist to idComida;

ALTER TABLE misteriosSA ADD CONSTRAINT chkNome
CHECK (nome in ('Biscoitos Scooby', 'Cachorro-Quente'));

truncate table misteriosSA;

SELECT dtCompra as 'data da compra', dtRetirada as 'Data de retirada', idComida, preco, peso FROM misteriosSA
where nome = 'Biscoitos Scooby';

SELECT * FROM misteriosSA
WHERE dtCompra < '2024-01-01';

SELECT * FROM misteriosSA 
WHERE preco >= 30.50;

TRUNCATE TABLE misteriosSA;

-- exercicio 3

CREATE DATABASE desenho;
USE desenho;

CREATE TABLE desenhosAnimados(
idDesenho int primary key auto_increment,
titulo varchar(50),
dtLancamento date,
nomeEmissora varchar(50),
classificacao int,
St4tus varchar(15),
nota tinyint(1)
) auto_increment = 10;

ALTER TABLE desenhosAnimados ADD CONSTRAINT chkNota 
CHECK(nota BETWEEN 1 AND 5);

INSERT INTO desenhosAnimados VALUES
(DEFAULT, 'Naruto', '1990-04-20', 'akira', 8,'exibindo', 4),
(DEFAULT, 'JujutsuKaisen', '2023-01-30', 'gege', 10,'exibindo', 5),
(DEFAULT, 'DragonBall', '2022-02-12', 'toriama', 19,'exibindo', 2),
(DEFAULT, 'Clarencio', '2021-01-21', 'cartoon', 9, 'cancelado', 1),
(DEFAULT, 'titio avo', '2021-10-12', 'cartoon', 20, 'finalizado', 2);

SELECT * FROM desenhosAnimados;

SELECT * FROM desenhosAnimados
WHERE classificacao <= 14;

SELECT * FROM desenhosAnimados
WHERE nomeEmissora = 'cartoon';

ALTER TABLE desenhosAnimados
ADD CONSTRAINT chkSt4tus 
CHECK(St4tus in ('exibindo', 'finalizado', 'cancelado'));

INSERT INTO desenhosAnimados VALUES
(DEFAULT, 'nanatsu', '1999-09-09', 'pedro', 10, 'atualizando', 1);
-- Error Code: 3819. Check constraint 'chkSt4tus' is violated.	0.000 sec

UPDATE desenhosAnimados
SET St4tus = 'finalizado'
WHERE idDesenho = 11;

UPDATE desenhosAnimados
SET St4tus = 'finalizado'
WHERE idDesenho = 12;

DELETE FROM desenhosAnimados WHERE idDesenho = 12;

SELECT * FROM desenhosAnimados 
WHERE titulo LIKE ('n%');

ALTER TABLE desenhosAnimados RENAME COLUMN classificacao to classificacaoIndicativa;

UPDATE desenhosAnimados 
SET nota = 2
WHERE idDesenho = 11;

UPDATE desenhosAnimados
SET dtLancamento = '1999-09-19'
WHERE idDesenho = 11;

TRUNCATE TABLE desenhosAnimados;

ALTER TABLE desenhosAnimados DROP CONSTRAINT chkSt4tus;

-- exercicio 2

CREATE DATABASE olimpiadas;
USE olimpiadas;

CREATE TABLE esporte (
	idEsporte int primary key auto_increment,
    nome varchar (40),
    categoria varchar(20),
    nJogador int,
    estreia date,
    pais varchar(30)
);

ALTER TABLE esporte ADD CONSTRAINT chkCategoria CHECK( categoria in ('individual','coletivo'));

INSERT INTO esporte VALUES
(NULL, 'futebol', 'coletivo', 11, '1990-09-01', 'Brasil'),
(NULL, 'volei', 'coletivo', 10, '2000-10-20', 'Colombia'),
(NULL, 'arremesso de peso', 'individual', 1, '2001-01-29', 'Estados Unidos'),
(NULL, 'salto com vara', 'individual', 1, '2024-10-12', 'Arabia Saudita'),
(NULL, 'boxe', 'individual', 1, '2021-12-01', 'Croacia');

ALTER TABLE esporte ADD COLUMN popularidade DECIMAL (3,2);
ALTER TABLE esporte ADD CONSTRAINT chkPopularidade CHECK(popularidade >=0 and popularidade <=10);

UPDATE esporte
SET popularidade = 2
WHERE idEsporte = 1;

UPDATE esporte 
SET popularidade = 9.0
WHERE idEsporte = 2;

UPDATE esporte
SET popularidade = 6
WHERE idEsporte = 3;

UPDATE esporte
SET popularidade = 3
WHERE idEsporte = 4;

UPDATE esporte 
SET popularidade = 2
WHERE idEsporte = 5;

SELECT * FROM esporte ORDER BY popularidade;

SELECT * FROM esporte WHERE estreia >= '2000-01-01'; 

ALTER TABLE esporte ADD CONSTRAINT chkEstreia CHECK(estreia >= '1896-04-06' or estreia <= '2024-08-27');

ALTER TABLE esporte DROP CONSTRAINT chkCategoria;

SELECT * FROM esporte 
WHERE pais LIKE ('_a%');

SELECT * FROM esporte 
WHERE nJogador BETWEEN 4 AND 11;
-- ou WHERE nJogador >= 4 AND nJogador <= 11;

DELETE FROM esporte
WHERE idEsporte in (1,3,5);

SELECT * FROM esporte;

-- EXERCICIO 1

CREATE DATABASE game_store;
USE game_store;

CREATE TABLE jogo (
	idJogo int primary key auto_increment,
    nome varchar (30),
    diretor varchar (30),
    genero varchar (30),
    lancamento date,
    nota float,
    quantidade int
    );
ALTER TABLE jogo ADD CONSTRAINT chkNota CHECK(nota >= 0 AND nota <= 10);

INSERT INTO jogo VALUES
(NULL, 'Fortnite', 'epic games', 'battle royale', '2018-01-30', 10, 100),
(NULL, 'Diablo IV', 'Blizzard', 'MMO RPG', '2023-02-20', 8, 99),
(NULL, 'Valorant', 'Riot Games', 'FPS', '2022-02-18', 2, 999),
(NULL, 'God of War - RAGNAROK', 'Sony', 'MMO RPG', '2024-06-29', 10, 80),
(NULL, 'League of Legends', 'Riot Games', 'Moba', '2014-09-11', 9.4, 2);

ALTER TABLE jogo ADD COLUMN midia varchar(7) 
CONSTRAINT chkMidia CHECK(midia in ('fisica', 'digital'));

UPDATE jogo
SET midia = 'digital'
WHERE idJogo = 1;

UPDATE jogo
SET midia = 'fisica'
WHERE idJogo = 2;

UPDATE jogo
SET midia = 'digital'
WHERE idJogo = 3;

UPDATE jogo
SET midia = 'fisica'
WHERE idJogo = 4;

UPDATE jogo
SET midia = 'digital'
WHERE idJogo = 5;

SELECT * FROM jogo
WHERE lancamento >= '2015-01-01';

SELECT * FROM jogo 
WHERE nome LIKE ('%a%') AND midia LIKE 'fisica';

SELECT * FROM jogo 
WHERE diretor NOT LIKE ('%e%');

ALTER TABLE jogo DROP CONSTRAINT chkNota;
ALTER TABLE jogo ADD CONSTRAINT chkNota CHECK(nota >= 0 AND nota <= 10);

SELECT * FROM jogo
WHERE genero LIKE 'MMO RPG' AND quantidade > 0;

INSERT INTO jogo VALUES 
(NULL, 'Pokemon', 'Bandai Nanco', 'MMO RPG', '2022-02-21', 1, 0, 'fisica');

DELETE FROM jogo 
WHERE quantidade < 0;

ALTER TABLE jogo RENAME COLUMN diretor to criador;

SELECT * FROM jogo;




 	
