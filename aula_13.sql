-- AULA 2
USE ccob;

CREATE TABLE pessoa (
id int primary key auto_increment,
nome varchar(50),
genero char (1),
constraint chkGenero check (genero in ('f', 'm' ))
) auto_increment = 100;

-- genero in ('f' , 'm' )0
-- genero = 'f' or 'm'
describe pessoa;

insert into pessoa values
    (default, 'grigor', 'm');
   
 insert into pessoa (nome, genero) values 
    ('pedro', 'm' ),
    ('vitoria', 'f');
    
select * from pessoa;
    
-- excluir a linha inteira
delete from pessoa 
    where id = 101;

insert into pessoa (nome) values
    ('laysa');
    
alter table pessoa drop constraint chkGenero;    
alter table pessoa add constraint chkGenero
    check (genero in ('f' , 'm' , 'n'));
	
insert into pessoa (nome, genero) values
	('jorge' , 'n' );
    
-- limpa os dados da tabela
truncate table pessoa;
  
select * from pessoa;

insert into pessoa (nome) values
	('vitoria');
alter table pessoa auto_increment = 100;     
    
insert into pessoa (nome) values
	('Grigor');
    
insert into pessoa values
	('Jeorge', 'm');	
  