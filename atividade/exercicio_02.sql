create database sprint1;
use sprint1;
create table atleta (
	idAtleta int primary key,
    nome varchar (40),
    modalidade varchar (40),
    qtdMedalha int
    );
insert into atleta values
('1', 'endrick parmera', 'futebol', '5'),
('2', 'marta linsey', 'futebol', '2'),
('3', 'pedro gusman', 'atletismo', '1'),
('4', 'larisa latynia', 'ginastica', '18'),
('5', 'nikolai andrianov', 'ginastica', '15'),
('6', 'jenny thompson', 'natação', '12'),
('7', 'dara torres', 'natação', '12');

-- exibir todos os dados da tabela
select * from atleta;

-- atualizar a quantidade de medalhas do atleta com id 1
-- atualizar a quantidade de medalhas do atleta com id 2 e 3
update atleta
set qtdMedalha = 18
where idAtleta = 1;

update atleta
set qtdMedalha = 12
where idAtleta in (2, 3);

-- atualizar o nome do atleta com id 4
update atleta
set nome = 'lorena partinson'
where idAtleta = 4;

-- adicionar a coluna data de nascimento
alter table atleta add column dtNasc date;

select * from atleta;

-- atualizar a data de nascimento dos atletas 
update atleta
set dtNasc = '2000-12-01'
where idAtleta = 1;

update atleta
set dtNasc = '1990-09-21'
where idAtleta = 2;

update atleta 
set dtNasc = '1980-11-30'
where idAtleta = 3;

update atleta
set dtNasc = '2004-09-11'
where idAtleta = 4;

update atleta
set dtNasc = '2001-01-29'
where idAtleta = 5;

update atleta
set dtNasc = '2002-02-19'
where idAtleta = 6;

update atleta
set dtNasc = '2005-10-22'
where idAtleta = 7;

-- excluir o atleta com id 5
delete from atleta
where idAtleta = 5;

-- exibir os atletas onde a modalidade é diferente de natação
select * from atleta
where modalidade != 'natação';

-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
select * from atleta
where qtdMedalha >= 3;

-- • Modificar o campo modalidade do tamanho 40 para o tamanho 60;
alter table atleta modify column modalidade varchar (60);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade;
describe atleta;

-- limpar os dados da tabela
truncate table atleta;

-- EXERCICIO 02

create table musica (
idMusica int primary key,
titulo varchar (40),
artista varchar (40),
genero varchar (40)
);

insert into musica values
('1', 'sicko mode', 'travis scott', 'trap'),
('2', 'antitode', 'travis scott', 'trap'),
('3', 'ela partiu', 'tim maia', 'mpb'),
('4', 'eu amo voce', 'tim maia', 'mpb'),
('5', 'tempo perdido', 'legiao urbana', 'pop rock'),
('6', 'pais e filhos', 'legiao urbana', 'pop rock'),
('7', 'kiss kiss', 'chris brown', 'rap');

-- Exibir todos os dados da tabela.
select * from musica;

-- Adicionar o campo curtidas do tipo int na tabela;
alter table musica add column curtidas int;
select * from musica;

--  Atualizar o campo curtidas de todas as músicas inseridas;
update musica
set curtidas = '19'
where idMusica = 1;

update musica
set curtidas = '819'
where idMusica = 2;

update musica
set curtidas = '182'
where idMusica = 3;

update musica
set curtidas = '388'
where idMusica = 4;

update musica 
set curtidas = '24'
where idMusica = 5;

update musica 
set curtidas = '999'
where idMusica = 6;

update musica
set curtidas = '09'
where idMusica = 7;

select * from musica;

-- ) Modificar o campo artista do tamanho 40 para o tamanho 80;
alter table musica modify column artista varchar (80);

-- Atualizar a quantidade de curtidas da música com id=1;
update musica 
set curtidas = '992'
where idMusica = 1;

--  Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
update musica
set curtidas = '298'
where idMusica in (2, 3);

-- Atualizar o nome da música com o id=5;
update musica
set titulo = 'que país é esse ?'
where idMusica = 5;

-- Excluir a música com o id=4;
delete from musica
where idMusica = 4;

-- Exibir as músicas onde o gênero é diferente de funk;
select * from musica 
where genero <> 'funk';

-- Exibir os dados das músicas que tem curtidas maior ou igual a 20;
select * from musica 
where curtidas >= '20';

--  Descrever os campos da tabela mostrando a atualização do campo artista;
describe musica;

-- Limpar os dados da tabela;
truncate table musica;

-- EXERCICIO 3

create table filme (
idFilme int primary key,
titulo varchar (50),
genero varchar (40),
diretor varchar (40)
);

insert into filme values
('1', 'deadpool', 'ação', 'marvel'),
('2', 'wolverine', 'ação', 'marvel'),
('3', '50 tons de cinza', 'drama', 'joao coelho'),
('4', 'carinha logo ali', 'drama', 'stefen curry'),
('5', 'por agua abaixo','ficção', 'joao coelho'),
('6', 'caindo de marte', 'ficção', 'stefen curry'),
('7', 'fiquei rica', 'comedia', 'leonardo lourencio');

-- • Exibir todos os dados da tabela.
select * from filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela
alter table filme add protagonista varchar (50);

-- Atualizar o campo protagonista de todas os filmes inseridos;
update filme
set protagonista = 'tim milley'
where idFilme = '1';

update filme 
set protagonista = 'volve'
where idFilme = '2';

update filme 
set protagonista = 'joao'
where idFilme = '3';

