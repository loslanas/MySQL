CREATE DATABASE db_escola;
USE db_escola; 
CREATE TABLE tb_alunos(
matricula bigint AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
data_nascimento DATE NOT NULL,
serie VARCHAR(20) NOT NULL,
status_matricula BOOLEAN NOT NULL, -- MUDEI PRA BOOLEAN
nota DECIMAL(2, 1) NOT NULL
);
INSERT INTO tb_alunos (nome, data_nascimento, serie, status_matricula, nota)
VALUES
    ('Pedro Almeida', '2010-09-12', '7º Ano', 1, 8.2),
    ('Clarice Santos', '2008-01-25', '8º Ano', 1, 5.6),
    ('Luiz Fernando', '2011-08-15', '6º Ano', 1, 7.0),
    ('Júlia Pimenta', '2012-09-10', '5º Ano', 0, 6.5),
    ('Augusto Ramos', '2010-10-20', '7º Ano', 1, 9.6),
    ('Beatriz Salles', '2009-09-25', '8º Ano', 1, 5.8),
    ('Camila Nunes', '2011-10-02', '6º Ano', 0, 8.5),
    ('Fernanda Arruda', '2011-12-17', '5º Ano', 1, 4.5);
    
SELECT * FROM tb_alunos;

SELECT * FROM tb_alunos WHERE status_matricula = 0;
SELECT * FROM tb_alunos WHERE nota >= 7.0;
SELECT * FROM tb_alunos WHERE nota < 7.0;
-- SET SQL_SAFE_UPDATES = 0; -- tive que desativar o safe update para fazer essa função rodar.
UPDATE tb_alunos SET nota = 0 WHERE status_matricula = 0; --
UPDATE tb_alunos SET nota = 8.5 WHERE matricula = 3;