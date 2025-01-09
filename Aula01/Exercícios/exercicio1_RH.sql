CREATE DATABASE db_empresa;
USE db_empresa;

CREATE TABLE tb_colaboradores
(
	matricula bigint auto_increment PRIMARY KEY,
    nome varchar(255) not null,
    departamento varchar(255) NOT NULL,
    cargo varchar(255) not null,
    data_admissao date not null,
    data_demissao date,
    ultimo_salario decimal(10,2) NOT NULL
);
-- testando se é possível preencher fora da ordem da tabela. **é possível
INSERT INTO tb_colaboradores (nome, cargo, departamento, data_admissao, data_demissao, ultimo_salario) 
VALUES
('Ana Paula Silva', 'Recursos Humanos','Analista de RH', "1998-02-18",NULL, 4500.00),
('Carlos Eduardo Oliveira','Tecnologia da Informação','Desenvolvedor Backend', "2000-06-14",NULL, 6500.00),
('Mariana Costa Souza', 'Vendas', 'Gerente de Vendas', "2008-03-12",NULL, 8500.00),
('Ricardo Mendes', 'Assistente Administrativo', 'Administrativo','2002-04-29','2010-09-20', 1200.00),
('Fernanda Rocha Lima', 'Designer Gráfico', 'Marketing','1997-10-14','2004-07-07', 1850.48);
-- fiz dois INSERTs pois ele reclamava quando eu coloquei as pessoas que não tinham sido demitidas com as que já foram
SELECT * FROM tb_colaboradores;
SELECT * FROM tb_colaboradores WHERE ultimo_salario >= 2000;
SELECT * FROM tb_colaboradores WHERE ultimo_salario < 2000;

UPDATE tb_colaboradores SET ultimo_salario = 10000.00, cargo = "Tech Lead" WHERE matricula = 2 ;
SELECT * FROM tb_colaboradores WHERE matricula = 2;




