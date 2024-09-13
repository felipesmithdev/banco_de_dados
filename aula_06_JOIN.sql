-- nosso primeiro join
CREATE DATABASE sprint2ccob;
USE sprint2ccob;

CREATE TABLE empresas (
	idEmpresa int primary key auto_increment,
    nome varchar(45),
    responsavel varchar(45)
) auto_increment = 100;

INSERT INTO empresas(nome) VALUES
('C6 Bank'),
('Stefanini');

CREATE TABLE aluno(
	ra char(8) primary key,
    nome varchar(45),
    telefone char(12),
    fkEmpresa int,
    constraint fkEmpresaAluno foreign key (fkEmpresa)
		references empresas(idEmpresa)
);

INSERT INTO aluno (ra, nome, fkEmpresa) VALUES
	('04242998', 'Wilma', 100),
    ('04242997', 'Barney', 101),
    ('04242996', 'Fred', 100);
    
-- exibir os dados dos alunos e sua respectiva empresa de interesse
-- join junção, relação

SELECT * FROM aluno JOIN empresas
	ON idEmpresa = fkEmpresa;

select * from aluno join empresas;

SELECT ra, aluno.nome, empresas.nome FROM aluno JOIN empresas
	ON idEmpresa = fkEmpresa;

SELECT ra as RaAluno,
 aluno.nome AS NomeAluno,
 empresas.nome AS 'Nome Empresa'
	FROM aluno JOIN empresas
	ON idEmpresa = fkEmpresa;
    
SELECT ra as RaAluno,
 a.nome AS NomeAluno,
 e.nome AS 'Nome Empresa'
	FROM aluno  AS a JOIN empresas AS e
	ON idEmpresa = fkEmpresa;
    
SELECT ra as RaAluno,
 a.nome AS NomeAluno,
 e.nome AS 'Nome Empresa'
	FROM aluno  AS a JOIN empresas AS e
	ON idEmpresa = fkEmpresa
    WHERE e.nome = 'Stefanini';