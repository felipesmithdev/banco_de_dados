-- CRIAR O BANCO DE DADOS
-- TODOS OS COMANDOS SÃO EM INGLES
-- E TODOS OS COMANDOS TERMINAM COM ;

CREATE DATABASE ccob;

-- SELECIONAR O BANCO DE DADOS
USE ccob;

-- CRIAR A NOSSA PRIMEIRA TABELA
create table aluno (
-- TODA TABELA TEM QUE TER UMA CHAVE PRIMARIA
-- PK (PRIMARY KEY)
-- TIPO INT (NUMERO INTEIRO) id int primary key
ra char(8) primary key,
nome varchar(50),
email varchar(25)
);

-- CHAR (A QUANTIDADE DE CARACTERES NAO ALTERA)
-- VARCHAR (A QUANTIDADE DE CARACTERES VARIA)

-- DESCREVER OS CAMPOS DA TABELA
describe aluno;
desc aluno;

-- INSERIR DADOS
insert into aluno values
('04242035', 'Vitoria', 'vitoria@sptech.school');

-- MEU PRIMEIRO SELECT
select ra, nome, email from aluno;
select nome, ra, email from aluno;

-- INSERIR MAIS ALUNOS
insert into aluno values
('04242038', 'Gabriella', 'gabriella@sptech.school'),
('04242005', 'Leticia', 'leticia@sptech.school');

-- EXIBIR TODOS OS CAMPOS DA TABELA ALUNO
select * from aluno;

-- EXIBIR APENAS O ALUNO COM O NOME LETICIA
select nome from aluno
where nome = 'Leticia';

-- EXIBIR APENAS O NOME CUJO COMEÇA COM A LETRA V
select * from aluno
where nome like 'V%';

-- EXIBIR APENAS O NOME CUJO TERMINA COM A LETRA A 
select * from aluno
where nome like '%a';

-- EXIBIR APENAS O NOME QUE CONTÉM A LETRA I 
select * from aluno
where nome like '%i%';

-- EXIBIR APENAS O NOME QUE A SEGUNDA LETRA É I
select * from aluno
where nome like '_i%';

select * from sluno;

-- ORDENAR PELO NOME EM ORDEM CRESCENTE 
select * from aluno order by nome;
select * from aluno order by nome asc;

-- ORDENAR PELO NOME EM ORDEM DECRESCENTE
select * from aluno order by nome desc;

-- EXIBIR OS ALUNOS CUJO O NOME NAO É LETICIA
select * from aluno
where nome <> 'Leticia';
-- != também significa diferente de




