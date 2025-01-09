-- Criação do Banco de Dados
CREATE DATABASE db_generation_game_online;

-- Uso do Banco de Dados
USE db_generation_game_online;

-- Criação da Tabela tb_classes
CREATE TABLE tb_classes (
    id_classe INT AUTO_INCREMENT PRIMARY KEY, -- Chave Primária
    nome_classe VARCHAR(50) NOT NULL,         -- Nome da classe
    habilidade_especial VARCHAR(100) NOT NULL -- Descrição da habilidade especial
);

INSERT INTO tb_classes (nome_classe, habilidade_especial) 
VALUES
('Guerreiro', 'Ataque de Espada'),
('Mago', 'Lançar Feitiços'),
('Arqueiro', 'Tiro Preciso'),
('Assassino', 'Ataque Furtivo'),
('Clérigo', 'Cura e Suporte');

SELECT * FROM tb_classes;

-- Criação da Tabela tb_personagens
CREATE TABLE tb_personagens (
    id_personagem INT AUTO_INCREMENT PRIMARY KEY, -- Chave Primária
    nome_personagem VARCHAR(50) NOT NULL,         -- Nome do personagem
    nivel INT NOT NULL,                           -- Nível do personagem
    experiencia INT NOT NULL,                     -- Experiência acumulada
    ataque INT NOT NULL,                   -- Data de criação do personagem
    defesa INT NOT NULL,
    vida INT NOT NULL,
    id_classe INT NOT NULL,                       -- Chave Estrangeira
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe) -- Relacionamento com tb_classes
);

INSERT INTO tb_personagens (nome_personagem, nivel, experiencia, ataque, defesa, vida, id_classe) 
VALUES
('Kael', 12, 3200, 2850, 7000, 150, 1), -- Guerreiro
('Lyrac', 15, 4500, 2650, 5000, 200, 2), -- Mago
('Fynar', 10, 2100, 1750, 6000, 300, 3), -- Arqueiro
('Zerak', 18, 5000, 3900, 1400, 110, 4), -- Assassino
('Elyra', 14, 4000, 1050, 800, 100, 5), -- Clérigo
('Dracos', 16, 4900, 1880, 6500, 550, 1), -- Guerreiro
('Meclira', 13, 3700, 6000, 1550, 500, 2), -- Mago
('Veyron', 11, 3000, 2730, 600, 400, 3); -- Arqueiro

SELECT * FROM tb_personagens;

SELECT * FROM tb_personagens WHERE ataque > 2000;

SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome_personagem LIKE "%c%";

SELECT * FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.id_classe = tb_classes.id_classe;

-- EXIGIR APENAS OS MAGOS
SELECT * FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.id_classe = tb_classes.id_classe
WHERE tb_personagens.id_classe = 2;