update filme
set protagonista = 'scamander'
where idFilme = '4';

update filme 
set protagonista = 'lucius'
where idFilme = '5';

update filme 
set protagonista = 'caique'
where idFilme = '6';

update filme 
set protagonista = 'papito'
where idFilme = '7';

-- Modificar o campo diretor do tamanho 40 para o tamanho 150;
alter table filme modify column diretor varchar (150);

-- Atualizar o diretor do filme com id=5;
update filme
set diretor = 'disney'
where idFilme = '5';

-- • Atualizar o diretor dos filmes com id=2 e com o id=7;
update filme
set diretor = 'carlinhos'
where idFilme in (2,7);

 -- Atualizar o título do filme com o id=6
 update filme
 set titulo = 'catando nozes'
 where idFilme = '6';
 
 -- Excluir o filme com o id=3;
delete from filme 
where idFilme = '3';

-- Exibir os filmes em que o gênero é diferente de drama;
select * from filme
where genero <> 'drama';

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’;
select * from filme 
where genero = 'suspense';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor
describe filme;

-- Limpar os dados da tabela;
truncate table filme;

-- EXERCICIO 4

CREATE TABLE Professor (
idProfessor int primary key,
nome VARCHAR (50),
especialidade VARCHAR (40),
dtNasc DATE
);

insert into Professor values
('1','Zeca','matematica','2001-02-15'),
('2','Pamela','matematica','1999-03-19'),
('3','Vivian','banco de dados','1990-10-13'),
('4','Joao','ciencia','1999-01-30'),
('5','Brandao','projeto inovacao','1970-05-20'),
('6','Guiber','ciencia','2002-12-5'),
('7','Luis','banco de dados','1990-10-26');

-- Exibir todos os dados da tabela
select * from Professor;

-- Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’,
-- ‘assistente’ ou ‘titular’;
alter table Professor add funcao varchar (50), 
add 
constraint chkFuncao check (funcao in ('monitor', 'assistente', 'titular'));

select * from Professor;
-- Atualizar os professores inseridos e suas respectivas funções;
update Professor
set funcao = 'monitor'
where idProfessor in (1,4,6);

update Professor 
set funcao = 'assistente'
where idProfessor in (2,3,7);

update Professor
set funcao = 'titular'
where idProfessor = '5';

-- inserir um novo professor
insert into Professor values
('8', 'caleb', 'espanhol', '1980-12-11', 'titular');

-- Excluir o professor onde o idProfessor é igual a 5;
delete from Professor 
where idProfessor = '5';

-- Exibir apenas os nomes dos professores titulares;
select (nome) from Professor
where funcao = 'titular';

-- Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
select especialidade, dtNasc from Professor
where funcao = 'monitor';

--  Atualizar a data de nascimento do idProfessor igual a 3;
update Professor 
set dtNasc = '1991-09-12'
where idProfessor = '3';

-- Limpar a tabela Professor;
truncate table Professor;

-- exercicio 5

create table curso(
idCurso int primary key,
nome varchar (50),
sigla varchar (3),
coordenador varchar (40)
);

insert into curso values
('5','ingles','ing','Alessandro'),
('4','matematica','mat','Paula'),
('3','algoritmo','alg','Jotape'),
('2','musica','msc','Nando'),
('1','marketing','mrk','Bruce');

-- Exibir todos os dados da tabela
select * from curso;

-- Exibir apenas os coordenadores dos cursos
select coordenador from curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
select * from curso
where sigla = 'ing';

-- Exibir os dados da tabela ordenados pelo nome do curso
select * from curso order by nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem
-- decrescente
select * from curso order by coordenador desc;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from curso
where nome like ('i%');

-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from curso
where nome like ('%s');

--  Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma
-- determinada letra
select * from curso
where nome like ('_n%'); 

--  Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma
-- determinada letra.
select * from curso
where nome like ('%e_');

-- elimine a tabela
drop table curso;



-- exercicio 6



CREATE TABLE Revista(
idRevista int primary key AUTO_INCREMENT,
nome varchar (40),
categoria varchar (30)
);

INSERT INTO Revista (nome)
VALUES ('veja'),
('globo'),
('band'),
('uol');
-- pode utilizar o comando null e default para criar um auto increment
-- Exibir todos os dados da tabela
SELECT * FROM Revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela
-- novamente para verificar se atualizou corretamente

UPDATE Revista 
SET categoria = 'romance'
WHERE idRevista = '1';

UPDATE Revista 
SET categoria = 'sport'
WHERE idRevista = '2';

UPDATE Revista 
SET categoria = 'moda'
WHERE idRevista = '3';

UPDATE Revista 
SET categoria = 'receita'
WHERE idRevista = '4';
SELECT * FROM Revista;

--  Insira mais 3 registros completos.
INSERT INTO Revista VALUES
('8','choquei','noticias'),
('7','sbt','quadrinho');

-- Exibir novamente os dados da tabela
SELECT * FROM Revista;

-- Exibir a descrição da estrutura da tabela
DESCRIBE Revista;

--  Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres
ALTER TABLE Revista MODIFY categoria VARCHAR(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o
-- tamanho da coluna categoria
DESCRIBE Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE Revista ADD periodicidade VARCHAR (15);

--  Exibir os dados da tabela
SELECT * FROM Revista;

-- Excluir a coluna periodicidade da tabela
ALTER TABLE Revista DROP periodicidade;

SELECT * FROM Revista;

DESCRIBE Revista;



































































