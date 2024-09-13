CREATE DATABASE aula3;
USE aula3;
-- campos numericos
/* inteiros - int
TINYINT - poucos numeros -127 ATE 127

Decimais 
FLOAT - 7 CARACTERES - 1234567
DOUBLE - 15 CARACTERES - 123456789012345
DECIMAL () - 32 CARACTERES
DECIAML(5,2) - 123,45
DECIMAL(8,4) - 1234,5678
*/

CREATE TABLE funcionario (
	id int primary key auto_increment,
	nome varchar(45) not null,
	peso float,
	altura float,
	dtNasc date,
    salario decimal(10,2),
    tipo tinyint
    );
    
DESCRIBE funcionario;

INSERT INTO funcionario (nome, peso, altura, dtNasc, salario, tipo) values
	('Silvio Santos', 83.100, 1.76, '1930-12-12', 999.99, 0),
    ('Hebe Camargo', 75.400, 1.60, '1929-03-08', 998.99, 0),
    ('Fausto Silva', 90.500, 1.84, '1950-05-02', 500.99, 1);

SELECT * FROM funcionario;

-- vamos testar o tinyint

INSERT INTO funcionario (nome, tipo) VALUES
	('Gugu', 10);

-- EXCLUIR A LINHA 4 E 5, DEVIDO TESTE DO TINYINT
DELETE FROM funcionario
WHERE id BETWEEN 4 AND 5;

-- check onde tipo 0 ou 1
ALTER TABLE funcionario ADD CONSTRAINT chkTipo 
	CHECK (tipo in (0,1));

SELECT * FROM funcionario;

-- Exibir uma frase: o funcionario xpto pesa x kg
SELECT concat(nome, peso) FROM funcionario;
SELECT concat('O funciinario ', nome, ' pesa ', peso,'kg!')
	FROM funcionario;
    
-- Exibir o seguinte, se o campo tipo estiver 0 mostrar, Deus o tenha!
-- se exibir o um, Cuidado!
SELECT nome,
	CASE 
		WHEN tipo = 0 THEN 'Deus o tenha!'
		ELSE 'Cuidado!'
		END 
        FROM funcionario;
	
    
-- Exibir o nome como nome do funcionario 
-- APELIDO - ALIASES- AS
SELECT nome AS 'Nome do Funcionario' FROM funcionario;

SELECT nome,
	CASE 
		WHEN tipo = 0 THEN 'Deus o tenha!'
		ELSE 'Cuidado!'
		END AS Condição 
        FROM funcionario;

-- Trazer a idade em anos do funcionario utilizando apenas a data de nascimento
-- select nome, timestampdiff(YEAR, dtNasc, now()) as idade from funcionario;

SELECT nome, timestampdiff(YEAR, dtNasc, now()) as idade 
	FROM funcionario;

SELECT nome, concat('A idade desse funcionario é ', timestampdiff(YEAR, dtNasc, now()), ' anos') as idade  
	FROM funcionario;
    
SELECT nome, concat('A idade desse funcionario é ', timestampdiff(MONTH, dtNasc, now()), ' meses de vida') as idade
	FROM funcionario;

    
    
    
    
    
    











    











