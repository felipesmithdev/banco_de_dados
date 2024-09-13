CREATE DATABASE sprint2;
USE sprint2;

-- Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave
-- primária da tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho
-- 40), qtdMedalha (int, representando a quantidade de medalhas que o atleta
-- possui)

CREATE TABLE atleta (
	idAtleta int primary key auto_increment,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
);

-- • Inserir dados na tabela, procurando colocar mais de um atleta para cada
-- modalidade e pelo menos 5 atletas.

INSERT INTO atleta (nome, modalidade, qtdMedalha) VALUES
	('John kennedy', 'atletismo', 28),
	('José Newton', 'corrida', 299),
	('Peter Jordan', 'futebol', 142),
	('Laura Smith', 'salto com vara', 98),
	('Pink Floyd', 'lançamento de dardo', 100);

INSERT INTO atleta (nome, modalidade, qtdMedalha) VALUES
	('Lisa Fonseca', 'corrida', 983),
	('Amanda Nunes', 'futebol', 0),
	('Caique Dias', 'salto com vara', 23),
	('Felipe Barbosa', 'corrida', 291);

-- • Criar uma tabela chamada País para conter os dados: idPais (int e chave primária
-- da tabela), nome (varchar, tamanho 30), capital (varchar, tamanho 40);
-- • Inserir pelo menos 4 países na tabela país


CREATE TABLE pais (
	idPais int primary key auto_increment,
    nome varchar(30),
    capital varchar(40)
);

INSERT INTO pais (nome, capital) VALUES
	('Brazil','Brasilia'),
    ('Estados Unidos','Washington'),
    ('França','Paris'),
    ('Canadá','Ottawa');

SELECT * FROM atleta;
    
-- Criar a chave estrangeira na tabela correspondente conforme modelagem;
ALTER TABLE atleta ADD COLUMN paisOrigem int,
	ADD CONSTRAINT fkPais foreign key (paisOrigem) references pais (idPais);


-- Atualizar o país de todos os atletas;
UPDATE atleta 
SET paisOrigem = 2
WHERE idAtleta = 1;

UPDATE atleta 
SET paisOrigem = 2
WHERE idAtleta in (3, 6, 9);

UPDATE atleta 
SET paisOrigem = 3
WHERE idAtleta in (2, 4, 5);

UPDATE atleta 
SET paisOrigem = 4
WHERE idAtleta = 7;

UPDATE atleta 
SET paisOrigem = 1
WHERE idAtleta = 8;

-- • Exibir os atletas e seu respectivo país;
SELECT * FROM atleta JOIN pais
	ON paisOrigem = idPais;
    
-- Exibir apenas o nome do atleta e o nome do respectivo país;
SELECT a.nome as 'Nome do Atleta',
p.nome as 'País de Origem'
From atleta as a JOIN pais as p 
	ON paisOrigem = idPais;
    
-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital;
SELECT * from atleta JOIN pais
ON paisOrigem = idPais
WHERE capital LIKE 'Paris';

-- EXERCICIO 2

-- Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho
-- 40), artista (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave
-- primária da tabela.

CREATE TABLE musica (
	idMusica int primary key auto_increment,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);
--  Inserir dados na tabela, procurando colocar um gênero de música que tenha mais
-- de uma música, e um artista, que tenha mais de uma música cadastrada. Procure
-- inserir pelo menos umas 3 músicas.

INSERT INTO musica (titulo, artista, genero) VALUES
('Fe1n', 'Travis Scott', 'Trap'),
('Sicko Mode', 'Travis Scott', 'Trap'),
('Eu amo você', 'Tim Maia', 'MPB'),
('Formidable', 'Frances', 'Pop'),
('The emptiness machine', 'Linkin Park', 'Rock');

-- Criar a tabela chamada Album para conter os dados: idAlbum, nome, tipo (digital
-- ou físico) e dtLancamento (DATE).
CREATE TABLE album(
	idAlbum int primary key auto_increment,
    nome varchar(30),
    tipo varchar(10),
    dtLancamento date
);
ALTER TABLE album ADD CONSTRAINT chkTipo CHECK (tipo in ('digital', 'fisico'));

-- Inserir pelo menos 2 albuns;
INSERT INTO album (nome, tipo, dtLancamento) VALUES
('Utopia', 'digital', '2023-10-29'),
('Perpectus', 'digital', '2024-06-18'),
('Nuvens', 'fisico', '1990-09-29');

-- • Fazer a modelagem lógica conforme a regra de negócio:
-- • 1 album pode ter 1 ou muitas músicas;
-- • 1 música é de 1 e somente 1 album;
-- Criar a chave estrangeira na tabela de acordo com a regra de negócio;

ALTER TABLE musica ADD COLUMN album int,
	ADD CONSTRAINT fkAlbum foreign key (album) references album (idAlbum);

-- c) Atualizar os álbuns de cada música;
UPDATE musica
SET album = 1
WHERE idMusica in (1, 2);

UPDATE musica
SET album = 2
WHERE idMusica = 5;

UPDATE musica
SET album = 3 
WHERE idMusica = 3;

-- Exibir todos os dados das tabelas separadamente;
SELECT * FROM musica;
SELECT * FROM album;

-- Exibir as músicas e seus respectivos álbuns;
SELECT titulo as Musica,
	album.nome as ALbum,
	artista, genero, album.tipo, dtLancamento as Lançamento
	FROM musica JOIN album
	ON album = idAlbum;
    
-- Exibir somente o título da música e o nome do seu respectivo álbum;
SELECT titulo AS Musica,
	album.nome as Album
    FROM musica JOIN album
    ON album = idAlbum;
    
-- Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo.
SELECT titulo as Musica,
artista, album.nome as Album, album.tipo, genero, dtLancamento
	FROM musica JOIN album
    ON album = idAlbum
    WHERE album.tipo = 'digital'; 
    